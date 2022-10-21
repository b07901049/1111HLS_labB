set moduleName dft_Pipeline_VITIS_LOOP_11_1
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {dft_Pipeline_VITIS_LOOP_11_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ real_sample int 32 regular {array 256 { 1 3 } 1 1 }  }
	{ temp float 32 regular {array 256 { 0 3 } 0 1 }  }
	{ sum_r float 32 regular {array 256 { 0 3 } 0 1 }  }
	{ sum_i float 32 regular {array 256 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "real_sample", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "temp", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sum_r", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sum_i", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 21
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
	{ temp_address0 sc_out sc_lv 8 signal 1 } 
	{ temp_ce0 sc_out sc_logic 1 signal 1 } 
	{ temp_we0 sc_out sc_logic 1 signal 1 } 
	{ temp_d0 sc_out sc_lv 32 signal 1 } 
	{ sum_r_address0 sc_out sc_lv 8 signal 2 } 
	{ sum_r_ce0 sc_out sc_logic 1 signal 2 } 
	{ sum_r_we0 sc_out sc_logic 1 signal 2 } 
	{ sum_r_d0 sc_out sc_lv 32 signal 2 } 
	{ sum_i_address0 sc_out sc_lv 8 signal 3 } 
	{ sum_i_ce0 sc_out sc_logic 1 signal 3 } 
	{ sum_i_we0 sc_out sc_logic 1 signal 3 } 
	{ sum_i_d0 sc_out sc_lv 32 signal 3 } 
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
 	{ "name": "temp_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "temp", "role": "address0" }} , 
 	{ "name": "temp_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "temp", "role": "ce0" }} , 
 	{ "name": "temp_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "temp", "role": "we0" }} , 
 	{ "name": "temp_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "temp", "role": "d0" }} , 
 	{ "name": "sum_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sum_r", "role": "address0" }} , 
 	{ "name": "sum_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sum_r", "role": "ce0" }} , 
 	{ "name": "sum_r_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sum_r", "role": "we0" }} , 
 	{ "name": "sum_r_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sum_r", "role": "d0" }} , 
 	{ "name": "sum_i_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sum_i", "role": "address0" }} , 
 	{ "name": "sum_i_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sum_i", "role": "ce0" }} , 
 	{ "name": "sum_i_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sum_i", "role": "we0" }} , 
 	{ "name": "sum_i_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sum_i", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
			{"Name" : "temp", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sum_r", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sum_i", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_11_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	dft_Pipeline_VITIS_LOOP_11_1 {
		real_sample {Type I LastRead 0 FirstWrite -1}
		temp {Type O LastRead -1 FirstWrite 1}
		sum_r {Type O LastRead -1 FirstWrite 0}
		sum_i {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "258", "Max" : "258"}
	, {"Name" : "Interval", "Min" : "258", "Max" : "258"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	real_sample { ap_memory {  { real_sample_address0 mem_address 1 8 }  { real_sample_ce0 mem_ce 1 1 }  { real_sample_q0 in_data 0 32 } } }
	temp { ap_memory {  { temp_address0 mem_address 1 8 }  { temp_ce0 mem_ce 1 1 }  { temp_we0 mem_we 1 1 }  { temp_d0 mem_din 1 32 } } }
	sum_r { ap_memory {  { sum_r_address0 mem_address 1 8 }  { sum_r_ce0 mem_ce 1 1 }  { sum_r_we0 mem_we 1 1 }  { sum_r_d0 mem_din 1 32 } } }
	sum_i { ap_memory {  { sum_i_address0 mem_address 1 8 }  { sum_i_ce0 mem_ce 1 1 }  { sum_i_we0 mem_we 1 1 }  { sum_i_d0 mem_din 1 32 } } }
}
