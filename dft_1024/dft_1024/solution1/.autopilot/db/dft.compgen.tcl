# This script segment is generated automatically by AutoPilot

set name dft_fadd_32ns_32ns_32_5_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fadd} IMPL {fulldsp} LATENCY 4 ALLOW_PRAGMA 1
}


set name dft_fadd_32ns_32ns_32_5_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fadd} IMPL {fulldsp} LATENCY 4 ALLOW_PRAGMA 1
}


set name dft_fmul_32ns_32ns_32_4_max_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fmul} IMPL {maxdsp} LATENCY 3 ALLOW_PRAGMA 1
}


# Memory (RAM/ROM)  definition:
set ID 5386
set hasByteEnable 0
set MemName dft_temp_RAM_AUTO_1R1W
set CoreName ap_simcore_mem
set PortList { 2 1 }
set DataWd 32
set AddrRange 16
set AddrWd 4
set impl_style auto
set TrueReset 0
set IsROM 0
set ROMData { }
set HasInitializer 0
set Initializer $ROMData
set NumOfStage 2
set DelayBudget 2.322
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $MemName BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


set CoreName RAM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_RAM] == "::AESL_LIB_VIRTEX::xil_gen_RAM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_RAM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_RAM, check your platform lib"
  }
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5387 \
    name real_sample_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_0 \
    op interface \
    ports { real_sample_0_address0 { O 4 vector } real_sample_0_ce0 { O 1 bit } real_sample_0_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5388 \
    name real_sample_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_1 \
    op interface \
    ports { real_sample_1_address0 { O 4 vector } real_sample_1_ce0 { O 1 bit } real_sample_1_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5389 \
    name real_sample_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_2 \
    op interface \
    ports { real_sample_2_address0 { O 4 vector } real_sample_2_ce0 { O 1 bit } real_sample_2_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5390 \
    name real_sample_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_3 \
    op interface \
    ports { real_sample_3_address0 { O 4 vector } real_sample_3_ce0 { O 1 bit } real_sample_3_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5391 \
    name real_sample_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_4 \
    op interface \
    ports { real_sample_4_address0 { O 4 vector } real_sample_4_ce0 { O 1 bit } real_sample_4_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5392 \
    name real_sample_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_5 \
    op interface \
    ports { real_sample_5_address0 { O 4 vector } real_sample_5_ce0 { O 1 bit } real_sample_5_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5393 \
    name real_sample_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_6 \
    op interface \
    ports { real_sample_6_address0 { O 4 vector } real_sample_6_ce0 { O 1 bit } real_sample_6_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5394 \
    name real_sample_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_7 \
    op interface \
    ports { real_sample_7_address0 { O 4 vector } real_sample_7_ce0 { O 1 bit } real_sample_7_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5395 \
    name real_sample_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_8 \
    op interface \
    ports { real_sample_8_address0 { O 4 vector } real_sample_8_ce0 { O 1 bit } real_sample_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5396 \
    name real_sample_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_9 \
    op interface \
    ports { real_sample_9_address0 { O 4 vector } real_sample_9_ce0 { O 1 bit } real_sample_9_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5397 \
    name real_sample_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_10 \
    op interface \
    ports { real_sample_10_address0 { O 4 vector } real_sample_10_ce0 { O 1 bit } real_sample_10_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5398 \
    name real_sample_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_11 \
    op interface \
    ports { real_sample_11_address0 { O 4 vector } real_sample_11_ce0 { O 1 bit } real_sample_11_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5399 \
    name real_sample_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_12 \
    op interface \
    ports { real_sample_12_address0 { O 4 vector } real_sample_12_ce0 { O 1 bit } real_sample_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5400 \
    name real_sample_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_13 \
    op interface \
    ports { real_sample_13_address0 { O 4 vector } real_sample_13_ce0 { O 1 bit } real_sample_13_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5401 \
    name real_sample_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_14 \
    op interface \
    ports { real_sample_14_address0 { O 4 vector } real_sample_14_ce0 { O 1 bit } real_sample_14_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5402 \
    name real_sample_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_15 \
    op interface \
    ports { real_sample_15_address0 { O 4 vector } real_sample_15_ce0 { O 1 bit } real_sample_15_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5403 \
    name real_sample_16 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_16 \
    op interface \
    ports { real_sample_16_address0 { O 4 vector } real_sample_16_ce0 { O 1 bit } real_sample_16_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_16'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5404 \
    name real_sample_17 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_17 \
    op interface \
    ports { real_sample_17_address0 { O 4 vector } real_sample_17_ce0 { O 1 bit } real_sample_17_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_17'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5405 \
    name real_sample_18 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_18 \
    op interface \
    ports { real_sample_18_address0 { O 4 vector } real_sample_18_ce0 { O 1 bit } real_sample_18_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_18'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5406 \
    name real_sample_19 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_19 \
    op interface \
    ports { real_sample_19_address0 { O 4 vector } real_sample_19_ce0 { O 1 bit } real_sample_19_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_19'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5407 \
    name real_sample_20 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_20 \
    op interface \
    ports { real_sample_20_address0 { O 4 vector } real_sample_20_ce0 { O 1 bit } real_sample_20_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_20'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5408 \
    name real_sample_21 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_21 \
    op interface \
    ports { real_sample_21_address0 { O 4 vector } real_sample_21_ce0 { O 1 bit } real_sample_21_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_21'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5409 \
    name real_sample_22 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_22 \
    op interface \
    ports { real_sample_22_address0 { O 4 vector } real_sample_22_ce0 { O 1 bit } real_sample_22_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_22'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5410 \
    name real_sample_23 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_23 \
    op interface \
    ports { real_sample_23_address0 { O 4 vector } real_sample_23_ce0 { O 1 bit } real_sample_23_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_23'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5411 \
    name real_sample_24 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_24 \
    op interface \
    ports { real_sample_24_address0 { O 4 vector } real_sample_24_ce0 { O 1 bit } real_sample_24_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_24'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5412 \
    name real_sample_25 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_25 \
    op interface \
    ports { real_sample_25_address0 { O 4 vector } real_sample_25_ce0 { O 1 bit } real_sample_25_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_25'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5413 \
    name real_sample_26 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_26 \
    op interface \
    ports { real_sample_26_address0 { O 4 vector } real_sample_26_ce0 { O 1 bit } real_sample_26_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_26'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5414 \
    name real_sample_27 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_27 \
    op interface \
    ports { real_sample_27_address0 { O 4 vector } real_sample_27_ce0 { O 1 bit } real_sample_27_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_27'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5415 \
    name real_sample_28 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_28 \
    op interface \
    ports { real_sample_28_address0 { O 4 vector } real_sample_28_ce0 { O 1 bit } real_sample_28_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_28'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5416 \
    name real_sample_29 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_29 \
    op interface \
    ports { real_sample_29_address0 { O 4 vector } real_sample_29_ce0 { O 1 bit } real_sample_29_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_29'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5417 \
    name real_sample_30 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_30 \
    op interface \
    ports { real_sample_30_address0 { O 4 vector } real_sample_30_ce0 { O 1 bit } real_sample_30_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_30'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5418 \
    name real_sample_31 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_31 \
    op interface \
    ports { real_sample_31_address0 { O 4 vector } real_sample_31_ce0 { O 1 bit } real_sample_31_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_31'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5419 \
    name real_sample_32 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_32 \
    op interface \
    ports { real_sample_32_address0 { O 4 vector } real_sample_32_ce0 { O 1 bit } real_sample_32_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_32'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5420 \
    name real_sample_33 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_33 \
    op interface \
    ports { real_sample_33_address0 { O 4 vector } real_sample_33_ce0 { O 1 bit } real_sample_33_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_33'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5421 \
    name real_sample_34 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_34 \
    op interface \
    ports { real_sample_34_address0 { O 4 vector } real_sample_34_ce0 { O 1 bit } real_sample_34_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_34'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5422 \
    name real_sample_35 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_35 \
    op interface \
    ports { real_sample_35_address0 { O 4 vector } real_sample_35_ce0 { O 1 bit } real_sample_35_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_35'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5423 \
    name real_sample_36 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_36 \
    op interface \
    ports { real_sample_36_address0 { O 4 vector } real_sample_36_ce0 { O 1 bit } real_sample_36_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_36'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5424 \
    name real_sample_37 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_37 \
    op interface \
    ports { real_sample_37_address0 { O 4 vector } real_sample_37_ce0 { O 1 bit } real_sample_37_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_37'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5425 \
    name real_sample_38 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_38 \
    op interface \
    ports { real_sample_38_address0 { O 4 vector } real_sample_38_ce0 { O 1 bit } real_sample_38_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_38'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5426 \
    name real_sample_39 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_39 \
    op interface \
    ports { real_sample_39_address0 { O 4 vector } real_sample_39_ce0 { O 1 bit } real_sample_39_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_39'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5427 \
    name real_sample_40 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_40 \
    op interface \
    ports { real_sample_40_address0 { O 4 vector } real_sample_40_ce0 { O 1 bit } real_sample_40_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_40'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5428 \
    name real_sample_41 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_41 \
    op interface \
    ports { real_sample_41_address0 { O 4 vector } real_sample_41_ce0 { O 1 bit } real_sample_41_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_41'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5429 \
    name real_sample_42 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_42 \
    op interface \
    ports { real_sample_42_address0 { O 4 vector } real_sample_42_ce0 { O 1 bit } real_sample_42_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_42'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5430 \
    name real_sample_43 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_43 \
    op interface \
    ports { real_sample_43_address0 { O 4 vector } real_sample_43_ce0 { O 1 bit } real_sample_43_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_43'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5431 \
    name real_sample_44 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_44 \
    op interface \
    ports { real_sample_44_address0 { O 4 vector } real_sample_44_ce0 { O 1 bit } real_sample_44_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_44'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5432 \
    name real_sample_45 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_45 \
    op interface \
    ports { real_sample_45_address0 { O 4 vector } real_sample_45_ce0 { O 1 bit } real_sample_45_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_45'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5433 \
    name real_sample_46 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_46 \
    op interface \
    ports { real_sample_46_address0 { O 4 vector } real_sample_46_ce0 { O 1 bit } real_sample_46_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_46'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5434 \
    name real_sample_47 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_47 \
    op interface \
    ports { real_sample_47_address0 { O 4 vector } real_sample_47_ce0 { O 1 bit } real_sample_47_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_47'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5435 \
    name real_sample_48 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_48 \
    op interface \
    ports { real_sample_48_address0 { O 4 vector } real_sample_48_ce0 { O 1 bit } real_sample_48_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_48'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5436 \
    name real_sample_49 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_49 \
    op interface \
    ports { real_sample_49_address0 { O 4 vector } real_sample_49_ce0 { O 1 bit } real_sample_49_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_49'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5437 \
    name real_sample_50 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_50 \
    op interface \
    ports { real_sample_50_address0 { O 4 vector } real_sample_50_ce0 { O 1 bit } real_sample_50_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_50'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5438 \
    name real_sample_51 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_51 \
    op interface \
    ports { real_sample_51_address0 { O 4 vector } real_sample_51_ce0 { O 1 bit } real_sample_51_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_51'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5439 \
    name real_sample_52 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_52 \
    op interface \
    ports { real_sample_52_address0 { O 4 vector } real_sample_52_ce0 { O 1 bit } real_sample_52_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_52'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5440 \
    name real_sample_53 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_53 \
    op interface \
    ports { real_sample_53_address0 { O 4 vector } real_sample_53_ce0 { O 1 bit } real_sample_53_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_53'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5441 \
    name real_sample_54 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_54 \
    op interface \
    ports { real_sample_54_address0 { O 4 vector } real_sample_54_ce0 { O 1 bit } real_sample_54_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_54'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5442 \
    name real_sample_55 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_55 \
    op interface \
    ports { real_sample_55_address0 { O 4 vector } real_sample_55_ce0 { O 1 bit } real_sample_55_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_55'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5443 \
    name real_sample_56 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_56 \
    op interface \
    ports { real_sample_56_address0 { O 4 vector } real_sample_56_ce0 { O 1 bit } real_sample_56_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_56'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5444 \
    name real_sample_57 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_57 \
    op interface \
    ports { real_sample_57_address0 { O 4 vector } real_sample_57_ce0 { O 1 bit } real_sample_57_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_57'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5445 \
    name real_sample_58 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_58 \
    op interface \
    ports { real_sample_58_address0 { O 4 vector } real_sample_58_ce0 { O 1 bit } real_sample_58_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_58'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5446 \
    name real_sample_59 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_59 \
    op interface \
    ports { real_sample_59_address0 { O 4 vector } real_sample_59_ce0 { O 1 bit } real_sample_59_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_59'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5447 \
    name real_sample_60 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_60 \
    op interface \
    ports { real_sample_60_address0 { O 4 vector } real_sample_60_ce0 { O 1 bit } real_sample_60_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_60'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5448 \
    name real_sample_61 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_61 \
    op interface \
    ports { real_sample_61_address0 { O 4 vector } real_sample_61_ce0 { O 1 bit } real_sample_61_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_61'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5449 \
    name real_sample_62 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_62 \
    op interface \
    ports { real_sample_62_address0 { O 4 vector } real_sample_62_ce0 { O 1 bit } real_sample_62_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_62'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5450 \
    name real_sample_63 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_63 \
    op interface \
    ports { real_sample_63_address0 { O 4 vector } real_sample_63_ce0 { O 1 bit } real_sample_63_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_63'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5451 \
    name real_output_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_0 \
    op interface \
    ports { real_output_0_address0 { O 4 vector } real_output_0_ce0 { O 1 bit } real_output_0_we0 { O 1 bit } real_output_0_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5452 \
    name real_output_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_1 \
    op interface \
    ports { real_output_1_address0 { O 4 vector } real_output_1_ce0 { O 1 bit } real_output_1_we0 { O 1 bit } real_output_1_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5453 \
    name real_output_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_2 \
    op interface \
    ports { real_output_2_address0 { O 4 vector } real_output_2_ce0 { O 1 bit } real_output_2_we0 { O 1 bit } real_output_2_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5454 \
    name real_output_3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_3 \
    op interface \
    ports { real_output_3_address0 { O 4 vector } real_output_3_ce0 { O 1 bit } real_output_3_we0 { O 1 bit } real_output_3_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5455 \
    name real_output_4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_4 \
    op interface \
    ports { real_output_4_address0 { O 4 vector } real_output_4_ce0 { O 1 bit } real_output_4_we0 { O 1 bit } real_output_4_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5456 \
    name real_output_5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_5 \
    op interface \
    ports { real_output_5_address0 { O 4 vector } real_output_5_ce0 { O 1 bit } real_output_5_we0 { O 1 bit } real_output_5_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5457 \
    name real_output_6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_6 \
    op interface \
    ports { real_output_6_address0 { O 4 vector } real_output_6_ce0 { O 1 bit } real_output_6_we0 { O 1 bit } real_output_6_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5458 \
    name real_output_7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_7 \
    op interface \
    ports { real_output_7_address0 { O 4 vector } real_output_7_ce0 { O 1 bit } real_output_7_we0 { O 1 bit } real_output_7_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5459 \
    name real_output_8 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_8 \
    op interface \
    ports { real_output_8_address0 { O 4 vector } real_output_8_ce0 { O 1 bit } real_output_8_we0 { O 1 bit } real_output_8_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5460 \
    name real_output_9 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_9 \
    op interface \
    ports { real_output_9_address0 { O 4 vector } real_output_9_ce0 { O 1 bit } real_output_9_we0 { O 1 bit } real_output_9_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5461 \
    name real_output_10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_10 \
    op interface \
    ports { real_output_10_address0 { O 4 vector } real_output_10_ce0 { O 1 bit } real_output_10_we0 { O 1 bit } real_output_10_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5462 \
    name real_output_11 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_11 \
    op interface \
    ports { real_output_11_address0 { O 4 vector } real_output_11_ce0 { O 1 bit } real_output_11_we0 { O 1 bit } real_output_11_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5463 \
    name real_output_12 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_12 \
    op interface \
    ports { real_output_12_address0 { O 4 vector } real_output_12_ce0 { O 1 bit } real_output_12_we0 { O 1 bit } real_output_12_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5464 \
    name real_output_13 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_13 \
    op interface \
    ports { real_output_13_address0 { O 4 vector } real_output_13_ce0 { O 1 bit } real_output_13_we0 { O 1 bit } real_output_13_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5465 \
    name real_output_14 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_14 \
    op interface \
    ports { real_output_14_address0 { O 4 vector } real_output_14_ce0 { O 1 bit } real_output_14_we0 { O 1 bit } real_output_14_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5466 \
    name real_output_15 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_15 \
    op interface \
    ports { real_output_15_address0 { O 4 vector } real_output_15_ce0 { O 1 bit } real_output_15_we0 { O 1 bit } real_output_15_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5467 \
    name real_output_16 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_16 \
    op interface \
    ports { real_output_16_address0 { O 4 vector } real_output_16_ce0 { O 1 bit } real_output_16_we0 { O 1 bit } real_output_16_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_16'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5468 \
    name real_output_17 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_17 \
    op interface \
    ports { real_output_17_address0 { O 4 vector } real_output_17_ce0 { O 1 bit } real_output_17_we0 { O 1 bit } real_output_17_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_17'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5469 \
    name real_output_18 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_18 \
    op interface \
    ports { real_output_18_address0 { O 4 vector } real_output_18_ce0 { O 1 bit } real_output_18_we0 { O 1 bit } real_output_18_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_18'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5470 \
    name real_output_19 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_19 \
    op interface \
    ports { real_output_19_address0 { O 4 vector } real_output_19_ce0 { O 1 bit } real_output_19_we0 { O 1 bit } real_output_19_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_19'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5471 \
    name real_output_20 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_20 \
    op interface \
    ports { real_output_20_address0 { O 4 vector } real_output_20_ce0 { O 1 bit } real_output_20_we0 { O 1 bit } real_output_20_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_20'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5472 \
    name real_output_21 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_21 \
    op interface \
    ports { real_output_21_address0 { O 4 vector } real_output_21_ce0 { O 1 bit } real_output_21_we0 { O 1 bit } real_output_21_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_21'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5473 \
    name real_output_22 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_22 \
    op interface \
    ports { real_output_22_address0 { O 4 vector } real_output_22_ce0 { O 1 bit } real_output_22_we0 { O 1 bit } real_output_22_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_22'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5474 \
    name real_output_23 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_23 \
    op interface \
    ports { real_output_23_address0 { O 4 vector } real_output_23_ce0 { O 1 bit } real_output_23_we0 { O 1 bit } real_output_23_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_23'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5475 \
    name real_output_24 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_24 \
    op interface \
    ports { real_output_24_address0 { O 4 vector } real_output_24_ce0 { O 1 bit } real_output_24_we0 { O 1 bit } real_output_24_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_24'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5476 \
    name real_output_25 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_25 \
    op interface \
    ports { real_output_25_address0 { O 4 vector } real_output_25_ce0 { O 1 bit } real_output_25_we0 { O 1 bit } real_output_25_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_25'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5477 \
    name real_output_26 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_26 \
    op interface \
    ports { real_output_26_address0 { O 4 vector } real_output_26_ce0 { O 1 bit } real_output_26_we0 { O 1 bit } real_output_26_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_26'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5478 \
    name real_output_27 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_27 \
    op interface \
    ports { real_output_27_address0 { O 4 vector } real_output_27_ce0 { O 1 bit } real_output_27_we0 { O 1 bit } real_output_27_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_27'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5479 \
    name real_output_28 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_28 \
    op interface \
    ports { real_output_28_address0 { O 4 vector } real_output_28_ce0 { O 1 bit } real_output_28_we0 { O 1 bit } real_output_28_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_28'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5480 \
    name real_output_29 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_29 \
    op interface \
    ports { real_output_29_address0 { O 4 vector } real_output_29_ce0 { O 1 bit } real_output_29_we0 { O 1 bit } real_output_29_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_29'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5481 \
    name real_output_30 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_30 \
    op interface \
    ports { real_output_30_address0 { O 4 vector } real_output_30_ce0 { O 1 bit } real_output_30_we0 { O 1 bit } real_output_30_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_30'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5482 \
    name real_output_31 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_31 \
    op interface \
    ports { real_output_31_address0 { O 4 vector } real_output_31_ce0 { O 1 bit } real_output_31_we0 { O 1 bit } real_output_31_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_31'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5483 \
    name real_output_32 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_32 \
    op interface \
    ports { real_output_32_address0 { O 4 vector } real_output_32_ce0 { O 1 bit } real_output_32_we0 { O 1 bit } real_output_32_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_32'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5484 \
    name real_output_33 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_33 \
    op interface \
    ports { real_output_33_address0 { O 4 vector } real_output_33_ce0 { O 1 bit } real_output_33_we0 { O 1 bit } real_output_33_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_33'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5485 \
    name real_output_34 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_34 \
    op interface \
    ports { real_output_34_address0 { O 4 vector } real_output_34_ce0 { O 1 bit } real_output_34_we0 { O 1 bit } real_output_34_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_34'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5486 \
    name real_output_35 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_35 \
    op interface \
    ports { real_output_35_address0 { O 4 vector } real_output_35_ce0 { O 1 bit } real_output_35_we0 { O 1 bit } real_output_35_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_35'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5487 \
    name real_output_36 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_36 \
    op interface \
    ports { real_output_36_address0 { O 4 vector } real_output_36_ce0 { O 1 bit } real_output_36_we0 { O 1 bit } real_output_36_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_36'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5488 \
    name real_output_37 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_37 \
    op interface \
    ports { real_output_37_address0 { O 4 vector } real_output_37_ce0 { O 1 bit } real_output_37_we0 { O 1 bit } real_output_37_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_37'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5489 \
    name real_output_38 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_38 \
    op interface \
    ports { real_output_38_address0 { O 4 vector } real_output_38_ce0 { O 1 bit } real_output_38_we0 { O 1 bit } real_output_38_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_38'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5490 \
    name real_output_39 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_39 \
    op interface \
    ports { real_output_39_address0 { O 4 vector } real_output_39_ce0 { O 1 bit } real_output_39_we0 { O 1 bit } real_output_39_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_39'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5491 \
    name real_output_40 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_40 \
    op interface \
    ports { real_output_40_address0 { O 4 vector } real_output_40_ce0 { O 1 bit } real_output_40_we0 { O 1 bit } real_output_40_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_40'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5492 \
    name real_output_41 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_41 \
    op interface \
    ports { real_output_41_address0 { O 4 vector } real_output_41_ce0 { O 1 bit } real_output_41_we0 { O 1 bit } real_output_41_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_41'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5493 \
    name real_output_42 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_42 \
    op interface \
    ports { real_output_42_address0 { O 4 vector } real_output_42_ce0 { O 1 bit } real_output_42_we0 { O 1 bit } real_output_42_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_42'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5494 \
    name real_output_43 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_43 \
    op interface \
    ports { real_output_43_address0 { O 4 vector } real_output_43_ce0 { O 1 bit } real_output_43_we0 { O 1 bit } real_output_43_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_43'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5495 \
    name real_output_44 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_44 \
    op interface \
    ports { real_output_44_address0 { O 4 vector } real_output_44_ce0 { O 1 bit } real_output_44_we0 { O 1 bit } real_output_44_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_44'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5496 \
    name real_output_45 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_45 \
    op interface \
    ports { real_output_45_address0 { O 4 vector } real_output_45_ce0 { O 1 bit } real_output_45_we0 { O 1 bit } real_output_45_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_45'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5497 \
    name real_output_46 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_46 \
    op interface \
    ports { real_output_46_address0 { O 4 vector } real_output_46_ce0 { O 1 bit } real_output_46_we0 { O 1 bit } real_output_46_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_46'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5498 \
    name real_output_47 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_47 \
    op interface \
    ports { real_output_47_address0 { O 4 vector } real_output_47_ce0 { O 1 bit } real_output_47_we0 { O 1 bit } real_output_47_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_47'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5499 \
    name real_output_48 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_48 \
    op interface \
    ports { real_output_48_address0 { O 4 vector } real_output_48_ce0 { O 1 bit } real_output_48_we0 { O 1 bit } real_output_48_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_48'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5500 \
    name real_output_49 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_49 \
    op interface \
    ports { real_output_49_address0 { O 4 vector } real_output_49_ce0 { O 1 bit } real_output_49_we0 { O 1 bit } real_output_49_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_49'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5501 \
    name real_output_50 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_50 \
    op interface \
    ports { real_output_50_address0 { O 4 vector } real_output_50_ce0 { O 1 bit } real_output_50_we0 { O 1 bit } real_output_50_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_50'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5502 \
    name real_output_51 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_51 \
    op interface \
    ports { real_output_51_address0 { O 4 vector } real_output_51_ce0 { O 1 bit } real_output_51_we0 { O 1 bit } real_output_51_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_51'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5503 \
    name real_output_52 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_52 \
    op interface \
    ports { real_output_52_address0 { O 4 vector } real_output_52_ce0 { O 1 bit } real_output_52_we0 { O 1 bit } real_output_52_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_52'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5504 \
    name real_output_53 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_53 \
    op interface \
    ports { real_output_53_address0 { O 4 vector } real_output_53_ce0 { O 1 bit } real_output_53_we0 { O 1 bit } real_output_53_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_53'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5505 \
    name real_output_54 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_54 \
    op interface \
    ports { real_output_54_address0 { O 4 vector } real_output_54_ce0 { O 1 bit } real_output_54_we0 { O 1 bit } real_output_54_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_54'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5506 \
    name real_output_55 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_55 \
    op interface \
    ports { real_output_55_address0 { O 4 vector } real_output_55_ce0 { O 1 bit } real_output_55_we0 { O 1 bit } real_output_55_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_55'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5507 \
    name real_output_56 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_56 \
    op interface \
    ports { real_output_56_address0 { O 4 vector } real_output_56_ce0 { O 1 bit } real_output_56_we0 { O 1 bit } real_output_56_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_56'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5508 \
    name real_output_57 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_57 \
    op interface \
    ports { real_output_57_address0 { O 4 vector } real_output_57_ce0 { O 1 bit } real_output_57_we0 { O 1 bit } real_output_57_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_57'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5509 \
    name real_output_58 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_58 \
    op interface \
    ports { real_output_58_address0 { O 4 vector } real_output_58_ce0 { O 1 bit } real_output_58_we0 { O 1 bit } real_output_58_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_58'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5510 \
    name real_output_59 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_59 \
    op interface \
    ports { real_output_59_address0 { O 4 vector } real_output_59_ce0 { O 1 bit } real_output_59_we0 { O 1 bit } real_output_59_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_59'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5511 \
    name real_output_60 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_60 \
    op interface \
    ports { real_output_60_address0 { O 4 vector } real_output_60_ce0 { O 1 bit } real_output_60_we0 { O 1 bit } real_output_60_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_60'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5512 \
    name real_output_61 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_61 \
    op interface \
    ports { real_output_61_address0 { O 4 vector } real_output_61_ce0 { O 1 bit } real_output_61_we0 { O 1 bit } real_output_61_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_61'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5513 \
    name real_output_62 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_62 \
    op interface \
    ports { real_output_62_address0 { O 4 vector } real_output_62_ce0 { O 1 bit } real_output_62_we0 { O 1 bit } real_output_62_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_62'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5514 \
    name real_output_63 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output_63 \
    op interface \
    ports { real_output_63_address0 { O 4 vector } real_output_63_ce0 { O 1 bit } real_output_63_we0 { O 1 bit } real_output_63_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output_63'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5515 \
    name imag_output_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_0 \
    op interface \
    ports { imag_output_0_address0 { O 4 vector } imag_output_0_ce0 { O 1 bit } imag_output_0_we0 { O 1 bit } imag_output_0_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5516 \
    name imag_output_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_1 \
    op interface \
    ports { imag_output_1_address0 { O 4 vector } imag_output_1_ce0 { O 1 bit } imag_output_1_we0 { O 1 bit } imag_output_1_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5517 \
    name imag_output_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_2 \
    op interface \
    ports { imag_output_2_address0 { O 4 vector } imag_output_2_ce0 { O 1 bit } imag_output_2_we0 { O 1 bit } imag_output_2_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5518 \
    name imag_output_3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_3 \
    op interface \
    ports { imag_output_3_address0 { O 4 vector } imag_output_3_ce0 { O 1 bit } imag_output_3_we0 { O 1 bit } imag_output_3_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5519 \
    name imag_output_4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_4 \
    op interface \
    ports { imag_output_4_address0 { O 4 vector } imag_output_4_ce0 { O 1 bit } imag_output_4_we0 { O 1 bit } imag_output_4_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5520 \
    name imag_output_5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_5 \
    op interface \
    ports { imag_output_5_address0 { O 4 vector } imag_output_5_ce0 { O 1 bit } imag_output_5_we0 { O 1 bit } imag_output_5_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5521 \
    name imag_output_6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_6 \
    op interface \
    ports { imag_output_6_address0 { O 4 vector } imag_output_6_ce0 { O 1 bit } imag_output_6_we0 { O 1 bit } imag_output_6_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5522 \
    name imag_output_7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_7 \
    op interface \
    ports { imag_output_7_address0 { O 4 vector } imag_output_7_ce0 { O 1 bit } imag_output_7_we0 { O 1 bit } imag_output_7_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5523 \
    name imag_output_8 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_8 \
    op interface \
    ports { imag_output_8_address0 { O 4 vector } imag_output_8_ce0 { O 1 bit } imag_output_8_we0 { O 1 bit } imag_output_8_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5524 \
    name imag_output_9 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_9 \
    op interface \
    ports { imag_output_9_address0 { O 4 vector } imag_output_9_ce0 { O 1 bit } imag_output_9_we0 { O 1 bit } imag_output_9_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5525 \
    name imag_output_10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_10 \
    op interface \
    ports { imag_output_10_address0 { O 4 vector } imag_output_10_ce0 { O 1 bit } imag_output_10_we0 { O 1 bit } imag_output_10_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5526 \
    name imag_output_11 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_11 \
    op interface \
    ports { imag_output_11_address0 { O 4 vector } imag_output_11_ce0 { O 1 bit } imag_output_11_we0 { O 1 bit } imag_output_11_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5527 \
    name imag_output_12 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_12 \
    op interface \
    ports { imag_output_12_address0 { O 4 vector } imag_output_12_ce0 { O 1 bit } imag_output_12_we0 { O 1 bit } imag_output_12_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5528 \
    name imag_output_13 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_13 \
    op interface \
    ports { imag_output_13_address0 { O 4 vector } imag_output_13_ce0 { O 1 bit } imag_output_13_we0 { O 1 bit } imag_output_13_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5529 \
    name imag_output_14 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_14 \
    op interface \
    ports { imag_output_14_address0 { O 4 vector } imag_output_14_ce0 { O 1 bit } imag_output_14_we0 { O 1 bit } imag_output_14_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5530 \
    name imag_output_15 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_15 \
    op interface \
    ports { imag_output_15_address0 { O 4 vector } imag_output_15_ce0 { O 1 bit } imag_output_15_we0 { O 1 bit } imag_output_15_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5531 \
    name imag_output_16 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_16 \
    op interface \
    ports { imag_output_16_address0 { O 4 vector } imag_output_16_ce0 { O 1 bit } imag_output_16_we0 { O 1 bit } imag_output_16_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_16'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5532 \
    name imag_output_17 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_17 \
    op interface \
    ports { imag_output_17_address0 { O 4 vector } imag_output_17_ce0 { O 1 bit } imag_output_17_we0 { O 1 bit } imag_output_17_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_17'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5533 \
    name imag_output_18 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_18 \
    op interface \
    ports { imag_output_18_address0 { O 4 vector } imag_output_18_ce0 { O 1 bit } imag_output_18_we0 { O 1 bit } imag_output_18_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_18'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5534 \
    name imag_output_19 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_19 \
    op interface \
    ports { imag_output_19_address0 { O 4 vector } imag_output_19_ce0 { O 1 bit } imag_output_19_we0 { O 1 bit } imag_output_19_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_19'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5535 \
    name imag_output_20 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_20 \
    op interface \
    ports { imag_output_20_address0 { O 4 vector } imag_output_20_ce0 { O 1 bit } imag_output_20_we0 { O 1 bit } imag_output_20_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_20'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5536 \
    name imag_output_21 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_21 \
    op interface \
    ports { imag_output_21_address0 { O 4 vector } imag_output_21_ce0 { O 1 bit } imag_output_21_we0 { O 1 bit } imag_output_21_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_21'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5537 \
    name imag_output_22 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_22 \
    op interface \
    ports { imag_output_22_address0 { O 4 vector } imag_output_22_ce0 { O 1 bit } imag_output_22_we0 { O 1 bit } imag_output_22_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_22'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5538 \
    name imag_output_23 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_23 \
    op interface \
    ports { imag_output_23_address0 { O 4 vector } imag_output_23_ce0 { O 1 bit } imag_output_23_we0 { O 1 bit } imag_output_23_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_23'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5539 \
    name imag_output_24 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_24 \
    op interface \
    ports { imag_output_24_address0 { O 4 vector } imag_output_24_ce0 { O 1 bit } imag_output_24_we0 { O 1 bit } imag_output_24_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_24'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5540 \
    name imag_output_25 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_25 \
    op interface \
    ports { imag_output_25_address0 { O 4 vector } imag_output_25_ce0 { O 1 bit } imag_output_25_we0 { O 1 bit } imag_output_25_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_25'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5541 \
    name imag_output_26 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_26 \
    op interface \
    ports { imag_output_26_address0 { O 4 vector } imag_output_26_ce0 { O 1 bit } imag_output_26_we0 { O 1 bit } imag_output_26_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_26'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5542 \
    name imag_output_27 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_27 \
    op interface \
    ports { imag_output_27_address0 { O 4 vector } imag_output_27_ce0 { O 1 bit } imag_output_27_we0 { O 1 bit } imag_output_27_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_27'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5543 \
    name imag_output_28 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_28 \
    op interface \
    ports { imag_output_28_address0 { O 4 vector } imag_output_28_ce0 { O 1 bit } imag_output_28_we0 { O 1 bit } imag_output_28_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_28'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5544 \
    name imag_output_29 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_29 \
    op interface \
    ports { imag_output_29_address0 { O 4 vector } imag_output_29_ce0 { O 1 bit } imag_output_29_we0 { O 1 bit } imag_output_29_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_29'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5545 \
    name imag_output_30 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_30 \
    op interface \
    ports { imag_output_30_address0 { O 4 vector } imag_output_30_ce0 { O 1 bit } imag_output_30_we0 { O 1 bit } imag_output_30_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_30'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5546 \
    name imag_output_31 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_31 \
    op interface \
    ports { imag_output_31_address0 { O 4 vector } imag_output_31_ce0 { O 1 bit } imag_output_31_we0 { O 1 bit } imag_output_31_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_31'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5547 \
    name imag_output_32 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_32 \
    op interface \
    ports { imag_output_32_address0 { O 4 vector } imag_output_32_ce0 { O 1 bit } imag_output_32_we0 { O 1 bit } imag_output_32_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_32'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5548 \
    name imag_output_33 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_33 \
    op interface \
    ports { imag_output_33_address0 { O 4 vector } imag_output_33_ce0 { O 1 bit } imag_output_33_we0 { O 1 bit } imag_output_33_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_33'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5549 \
    name imag_output_34 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_34 \
    op interface \
    ports { imag_output_34_address0 { O 4 vector } imag_output_34_ce0 { O 1 bit } imag_output_34_we0 { O 1 bit } imag_output_34_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_34'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5550 \
    name imag_output_35 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_35 \
    op interface \
    ports { imag_output_35_address0 { O 4 vector } imag_output_35_ce0 { O 1 bit } imag_output_35_we0 { O 1 bit } imag_output_35_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_35'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5551 \
    name imag_output_36 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_36 \
    op interface \
    ports { imag_output_36_address0 { O 4 vector } imag_output_36_ce0 { O 1 bit } imag_output_36_we0 { O 1 bit } imag_output_36_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_36'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5552 \
    name imag_output_37 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_37 \
    op interface \
    ports { imag_output_37_address0 { O 4 vector } imag_output_37_ce0 { O 1 bit } imag_output_37_we0 { O 1 bit } imag_output_37_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_37'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5553 \
    name imag_output_38 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_38 \
    op interface \
    ports { imag_output_38_address0 { O 4 vector } imag_output_38_ce0 { O 1 bit } imag_output_38_we0 { O 1 bit } imag_output_38_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_38'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5554 \
    name imag_output_39 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_39 \
    op interface \
    ports { imag_output_39_address0 { O 4 vector } imag_output_39_ce0 { O 1 bit } imag_output_39_we0 { O 1 bit } imag_output_39_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_39'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5555 \
    name imag_output_40 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_40 \
    op interface \
    ports { imag_output_40_address0 { O 4 vector } imag_output_40_ce0 { O 1 bit } imag_output_40_we0 { O 1 bit } imag_output_40_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_40'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5556 \
    name imag_output_41 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_41 \
    op interface \
    ports { imag_output_41_address0 { O 4 vector } imag_output_41_ce0 { O 1 bit } imag_output_41_we0 { O 1 bit } imag_output_41_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_41'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5557 \
    name imag_output_42 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_42 \
    op interface \
    ports { imag_output_42_address0 { O 4 vector } imag_output_42_ce0 { O 1 bit } imag_output_42_we0 { O 1 bit } imag_output_42_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_42'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5558 \
    name imag_output_43 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_43 \
    op interface \
    ports { imag_output_43_address0 { O 4 vector } imag_output_43_ce0 { O 1 bit } imag_output_43_we0 { O 1 bit } imag_output_43_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_43'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5559 \
    name imag_output_44 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_44 \
    op interface \
    ports { imag_output_44_address0 { O 4 vector } imag_output_44_ce0 { O 1 bit } imag_output_44_we0 { O 1 bit } imag_output_44_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_44'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5560 \
    name imag_output_45 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_45 \
    op interface \
    ports { imag_output_45_address0 { O 4 vector } imag_output_45_ce0 { O 1 bit } imag_output_45_we0 { O 1 bit } imag_output_45_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_45'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5561 \
    name imag_output_46 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_46 \
    op interface \
    ports { imag_output_46_address0 { O 4 vector } imag_output_46_ce0 { O 1 bit } imag_output_46_we0 { O 1 bit } imag_output_46_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_46'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5562 \
    name imag_output_47 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_47 \
    op interface \
    ports { imag_output_47_address0 { O 4 vector } imag_output_47_ce0 { O 1 bit } imag_output_47_we0 { O 1 bit } imag_output_47_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_47'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5563 \
    name imag_output_48 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_48 \
    op interface \
    ports { imag_output_48_address0 { O 4 vector } imag_output_48_ce0 { O 1 bit } imag_output_48_we0 { O 1 bit } imag_output_48_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_48'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5564 \
    name imag_output_49 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_49 \
    op interface \
    ports { imag_output_49_address0 { O 4 vector } imag_output_49_ce0 { O 1 bit } imag_output_49_we0 { O 1 bit } imag_output_49_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_49'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5565 \
    name imag_output_50 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_50 \
    op interface \
    ports { imag_output_50_address0 { O 4 vector } imag_output_50_ce0 { O 1 bit } imag_output_50_we0 { O 1 bit } imag_output_50_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_50'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5566 \
    name imag_output_51 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_51 \
    op interface \
    ports { imag_output_51_address0 { O 4 vector } imag_output_51_ce0 { O 1 bit } imag_output_51_we0 { O 1 bit } imag_output_51_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_51'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5567 \
    name imag_output_52 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_52 \
    op interface \
    ports { imag_output_52_address0 { O 4 vector } imag_output_52_ce0 { O 1 bit } imag_output_52_we0 { O 1 bit } imag_output_52_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_52'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5568 \
    name imag_output_53 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_53 \
    op interface \
    ports { imag_output_53_address0 { O 4 vector } imag_output_53_ce0 { O 1 bit } imag_output_53_we0 { O 1 bit } imag_output_53_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_53'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5569 \
    name imag_output_54 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_54 \
    op interface \
    ports { imag_output_54_address0 { O 4 vector } imag_output_54_ce0 { O 1 bit } imag_output_54_we0 { O 1 bit } imag_output_54_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_54'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5570 \
    name imag_output_55 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_55 \
    op interface \
    ports { imag_output_55_address0 { O 4 vector } imag_output_55_ce0 { O 1 bit } imag_output_55_we0 { O 1 bit } imag_output_55_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_55'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5571 \
    name imag_output_56 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_56 \
    op interface \
    ports { imag_output_56_address0 { O 4 vector } imag_output_56_ce0 { O 1 bit } imag_output_56_we0 { O 1 bit } imag_output_56_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_56'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5572 \
    name imag_output_57 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_57 \
    op interface \
    ports { imag_output_57_address0 { O 4 vector } imag_output_57_ce0 { O 1 bit } imag_output_57_we0 { O 1 bit } imag_output_57_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_57'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5573 \
    name imag_output_58 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_58 \
    op interface \
    ports { imag_output_58_address0 { O 4 vector } imag_output_58_ce0 { O 1 bit } imag_output_58_we0 { O 1 bit } imag_output_58_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_58'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5574 \
    name imag_output_59 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_59 \
    op interface \
    ports { imag_output_59_address0 { O 4 vector } imag_output_59_ce0 { O 1 bit } imag_output_59_we0 { O 1 bit } imag_output_59_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_59'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5575 \
    name imag_output_60 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_60 \
    op interface \
    ports { imag_output_60_address0 { O 4 vector } imag_output_60_ce0 { O 1 bit } imag_output_60_we0 { O 1 bit } imag_output_60_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_60'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5576 \
    name imag_output_61 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_61 \
    op interface \
    ports { imag_output_61_address0 { O 4 vector } imag_output_61_ce0 { O 1 bit } imag_output_61_we0 { O 1 bit } imag_output_61_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_61'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5577 \
    name imag_output_62 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_62 \
    op interface \
    ports { imag_output_62_address0 { O 4 vector } imag_output_62_ce0 { O 1 bit } imag_output_62_we0 { O 1 bit } imag_output_62_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_62'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5578 \
    name imag_output_63 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output_63 \
    op interface \
    ports { imag_output_63_address0 { O 4 vector } imag_output_63_ce0 { O 1 bit } imag_output_63_we0 { O 1 bit } imag_output_63_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output_63'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


