set SynModuleInfo {
  {SRCNAME Loop_VITIS_LOOP_18_1_proc MODELNAME Loop_VITIS_LOOP_18_1_proc RTLNAME dft_Loop_VITIS_LOOP_18_1_proc
    SUBMODULES {
      {MODELNAME dft_flow_control_loop_pipe RTLNAME dft_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME dft_flow_control_loop_pipe_U}
    }
  }
  {SRCNAME Loop_VITIS_LOOP_23_2_proc_Pipeline_VITIS_LOOP_23_2 MODELNAME Loop_VITIS_LOOP_23_2_proc_Pipeline_VITIS_LOOP_23_2 RTLNAME dft_Loop_VITIS_LOOP_23_2_proc_Pipeline_VITIS_LOOP_23_2
    SUBMODULES {
      {MODELNAME dft_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME dft_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME dft_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME dft_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME dft_Loop_VITIS_LOOP_23_2_proc_Pipeline_VITIS_LOOP_23_2_cos_coefficients_table_ROMbkb RTLNAME dft_Loop_VITIS_LOOP_23_2_proc_Pipeline_VITIS_LOOP_23_2_cos_coefficients_table_ROMbkb BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME dft_Loop_VITIS_LOOP_23_2_proc_Pipeline_VITIS_LOOP_23_2_sin_coefficients_table_ROMcud RTLNAME dft_Loop_VITIS_LOOP_23_2_proc_Pipeline_VITIS_LOOP_23_2_sin_coefficients_table_ROMcud BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME dft_flow_control_loop_pipe_sequential_init RTLNAME dft_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME dft_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME Loop_VITIS_LOOP_23_2_proc MODELNAME Loop_VITIS_LOOP_23_2_proc RTLNAME dft_Loop_VITIS_LOOP_23_2_proc}
  {SRCNAME dft MODELNAME dft RTLNAME dft IS_TOP 1
    SUBMODULES {
      {MODELNAME dft_fifo_w32_d2_S RTLNAME dft_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
    }
  }
}
