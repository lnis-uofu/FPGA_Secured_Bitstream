#!/bin/env python3

import os, sys, shutil
from siliconcompiler.core import Chip

# For Caravel user wrapper
if not os.environ.get('CARAVEL_ROOT', None):
    print("[-] Missing 'CARAVEL_ROOT' environment variable!")
    sys.exit(1)
CARAVEL_ROOT = os.environ['CARAVEL_ROOT']

# Output directories
for outdir in ['build','gds','def','lef','gl']:
    if not os.path.isdir(outdir):
        os.makedirs(outdir)

# Margins are set to ~10mm, snapped to placement site dimensions (0.46mm x 2.72mm in sky130hd)
MARGIN_W = 9.66
MARGIN_H = 8.16

def build_top(design="user_project_wrapper"):
    # RTL goes in a modified 'user_project_wrapper' object, see sources.
    chip = Chip(design)
    chip.load_target('skywater130_demo')
    chip.set('tool', 'openroad', 'var', 'place', '0', 'place_density', ['0.15'])
    chip.set('tool', 'openroad', 'var', 'route', '0', 'grt_allow_congestion', ['true'])

    # Set top-level source files.
    chip.set('input', 'verilog', f'{CARAVEL_ROOT}/verilog/rtl/defines.v')
    chip.add('input', 'verilog', 'rtl/user_project_wrapper_fpga_pmu.v')
    chip.add('input', 'verilog', 'rtl/fpga_top.bb.v')
    chip.add('input', 'verilog', 'rtl/pmu.bb.v')

    # Design constraints
    # chip.set('input', 'sdc', 'sdc/top.sdc')
    chip.clock('user_clock2', period=20)

    # User project wrapper area is 2.92mm x 3.52mm
    TOP_W = 2920
    TOP_H = 3520

    # Set user design die/core area.
    chip.set('asic', 'diearea', (0, 0))
    chip.add('asic', 'diearea', (TOP_W, TOP_H))
    chip.set('asic', 'corearea', (MARGIN_W, MARGIN_H))
    chip.add('asic', 'corearea', (TOP_W - MARGIN_W, TOP_H - MARGIN_H))

    # Add core design macro as a library.
    for libname in ['pmu', 'fpga_top']:
        stackup = chip.get('asic', 'stackup')
        chip.add('asic', 'macrolib', libname)
        macro_lib = Chip(libname)
        macro_lib.add('model', 'layout', 'gds', stackup, f'gds/{libname}.gds')
        macro_lib.add('model', 'layout', 'def', stackup, f'def/{libname}.def')
        macro_lib.add('model', 'layout', 'lef', stackup, f'lef/{libname}.lef')
        macro_lib.add('model', 'layout', 'vg', stackup, f'vg/{libname}.vg')
        macro_lib.set('asic', 'pdk', 'skywater130')
        macro_lib.set('option', 'pdk', 'skywater130')
        macro_lib.set('asic', 'stackup', stackup)
        chip.import_library(macro_lib)

    # Use pre-defined floorplan for the wrapper..
    chip.set('input', 'floorplan.def', f'{CARAVEL_ROOT}/def/user_project_wrapper.def')

    # (No?) tapcells in the top-level wrapper.
    libtype = 'unithd'

    # no routing on met4 and met5 (error spacing)
    chip.set('asic', 'maxlayer', 'met3')

    # No I/O buffers in the top-level wrapper, but keep tie-hi/lo cells.
    chip.set('asic', 'cells', 'buf', [])

    # Create PDN-generation script.
    pdk = chip.get('option', 'pdk')
    with open('build/pdngen_top.tcl', 'w') as pdnf:
        # TODO: Jinja template?
        pdnf.write('''
# Add PDN connections for each voltage domain.
add_global_connection -net vccd1 -pin_pattern "^VPWR$" -power
add_global_connection -net vssd1 -pin_pattern "^VGND$" -ground
add_global_connection -net vccd1 -pin_pattern "^POWER$" -power
add_global_connection -net vssd1 -pin_pattern "^GROUND$" -ground
global_connect

set_voltage_domain -name Core -power vccd1 -ground vssd1

define_pdn_grid -name core_grid -macro -grid_over_boundary -default -voltage_domain Core
add_pdn_stripe -grid core_grid -layer met1 -width 0.48 -pitch 5.44 -offset 10.88 -starts_with POWER -followpins
add_pdn_connect -grid core_grid -layers {met1 met4}
add_pdn_connect -grid core_grid -layers {met1 met5}

# Done defining commands; generate PDN.
pdngen''')
    chip.set('pdk', pdk, 'aprtech', 'openroad', stackup, libtype, 'pdngen', 'build/pdngen_top.tcl')

    # Generate macro-placement script.
    with open('build/macroplace_top.tcl', 'w') as mf:
        mf.write('''
# macros
place_cell -inst_name pmu_    -origin { 934.72  204.00} -orient R0 -status FIRM
place_cell -inst_name fpga22_ -origin {1160.12 1047.20} -orient R0 -status FIRM
''')
    chip.set('pdk', pdk, 'aprtech', 'openroad', stackup, libtype, 'macroplace', 'build/macroplace_top.tcl')

    # Run the top-level build.
    chip.run()

    # Add via definitions to the gate-level netlist.
    jobdir = f"{chip.get('option', 'builddir')}/{design}/{chip.get('option', 'jobname')}"
    shutil.copy(f'{jobdir}/dfm/0/outputs/{design}.vg', f'gl/{design}.vg')
    in_mod = False
    done_mod = False
    with open(f'gl/{design}.v', 'w') as wf:
        with open(f'gl/{design}.vg', 'r') as rf:
            for line in rf.readlines():
                if in_mod:
                    if line.strip().startswith('endmodule'):
                        wf.write('''VIA_L1M1_PR(vssd1);
VIA_L1M1_PR(vccd1);
VIA_L1M1_PR_MR(vssd1);
VIA_L1M1_PR_MR(vccd1);
VIA_M1M2_PR(vssd1);
VIA_M1M2_PR(vccd1);
VIA_M2M3_PR(vssd1);
VIA_M2M3_PR(vccd1);
VIA_M3M4_PR(vssd1);
VIA_M3M4_PR(vccd1);
VIA_M4M5_PR(vssd1);
VIA_M4M5_PR(vccd1);
VIA_via2_3_3100_480_1_9_320_320(vssd1);
VIA_via2_3_3100_480_1_9_320_320(vccd1);
VIA_via3_4_3100_480_1_7_400_400(vssd1);
VIA_via3_4_3100_480_1_7_400_400(vccd1);
VIA_via4_3100x3100(vssd1);
VIA_via4_3100x3100(vccd1);
VIA_via4_5_3100_480_1_7_400_400(vssd1);
VIA_via4_5_3100_480_1_7_400_400(vccd1);\n''')
                elif not done_mod:
                    if line.strip().startswith('module user_project_wrapper'):
                        in_mod = True
                wf.write(line)

    # Copy GDS/DEF/LEF files for use in the top-level build.
    shutil.copy(f'{jobdir}/export/0/outputs/{design}.gds', f'gds/{design}.gds')
    shutil.copy(f'{jobdir}/export/0/inputs/{design}.def', f'def/{design}.def')
    shutil.copy(f'{jobdir}/export/0/inputs/{design}.lef', f'lef/{design}.lef')

if __name__ == '__main__':
    build_top()

