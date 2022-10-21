create_project prj -part xc7z020-clg484-1 -force
set_property target_language verilog [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/verilog"
source "D:/1111HLS/LabB/dft_256/dft_256/solution1/syn/verilog/dft_dmul_64ns_64ns_64_7_max_dsp_1_ip.tcl"
source "D:/1111HLS/LabB/dft_256/dft_256/solution1/syn/verilog/dft_faddfsub_32ns_32ns_32_5_full_dsp_1_ip.tcl"
source "D:/1111HLS/LabB/dft_256/dft_256/solution1/syn/verilog/dft_fmul_32ns_32ns_32_4_max_dsp_1_ip.tcl"
source "D:/1111HLS/LabB/dft_256/dft_256/solution1/syn/verilog/dft_fptrunc_64ns_32_2_no_dsp_1_ip.tcl"
source "D:/1111HLS/LabB/dft_256/dft_256/solution1/syn/verilog/dft_sitodp_32ns_64_6_no_dsp_1_ip.tcl"
