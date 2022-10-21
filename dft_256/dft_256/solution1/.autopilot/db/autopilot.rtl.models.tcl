set SynModuleInfo {
  {SRCNAME dft_Pipeline_VITIS_LOOP_12_1 MODELNAME dft_Pipeline_VITIS_LOOP_12_1 RTLNAME dft_dft_Pipeline_VITIS_LOOP_12_1
    SUBMODULES {
      {MODELNAME dft_flow_control_loop_pipe_sequential_init RTLNAME dft_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME dft_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME sin_or_cos<float> MODELNAME sin_or_cos_float_s RTLNAME dft_sin_or_cos_float_s
    SUBMODULES {
      {MODELNAME dft_mul_80s_24ns_80_5_1 RTLNAME dft_mul_80s_24ns_80_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME dft_mux_83_1_1_1 RTLNAME dft_mux_83_1_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME dft_mux_164_1_1_1 RTLNAME dft_mux_164_1_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME dft_mul_23s_22ns_45_1_1 RTLNAME dft_mul_23s_22ns_45_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME dft_mul_30s_29ns_58_2_1 RTLNAME dft_mul_30s_29ns_58_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME dft_mul_mul_15ns_15ns_30_4_1 RTLNAME dft_mul_mul_15ns_15ns_30_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME dft_mul_mul_15ns_15s_30_4_1 RTLNAME dft_mul_mul_15ns_15s_30_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME dft_sin_or_cos_float_s_ref_4oPi_table_100_V_ROM_1P_LUTRAM_1R RTLNAME dft_sin_or_cos_float_s_ref_4oPi_table_100_V_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME dft_sin_or_cos_float_s_second_order_float_sin_cos_K0_V_ROM_1P_LUTRAM_1R RTLNAME dft_sin_or_cos_float_s_second_order_float_sin_cos_K0_V_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME dft_sin_or_cos_float_s_second_order_float_sin_cos_K1_V_ROM_1P_LUTRAM_1R RTLNAME dft_sin_or_cos_float_s_second_order_float_sin_cos_K1_V_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME dft_sin_or_cos_float_s_second_order_float_sin_cos_K2_V_ROM_1P_LUTRAM_1R RTLNAME dft_sin_or_cos_float_s_second_order_float_sin_cos_K2_V_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME dft_Pipeline_VITIS_LOOP_20_3 MODELNAME dft_Pipeline_VITIS_LOOP_20_3 RTLNAME dft_dft_Pipeline_VITIS_LOOP_20_3
    SUBMODULES {
      {MODELNAME dft_faddfsub_32ns_32ns_32_5_full_dsp_1 RTLNAME dft_faddfsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME dft_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME dft_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME dft_fptrunc_64ns_32_2_no_dsp_1 RTLNAME dft_fptrunc_64ns_32_2_no_dsp_1 BINDTYPE op TYPE fptrunc IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME dft_dmul_64ns_64ns_64_7_max_dsp_1 RTLNAME dft_dmul_64ns_64ns_64_7_max_dsp_1 BINDTYPE op TYPE dmul IMPL maxdsp LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME dft_sitodp_32ns_64_6_no_dsp_1 RTLNAME dft_sitodp_32ns_64_6_no_dsp_1 BINDTYPE op TYPE sitodp IMPL auto LATENCY 5 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME dft_Pipeline_VITIS_LOOP_31_4 MODELNAME dft_Pipeline_VITIS_LOOP_31_4 RTLNAME dft_dft_Pipeline_VITIS_LOOP_31_4}
  {SRCNAME dft MODELNAME dft RTLNAME dft IS_TOP 1
    SUBMODULES {
      {MODELNAME dft_sum_r_RAM_AUTO_1R1W RTLNAME dft_sum_r_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
