############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project dft_v3
set_top dft
add_files dft_v3/coefficients256.h
add_files dft_v3/dft.cpp
add_files dft_v3/dft.h
add_files -tb dft_v3/dft_test.cpp
add_files -tb dft_v3/out.gold.dat
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
#source "./dft_v3/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
