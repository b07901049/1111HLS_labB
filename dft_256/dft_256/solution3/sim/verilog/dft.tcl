
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set cinoutgroup [add_wave_group "C InOuts" -into $designtopgroup]
set return_group [add_wave_group return(memory) -into $cinoutgroup]
add_wave /apatb_dft_top/AESL_inst_dft/imag_output_q0 -into $return_group -radix hex
add_wave /apatb_dft_top/AESL_inst_dft/imag_output_d0 -into $return_group -radix hex
add_wave /apatb_dft_top/AESL_inst_dft/imag_output_we0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_dft_top/AESL_inst_dft/imag_output_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_dft_top/AESL_inst_dft/imag_output_address0 -into $return_group -radix hex
add_wave /apatb_dft_top/AESL_inst_dft/real_output_q0 -into $return_group -radix hex
add_wave /apatb_dft_top/AESL_inst_dft/real_output_d0 -into $return_group -radix hex
add_wave /apatb_dft_top/AESL_inst_dft/real_output_we0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_dft_top/AESL_inst_dft/real_output_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_dft_top/AESL_inst_dft/real_output_address0 -into $return_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set return_group [add_wave_group return(memory) -into $cinputgroup]
add_wave /apatb_dft_top/AESL_inst_dft/real_sample_q0 -into $return_group -radix hex
add_wave /apatb_dft_top/AESL_inst_dft/real_sample_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_dft_top/AESL_inst_dft/real_sample_address0 -into $return_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_dft_top/AESL_inst_dft/ap_start -into $blocksiggroup
add_wave /apatb_dft_top/AESL_inst_dft/ap_done -into $blocksiggroup
add_wave /apatb_dft_top/AESL_inst_dft/ap_idle -into $blocksiggroup
add_wave /apatb_dft_top/AESL_inst_dft/ap_ready -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_dft_top/AESL_inst_dft/ap_rst -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_dft_top/AESL_inst_dft/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_dft_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_dft_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_dft_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_dft_top/LENGTH_real_sample -into $tb_portdepth_group -radix hex
add_wave /apatb_dft_top/LENGTH_imag_sample -into $tb_portdepth_group -radix hex
add_wave /apatb_dft_top/LENGTH_real_output -into $tb_portdepth_group -radix hex
add_wave /apatb_dft_top/LENGTH_imag_output -into $tb_portdepth_group -radix hex
set tbcinoutgroup [add_wave_group "C InOuts" -into $testbenchgroup]
set tb_return_group [add_wave_group return(memory) -into $tbcinoutgroup]
add_wave /apatb_dft_top/imag_output_q0 -into $tb_return_group -radix hex
add_wave /apatb_dft_top/imag_output_d0 -into $tb_return_group -radix hex
add_wave /apatb_dft_top/imag_output_we0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_dft_top/imag_output_ce0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_dft_top/imag_output_address0 -into $tb_return_group -radix hex
add_wave /apatb_dft_top/real_output_q0 -into $tb_return_group -radix hex
add_wave /apatb_dft_top/real_output_d0 -into $tb_return_group -radix hex
add_wave /apatb_dft_top/real_output_we0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_dft_top/real_output_ce0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_dft_top/real_output_address0 -into $tb_return_group -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(memory) -into $tbcinputgroup]
add_wave /apatb_dft_top/real_sample_q0 -into $tb_return_group -radix hex
add_wave /apatb_dft_top/real_sample_ce0 -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_dft_top/real_sample_address0 -into $tb_return_group -radix hex
save_wave_config dft.wcfg
run all
quit

