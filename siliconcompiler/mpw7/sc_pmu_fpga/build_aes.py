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

def build_pmu(design="aes"):
    chip = Chip(design)
    chip.load_target('skywater130_demo')

    # Load all source
    chip.add('input', 'verilog', './rtl/aes.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/aes/aes_core.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/aes/aes_decipher_block.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/aes/aes_inv_sbox.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/aes/aes_key_mem.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/aes/aes_sbox.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/aes/round_key.v')

    # Design constraints
    chip.set('input', 'sdc', 'sdc/aes.sdc')

    chip.set('tool', 'openroad', 'var', 'place', '0', 'place_density', ['0.35'])
    chip.set('tool', 'openroad', 'var', 'route', '0', 'grt_allow_congestion', ['true'])

    # Die area
    CORE_W = 999.58
    CORE_H = 919.36

    # Set user design die/core area.
    chip.set('asic', 'diearea', (0, 0))
    chip.add('asic', 'diearea', (CORE_W, CORE_H))
    chip.set('asic', 'corearea', (MARGIN_W, MARGIN_H))
    chip.add('asic', 'corearea', (CORE_W - MARGIN_W, CORE_H - MARGIN_H))

    # No routing on met4-met5.
    stackup = chip.get('asic', 'stackup')
    libtype = 'unithd'
    chip.set('asic', 'maxlayer', 'met3')

    chip.set('library', 'sky130hd', 'asic', 'cells', 'filler', ['sky130_fd_sc_hd__fill_1',
                                                                'sky130_fd_sc_hd__fill_2',
                                                                'sky130_fd_sc_hd__decap_3',
                                                                'sky130_fd_sc_hd__decap_4',
                                                                'sky130_fd_sc_hd__decap_6',
                                                                'sky130_fd_sc_hd__decap_8',
                                                                'sky130_ef_sc_hd__decap_12'])
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




if __name__ == '__main__':
    build_pmu()
