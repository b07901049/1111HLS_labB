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
	{ real_sample int 32 regular {array 256 { 1 3 } 1 1 }  }
	{ imag_sample int 32 unused {array 256 { } 0 1 }  }
	{ real_output int 32 regular {array 256 { 2 3 } 1 1 }  }
	{ imag_output int 32 regular {array 256 { 2 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "real_sample", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "imag_sample", "interface" : "memory", "bitwidth" : 32, "direction" : "NONE"} , 
 	{ "Name" : "real_output", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "imag_output", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 29
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ real_sample_address0 sc_out sc_lv 8 signal 0 } 
	{ real_sample_ce0 sc_out sc_logic 1 signal 0 } 
	{ real_sample_q0 sc_in sc_lv 32 signal 0 } 
	{ imag_sample_address0 sc_out sc_lv 8 signal 1 } 
	{ imag_sample_ce0 sc_out sc_logic 1 signal 1 } 
	{ imag_sample_we0 sc_out sc_logic 1 signal 1 } 
	{ imag_sample_d0 sc_out sc_lv 32 signal 1 } 
	{ imag_sample_q0 sc_in sc_lv 32 signal 1 } 
	{ imag_sample_address1 sc_out sc_lv 8 signal 1 } 
	{ imag_sample_ce1 sc_out sc_logic 1 signal 1 } 
	{ imag_sample_we1 sc_out sc_logic 1 signal 1 } 
	{ imag_sample_d1 sc_out sc_lv 32 signal 1 } 
	{ imag_sample_q1 sc_in sc_lv 32 signal 1 } 
	{ real_output_address0 sc_out sc_lv 8 signal 2 } 
	{ real_output_ce0 sc_out sc_logic 1 signal 2 } 
	{ real_output_we0 sc_out sc_logic 1 signal 2 } 
	{ real_output_d0 sc_out sc_lv 32 signal 2 } 
	{ real_output_q0 sc_in sc_lv 32 signal 2 } 
	{ imag_output_address0 sc_out sc_lv 8 signal 3 } 
	{ imag_output_ce0 sc_out sc_logic 1 signal 3 } 
	{ imag_output_we0 sc_out sc_logic 1 signal 3 } 
	{ imag_output_d0 sc_out sc_lv 32 signal 3 } 
	{ imag_output_q0 sc_in sc_lv 32 signal 3 } 
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
 	{ "name": "real_sample_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "real_sample", "role": "q0" }} , 
 	{ "name": "imag_sample_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "imag_sample", "role": "address0" }} , 
 	{ "name": "imag_sample_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imag_sample", "role": "ce0" }} , 
 	{ "name": "imag_sample_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imag_sample", "role": "we0" }} , 
 	{ "name": "imag_sample_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imag_sample", "role": "d0" }} , 
 	{ "name": "imag_sample_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imag_sample", "role": "q0" }} , 
 	{ "name": "imag_sample_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "imag_sample", "role": "address1" }} , 
 	{ "name": "imag_sample_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imag_sample", "role": "ce1" }} , 
 	{ "name": "imag_sample_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imag_sample", "role": "we1" }} , 
 	{ "name": "imag_sample_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imag_sample", "role": "d1" }} , 
 	{ "name": "imag_sample_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imag_sample", "role": "q1" }} , 
 	{ "name": "real_output_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "real_output", "role": "address0" }} , 
 	{ "name": "real_output_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "real_output", "role": "ce0" }} , 
 	{ "name": "real_output_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "real_output", "role": "we0" }} , 
 	{ "name": "real_output_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "real_output", "role": "d0" }} , 
 	{ "name": "real_output_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "real_output", "role": "q0" }} , 
 	{ "name": "imag_output_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "imag_output", "role": "address0" }} , 
 	{ "name": "imag_output_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imag_output", "role": "ce0" }} , 
 	{ "name": "imag_output_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imag_output", "role": "we0" }} , 
 	{ "name": "imag_output_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imag_output", "role": "d0" }} , 
 	{ "name": "imag_output_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imag_output", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "4"],
		"CDFG" : "dft",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "331268", "EstimateLatencyMax" : "331268",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "real_sample", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86", "Port" : "real_sample", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "imag_sample", "Type" : "Memory", "Direction" : "X"},
			{"Name" : "real_output", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94", "Port" : "real_output", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "imag_output", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94", "Port" : "imag_output", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94", "Port" : "cos_coefficients_table", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94", "Port" : "sin_coefficients_table", "Inst_start_state" : "5", "Inst_end_state" : "6"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_15_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.temp_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86", "Parent" : "0", "Child" : ["3"],
		"CDFG" : "dft_Pipeline_VITIS_LOOP_11_1",
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
			{"Name" : "temp", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_11_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86.flow_control_loop_pipe_sequential_init_U", "Parent" : "2"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94", "Parent" : "0", "Child" : ["5", "6", "7", "8", "9"],
		"CDFG" : "dft_Pipeline_VITIS_LOOP_17_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1289", "EstimateLatencyMax" : "1289",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bitcast_ln20", "Type" : "None", "Direction" : "I"},
			{"Name" : "bitcast_ln19", "Type" : "None", "Direction" : "I"},
			{"Name" : "imag_output", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "zext_ln15", "Type" : "None", "Direction" : "I"},
			{"Name" : "real_output", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "trunc_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "temp", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "cos_coefficients_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sin_coefficients_table", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_17_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94.cos_coefficients_table_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94.sin_coefficients_table_U", "Parent" : "4"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94.fadd_32ns_32ns_32_5_full_dsp_1_U3", "Parent" : "4"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94.fmul_32ns_32ns_32_4_max_dsp_1_U4", "Parent" : "4"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94.flow_control_loop_pipe_sequential_init_U", "Parent" : "4"}]}


set ArgLastReadFirstWriteLatency {
	dft {
		real_sample {Type I LastRead 0 FirstWrite -1}
		imag_sample {Type X LastRead -1 FirstWrite -1}
		real_output {Type IO LastRead 2 FirstWrite 11}
		imag_output {Type IO LastRead 2 FirstWrite 12}
		cos_coefficients_table {Type I LastRead -1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead -1 FirstWrite -1}}
	dft_Pipeline_VITIS_LOOP_11_1 {
		real_sample {Type I LastRead 0 FirstWrite -1}
		temp {Type O LastRead -1 FirstWrite 1}}
	dft_Pipeline_VITIS_LOOP_17_3 {
		bitcast_ln20 {Type I LastRead 0 FirstWrite -1}
		bitcast_ln19 {Type I LastRead 0 FirstWrite -1}
		imag_output {Type O LastRead -1 FirstWrite 12}
		zext_ln15 {Type I LastRead 0 FirstWrite -1}
		real_output {Type O LastRead -1 FirstWrite 11}
		trunc_ln {Type I LastRead 0 FirstWrite -1}
		temp {Type I LastRead 0 FirstWrite -1}
		cos_coefficients_table {Type I LastRead -1 FirstWrite -1}
		sin_coefficients_table {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "331268", "Max" : "331268"}
	, {"Name" : "Interval", "Min" : "331269", "Max" : "331269"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	real_sample { ap_memory {  { real_sample_address0 mem_address 1 8 }  { real_sample_ce0 mem_ce 1 1 }  { real_sample_q0 mem_dout 0 32 } } }
	imag_sample { ap_memory {  { imag_sample_address0 mem_address 1 8 }  { imag_sample_ce0 mem_ce 1 1 }  { imag_sample_we0 mem_we 1 1 }  { imag_sample_d0 mem_din 1 32 }  { imag_sample_q0 mem_dout 0 32 }  { imag_sample_address1 MemPortADDR2 1 8 }  { imag_sample_ce1 MemPortCE2 1 1 }  { imag_sample_we1 MemPortWE2 1 1 }  { imag_sample_d1 MemPortDIN2 1 32 }  { imag_sample_q1 MemPortDOUT2 0 32 } } }
	real_output { ap_memory {  { real_output_address0 mem_address 1 8 }  { real_output_ce0 mem_ce 1 1 }  { real_output_we0 mem_we 1 1 }  { real_output_d0 mem_din 1 32 }  { real_output_q0 mem_dout 0 32 } } }
	imag_output { ap_memory {  { imag_output_address0 mem_address 1 8 }  { imag_output_ce0 mem_ce 1 1 }  { imag_output_we0 mem_we 1 1 }  { imag_output_d0 mem_din 1 32 }  { imag_output_q0 mem_dout 0 32 } } }
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
