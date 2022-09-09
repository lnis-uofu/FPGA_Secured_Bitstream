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

def build_fpga(design="fpga_top"):
    chip = Chip(design)
    chip.load_target('skywater130_demo')

    # Load all sources
    chip.set('input', 'verilog', './rtl/fpga_top.v')

    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/CustomModules/frac_lut4_arith.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/CustomModules/frac_mult_18_18.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/CustomModules/frac_mult_18x18.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/CustomModules/sky130_fd_sc_hd_wrapper.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/CustomModules/sofa_plus_ccff.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/CustomModules/sofa_plus_dff.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/CustomModules/sofa_plus_io.v')

    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/lb/grid_clb.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/lb/grid_io_bottom_bottom.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/lb/grid_io_left_left.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/lb/grid_io_right_right.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/lb/grid_io_top_top.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/lb/grid_mult_18.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/lb/logical_tile_clb_mode_clb_.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/lb/logical_tile_clb_mode_default__fle.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__ff.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__frac_logic.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__frac_logic_mode_default__frac_lut4_arith.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/lb/logical_tile_io_mode_io_.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/lb/logical_tile_io_mode_physical__iopad.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/lb/logical_tile_mult_18_mode_default__mult_18_core.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/lb/logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/lb/logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/lb/logical_tile_mult_18_mode_mult_18_.v')

    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/routing/cbx_1__0_.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/routing/cbx_1__2_.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/routing/cby_0__1_.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/routing/cby_1__1_.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/routing/cby_2__1_.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/routing/sb_0__0_.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/routing/sb_0__1_.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/routing/sb_0__2_.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/routing/sb_1__0_.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/routing/sb_1__1_.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/routing/sb_1__2_.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/routing/sb_2__0_.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/routing/sb_2__1_.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/routing/sb_2__2_.v')

    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/sub_module/arch_encoder.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/sub_module/inv_buf_passgate.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/sub_module/local_encoder.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/sub_module/luts.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/sub_module/memories.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/sub_module/mux_primitives.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/sub_module/muxes.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/sub_module/shift_register_banks.v')
    chip.add('input', 'verilog', '../../../pmu/rtl/fpga_22/sub_module/wires.v')

    # Design constraint (Clock)
    chip.set('input', 'sdc', 'sdc/fpga.sdc')

    chip.set('tool', 'openroad', 'var', 'place', '0', 'place_density', ['0.45'])
    chip.set('tool', 'openroad', 'var', 'route', '0', 'grt_allow_congestion', ['true'])

    # Die area
    CORE_W = 819.72
    CORE_H = 818.72

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
    build_fpga()

