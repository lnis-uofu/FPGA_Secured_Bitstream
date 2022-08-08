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

def build_pmu(design="pmu"):
    chip = Chip(design)
    chip.load_target('skywater130_demo')

    # Load all source
    chip.set('input', 'verilog', 'rtl/pmu/pmu.v')
    chip.add('input', 'verilog', 'rtl/pmu/pmu_core.v')
    chip.add('input', 'verilog', 'rtl/pmu/sha/sha256_core.v')
    chip.add('input', 'verilog', 'rtl/pmu/sha/sha256_k_constants.v')
    chip.add('input', 'verilog', 'rtl/pmu/sha/sha256_w_mem.v')
    chip.add('input', 'verilog', 'rtl/pmu/tap_top.v')
    chip.add('input', 'verilog', 'rtl/pmu/crc8.v')
    chip.add('input', 'verilog', 'rtl/pmu/key_storage.v')
    chip.add('input', 'verilog', 'rtl/pmu/aes/aes_core.v')
    chip.add('input', 'verilog', 'rtl/pmu/aes/aes_decipher_block.v')
    chip.add('input', 'verilog', 'rtl/pmu/aes/aes_inv_sbox.v')
    chip.add('input', 'verilog', 'rtl/pmu/aes/aes_key_mem.v')
    chip.add('input', 'verilog', 'rtl/pmu/aes/aes_sbox.v')
    chip.add('input', 'verilog', 'rtl/pmu/aes/round_key.v')

    # Design constraints
    chip.set('input', 'sdc', 'sdc/pmu.sdc')

    chip.set('tool', 'openroad', 'var', 'place', '0', 'place_density', ['0.65'])
    chip.set('tool', 'openroad', 'var', 'route', '0', 'grt_allow_congestion', ['true'])

    # Die area
    CORE_W = 1049.72
    CORE_H = 748

    # Set user design die/core area.
    chip.set('asic', 'diearea', (0, 0))
    chip.add('asic', 'diearea', (CORE_W, CORE_H))
    chip.set('asic', 'corearea', (MARGIN_W, MARGIN_H))
    chip.add('asic', 'corearea', (CORE_W - MARGIN_W, CORE_H - MARGIN_H))

    # No routing on met4-met5.
    stackup = chip.get('asic', 'stackup')
    libtype = 'unithd'
    chip.set('asic', 'maxlayer', 'met3')

    # Create empty PDN script to effectively skip PDN generation.
    pdk = chip.get('option', 'pdk')
    with open('build/pdngen.tcl', 'w') as pdnf:
        pdnf.write('''#NOP''')
    chip.set('pdk', pdk, 'aprtech', 'openroad', stackup, libtype, 'pdngen', 'build/pdngen.tcl')

    # Build the core design.
    chip.run()

    # Copy GDS/DEF/LEF files for use in the top-level build.
    jobdir = f"{chip.get('option', 'builddir')}/{design}/{chip.get('option', 'jobname')}"
    shutil.copy(f'{jobdir}/export/0/outputs/{design}.gds', f'gds/{design}.gds')
    shutil.copy(f'{jobdir}/export/0/inputs/{design}.def', f'def/{design}.def')
    shutil.copy(f'{jobdir}/export/0/inputs/{design}.lef', f'lef/{design}.lef')
    shutil.copy(f'{jobdir}/dfm/0/outputs/{design}.vg', f'gl/{design}.vg')

def build_top_only_pmu(design="user_project_wrapper"):
    # The 'hearbeat' RTL goes in a modified 'user_project_wrapper' object, see sources.
    chip = Chip(design)
    chip.load_target('skywater130_demo')
    chip.set('tool', 'openroad', 'var', 'place', '0', 'place_density', ['0.15'])
    chip.set('tool', 'openroad', 'var', 'route', '0', 'grt_allow_congestion', ['true'])
    chip.clock('user_clock2', period=20)

    # Set top-level source files.
    chip.set('input', 'verilog', f'{CARAVEL_ROOT}/verilog/rtl/defines.v')
    chip.add('input', 'verilog', 'rtl/user_project_wrapper_pmu.v')
    chip.add('input', 'verilog', 'rtl/pmu.bb.v')

    # User project wrapper area is 2.92mm x 3.52mm
    TOP_W = 2920
    TOP_H = 3520

    # Set top-level die/core area.
    chip.set('asic', 'diearea', (0, 0))
    chip.add('asic', 'diearea', (TOP_W, TOP_H))
    chip.set('asic', 'corearea', (MARGIN_W, MARGIN_H))
    chip.add('asic', 'corearea', (TOP_W - MARGIN_W, TOP_H - MARGIN_H))

    # Add core design macro as a library.
    libname = 'pmu'
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
add_pdn_stripe -grid core_grid -layer met1 -width 0.48 -starts_with POWER -followpins
add_pdn_connect -grid core_grid -layers {met1 met5}

# Done defining commands; generate PDN.
pdngen''')
    chip.set('pdk', pdk, 'aprtech', 'openroad', stackup, libtype, 'pdngen', 'build/pdngen_top.tcl')

    # Generate macro-placement script.
    with open('build/macroplace_top.tcl', 'w') as mf:
        mf.write('''
# 'mprj' user-defined project macro, near the center of the die area.
#place_cell -inst_name mprj -origin {1024.88 1689.12} -orient R0 -status FIRM
place_cell -inst_name mprj -origin { 934.72  204.00} -orient R0 -status FIRM
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
    build_pmu()
