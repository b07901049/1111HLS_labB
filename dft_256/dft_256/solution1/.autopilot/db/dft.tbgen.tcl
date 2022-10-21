set moduleName dft
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {dft}
set C_modelType { void 0 }
set C_modelArgList {
	{ real_sample int 32 regular {array 256 { 2 3 } 1 1 }  }
	{ imag_sample int 32 regular {array 256 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "real_sample", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "imag_sample", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 15
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ real_sample_address0 sc_out sc_lv 8 signal 0 } 
	{ real_sample_ce0 sc_out sc_logic 1 signal 0 } 
	{ real_sample_we0 sc_out sc_logic 1 signal 0 } 
	{ real_sample_d0 sc_out sc_lv 32 signal 0 } 
	{ real_sample_q0 sc_in sc_lv 32 signal 0 } 
	{ imag_sample_address0 sc_out sc_lv 8 signal 1 } 
	{ imag_sample_ce0 sc_out sc_logic 1 signal 1 } 
	{ imag_sample_we0 sc_out sc_logic 1 signal 1 } 
	{ imag_sample_d0 sc_out sc_lv 32 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "real_sample_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "real_sample", "role": "address0" }} , 
 	{ "name": "real_sample_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "real_sample", "role": "ce0" }} , 
 	{ "name": "real_sample_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "real_sample", "role": "we0" }} , 
 	{ "name": "real_sample_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "real_sample", "role": "d0" }} , 
 	{ "name": "real_sample_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "real_sample", "role": "q0" }} , 
 	{ "name": "imag_sample_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "imag_sample", "role": "address0" }} , 
 	{ "name": "imag_sample_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imag_sample", "role": "ce0" }} , 
 	{ "name": "imag_sample_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imag_sample", "role": "we0" }} , 
 	{ "name": "imag_sample_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imag_sample", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "6", "8"],
		"CDFG" : "dft",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "342791", "EstimateLatencyMax" : "342791",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "real_sample", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_dft_Pipeline_VITIS_LOOP_31_4_fu_106", "Port" : "real_sample", "Inst_start_state" : "3", "Inst_end_state" : "7"},
					{"ID" : "4", "SubInstance" : "grp_dft_Pipeline_VITIS_LOOP_12_1_fu_94", "Port" : "real_sample", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "imag_sample", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_dft_Pipeline_VITIS_LOOP_31_4_fu_106", "Port" : "imag_sample", "Inst_start_state" : "3", "Inst_end_state" : "7"}]},
			{"Name" : "ref_4oPi_table_100_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116", "Port" : "ref_4oPi_table_100_V", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "second_order_float_sin_cos_K0_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116", "Port" : "second_order_float_sin_cos_K0_V", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "second_order_float_sin_cos_K1_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116", "Port" : "second_order_float_sin_cos_K1_V", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "second_order_float_sin_cos_K2_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116", "Port" : "second_order_float_sin_cos_K2_V", "Inst_start_state" : "5", "Inst_end_state" : "6"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_18_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state7"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sum_r_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sum_i_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.temp_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_12_1_fu_94", "Parent" : "0", "Child" : ["5"],
		"CDFG" : "dft_Pipeline_VITIS_LOOP_12_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "258", "EstimateLatencyMax" : "258",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "real_sample", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "temp", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sum_r", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sum_i", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_12_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_12_1_fu_94.flow_control_loop_pipe_sequential_init_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_31_4_fu_106", "Parent" : "0", "Child" : ["7"],
		"CDFG" : "dft_Pipeline_VITIS_LOOP_31_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "258", "EstimateLatencyMax" : "258",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sum_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "real_sample", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sum_i", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "imag_sample", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_31_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_31_4_fu_106.flow_control_loop_pipe_sequential_init_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116", "Parent" : "0", "Child" : ["9", "22", "23", "24", "25", "26", "27"],
		"CDFG" : "dft_Pipeline_VITIS_LOOP_20_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1333", "EstimateLatencyMax" : "1333",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sum_i_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "sum_r_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "sum_i", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "zext_ln18", "Type" : "None", "Direction" : "I"},
			{"Name" : "sum_r", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "zext_ln21", "Type" : "None", "Direction" : "I"},
			{"Name" : "temp", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ref_4oPi_table_100_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sin_or_cos_float_s_fu_144", "Port" : "ref_4oPi_table_100_V", "Inst_start_state" : "24", "Inst_end_state" : "43"}]},
			{"Name" : "second_order_float_sin_cos_K0_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sin_or_cos_float_s_fu_144", "Port" : "second_order_float_sin_cos_K0_V", "Inst_start_state" : "24", "Inst_end_state" : "43"}]},
			{"Name" : "second_order_float_sin_cos_K1_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sin_or_cos_float_s_fu_144", "Port" : "second_order_float_sin_cos_K1_V", "Inst_start_state" : "24", "Inst_end_state" : "43"}]},
			{"Name" : "second_order_float_sin_cos_K2_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sin_or_cos_float_s_fu_144", "Port" : "second_order_float_sin_cos_K2_V", "Inst_start_state" : "24", "Inst_end_state" : "43"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_20_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter10", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter10", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116.grp_sin_or_cos_float_s_fu_144", "Parent" : "8", "Child" : ["10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21"],
		"CDFG" : "sin_or_cos_float_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "19", "EstimateLatencyMin" : "19", "EstimateLatencyMax" : "19",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "t_in", "Type" : "None", "Direction" : "I"},
			{"Name" : "do_cos", "Type" : "None", "Direction" : "I"},
			{"Name" : "ref_4oPi_table_100_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "second_order_float_sin_cos_K0_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "second_order_float_sin_cos_K1_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "second_order_float_sin_cos_K2_V", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116.grp_sin_or_cos_float_s_fu_144.ref_4oPi_table_100_V_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116.grp_sin_or_cos_float_s_fu_144.second_order_float_sin_cos_K0_V_U", "Parent" : "9"},
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116.grp_sin_or_cos_float_s_fu_144.second_order_float_sin_cos_K1_V_U", "Parent" : "9"},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116.grp_sin_or_cos_float_s_fu_144.second_order_float_sin_cos_K2_V_U", "Parent" : "9"},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116.grp_sin_or_cos_float_s_fu_144.mul_80s_24ns_80_5_1_U5", "Parent" : "9"},
	{"ID" : "15", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116.grp_sin_or_cos_float_s_fu_144.mux_83_1_1_1_U6", "Parent" : "9"},
	{"ID" : "16", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116.grp_sin_or_cos_float_s_fu_144.mux_164_1_1_1_U7", "Parent" : "9"},
	{"ID" : "17", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116.grp_sin_or_cos_float_s_fu_144.mux_164_1_1_1_U8", "Parent" : "9"},
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116.grp_sin_or_cos_float_s_fu_144.mul_23s_22ns_45_1_1_U9", "Parent" : "9"},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116.grp_sin_or_cos_float_s_fu_144.mul_30s_29ns_58_2_1_U10", "Parent" : "9"},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116.grp_sin_or_cos_float_s_fu_144.mul_mul_15ns_15ns_30_4_1_U11", "Parent" : "9"},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116.grp_sin_or_cos_float_s_fu_144.mul_mul_15ns_15s_30_4_1_U12", "Parent" : "9"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116.faddfsub_32ns_32ns_32_5_full_dsp_1_U27", "Parent" : "8"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116.fmul_32ns_32ns_32_4_max_dsp_1_U28", "Parent" : "8"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116.fptrunc_64ns_32_2_no_dsp_1_U29", "Parent" : "8"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116.dmul_64ns_64ns_64_7_max_dsp_1_U30", "Parent" : "8"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116.sitodp_32ns_64_6_no_dsp_1_U31", "Parent" : "8"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_20_3_fu_116.flow_control_loop_pipe_sequential_init_U", "Parent" : "8"}]}


set ArgLastReadFirstWriteLatency {
	dft {
		real_sample {Type IO LastRead 0 FirstWrite -1}
		imag_sample {Type O LastRead -1 FirstWrite 1}
		ref_4oPi_table_100_V {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K0_V {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K1_V {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K2_V {Type I LastRead -1 FirstWrite -1}}
	dft_Pipeline_VITIS_LOOP_12_1 {
		real_sample {Type I LastRead 0 FirstWrite -1}
		temp {Type O LastRead -1 FirstWrite 1}
		sum_r {Type O LastRead -1 FirstWrite 0}
		sum_i {Type O LastRead -1 FirstWrite 0}}
	dft_Pipeline_VITIS_LOOP_31_4 {
		sum_r {Type I LastRead 0 FirstWrite -1}
		real_sample {Type O LastRead -1 FirstWrite 1}
		sum_i {Type I LastRead 0 FirstWrite -1}
		imag_sample {Type O LastRead -1 FirstWrite 1}}
	dft_Pipeline_VITIS_LOOP_20_3 {
		sum_i_load {Type I LastRead 0 FirstWrite -1}
		sum_r_load {Type I LastRead 0 FirstWrite -1}
		sum_i {Type O LastRead -1 FirstWrite 52}
		zext_ln18 {Type I LastRead 0 FirstWrite -1}
		sum_r {Type O LastRead -1 FirstWrite 51}
		zext_ln21 {Type I LastRead 0 FirstWrite -1}
		temp {Type I LastRead 40 FirstWrite -1}
		ref_4oPi_table_100_V {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K0_V {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K1_V {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K2_V {Type I LastRead -1 FirstWrite -1}}
	sin_or_cos_float_s {
		t_in {Type I LastRead 0 FirstWrite -1}
		do_cos {Type I LastRead 0 FirstWrite -1}
		ref_4oPi_table_100_V {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K0_V {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K1_V {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K2_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "342791", "Max" : "342791"}
	, {"Name" : "Interval", "Min" : "342792", "Max" : "342792"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	real_sample { ap_memory {  { real_sample_address0 mem_address 1 8 }  { real_sample_ce0 mem_ce 1 1 }  { real_sample_we0 mem_we 1 1 }  { real_sample_d0 mem_din 1 32 }  { real_sample_q0 mem_dout 0 32 } } }
	imag_sample { ap_memory {  { imag_sample_address0 mem_address 1 8 }  { imag_sample_ce0 mem_ce 1 1 }  { imag_sample_we0 mem_we 1 1 }  { imag_sample_d0 mem_din 1 32 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
