# This script segment is generated automatically by AutoPilot

set id 1
set name dft_mux_646_32_1_1
set corename simcore_mux
set op mux
set stage_num 1
set din0_width 32
set din0_signed 0
set din1_width 32
set din1_signed 0
set din2_width 32
set din2_signed 0
set din3_width 32
set din3_signed 0
set din4_width 32
set din4_signed 0
set din5_width 32
set din5_signed 0
set din6_width 32
set din6_signed 0
set din7_width 32
set din7_signed 0
set din8_width 32
set din8_signed 0
set din9_width 32
set din9_signed 0
set din10_width 32
set din10_signed 0
set din11_width 32
set din11_signed 0
set din12_width 32
set din12_signed 0
set din13_width 32
set din13_signed 0
set din14_width 32
set din14_signed 0
set din15_width 32
set din15_signed 0
set din16_width 32
set din16_signed 0
set din17_width 32
set din17_signed 0
set din18_width 32
set din18_signed 0
set din19_width 32
set din19_signed 0
set din20_width 32
set din20_signed 0
set din21_width 32
set din21_signed 0
set din22_width 32
set din22_signed 0
set din23_width 32
set din23_signed 0
set din24_width 32
set din24_signed 0
set din25_width 32
set din25_signed 0
set din26_width 32
set din26_signed 0
set din27_width 32
set din27_signed 0
set din28_width 32
set din28_signed 0
set din29_width 32
set din29_signed 0
set din30_width 32
set din30_signed 0
set din31_width 32
set din31_signed 0
set din32_width 32
set din32_signed 0
set din33_width 32
set din33_signed 0
set din34_width 32
set din34_signed 0
set din35_width 32
set din35_signed 0
set din36_width 32
set din36_signed 0
set din37_width 32
set din37_signed 0
set din38_width 32
set din38_signed 0
set din39_width 32
set din39_signed 0
set din40_width 32
set din40_signed 0
set din41_width 32
set din41_signed 0
set din42_width 32
set din42_signed 0
set din43_width 32
set din43_signed 0
set din44_width 32
set din44_signed 0
set din45_width 32
set din45_signed 0
set din46_width 32
set din46_signed 0
set din47_width 32
set din47_signed 0
set din48_width 32
set din48_signed 0
set din49_width 32
set din49_signed 0
set din50_width 32
set din50_signed 0
set din51_width 32
set din51_signed 0
set din52_width 32
set din52_signed 0
set din53_width 32
set din53_signed 0
set din54_width 32
set din54_signed 0
set din55_width 32
set din55_signed 0
set din56_width 32
set din56_signed 0
set din57_width 32
set din57_signed 0
set din58_width 32
set din58_signed 0
set din59_width 32
set din59_signed 0
set din60_width 32
set din60_signed 0
set din61_width 32
set din61_signed 0
set din62_width 32
set din62_signed 0
set din63_width 32
set din63_signed 0
set din64_width 6
set din64_signed 0
set dout_width 32
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mux} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set op mux
set corename Multiplexer
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_pipemux] == "::AESL_LIB_VIRTEX::xil_gen_pipemux"} {
eval "::AESL_LIB_VIRTEX::xil_gen_pipemux { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    din0_width ${din0_width} \
    din0_signed ${din0_signed} \
    din1_width ${din1_width} \
    din1_signed ${din1_signed} \
    din2_width ${din2_width} \
    din2_signed ${din2_signed} \
    din3_width ${din3_width} \
    din3_signed ${din3_signed} \
    din4_width ${din4_width} \
    din4_signed ${din4_signed} \
    din5_width ${din5_width} \
    din5_signed ${din5_signed} \
    din6_width ${din6_width} \
    din6_signed ${din6_signed} \
    din7_width ${din7_width} \
    din7_signed ${din7_signed} \
    din8_width ${din8_width} \
    din8_signed ${din8_signed} \
    din9_width ${din9_width} \
    din9_signed ${din9_signed} \
    din10_width ${din10_width} \
    din10_signed ${din10_signed} \
    din11_width ${din11_width} \
    din11_signed ${din11_signed} \
    din12_width ${din12_width} \
    din12_signed ${din12_signed} \
    din13_width ${din13_width} \
    din13_signed ${din13_signed} \
    din14_width ${din14_width} \
    din14_signed ${din14_signed} \
    din15_width ${din15_width} \
    din15_signed ${din15_signed} \
    din16_width ${din16_width} \
    din16_signed ${din16_signed} \
    din17_width ${din17_width} \
    din17_signed ${din17_signed} \
    din18_width ${din18_width} \
    din18_signed ${din18_signed} \
    din19_width ${din19_width} \
    din19_signed ${din19_signed} \
    din20_width ${din20_width} \
    din20_signed ${din20_signed} \
    din21_width ${din21_width} \
    din21_signed ${din21_signed} \
    din22_width ${din22_width} \
    din22_signed ${din22_signed} \
    din23_width ${din23_width} \
    din23_signed ${din23_signed} \
    din24_width ${din24_width} \
    din24_signed ${din24_signed} \
    din25_width ${din25_width} \
    din25_signed ${din25_signed} \
    din26_width ${din26_width} \
    din26_signed ${din26_signed} \
    din27_width ${din27_width} \
    din27_signed ${din27_signed} \
    din28_width ${din28_width} \
    din28_signed ${din28_signed} \
    din29_width ${din29_width} \
    din29_signed ${din29_signed} \
    din30_width ${din30_width} \
    din30_signed ${din30_signed} \
    din31_width ${din31_width} \
    din31_signed ${din31_signed} \
    din32_width ${din32_width} \
    din32_signed ${din32_signed} \
    din33_width ${din33_width} \
    din33_signed ${din33_signed} \
    din34_width ${din34_width} \
    din34_signed ${din34_signed} \
    din35_width ${din35_width} \
    din35_signed ${din35_signed} \
    din36_width ${din36_width} \
    din36_signed ${din36_signed} \
    din37_width ${din37_width} \
    din37_signed ${din37_signed} \
    din38_width ${din38_width} \
    din38_signed ${din38_signed} \
    din39_width ${din39_width} \
    din39_signed ${din39_signed} \
    din40_width ${din40_width} \
    din40_signed ${din40_signed} \
    din41_width ${din41_width} \
    din41_signed ${din41_signed} \
    din42_width ${din42_width} \
    din42_signed ${din42_signed} \
    din43_width ${din43_width} \
    din43_signed ${din43_signed} \
    din44_width ${din44_width} \
    din44_signed ${din44_signed} \
    din45_width ${din45_width} \
    din45_signed ${din45_signed} \
    din46_width ${din46_width} \
    din46_signed ${din46_signed} \
    din47_width ${din47_width} \
    din47_signed ${din47_signed} \
    din48_width ${din48_width} \
    din48_signed ${din48_signed} \
    din49_width ${din49_width} \
    din49_signed ${din49_signed} \
    din50_width ${din50_width} \
    din50_signed ${din50_signed} \
    din51_width ${din51_width} \
    din51_signed ${din51_signed} \
    din52_width ${din52_width} \
    din52_signed ${din52_signed} \
    din53_width ${din53_width} \
    din53_signed ${din53_signed} \
    din54_width ${din54_width} \
    din54_signed ${din54_signed} \
    din55_width ${din55_width} \
    din55_signed ${din55_signed} \
    din56_width ${din56_width} \
    din56_signed ${din56_signed} \
    din57_width ${din57_width} \
    din57_signed ${din57_signed} \
    din58_width ${din58_width} \
    din58_signed ${din58_signed} \
    din59_width ${din59_width} \
    din59_signed ${din59_signed} \
    din60_width ${din60_width} \
    din60_signed ${din60_signed} \
    din61_width ${din61_width} \
    din61_signed ${din61_signed} \
    din62_width ${din62_width} \
    din62_signed ${din62_signed} \
    din63_width ${din63_width} \
    din63_signed ${din63_signed} \
    din64_width ${din64_width} \
    din64_signed ${din64_signed} \
    dout_width ${dout_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_pipemux, check your platform lib"
}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3 \
    name real_sample_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_0 \
    op interface \
    ports { real_sample_0_address0 { O 2 vector } real_sample_0_ce0 { O 1 bit } real_sample_0_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 4 \
    name real_sample_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_1 \
    op interface \
    ports { real_sample_1_address0 { O 2 vector } real_sample_1_ce0 { O 1 bit } real_sample_1_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5 \
    name real_sample_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_2 \
    op interface \
    ports { real_sample_2_address0 { O 2 vector } real_sample_2_ce0 { O 1 bit } real_sample_2_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 6 \
    name real_sample_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_3 \
    op interface \
    ports { real_sample_3_address0 { O 2 vector } real_sample_3_ce0 { O 1 bit } real_sample_3_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 7 \
    name real_sample_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_4 \
    op interface \
    ports { real_sample_4_address0 { O 2 vector } real_sample_4_ce0 { O 1 bit } real_sample_4_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 8 \
    name real_sample_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_5 \
    op interface \
    ports { real_sample_5_address0 { O 2 vector } real_sample_5_ce0 { O 1 bit } real_sample_5_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 9 \
    name real_sample_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_6 \
    op interface \
    ports { real_sample_6_address0 { O 2 vector } real_sample_6_ce0 { O 1 bit } real_sample_6_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 10 \
    name real_sample_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_7 \
    op interface \
    ports { real_sample_7_address0 { O 2 vector } real_sample_7_ce0 { O 1 bit } real_sample_7_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 11 \
    name real_sample_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_8 \
    op interface \
    ports { real_sample_8_address0 { O 2 vector } real_sample_8_ce0 { O 1 bit } real_sample_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 12 \
    name real_sample_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_9 \
    op interface \
    ports { real_sample_9_address0 { O 2 vector } real_sample_9_ce0 { O 1 bit } real_sample_9_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 13 \
    name real_sample_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_10 \
    op interface \
    ports { real_sample_10_address0 { O 2 vector } real_sample_10_ce0 { O 1 bit } real_sample_10_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 14 \
    name real_sample_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_11 \
    op interface \
    ports { real_sample_11_address0 { O 2 vector } real_sample_11_ce0 { O 1 bit } real_sample_11_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 15 \
    name real_sample_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_12 \
    op interface \
    ports { real_sample_12_address0 { O 2 vector } real_sample_12_ce0 { O 1 bit } real_sample_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 16 \
    name real_sample_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_13 \
    op interface \
    ports { real_sample_13_address0 { O 2 vector } real_sample_13_ce0 { O 1 bit } real_sample_13_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 17 \
    name real_sample_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_14 \
    op interface \
    ports { real_sample_14_address0 { O 2 vector } real_sample_14_ce0 { O 1 bit } real_sample_14_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 18 \
    name real_sample_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_15 \
    op interface \
    ports { real_sample_15_address0 { O 2 vector } real_sample_15_ce0 { O 1 bit } real_sample_15_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 19 \
    name real_sample_16 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_16 \
    op interface \
    ports { real_sample_16_address0 { O 2 vector } real_sample_16_ce0 { O 1 bit } real_sample_16_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_16'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 20 \
    name real_sample_17 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_17 \
    op interface \
    ports { real_sample_17_address0 { O 2 vector } real_sample_17_ce0 { O 1 bit } real_sample_17_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_17'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 21 \
    name real_sample_18 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_18 \
    op interface \
    ports { real_sample_18_address0 { O 2 vector } real_sample_18_ce0 { O 1 bit } real_sample_18_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_18'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 22 \
    name real_sample_19 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_19 \
    op interface \
    ports { real_sample_19_address0 { O 2 vector } real_sample_19_ce0 { O 1 bit } real_sample_19_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_19'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 23 \
    name real_sample_20 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_20 \
    op interface \
    ports { real_sample_20_address0 { O 2 vector } real_sample_20_ce0 { O 1 bit } real_sample_20_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_20'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 24 \
    name real_sample_21 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_21 \
    op interface \
    ports { real_sample_21_address0 { O 2 vector } real_sample_21_ce0 { O 1 bit } real_sample_21_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_21'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 25 \
    name real_sample_22 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_22 \
    op interface \
    ports { real_sample_22_address0 { O 2 vector } real_sample_22_ce0 { O 1 bit } real_sample_22_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_22'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 26 \
    name real_sample_23 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_23 \
    op interface \
    ports { real_sample_23_address0 { O 2 vector } real_sample_23_ce0 { O 1 bit } real_sample_23_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_23'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 27 \
    name real_sample_24 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_24 \
    op interface \
    ports { real_sample_24_address0 { O 2 vector } real_sample_24_ce0 { O 1 bit } real_sample_24_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_24'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 28 \
    name real_sample_25 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_25 \
    op interface \
    ports { real_sample_25_address0 { O 2 vector } real_sample_25_ce0 { O 1 bit } real_sample_25_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_25'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 29 \
    name real_sample_26 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_26 \
    op interface \
    ports { real_sample_26_address0 { O 2 vector } real_sample_26_ce0 { O 1 bit } real_sample_26_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_26'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 30 \
    name real_sample_27 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_27 \
    op interface \
    ports { real_sample_27_address0 { O 2 vector } real_sample_27_ce0 { O 1 bit } real_sample_27_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_27'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 31 \
    name real_sample_28 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_28 \
    op interface \
    ports { real_sample_28_address0 { O 2 vector } real_sample_28_ce0 { O 1 bit } real_sample_28_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_28'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 32 \
    name real_sample_29 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_29 \
    op interface \
    ports { real_sample_29_address0 { O 2 vector } real_sample_29_ce0 { O 1 bit } real_sample_29_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_29'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 33 \
    name real_sample_30 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_30 \
    op interface \
    ports { real_sample_30_address0 { O 2 vector } real_sample_30_ce0 { O 1 bit } real_sample_30_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_30'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 34 \
    name real_sample_31 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_31 \
    op interface \
    ports { real_sample_31_address0 { O 2 vector } real_sample_31_ce0 { O 1 bit } real_sample_31_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_31'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 35 \
    name real_sample_32 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_32 \
    op interface \
    ports { real_sample_32_address0 { O 2 vector } real_sample_32_ce0 { O 1 bit } real_sample_32_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_32'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 36 \
    name real_sample_33 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_33 \
    op interface \
    ports { real_sample_33_address0 { O 2 vector } real_sample_33_ce0 { O 1 bit } real_sample_33_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_33'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 37 \
    name real_sample_34 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_34 \
    op interface \
    ports { real_sample_34_address0 { O 2 vector } real_sample_34_ce0 { O 1 bit } real_sample_34_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_34'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 38 \
    name real_sample_35 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_35 \
    op interface \
    ports { real_sample_35_address0 { O 2 vector } real_sample_35_ce0 { O 1 bit } real_sample_35_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_35'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 39 \
    name real_sample_36 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_36 \
    op interface \
    ports { real_sample_36_address0 { O 2 vector } real_sample_36_ce0 { O 1 bit } real_sample_36_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_36'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 40 \
    name real_sample_37 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_37 \
    op interface \
    ports { real_sample_37_address0 { O 2 vector } real_sample_37_ce0 { O 1 bit } real_sample_37_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_37'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 41 \
    name real_sample_38 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_38 \
    op interface \
    ports { real_sample_38_address0 { O 2 vector } real_sample_38_ce0 { O 1 bit } real_sample_38_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_38'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 42 \
    name real_sample_39 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_39 \
    op interface \
    ports { real_sample_39_address0 { O 2 vector } real_sample_39_ce0 { O 1 bit } real_sample_39_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_39'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 43 \
    name real_sample_40 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_40 \
    op interface \
    ports { real_sample_40_address0 { O 2 vector } real_sample_40_ce0 { O 1 bit } real_sample_40_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_40'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 44 \
    name real_sample_41 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_41 \
    op interface \
    ports { real_sample_41_address0 { O 2 vector } real_sample_41_ce0 { O 1 bit } real_sample_41_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_41'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 45 \
    name real_sample_42 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_42 \
    op interface \
    ports { real_sample_42_address0 { O 2 vector } real_sample_42_ce0 { O 1 bit } real_sample_42_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_42'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 46 \
    name real_sample_43 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_43 \
    op interface \
    ports { real_sample_43_address0 { O 2 vector } real_sample_43_ce0 { O 1 bit } real_sample_43_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_43'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 47 \
    name real_sample_44 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_44 \
    op interface \
    ports { real_sample_44_address0 { O 2 vector } real_sample_44_ce0 { O 1 bit } real_sample_44_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_44'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 48 \
    name real_sample_45 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_45 \
    op interface \
    ports { real_sample_45_address0 { O 2 vector } real_sample_45_ce0 { O 1 bit } real_sample_45_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_45'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 49 \
    name real_sample_46 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_46 \
    op interface \
    ports { real_sample_46_address0 { O 2 vector } real_sample_46_ce0 { O 1 bit } real_sample_46_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_46'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 50 \
    name real_sample_47 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_47 \
    op interface \
    ports { real_sample_47_address0 { O 2 vector } real_sample_47_ce0 { O 1 bit } real_sample_47_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_47'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 51 \
    name real_sample_48 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_48 \
    op interface \
    ports { real_sample_48_address0 { O 2 vector } real_sample_48_ce0 { O 1 bit } real_sample_48_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_48'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 52 \
    name real_sample_49 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_49 \
    op interface \
    ports { real_sample_49_address0 { O 2 vector } real_sample_49_ce0 { O 1 bit } real_sample_49_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_49'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 53 \
    name real_sample_50 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_50 \
    op interface \
    ports { real_sample_50_address0 { O 2 vector } real_sample_50_ce0 { O 1 bit } real_sample_50_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_50'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 54 \
    name real_sample_51 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_51 \
    op interface \
    ports { real_sample_51_address0 { O 2 vector } real_sample_51_ce0 { O 1 bit } real_sample_51_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_51'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 55 \
    name real_sample_52 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_52 \
    op interface \
    ports { real_sample_52_address0 { O 2 vector } real_sample_52_ce0 { O 1 bit } real_sample_52_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_52'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 56 \
    name real_sample_53 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_53 \
    op interface \
    ports { real_sample_53_address0 { O 2 vector } real_sample_53_ce0 { O 1 bit } real_sample_53_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_53'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 57 \
    name real_sample_54 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_54 \
    op interface \
    ports { real_sample_54_address0 { O 2 vector } real_sample_54_ce0 { O 1 bit } real_sample_54_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_54'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 58 \
    name real_sample_55 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_55 \
    op interface \
    ports { real_sample_55_address0 { O 2 vector } real_sample_55_ce0 { O 1 bit } real_sample_55_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_55'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 59 \
    name real_sample_56 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_56 \
    op interface \
    ports { real_sample_56_address0 { O 2 vector } real_sample_56_ce0 { O 1 bit } real_sample_56_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_56'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 60 \
    name real_sample_57 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_57 \
    op interface \
    ports { real_sample_57_address0 { O 2 vector } real_sample_57_ce0 { O 1 bit } real_sample_57_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_57'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 61 \
    name real_sample_58 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_58 \
    op interface \
    ports { real_sample_58_address0 { O 2 vector } real_sample_58_ce0 { O 1 bit } real_sample_58_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_58'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 62 \
    name real_sample_59 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_59 \
    op interface \
    ports { real_sample_59_address0 { O 2 vector } real_sample_59_ce0 { O 1 bit } real_sample_59_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_59'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 63 \
    name real_sample_60 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_60 \
    op interface \
    ports { real_sample_60_address0 { O 2 vector } real_sample_60_ce0 { O 1 bit } real_sample_60_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_60'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 64 \
    name real_sample_61 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_61 \
    op interface \
    ports { real_sample_61_address0 { O 2 vector } real_sample_61_ce0 { O 1 bit } real_sample_61_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_61'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 65 \
    name real_sample_62 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_62 \
    op interface \
    ports { real_sample_62_address0 { O 2 vector } real_sample_62_ce0 { O 1 bit } real_sample_62_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_62'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 66 \
    name real_sample_63 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename real_sample_63 \
    op interface \
    ports { real_sample_63_address0 { O 2 vector } real_sample_63_ce0 { O 1 bit } real_sample_63_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_sample_63'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 67 \
    name temp_63_3_01930_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_63_3_01930_out \
    op interface \
    ports { temp_63_3_01930_out { O 32 vector } temp_63_3_01930_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 68 \
    name temp_63_2_01929_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_63_2_01929_out \
    op interface \
    ports { temp_63_2_01929_out { O 32 vector } temp_63_2_01929_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 69 \
    name temp_63_1_01928_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_63_1_01928_out \
    op interface \
    ports { temp_63_1_01928_out { O 32 vector } temp_63_1_01928_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 70 \
    name temp_63_0_01927_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_63_0_01927_out \
    op interface \
    ports { temp_63_0_01927_out { O 32 vector } temp_63_0_01927_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 71 \
    name temp_62_3_01926_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_62_3_01926_out \
    op interface \
    ports { temp_62_3_01926_out { O 32 vector } temp_62_3_01926_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 72 \
    name temp_62_2_01925_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_62_2_01925_out \
    op interface \
    ports { temp_62_2_01925_out { O 32 vector } temp_62_2_01925_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 73 \
    name temp_62_1_01924_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_62_1_01924_out \
    op interface \
    ports { temp_62_1_01924_out { O 32 vector } temp_62_1_01924_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 74 \
    name temp_62_0_01923_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_62_0_01923_out \
    op interface \
    ports { temp_62_0_01923_out { O 32 vector } temp_62_0_01923_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 75 \
    name temp_61_3_01922_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_61_3_01922_out \
    op interface \
    ports { temp_61_3_01922_out { O 32 vector } temp_61_3_01922_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 76 \
    name temp_61_2_01921_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_61_2_01921_out \
    op interface \
    ports { temp_61_2_01921_out { O 32 vector } temp_61_2_01921_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 77 \
    name temp_61_1_01920_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_61_1_01920_out \
    op interface \
    ports { temp_61_1_01920_out { O 32 vector } temp_61_1_01920_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 78 \
    name temp_61_0_01919_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_61_0_01919_out \
    op interface \
    ports { temp_61_0_01919_out { O 32 vector } temp_61_0_01919_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 79 \
    name temp_60_3_01918_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_60_3_01918_out \
    op interface \
    ports { temp_60_3_01918_out { O 32 vector } temp_60_3_01918_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 80 \
    name temp_60_2_01917_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_60_2_01917_out \
    op interface \
    ports { temp_60_2_01917_out { O 32 vector } temp_60_2_01917_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 81 \
    name temp_60_1_01916_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_60_1_01916_out \
    op interface \
    ports { temp_60_1_01916_out { O 32 vector } temp_60_1_01916_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 82 \
    name temp_60_0_01915_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_60_0_01915_out \
    op interface \
    ports { temp_60_0_01915_out { O 32 vector } temp_60_0_01915_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 83 \
    name temp_59_3_01914_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_59_3_01914_out \
    op interface \
    ports { temp_59_3_01914_out { O 32 vector } temp_59_3_01914_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 84 \
    name temp_59_2_01913_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_59_2_01913_out \
    op interface \
    ports { temp_59_2_01913_out { O 32 vector } temp_59_2_01913_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 85 \
    name temp_59_1_01912_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_59_1_01912_out \
    op interface \
    ports { temp_59_1_01912_out { O 32 vector } temp_59_1_01912_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 86 \
    name temp_59_0_01911_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_59_0_01911_out \
    op interface \
    ports { temp_59_0_01911_out { O 32 vector } temp_59_0_01911_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 87 \
    name temp_58_3_01910_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_58_3_01910_out \
    op interface \
    ports { temp_58_3_01910_out { O 32 vector } temp_58_3_01910_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 88 \
    name temp_58_2_01909_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_58_2_01909_out \
    op interface \
    ports { temp_58_2_01909_out { O 32 vector } temp_58_2_01909_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 89 \
    name temp_58_1_01908_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_58_1_01908_out \
    op interface \
    ports { temp_58_1_01908_out { O 32 vector } temp_58_1_01908_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 90 \
    name temp_58_0_01907_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_58_0_01907_out \
    op interface \
    ports { temp_58_0_01907_out { O 32 vector } temp_58_0_01907_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 91 \
    name temp_57_3_01906_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_57_3_01906_out \
    op interface \
    ports { temp_57_3_01906_out { O 32 vector } temp_57_3_01906_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 92 \
    name temp_57_2_01905_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_57_2_01905_out \
    op interface \
    ports { temp_57_2_01905_out { O 32 vector } temp_57_2_01905_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 93 \
    name temp_57_1_01904_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_57_1_01904_out \
    op interface \
    ports { temp_57_1_01904_out { O 32 vector } temp_57_1_01904_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 94 \
    name temp_57_0_01903_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_57_0_01903_out \
    op interface \
    ports { temp_57_0_01903_out { O 32 vector } temp_57_0_01903_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 95 \
    name temp_56_3_01902_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_56_3_01902_out \
    op interface \
    ports { temp_56_3_01902_out { O 32 vector } temp_56_3_01902_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 96 \
    name temp_56_2_01901_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_56_2_01901_out \
    op interface \
    ports { temp_56_2_01901_out { O 32 vector } temp_56_2_01901_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 97 \
    name temp_56_1_01900_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_56_1_01900_out \
    op interface \
    ports { temp_56_1_01900_out { O 32 vector } temp_56_1_01900_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 98 \
    name temp_56_0_01899_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_56_0_01899_out \
    op interface \
    ports { temp_56_0_01899_out { O 32 vector } temp_56_0_01899_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 99 \
    name temp_55_3_01898_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_55_3_01898_out \
    op interface \
    ports { temp_55_3_01898_out { O 32 vector } temp_55_3_01898_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 100 \
    name temp_55_2_01897_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_55_2_01897_out \
    op interface \
    ports { temp_55_2_01897_out { O 32 vector } temp_55_2_01897_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 101 \
    name temp_55_1_01896_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_55_1_01896_out \
    op interface \
    ports { temp_55_1_01896_out { O 32 vector } temp_55_1_01896_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 102 \
    name temp_55_0_01895_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_55_0_01895_out \
    op interface \
    ports { temp_55_0_01895_out { O 32 vector } temp_55_0_01895_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 103 \
    name temp_54_3_01894_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_54_3_01894_out \
    op interface \
    ports { temp_54_3_01894_out { O 32 vector } temp_54_3_01894_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 104 \
    name temp_54_2_01893_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_54_2_01893_out \
    op interface \
    ports { temp_54_2_01893_out { O 32 vector } temp_54_2_01893_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 105 \
    name temp_54_1_01892_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_54_1_01892_out \
    op interface \
    ports { temp_54_1_01892_out { O 32 vector } temp_54_1_01892_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 106 \
    name temp_54_0_01891_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_54_0_01891_out \
    op interface \
    ports { temp_54_0_01891_out { O 32 vector } temp_54_0_01891_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 107 \
    name temp_53_3_01890_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_53_3_01890_out \
    op interface \
    ports { temp_53_3_01890_out { O 32 vector } temp_53_3_01890_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 108 \
    name temp_53_2_01889_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_53_2_01889_out \
    op interface \
    ports { temp_53_2_01889_out { O 32 vector } temp_53_2_01889_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 109 \
    name temp_53_1_01888_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_53_1_01888_out \
    op interface \
    ports { temp_53_1_01888_out { O 32 vector } temp_53_1_01888_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 110 \
    name temp_53_0_01887_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_53_0_01887_out \
    op interface \
    ports { temp_53_0_01887_out { O 32 vector } temp_53_0_01887_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 111 \
    name temp_52_3_01886_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_52_3_01886_out \
    op interface \
    ports { temp_52_3_01886_out { O 32 vector } temp_52_3_01886_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 112 \
    name temp_52_2_01885_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_52_2_01885_out \
    op interface \
    ports { temp_52_2_01885_out { O 32 vector } temp_52_2_01885_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 113 \
    name temp_52_1_01884_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_52_1_01884_out \
    op interface \
    ports { temp_52_1_01884_out { O 32 vector } temp_52_1_01884_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 114 \
    name temp_52_0_01883_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_52_0_01883_out \
    op interface \
    ports { temp_52_0_01883_out { O 32 vector } temp_52_0_01883_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 115 \
    name temp_51_3_01882_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_51_3_01882_out \
    op interface \
    ports { temp_51_3_01882_out { O 32 vector } temp_51_3_01882_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 116 \
    name temp_51_2_01881_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_51_2_01881_out \
    op interface \
    ports { temp_51_2_01881_out { O 32 vector } temp_51_2_01881_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 117 \
    name temp_51_1_01880_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_51_1_01880_out \
    op interface \
    ports { temp_51_1_01880_out { O 32 vector } temp_51_1_01880_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 118 \
    name temp_51_0_01879_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_51_0_01879_out \
    op interface \
    ports { temp_51_0_01879_out { O 32 vector } temp_51_0_01879_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 119 \
    name temp_50_3_01878_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_50_3_01878_out \
    op interface \
    ports { temp_50_3_01878_out { O 32 vector } temp_50_3_01878_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 120 \
    name temp_50_2_01877_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_50_2_01877_out \
    op interface \
    ports { temp_50_2_01877_out { O 32 vector } temp_50_2_01877_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 121 \
    name temp_50_1_01876_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_50_1_01876_out \
    op interface \
    ports { temp_50_1_01876_out { O 32 vector } temp_50_1_01876_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 122 \
    name temp_50_0_01875_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_50_0_01875_out \
    op interface \
    ports { temp_50_0_01875_out { O 32 vector } temp_50_0_01875_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 123 \
    name temp_49_3_01874_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_49_3_01874_out \
    op interface \
    ports { temp_49_3_01874_out { O 32 vector } temp_49_3_01874_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 124 \
    name temp_49_2_01873_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_49_2_01873_out \
    op interface \
    ports { temp_49_2_01873_out { O 32 vector } temp_49_2_01873_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 125 \
    name temp_49_1_01872_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_49_1_01872_out \
    op interface \
    ports { temp_49_1_01872_out { O 32 vector } temp_49_1_01872_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 126 \
    name temp_49_0_01871_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_49_0_01871_out \
    op interface \
    ports { temp_49_0_01871_out { O 32 vector } temp_49_0_01871_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 127 \
    name temp_48_3_01870_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_48_3_01870_out \
    op interface \
    ports { temp_48_3_01870_out { O 32 vector } temp_48_3_01870_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 128 \
    name temp_48_2_01869_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_48_2_01869_out \
    op interface \
    ports { temp_48_2_01869_out { O 32 vector } temp_48_2_01869_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 129 \
    name temp_48_1_01868_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_48_1_01868_out \
    op interface \
    ports { temp_48_1_01868_out { O 32 vector } temp_48_1_01868_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 130 \
    name temp_48_0_01867_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_48_0_01867_out \
    op interface \
    ports { temp_48_0_01867_out { O 32 vector } temp_48_0_01867_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 131 \
    name temp_47_3_01866_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_47_3_01866_out \
    op interface \
    ports { temp_47_3_01866_out { O 32 vector } temp_47_3_01866_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 132 \
    name temp_47_2_01865_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_47_2_01865_out \
    op interface \
    ports { temp_47_2_01865_out { O 32 vector } temp_47_2_01865_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 133 \
    name temp_47_1_01864_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_47_1_01864_out \
    op interface \
    ports { temp_47_1_01864_out { O 32 vector } temp_47_1_01864_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 134 \
    name temp_47_0_01863_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_47_0_01863_out \
    op interface \
    ports { temp_47_0_01863_out { O 32 vector } temp_47_0_01863_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 135 \
    name temp_46_3_01862_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_46_3_01862_out \
    op interface \
    ports { temp_46_3_01862_out { O 32 vector } temp_46_3_01862_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 136 \
    name temp_46_2_01861_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_46_2_01861_out \
    op interface \
    ports { temp_46_2_01861_out { O 32 vector } temp_46_2_01861_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 137 \
    name temp_46_1_01860_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_46_1_01860_out \
    op interface \
    ports { temp_46_1_01860_out { O 32 vector } temp_46_1_01860_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 138 \
    name temp_46_0_01859_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_46_0_01859_out \
    op interface \
    ports { temp_46_0_01859_out { O 32 vector } temp_46_0_01859_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 139 \
    name temp_45_3_01858_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_45_3_01858_out \
    op interface \
    ports { temp_45_3_01858_out { O 32 vector } temp_45_3_01858_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 140 \
    name temp_45_2_01857_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_45_2_01857_out \
    op interface \
    ports { temp_45_2_01857_out { O 32 vector } temp_45_2_01857_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 141 \
    name temp_45_1_01856_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_45_1_01856_out \
    op interface \
    ports { temp_45_1_01856_out { O 32 vector } temp_45_1_01856_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 142 \
    name temp_45_0_01855_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_45_0_01855_out \
    op interface \
    ports { temp_45_0_01855_out { O 32 vector } temp_45_0_01855_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 143 \
    name temp_44_3_01854_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_44_3_01854_out \
    op interface \
    ports { temp_44_3_01854_out { O 32 vector } temp_44_3_01854_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 144 \
    name temp_44_2_01853_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_44_2_01853_out \
    op interface \
    ports { temp_44_2_01853_out { O 32 vector } temp_44_2_01853_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 145 \
    name temp_44_1_01852_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_44_1_01852_out \
    op interface \
    ports { temp_44_1_01852_out { O 32 vector } temp_44_1_01852_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 146 \
    name temp_44_0_01851_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_44_0_01851_out \
    op interface \
    ports { temp_44_0_01851_out { O 32 vector } temp_44_0_01851_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 147 \
    name temp_43_3_01850_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_43_3_01850_out \
    op interface \
    ports { temp_43_3_01850_out { O 32 vector } temp_43_3_01850_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 148 \
    name temp_43_2_01849_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_43_2_01849_out \
    op interface \
    ports { temp_43_2_01849_out { O 32 vector } temp_43_2_01849_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 149 \
    name temp_43_1_01848_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_43_1_01848_out \
    op interface \
    ports { temp_43_1_01848_out { O 32 vector } temp_43_1_01848_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 150 \
    name temp_43_0_01847_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_43_0_01847_out \
    op interface \
    ports { temp_43_0_01847_out { O 32 vector } temp_43_0_01847_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 151 \
    name temp_42_3_01846_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_42_3_01846_out \
    op interface \
    ports { temp_42_3_01846_out { O 32 vector } temp_42_3_01846_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 152 \
    name temp_42_2_01845_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_42_2_01845_out \
    op interface \
    ports { temp_42_2_01845_out { O 32 vector } temp_42_2_01845_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 153 \
    name temp_42_1_01844_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_42_1_01844_out \
    op interface \
    ports { temp_42_1_01844_out { O 32 vector } temp_42_1_01844_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 154 \
    name temp_42_0_01843_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_42_0_01843_out \
    op interface \
    ports { temp_42_0_01843_out { O 32 vector } temp_42_0_01843_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 155 \
    name temp_41_3_01842_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_41_3_01842_out \
    op interface \
    ports { temp_41_3_01842_out { O 32 vector } temp_41_3_01842_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 156 \
    name temp_41_2_01841_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_41_2_01841_out \
    op interface \
    ports { temp_41_2_01841_out { O 32 vector } temp_41_2_01841_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 157 \
    name temp_41_1_01840_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_41_1_01840_out \
    op interface \
    ports { temp_41_1_01840_out { O 32 vector } temp_41_1_01840_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 158 \
    name temp_41_0_01839_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_41_0_01839_out \
    op interface \
    ports { temp_41_0_01839_out { O 32 vector } temp_41_0_01839_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 159 \
    name temp_40_3_01838_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_40_3_01838_out \
    op interface \
    ports { temp_40_3_01838_out { O 32 vector } temp_40_3_01838_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 160 \
    name temp_40_2_01837_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_40_2_01837_out \
    op interface \
    ports { temp_40_2_01837_out { O 32 vector } temp_40_2_01837_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 161 \
    name temp_40_1_01836_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_40_1_01836_out \
    op interface \
    ports { temp_40_1_01836_out { O 32 vector } temp_40_1_01836_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 162 \
    name temp_40_0_01835_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_40_0_01835_out \
    op interface \
    ports { temp_40_0_01835_out { O 32 vector } temp_40_0_01835_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 163 \
    name temp_39_3_01834_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_39_3_01834_out \
    op interface \
    ports { temp_39_3_01834_out { O 32 vector } temp_39_3_01834_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 164 \
    name temp_39_2_01833_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_39_2_01833_out \
    op interface \
    ports { temp_39_2_01833_out { O 32 vector } temp_39_2_01833_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 165 \
    name temp_39_1_01832_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_39_1_01832_out \
    op interface \
    ports { temp_39_1_01832_out { O 32 vector } temp_39_1_01832_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 166 \
    name temp_39_0_01831_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_39_0_01831_out \
    op interface \
    ports { temp_39_0_01831_out { O 32 vector } temp_39_0_01831_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 167 \
    name temp_38_3_01830_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_38_3_01830_out \
    op interface \
    ports { temp_38_3_01830_out { O 32 vector } temp_38_3_01830_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 168 \
    name temp_38_2_01829_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_38_2_01829_out \
    op interface \
    ports { temp_38_2_01829_out { O 32 vector } temp_38_2_01829_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 169 \
    name temp_38_1_01828_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_38_1_01828_out \
    op interface \
    ports { temp_38_1_01828_out { O 32 vector } temp_38_1_01828_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 170 \
    name temp_38_0_01827_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_38_0_01827_out \
    op interface \
    ports { temp_38_0_01827_out { O 32 vector } temp_38_0_01827_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 171 \
    name temp_37_3_01826_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_37_3_01826_out \
    op interface \
    ports { temp_37_3_01826_out { O 32 vector } temp_37_3_01826_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 172 \
    name temp_37_2_01825_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_37_2_01825_out \
    op interface \
    ports { temp_37_2_01825_out { O 32 vector } temp_37_2_01825_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 173 \
    name temp_37_1_01824_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_37_1_01824_out \
    op interface \
    ports { temp_37_1_01824_out { O 32 vector } temp_37_1_01824_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 174 \
    name temp_37_0_01823_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_37_0_01823_out \
    op interface \
    ports { temp_37_0_01823_out { O 32 vector } temp_37_0_01823_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 175 \
    name temp_36_3_01822_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_36_3_01822_out \
    op interface \
    ports { temp_36_3_01822_out { O 32 vector } temp_36_3_01822_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 176 \
    name temp_36_2_01821_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_36_2_01821_out \
    op interface \
    ports { temp_36_2_01821_out { O 32 vector } temp_36_2_01821_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 177 \
    name temp_36_1_01820_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_36_1_01820_out \
    op interface \
    ports { temp_36_1_01820_out { O 32 vector } temp_36_1_01820_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 178 \
    name temp_36_0_01819_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_36_0_01819_out \
    op interface \
    ports { temp_36_0_01819_out { O 32 vector } temp_36_0_01819_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 179 \
    name temp_35_3_01818_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_35_3_01818_out \
    op interface \
    ports { temp_35_3_01818_out { O 32 vector } temp_35_3_01818_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 180 \
    name temp_35_2_01817_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_35_2_01817_out \
    op interface \
    ports { temp_35_2_01817_out { O 32 vector } temp_35_2_01817_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 181 \
    name temp_35_1_01816_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_35_1_01816_out \
    op interface \
    ports { temp_35_1_01816_out { O 32 vector } temp_35_1_01816_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 182 \
    name temp_35_0_01815_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_35_0_01815_out \
    op interface \
    ports { temp_35_0_01815_out { O 32 vector } temp_35_0_01815_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 183 \
    name temp_34_3_01814_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_34_3_01814_out \
    op interface \
    ports { temp_34_3_01814_out { O 32 vector } temp_34_3_01814_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 184 \
    name temp_34_2_01813_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_34_2_01813_out \
    op interface \
    ports { temp_34_2_01813_out { O 32 vector } temp_34_2_01813_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 185 \
    name temp_34_1_01812_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_34_1_01812_out \
    op interface \
    ports { temp_34_1_01812_out { O 32 vector } temp_34_1_01812_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 186 \
    name temp_34_0_01811_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_34_0_01811_out \
    op interface \
    ports { temp_34_0_01811_out { O 32 vector } temp_34_0_01811_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 187 \
    name temp_33_3_01810_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_33_3_01810_out \
    op interface \
    ports { temp_33_3_01810_out { O 32 vector } temp_33_3_01810_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 188 \
    name temp_33_2_01809_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_33_2_01809_out \
    op interface \
    ports { temp_33_2_01809_out { O 32 vector } temp_33_2_01809_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 189 \
    name temp_33_1_01808_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_33_1_01808_out \
    op interface \
    ports { temp_33_1_01808_out { O 32 vector } temp_33_1_01808_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 190 \
    name temp_33_0_01807_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_33_0_01807_out \
    op interface \
    ports { temp_33_0_01807_out { O 32 vector } temp_33_0_01807_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 191 \
    name temp_32_3_01806_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_32_3_01806_out \
    op interface \
    ports { temp_32_3_01806_out { O 32 vector } temp_32_3_01806_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 192 \
    name temp_32_2_01805_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_32_2_01805_out \
    op interface \
    ports { temp_32_2_01805_out { O 32 vector } temp_32_2_01805_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 193 \
    name temp_32_1_01804_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_32_1_01804_out \
    op interface \
    ports { temp_32_1_01804_out { O 32 vector } temp_32_1_01804_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 194 \
    name temp_32_0_01803_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_32_0_01803_out \
    op interface \
    ports { temp_32_0_01803_out { O 32 vector } temp_32_0_01803_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 195 \
    name temp_31_3_01802_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_31_3_01802_out \
    op interface \
    ports { temp_31_3_01802_out { O 32 vector } temp_31_3_01802_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 196 \
    name temp_31_2_01801_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_31_2_01801_out \
    op interface \
    ports { temp_31_2_01801_out { O 32 vector } temp_31_2_01801_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 197 \
    name temp_31_1_01800_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_31_1_01800_out \
    op interface \
    ports { temp_31_1_01800_out { O 32 vector } temp_31_1_01800_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 198 \
    name temp_31_0_01799_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_31_0_01799_out \
    op interface \
    ports { temp_31_0_01799_out { O 32 vector } temp_31_0_01799_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 199 \
    name temp_30_3_01798_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_30_3_01798_out \
    op interface \
    ports { temp_30_3_01798_out { O 32 vector } temp_30_3_01798_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 200 \
    name temp_30_2_01797_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_30_2_01797_out \
    op interface \
    ports { temp_30_2_01797_out { O 32 vector } temp_30_2_01797_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 201 \
    name temp_30_1_01796_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_30_1_01796_out \
    op interface \
    ports { temp_30_1_01796_out { O 32 vector } temp_30_1_01796_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 202 \
    name temp_30_0_01795_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_30_0_01795_out \
    op interface \
    ports { temp_30_0_01795_out { O 32 vector } temp_30_0_01795_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 203 \
    name temp_29_3_01794_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_29_3_01794_out \
    op interface \
    ports { temp_29_3_01794_out { O 32 vector } temp_29_3_01794_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 204 \
    name temp_29_2_01793_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_29_2_01793_out \
    op interface \
    ports { temp_29_2_01793_out { O 32 vector } temp_29_2_01793_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 205 \
    name temp_29_1_01792_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_29_1_01792_out \
    op interface \
    ports { temp_29_1_01792_out { O 32 vector } temp_29_1_01792_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 206 \
    name temp_29_0_01791_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_29_0_01791_out \
    op interface \
    ports { temp_29_0_01791_out { O 32 vector } temp_29_0_01791_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 207 \
    name temp_28_3_01790_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_28_3_01790_out \
    op interface \
    ports { temp_28_3_01790_out { O 32 vector } temp_28_3_01790_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 208 \
    name temp_28_2_01789_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_28_2_01789_out \
    op interface \
    ports { temp_28_2_01789_out { O 32 vector } temp_28_2_01789_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 209 \
    name temp_28_1_01788_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_28_1_01788_out \
    op interface \
    ports { temp_28_1_01788_out { O 32 vector } temp_28_1_01788_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 210 \
    name temp_28_0_01787_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_28_0_01787_out \
    op interface \
    ports { temp_28_0_01787_out { O 32 vector } temp_28_0_01787_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 211 \
    name temp_27_3_01786_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_27_3_01786_out \
    op interface \
    ports { temp_27_3_01786_out { O 32 vector } temp_27_3_01786_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 212 \
    name temp_27_2_01785_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_27_2_01785_out \
    op interface \
    ports { temp_27_2_01785_out { O 32 vector } temp_27_2_01785_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 213 \
    name temp_27_1_01784_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_27_1_01784_out \
    op interface \
    ports { temp_27_1_01784_out { O 32 vector } temp_27_1_01784_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 214 \
    name temp_27_0_01783_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_27_0_01783_out \
    op interface \
    ports { temp_27_0_01783_out { O 32 vector } temp_27_0_01783_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 215 \
    name temp_26_3_01782_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_26_3_01782_out \
    op interface \
    ports { temp_26_3_01782_out { O 32 vector } temp_26_3_01782_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 216 \
    name temp_26_2_01781_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_26_2_01781_out \
    op interface \
    ports { temp_26_2_01781_out { O 32 vector } temp_26_2_01781_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 217 \
    name temp_26_1_01780_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_26_1_01780_out \
    op interface \
    ports { temp_26_1_01780_out { O 32 vector } temp_26_1_01780_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 218 \
    name temp_26_0_01779_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_26_0_01779_out \
    op interface \
    ports { temp_26_0_01779_out { O 32 vector } temp_26_0_01779_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 219 \
    name temp_25_3_01778_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_25_3_01778_out \
    op interface \
    ports { temp_25_3_01778_out { O 32 vector } temp_25_3_01778_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 220 \
    name temp_25_2_01777_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_25_2_01777_out \
    op interface \
    ports { temp_25_2_01777_out { O 32 vector } temp_25_2_01777_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 221 \
    name temp_25_1_01776_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_25_1_01776_out \
    op interface \
    ports { temp_25_1_01776_out { O 32 vector } temp_25_1_01776_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 222 \
    name temp_25_0_01775_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_25_0_01775_out \
    op interface \
    ports { temp_25_0_01775_out { O 32 vector } temp_25_0_01775_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 223 \
    name temp_24_3_01774_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_24_3_01774_out \
    op interface \
    ports { temp_24_3_01774_out { O 32 vector } temp_24_3_01774_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 224 \
    name temp_24_2_01773_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_24_2_01773_out \
    op interface \
    ports { temp_24_2_01773_out { O 32 vector } temp_24_2_01773_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 225 \
    name temp_24_1_01772_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_24_1_01772_out \
    op interface \
    ports { temp_24_1_01772_out { O 32 vector } temp_24_1_01772_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 226 \
    name temp_24_0_01771_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_24_0_01771_out \
    op interface \
    ports { temp_24_0_01771_out { O 32 vector } temp_24_0_01771_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 227 \
    name temp_23_3_01770_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_23_3_01770_out \
    op interface \
    ports { temp_23_3_01770_out { O 32 vector } temp_23_3_01770_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 228 \
    name temp_23_2_01769_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_23_2_01769_out \
    op interface \
    ports { temp_23_2_01769_out { O 32 vector } temp_23_2_01769_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 229 \
    name temp_23_1_01768_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_23_1_01768_out \
    op interface \
    ports { temp_23_1_01768_out { O 32 vector } temp_23_1_01768_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 230 \
    name temp_23_0_01767_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_23_0_01767_out \
    op interface \
    ports { temp_23_0_01767_out { O 32 vector } temp_23_0_01767_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 231 \
    name temp_22_3_01766_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_22_3_01766_out \
    op interface \
    ports { temp_22_3_01766_out { O 32 vector } temp_22_3_01766_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 232 \
    name temp_22_2_01765_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_22_2_01765_out \
    op interface \
    ports { temp_22_2_01765_out { O 32 vector } temp_22_2_01765_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 233 \
    name temp_22_1_01764_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_22_1_01764_out \
    op interface \
    ports { temp_22_1_01764_out { O 32 vector } temp_22_1_01764_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 234 \
    name temp_22_0_01763_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_22_0_01763_out \
    op interface \
    ports { temp_22_0_01763_out { O 32 vector } temp_22_0_01763_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 235 \
    name temp_21_3_01762_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_21_3_01762_out \
    op interface \
    ports { temp_21_3_01762_out { O 32 vector } temp_21_3_01762_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 236 \
    name temp_21_2_01761_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_21_2_01761_out \
    op interface \
    ports { temp_21_2_01761_out { O 32 vector } temp_21_2_01761_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 237 \
    name temp_21_1_01760_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_21_1_01760_out \
    op interface \
    ports { temp_21_1_01760_out { O 32 vector } temp_21_1_01760_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 238 \
    name temp_21_0_01759_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_21_0_01759_out \
    op interface \
    ports { temp_21_0_01759_out { O 32 vector } temp_21_0_01759_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 239 \
    name temp_20_3_01758_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_20_3_01758_out \
    op interface \
    ports { temp_20_3_01758_out { O 32 vector } temp_20_3_01758_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 240 \
    name temp_20_2_01757_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_20_2_01757_out \
    op interface \
    ports { temp_20_2_01757_out { O 32 vector } temp_20_2_01757_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 241 \
    name temp_20_1_01756_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_20_1_01756_out \
    op interface \
    ports { temp_20_1_01756_out { O 32 vector } temp_20_1_01756_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 242 \
    name temp_20_0_01755_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_20_0_01755_out \
    op interface \
    ports { temp_20_0_01755_out { O 32 vector } temp_20_0_01755_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 243 \
    name temp_19_3_01754_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_19_3_01754_out \
    op interface \
    ports { temp_19_3_01754_out { O 32 vector } temp_19_3_01754_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 244 \
    name temp_19_2_01753_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_19_2_01753_out \
    op interface \
    ports { temp_19_2_01753_out { O 32 vector } temp_19_2_01753_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 245 \
    name temp_19_1_01752_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_19_1_01752_out \
    op interface \
    ports { temp_19_1_01752_out { O 32 vector } temp_19_1_01752_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 246 \
    name temp_19_0_01751_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_19_0_01751_out \
    op interface \
    ports { temp_19_0_01751_out { O 32 vector } temp_19_0_01751_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 247 \
    name temp_18_3_01750_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_18_3_01750_out \
    op interface \
    ports { temp_18_3_01750_out { O 32 vector } temp_18_3_01750_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 248 \
    name temp_18_2_01749_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_18_2_01749_out \
    op interface \
    ports { temp_18_2_01749_out { O 32 vector } temp_18_2_01749_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 249 \
    name temp_18_1_01748_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_18_1_01748_out \
    op interface \
    ports { temp_18_1_01748_out { O 32 vector } temp_18_1_01748_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 250 \
    name temp_18_0_01747_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_18_0_01747_out \
    op interface \
    ports { temp_18_0_01747_out { O 32 vector } temp_18_0_01747_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 251 \
    name temp_17_3_01746_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_17_3_01746_out \
    op interface \
    ports { temp_17_3_01746_out { O 32 vector } temp_17_3_01746_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 252 \
    name temp_17_2_01745_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_17_2_01745_out \
    op interface \
    ports { temp_17_2_01745_out { O 32 vector } temp_17_2_01745_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 253 \
    name temp_17_1_01744_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_17_1_01744_out \
    op interface \
    ports { temp_17_1_01744_out { O 32 vector } temp_17_1_01744_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 254 \
    name temp_17_0_01743_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_17_0_01743_out \
    op interface \
    ports { temp_17_0_01743_out { O 32 vector } temp_17_0_01743_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 255 \
    name temp_16_3_01742_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_16_3_01742_out \
    op interface \
    ports { temp_16_3_01742_out { O 32 vector } temp_16_3_01742_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 256 \
    name temp_16_2_01741_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_16_2_01741_out \
    op interface \
    ports { temp_16_2_01741_out { O 32 vector } temp_16_2_01741_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 257 \
    name temp_16_1_01740_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_16_1_01740_out \
    op interface \
    ports { temp_16_1_01740_out { O 32 vector } temp_16_1_01740_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 258 \
    name temp_16_0_01739_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_16_0_01739_out \
    op interface \
    ports { temp_16_0_01739_out { O 32 vector } temp_16_0_01739_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 259 \
    name temp_15_3_01738_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_15_3_01738_out \
    op interface \
    ports { temp_15_3_01738_out { O 32 vector } temp_15_3_01738_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 260 \
    name temp_15_2_01737_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_15_2_01737_out \
    op interface \
    ports { temp_15_2_01737_out { O 32 vector } temp_15_2_01737_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 261 \
    name temp_15_1_01736_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_15_1_01736_out \
    op interface \
    ports { temp_15_1_01736_out { O 32 vector } temp_15_1_01736_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 262 \
    name temp_15_0_01735_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_15_0_01735_out \
    op interface \
    ports { temp_15_0_01735_out { O 32 vector } temp_15_0_01735_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 263 \
    name temp_14_3_01734_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_14_3_01734_out \
    op interface \
    ports { temp_14_3_01734_out { O 32 vector } temp_14_3_01734_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 264 \
    name temp_14_2_01733_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_14_2_01733_out \
    op interface \
    ports { temp_14_2_01733_out { O 32 vector } temp_14_2_01733_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 265 \
    name temp_14_1_01732_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_14_1_01732_out \
    op interface \
    ports { temp_14_1_01732_out { O 32 vector } temp_14_1_01732_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 266 \
    name temp_14_0_01731_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_14_0_01731_out \
    op interface \
    ports { temp_14_0_01731_out { O 32 vector } temp_14_0_01731_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 267 \
    name temp_13_3_01730_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_13_3_01730_out \
    op interface \
    ports { temp_13_3_01730_out { O 32 vector } temp_13_3_01730_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 268 \
    name temp_13_2_01729_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_13_2_01729_out \
    op interface \
    ports { temp_13_2_01729_out { O 32 vector } temp_13_2_01729_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 269 \
    name temp_13_1_01728_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_13_1_01728_out \
    op interface \
    ports { temp_13_1_01728_out { O 32 vector } temp_13_1_01728_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 270 \
    name temp_13_0_01727_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_13_0_01727_out \
    op interface \
    ports { temp_13_0_01727_out { O 32 vector } temp_13_0_01727_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 271 \
    name temp_12_3_01726_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_12_3_01726_out \
    op interface \
    ports { temp_12_3_01726_out { O 32 vector } temp_12_3_01726_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 272 \
    name temp_12_2_01725_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_12_2_01725_out \
    op interface \
    ports { temp_12_2_01725_out { O 32 vector } temp_12_2_01725_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 273 \
    name temp_12_1_01724_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_12_1_01724_out \
    op interface \
    ports { temp_12_1_01724_out { O 32 vector } temp_12_1_01724_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 274 \
    name temp_12_0_01723_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_12_0_01723_out \
    op interface \
    ports { temp_12_0_01723_out { O 32 vector } temp_12_0_01723_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 275 \
    name temp_11_3_01722_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_11_3_01722_out \
    op interface \
    ports { temp_11_3_01722_out { O 32 vector } temp_11_3_01722_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 276 \
    name temp_11_2_01721_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_11_2_01721_out \
    op interface \
    ports { temp_11_2_01721_out { O 32 vector } temp_11_2_01721_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 277 \
    name temp_11_1_01720_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_11_1_01720_out \
    op interface \
    ports { temp_11_1_01720_out { O 32 vector } temp_11_1_01720_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 278 \
    name temp_11_0_01719_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_11_0_01719_out \
    op interface \
    ports { temp_11_0_01719_out { O 32 vector } temp_11_0_01719_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 279 \
    name temp_10_3_01718_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_10_3_01718_out \
    op interface \
    ports { temp_10_3_01718_out { O 32 vector } temp_10_3_01718_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 280 \
    name temp_10_2_01717_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_10_2_01717_out \
    op interface \
    ports { temp_10_2_01717_out { O 32 vector } temp_10_2_01717_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 281 \
    name temp_10_1_01716_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_10_1_01716_out \
    op interface \
    ports { temp_10_1_01716_out { O 32 vector } temp_10_1_01716_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 282 \
    name temp_10_0_01715_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_10_0_01715_out \
    op interface \
    ports { temp_10_0_01715_out { O 32 vector } temp_10_0_01715_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 283 \
    name temp_9_3_01714_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_9_3_01714_out \
    op interface \
    ports { temp_9_3_01714_out { O 32 vector } temp_9_3_01714_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 284 \
    name temp_9_2_01713_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_9_2_01713_out \
    op interface \
    ports { temp_9_2_01713_out { O 32 vector } temp_9_2_01713_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 285 \
    name temp_9_1_01712_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_9_1_01712_out \
    op interface \
    ports { temp_9_1_01712_out { O 32 vector } temp_9_1_01712_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 286 \
    name temp_9_0_01711_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_9_0_01711_out \
    op interface \
    ports { temp_9_0_01711_out { O 32 vector } temp_9_0_01711_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 287 \
    name temp_8_3_01710_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_8_3_01710_out \
    op interface \
    ports { temp_8_3_01710_out { O 32 vector } temp_8_3_01710_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 288 \
    name temp_8_2_01709_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_8_2_01709_out \
    op interface \
    ports { temp_8_2_01709_out { O 32 vector } temp_8_2_01709_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 289 \
    name temp_8_1_01708_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_8_1_01708_out \
    op interface \
    ports { temp_8_1_01708_out { O 32 vector } temp_8_1_01708_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 290 \
    name temp_8_0_01707_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_8_0_01707_out \
    op interface \
    ports { temp_8_0_01707_out { O 32 vector } temp_8_0_01707_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 291 \
    name temp_7_3_01706_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_7_3_01706_out \
    op interface \
    ports { temp_7_3_01706_out { O 32 vector } temp_7_3_01706_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 292 \
    name temp_7_2_01705_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_7_2_01705_out \
    op interface \
    ports { temp_7_2_01705_out { O 32 vector } temp_7_2_01705_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 293 \
    name temp_7_1_01704_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_7_1_01704_out \
    op interface \
    ports { temp_7_1_01704_out { O 32 vector } temp_7_1_01704_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 294 \
    name temp_7_0_01703_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_7_0_01703_out \
    op interface \
    ports { temp_7_0_01703_out { O 32 vector } temp_7_0_01703_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 295 \
    name temp_6_3_01702_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_6_3_01702_out \
    op interface \
    ports { temp_6_3_01702_out { O 32 vector } temp_6_3_01702_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 296 \
    name temp_6_2_01701_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_6_2_01701_out \
    op interface \
    ports { temp_6_2_01701_out { O 32 vector } temp_6_2_01701_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 297 \
    name temp_6_1_01700_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_6_1_01700_out \
    op interface \
    ports { temp_6_1_01700_out { O 32 vector } temp_6_1_01700_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 298 \
    name temp_6_0_01699_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_6_0_01699_out \
    op interface \
    ports { temp_6_0_01699_out { O 32 vector } temp_6_0_01699_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 299 \
    name temp_5_3_01698_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_5_3_01698_out \
    op interface \
    ports { temp_5_3_01698_out { O 32 vector } temp_5_3_01698_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 300 \
    name temp_5_2_01697_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_5_2_01697_out \
    op interface \
    ports { temp_5_2_01697_out { O 32 vector } temp_5_2_01697_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 301 \
    name temp_5_1_01696_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_5_1_01696_out \
    op interface \
    ports { temp_5_1_01696_out { O 32 vector } temp_5_1_01696_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 302 \
    name temp_5_0_01695_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_5_0_01695_out \
    op interface \
    ports { temp_5_0_01695_out { O 32 vector } temp_5_0_01695_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 303 \
    name temp_4_3_01694_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_4_3_01694_out \
    op interface \
    ports { temp_4_3_01694_out { O 32 vector } temp_4_3_01694_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 304 \
    name temp_4_2_01693_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_4_2_01693_out \
    op interface \
    ports { temp_4_2_01693_out { O 32 vector } temp_4_2_01693_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 305 \
    name temp_4_1_01692_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_4_1_01692_out \
    op interface \
    ports { temp_4_1_01692_out { O 32 vector } temp_4_1_01692_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 306 \
    name temp_4_0_01691_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_4_0_01691_out \
    op interface \
    ports { temp_4_0_01691_out { O 32 vector } temp_4_0_01691_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 307 \
    name temp_3_3_01690_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_3_3_01690_out \
    op interface \
    ports { temp_3_3_01690_out { O 32 vector } temp_3_3_01690_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 308 \
    name temp_3_2_01689_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_3_2_01689_out \
    op interface \
    ports { temp_3_2_01689_out { O 32 vector } temp_3_2_01689_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 309 \
    name temp_3_1_01688_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_3_1_01688_out \
    op interface \
    ports { temp_3_1_01688_out { O 32 vector } temp_3_1_01688_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 310 \
    name temp_3_0_01687_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_3_0_01687_out \
    op interface \
    ports { temp_3_0_01687_out { O 32 vector } temp_3_0_01687_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 311 \
    name temp_2_3_01686_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_2_3_01686_out \
    op interface \
    ports { temp_2_3_01686_out { O 32 vector } temp_2_3_01686_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 312 \
    name temp_2_2_01685_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_2_2_01685_out \
    op interface \
    ports { temp_2_2_01685_out { O 32 vector } temp_2_2_01685_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 313 \
    name temp_2_1_01684_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_2_1_01684_out \
    op interface \
    ports { temp_2_1_01684_out { O 32 vector } temp_2_1_01684_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 314 \
    name temp_2_0_01683_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_2_0_01683_out \
    op interface \
    ports { temp_2_0_01683_out { O 32 vector } temp_2_0_01683_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 315 \
    name temp_1_3_01682_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_1_3_01682_out \
    op interface \
    ports { temp_1_3_01682_out { O 32 vector } temp_1_3_01682_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 316 \
    name temp_1_2_01681_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_1_2_01681_out \
    op interface \
    ports { temp_1_2_01681_out { O 32 vector } temp_1_2_01681_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 317 \
    name temp_1_1_01680_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_1_1_01680_out \
    op interface \
    ports { temp_1_1_01680_out { O 32 vector } temp_1_1_01680_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 318 \
    name temp_1_0_01679_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_1_0_01679_out \
    op interface \
    ports { temp_1_0_01679_out { O 32 vector } temp_1_0_01679_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 319 \
    name temp_312_01678_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_312_01678_out \
    op interface \
    ports { temp_312_01678_out { O 32 vector } temp_312_01678_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 320 \
    name temp_211_01677_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_211_01677_out \
    op interface \
    ports { temp_211_01677_out { O 32 vector } temp_211_01677_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 321 \
    name temp_110_01676_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_110_01676_out \
    op interface \
    ports { temp_110_01676_out { O 32 vector } temp_110_01676_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 322 \
    name temp_0_01675_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_0_01675_out \
    op interface \
    ports { temp_0_01675_out { O 32 vector } temp_0_01675_out_ap_vld { O 1 bit } } \
} "
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


# flow_control definition:
set InstName dft_flow_control_loop_pipe_sequential_init_U
set CompName dft_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix dft_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


