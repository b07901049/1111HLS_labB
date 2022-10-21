############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project dft_256
set_top dft
add_files dft_256/dft.h
add_files dft_256/dft.cpp
add_files dft_256/coefficients256.h
add_files -tb dft_256/out.gold.dat -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb dft_256/dft_test.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution3"

create_clock -period 2 -name default
source "./dft_256/solution3/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
