set SynModuleInfo {
  {SRCNAME dft_Pipeline_VITIS_LOOP_18_1 MODELNAME dft_Pipeline_VITIS_LOOP_18_1 RTLNAME dft_dft_Pipeline_VITIS_LOOP_18_1
    SUBMODULES {
      {MODELNAME dft_mux_646_32_1_1 RTLNAME dft_mux_646_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME dft_flow_control_loop_pipe_sequential_init RTLNAME dft_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME dft_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME dft_Pipeline_VITIS_LOOP_28_3 MODELNAME dft_Pipeline_VITIS_LOOP_28_3 RTLNAME dft_dft_Pipeline_VITIS_LOOP_28_3
    SUBMODULES {
      {MODELNAME dft_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME dft_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME dft_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME dft_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME dft_mul_8s_8s_8_1_1 RTLNAME dft_mul_8s_8s_8_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME dft_mux_576_32_1_1 RTLNAME dft_mux_576_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME dft_mux_586_32_1_1 RTLNAME dft_mux_586_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME dft_mux_596_32_1_1 RTLNAME dft_mux_596_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME dft_mux_606_32_1_1 RTLNAME dft_mux_606_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME dft_mux_616_32_1_1 RTLNAME dft_mux_616_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME dft_mux_626_32_1_1 RTLNAME dft_mux_626_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME dft_mux_636_32_1_1 RTLNAME dft_mux_636_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME dft_dft_Pipeline_VITIS_LOOP_28_3_cos_coefficients_table_ROM_AUTO_1R RTLNAME dft_dft_Pipeline_VITIS_LOOP_28_3_cos_coefficients_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME dft_dft_Pipeline_VITIS_LOOP_28_3_sin_coefficients_table_ROM_AUTO_1R RTLNAME dft_dft_Pipeline_VITIS_LOOP_28_3_sin_coefficients_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME dft MODELNAME dft RTLNAME dft IS_TOP 1}
}
