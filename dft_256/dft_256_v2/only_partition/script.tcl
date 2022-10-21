############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project dft_256_v2
set_top dft
add_files dft_256_v2/coefficients256.h
add_files dft_256_v2/dft.cpp
add_files dft_256_v2/dft.h
add_files -tb dft_256_v2/dft_test.cpp
add_files -tb dft_256_v2/out.gold.dat
open_solution "only_partition" -flow_target vivado
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
source "./dft_256_v2/only_partition/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
