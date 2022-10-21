# This script segment is generated automatically by AutoPilot

set name dft_fadd_32ns_32ns_32_5_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fadd} IMPL {fulldsp} LATENCY 4 ALLOW_PRAGMA 1
}


set name dft_fmul_32ns_32ns_32_4_max_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fmul} IMPL {maxdsp} LATENCY 3 ALLOW_PRAGMA 1
}


# Memory (RAM/ROM)  definition:
set ID 520
set hasByteEnable 0
set MemName dft_dft_Pipeline_VITIS_LOOP_28_3_cos_coefficients_table_ROM_AUTO_1R
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 32
set AddrRange 256
set AddrWd 8
set impl_style auto
set TrueReset 0
set IsROM 1
set ROMData { "00111111100000000000000000000000" "00111111011111111110110001000110" "00111111011111111011000100000111" "00111111011111110100111001100110" "00111111011111101100010001110010" "00111111011111100001001100101011" "00111111011111010011101010110100" "00111111011111000011101100101110" "00111111011110110001010010111010" "00111111011110011100011110011011" "00111111011110000101001111110100" "00111111011101101011101000000110" "00111111011101001111101000000101" "00111111011100110001010001000100" "00111111011100010000100100000111" "00111111011011101101100010100001" "00111111011011001000001101100110" "00111111011010100000100110101011" "00111111011001110110101111010011" "00111111011001001010101001010100" "00111111011000011100010110010011" "00111111010111101011111000000110" "00111111010110111001010000100001" "00111111010110000100100001011010" "00111111010101001101101100111000" "00111111010100010100110101000000" "00111111010011011001111100001010" "00111111010010011101000100001011" "00111111010001011110001111111100" "00111111010000011101100001110011" "00111111001111011010111011110111" "00111111001110010110100001000000" "00111111001101010000010011110111" "00111111001100001000010111000010" "00111111001010111110101101001010" "00111111001001110011011001011001" "00111111001000100110011110010100" "00111111000111010111111111011000" "00111111000110000111111110111011" "00111111000100110110100000100111" "00111111000011100011100111010110" "00111111000010001111010110100001" "00111111000000111001110001000001" "00111110111111000101110100100000" "00111110111100010101101011110011" "00111110111001100011001101101010" "00111110110110101110100001111101" "00111110110011110111101111000000" "00111110110000111110111100000111" "00111110101110000100010000101000" "00111110101011000111110011011001" "00111110101000001001101011101101" "00111110100101001010000000111100" "00111110100010001000111010011011" "00111110011110001100111111000000" "00111110011000000101110000000011" "00111110010001111100010110101100" "00111110001011110001000010101010" "00111110000101100100000001100100" "00111101111110101011001010011110" "00111101110010001011110100100011" "00111101100101101010100100111111" "00111101010010001111101110000111" "00111100110010010000101000110101" "00000000000000000000000000000000" "10111100110010010000101000110101" "10111101010010001111101110000111" "10111101100101101010100100111111" "10111101110010001011110100100011" "10111101111110101011001010011110" "10111110000101100100000001100100" "10111110001011110001000010101010" "10111110010001111100010110101100" "10111110011000000101110000000011" "10111110011110001100111111000000" "10111110100010001000111010011011" "10111110100101001010000000111100" "10111110101000001001101011101101" "10111110101011000111110011011001" "10111110101110000100010000101000" "10111110110000111110111100000111" "10111110110011110111101111000000" "10111110110110101110100001111101" "10111110111001100011001101101010" "10111110111100010101101011110011" "10111110111111000101110100100000" "10111111000000111001110001000001" "10111111000010001111010110100001" "10111111000011100011100111010110" "10111111000100110110100000100111" "10111111000110000111111110111011" "10111111000111010111111111011000" "10111111001000100110011110010100" "10111111001001110011011001011001" "10111111001010111110101101001010" "10111111001100001000010111000010" "10111111001101010000010011110111" "10111111001110010110100001000000" "10111111001111011010111011110111" "10111111010000011101100001110011" "10111111010001011110001111111100" "10111111010010011101000100001011" "10111111010011011001111100001010" "10111111010100010100110101000000" "10111111010101001101101100111000" "10111111010110000100100001011010" "10111111010110111001010000100001" "10111111010111101011111000000110" "10111111011000011100010110010011" "10111111011001001010101001010100" "10111111011001110110101111010011" "10111111011010100000100110101011" "10111111011011001000001101100110" "10111111011011101101100010100001" "10111111011100010000100100000111" "10111111011100110001010001000100" "10111111011101001111101000000101" "10111111011101101011101000000110" "10111111011110000101001111110100" "10111111011110011100011110011011" "10111111011110110001010010111010" "10111111011111000011101100101110" "10111111011111010011101010110100" "10111111011111100001001100101011" "10111111011111101100010001110010" "10111111011111110100111001100110" "10111111011111111011000100000111" "10111111011111111110110001000110" "10111111100000000000000000000000" "10111111011111111110110001000110" "10111111011111111011000100000111" "10111111011111110100111001100110" "10111111011111101100010001110010" "10111111011111100001001100101011" "10111111011111010011101010110100" "10111111011111000011101100101110" "10111111011110110001010010111010" "10111111011110011100011110011011" "10111111011110000101001111110100" "10111111011101101011101000000110" "10111111011101001111101000000101" "10111111011100110001010001000100" "10111111011100010000100100000111" "10111111011011101101100010100001" "10111111011011001000001101100110" "10111111011010100000100110101011" "10111111011001110110101111010011" "10111111011001001010101001010100" "10111111011000011100010110010011" "10111111010111101011111000000110" "10111111010110111001010000100001" "10111111010110000100100001011010" "10111111010101001101101100111000" "10111111010100010100110101000000" "10111111010011011001111100001010" "10111111010010011101000100001011" "10111111010001011110001111111100" "10111111010000011101100001110011" "10111111001111011010111011110111" "10111111001110010110100001000000" "10111111001101010000010011110111" "10111111001100001000010111000010" "10111111001010111110101101001010" "10111111001001110011011001011001" "10111111001000100110011110010100" "10111111000111010111111111011000" "10111111000110000111111110111011" "10111111000100110110100000100111" "10111111000011100011100111010110" "10111111000010001111010110100001" "10111111000000111001110001000001" "10111110111111000101110100100000" "10111110111100010101101011110011" "10111110111001100011001101101010" "10111110110110101110100001111101" "10111110110011110111101111000000" "10111110110000111110111100000111" "10111110101110000100010000101000" "10111110101011000111110011011001" "10111110101000001001101011101101" "10111110100101001010000000111100" "10111110100010001000111010011011" "10111110011110001100111111000000" "10111110011000000101110000000011" "10111110010001111100010110101100" "10111110001011110001000010101010" "10111110000101100100000001100100" "10111101111110101011001010011110" "10111101110010001011110100100011" "10111101100101101010100100111111" "10111101010010001111101110000111" "10111100110010010000101000110101" "10000000000000000000000000000000" "00111100110010010000101000110101" "00111101010010001111101110000111" "00111101100101101010100100111111" "00111101110010001011110100100011" "00111101111110101011001010011110" "00111110000101100100000001100100" "00111110001011110001000010101010" "00111110010001111100010110101100" "00111110011000000101110000000011" "00111110011110001100111111000000" "00111110100010001000111010011011" "00111110100101001010000000111100" "00111110101000001001101011101101" "00111110101011000111110011011001" "00111110101110000100010000101000" "00111110110000111110111100000111" "00111110110011110111101111000000" "00111110110110101110100001111101" "00111110111001100011001101101010" "00111110111100010101101011110011" "00111110111111000101110100100000" "00111111000000111001110001000001" "00111111000010001111010110100001" "00111111000011100011100111010110" "00111111000100110110100000100111" "00111111000110000111111110111011" "00111111000111010111111111011000" "00111111001000100110011110010100" "00111111001001110011011001011001" "00111111001010111110101101001010" "00111111001100001000010111000010" "00111111001101010000010011110111" "00111111001110010110100001000000" "00111111001111011010111011110111" "00111111010000011101100001110011" "00111111010001011110001111111100" "00111111010010011101000100001011" "00111111010011011001111100001010" "00111111010100010100110101000000" "00111111010101001101101100111000" "00111111010110000100100001011010" "00111111010110111001010000100001" "00111111010111101011111000000110" "00111111011000011100010110010011" "00111111011001001010101001010100" "00111111011001110110101111010011" "00111111011010100000100110101011" "00111111011011001000001101100110" "00111111011011101101100010100001" "00111111011100010000100100000111" "00111111011100110001010001000100" "00111111011101001111101000000101" "00111111011101101011101000000110" "00111111011110000101001111110100" "00111111011110011100011110011011" "00111111011110110001010010111010" "00111111011111000011101100101110" "00111111011111010011101010110100" "00111111011111100001001100101011" "00111111011111101100010001110010" "00111111011111110100111001100110" "00111111011111111011000100000111" "00111111011111111110110001000110" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set DelayBudget 3.254
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
    port_num 1 \
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
	::AP::rtl_comp_handler $MemName BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


set CoreName ROM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 1 \
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
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 521
set hasByteEnable 0
set MemName dft_dft_Pipeline_VITIS_LOOP_28_3_sin_coefficients_table_ROM_AUTO_1R
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 32
set AddrRange 256
set AddrWd 8
set impl_style auto
set TrueReset 0
set IsROM 1
set ROMData { "00000000000000000000000000000000" "10111100110010010000101000110101" "10111101010010001111101110000111" "10111101100101101010100100111111" "10111101110010001011110100100011" "10111101111110101011001010011110" "10111110000101100100000001100100" "10111110001011110001000010101010" "10111110010001111100010110101100" "10111110011000000101110000000011" "10111110011110001100111111000000" "10111110100010001000111010011011" "10111110100101001010000000111100" "10111110101000001001101011101101" "10111110101011000111110011011001" "10111110101110000100010000101000" "10111110110000111110111100000111" "10111110110011110111101111000000" "10111110110110101110100001111101" "10111110111001100011001101101010" "10111110111100010101101011110011" "10111110111111000101110100100000" "10111111000000111001110001000001" "10111111000010001111010110100001" "10111111000011100011100111010110" "10111111000100110110100000100111" "10111111000110000111111110111011" "10111111000111010111111111011000" "10111111001000100110011110010100" "10111111001001110011011001011001" "10111111001010111110101101001010" "10111111001100001000010111000010" "10111111001101010000010011110111" "10111111001110010110100001000000" "10111111001111011010111011110111" "10111111010000011101100001110011" "10111111010001011110001111111100" "10111111010010011101000100001011" "10111111010011011001111100001010" "10111111010100010100110101000000" "10111111010101001101101100111000" "10111111010110000100100001011010" "10111111010110111001010000100001" "10111111010111101011111000000110" "10111111011000011100010110010011" "10111111011001001010101001010100" "10111111011001110110101111010011" "10111111011010100000100110101011" "10111111011011001000001101100110" "10111111011011101101100010100001" "10111111011100010000100100000111" "10111111011100110001010001000100" "10111111011101001111101000000101" "10111111011101101011101000000110" "10111111011110000101001111110100" "10111111011110011100011110011011" "10111111011110110001010010111010" "10111111011111000011101100101110" "10111111011111010011101010110100" "10111111011111100001001100101011" "10111111011111101100010001110010" "10111111011111110100111001100110" "10111111011111111011000100000111" "10111111011111111110110001000110" "10111111100000000000000000000000" "10111111011111111110110001000110" "10111111011111111011000100000111" "10111111011111110100111001100110" "10111111011111101100010001110010" "10111111011111100001001100101011" "10111111011111010011101010110100" "10111111011111000011101100101110" "10111111011110110001010010111010" "10111111011110011100011110011011" "10111111011110000101001111110100" "10111111011101101011101000000110" "10111111011101001111101000000101" "10111111011100110001010001000100" "10111111011100010000100100000111" "10111111011011101101100010100001" "10111111011011001000001101100110" "10111111011010100000100110101011" "10111111011001110110101111010011" "10111111011001001010101001010100" "10111111011000011100010110010011" "10111111010111101011111000000110" "10111111010110111001010000100001" "10111111010110000100100001011010" "10111111010101001101101100111000" "10111111010100010100110101000000" "10111111010011011001111100001010" "10111111010010011101000100001011" "10111111010001011110001111111100" "10111111010000011101100001110011" "10111111001111011010111011110111" "10111111001110010110100001000000" "10111111001101010000010011110111" "10111111001100001000010111000010" "10111111001010111110101101001010" "10111111001001110011011001011001" "10111111001000100110011110010100" "10111111000111010111111111011000" "10111111000110000111111110111011" "10111111000100110110100000100111" "10111111000011100011100111010110" "10111111000010001111010110100001" "10111111000000111001110001000001" "10111110111111000101110100100000" "10111110111100010101101011110011" "10111110111001100011001101101010" "10111110110110101110100001111101" "10111110110011110111101111000000" "10111110110000111110111100000111" "10111110101110000100010000101000" "10111110101011000111110011011001" "10111110101000001001101011101101" "10111110100101001010000000111100" "10111110100010001000111010011011" "10111110011110001100111111000000" "10111110011000000101110000000011" "10111110010001111100010110101100" "10111110001011110001000010101010" "10111110000101100100000001100100" "10111101111110101011001010011110" "10111101110010001011110100100011" "10111101100101101010100100111111" "10111101010010001111101110000111" "10111100110010010000101000110101" "10000000000000000000000000000000" "00111100110010010000101000110101" "00111101010010001111101110000111" "00111101100101101010100100111111" "00111101110010001011110100100011" "00111101111110101011001010011110" "00111110000101100100000001100100" "00111110001011110001000010101010" "00111110010001111100010110101100" "00111110011000000101110000000011" "00111110011110001100111111000000" "00111110100010001000111010011011" "00111110100101001010000000111100" "00111110101000001001101011101101" "00111110101011000111110011011001" "00111110101110000100010000101000" "00111110110000111110111100000111" "00111110110011110111101111000000" "00111110110110101110100001111101" "00111110111001100011001101101010" "00111110111100010101101011110011" "00111110111111000101110100100000" "00111111000000111001110001000001" "00111111000010001111010110100001" "00111111000011100011100111010110" "00111111000100110110100000100111" "00111111000110000111111110111011" "00111111000111010111111111011000" "00111111001000100110011110010100" "00111111001001110011011001011001" "00111111001010111110101101001010" "00111111001100001000010111000010" "00111111001101010000010011110111" "00111111001110010110100001000000" "00111111001111011010111011110111" "00111111010000011101100001110011" "00111111010001011110001111111100" "00111111010010011101000100001011" "00111111010011011001111100001010" "00111111010100010100110101000000" "00111111010101001101101100111000" "00111111010110000100100001011010" "00111111010110111001010000100001" "00111111010111101011111000000110" "00111111011000011100010110010011" "00111111011001001010101001010100" "00111111011001110110101111010011" "00111111011010100000100110101011" "00111111011011001000001101100110" "00111111011011101101100010100001" "00111111011100010000100100000111" "00111111011100110001010001000100" "00111111011101001111101000000101" "00111111011101101011101000000110" "00111111011110000101001111110100" "00111111011110011100011110011011" "00111111011110110001010010111010" "00111111011111000011101100101110" "00111111011111010011101010110100" "00111111011111100001001100101011" "00111111011111101100010001110010" "00111111011111110100111001100110" "00111111011111111011000100000111" "00111111011111111110110001000110" "00111111100000000000000000000000" "00111111011111111110110001000110" "00111111011111111011000100000111" "00111111011111110100111001100110" "00111111011111101100010001110010" "00111111011111100001001100101011" "00111111011111010011101010110100" "00111111011111000011101100101110" "00111111011110110001010010111010" "00111111011110011100011110011011" "00111111011110000101001111110100" "00111111011101101011101000000110" "00111111011101001111101000000101" "00111111011100110001010001000100" "00111111011100010000100100000111" "00111111011011101101100010100001" "00111111011011001000001101100110" "00111111011010100000100110101011" "00111111011001110110101111010011" "00111111011001001010101001010100" "00111111011000011100010110010011" "00111111010111101011111000000110" "00111111010110111001010000100001" "00111111010110000100100001011010" "00111111010101001101101100111000" "00111111010100010100110101000000" "00111111010011011001111100001010" "00111111010010011101000100001011" "00111111010001011110001111111100" "00111111010000011101100001110011" "00111111001111011010111011110111" "00111111001110010110100001000000" "00111111001101010000010011110111" "00111111001100001000010111000010" "00111111001010111110101101001010" "00111111001001110011011001011001" "00111111001000100110011110010100" "00111111000111010111111111011000" "00111111000110000111111110111011" "00111111000100110110100000100111" "00111111000011100011100111010110" "00111111000010001111010110100001" "00111111000000111001110001000001" "00111110111111000101110100100000" "00111110111100010101101011110011" "00111110111001100011001101101010" "00111110110110101110100001111101" "00111110110011110111101111000000" "00111110110000111110111100000111" "00111110101110000100010000101000" "00111110101011000111110011011001" "00111110101000001001101011101101" "00111110100101001010000000111100" "00111110100010001000111010011011" "00111110011110001100111111000000" "00111110011000000101110000000011" "00111110010001111100010110101100" "00111110001011110001000010101010" "00111110000101100100000001100100" "00111101111110101011001010011110" "00111101110010001011110100100011" "00111101100101101010100100111111" "00111101010010001111101110000111" "00111100110010010000101000110101" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set DelayBudget 3.254
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
    port_num 1 \
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
	::AP::rtl_comp_handler $MemName BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


set CoreName ROM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 1 \
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
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 522 \
    name trunc_ln1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_trunc_ln1 \
    op interface \
    ports { trunc_ln1 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 523 \
    name temp_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_reload \
    op interface \
    ports { temp_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 524 \
    name temp_1_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_1_reload \
    op interface \
    ports { temp_1_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 525 \
    name temp_2_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_2_reload \
    op interface \
    ports { temp_2_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 526 \
    name temp_3_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_3_reload \
    op interface \
    ports { temp_3_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 527 \
    name temp_4_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_4_reload \
    op interface \
    ports { temp_4_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 528 \
    name temp_5_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_5_reload \
    op interface \
    ports { temp_5_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 529 \
    name temp_6_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_6_reload \
    op interface \
    ports { temp_6_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 530 \
    name temp_7_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_7_reload \
    op interface \
    ports { temp_7_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 531 \
    name temp_8_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_8_reload \
    op interface \
    ports { temp_8_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 532 \
    name temp_9_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_9_reload \
    op interface \
    ports { temp_9_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 533 \
    name temp_10_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_10_reload \
    op interface \
    ports { temp_10_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 534 \
    name temp_11_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_11_reload \
    op interface \
    ports { temp_11_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 535 \
    name temp_12_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_12_reload \
    op interface \
    ports { temp_12_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 536 \
    name temp_13_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_13_reload \
    op interface \
    ports { temp_13_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 537 \
    name temp_14_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_14_reload \
    op interface \
    ports { temp_14_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 538 \
    name temp_15_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_15_reload \
    op interface \
    ports { temp_15_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 539 \
    name temp_16_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_16_reload \
    op interface \
    ports { temp_16_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 540 \
    name temp_17_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_17_reload \
    op interface \
    ports { temp_17_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 541 \
    name temp_18_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_18_reload \
    op interface \
    ports { temp_18_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 542 \
    name temp_19_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_19_reload \
    op interface \
    ports { temp_19_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 543 \
    name temp_20_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_20_reload \
    op interface \
    ports { temp_20_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 544 \
    name temp_21_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_21_reload \
    op interface \
    ports { temp_21_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 545 \
    name temp_22_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_22_reload \
    op interface \
    ports { temp_22_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 546 \
    name temp_23_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_23_reload \
    op interface \
    ports { temp_23_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 547 \
    name temp_24_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_24_reload \
    op interface \
    ports { temp_24_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 548 \
    name temp_25_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_25_reload \
    op interface \
    ports { temp_25_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 549 \
    name temp_26_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_26_reload \
    op interface \
    ports { temp_26_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 550 \
    name temp_27_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_27_reload \
    op interface \
    ports { temp_27_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 551 \
    name temp_28_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_28_reload \
    op interface \
    ports { temp_28_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 552 \
    name temp_29_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_29_reload \
    op interface \
    ports { temp_29_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 553 \
    name temp_30_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_30_reload \
    op interface \
    ports { temp_30_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 554 \
    name temp_31_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_31_reload \
    op interface \
    ports { temp_31_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 555 \
    name temp_32_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_32_reload \
    op interface \
    ports { temp_32_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 556 \
    name temp_33_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_33_reload \
    op interface \
    ports { temp_33_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 557 \
    name temp_34_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_34_reload \
    op interface \
    ports { temp_34_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 558 \
    name temp_35_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_35_reload \
    op interface \
    ports { temp_35_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 559 \
    name temp_36_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_36_reload \
    op interface \
    ports { temp_36_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 560 \
    name temp_37_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_37_reload \
    op interface \
    ports { temp_37_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 561 \
    name temp_38_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_38_reload \
    op interface \
    ports { temp_38_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 562 \
    name temp_39_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_39_reload \
    op interface \
    ports { temp_39_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 563 \
    name temp_40_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_40_reload \
    op interface \
    ports { temp_40_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 564 \
    name temp_41_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_41_reload \
    op interface \
    ports { temp_41_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 565 \
    name temp_42_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_42_reload \
    op interface \
    ports { temp_42_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 566 \
    name temp_43_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_43_reload \
    op interface \
    ports { temp_43_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 567 \
    name temp_44_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_44_reload \
    op interface \
    ports { temp_44_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 568 \
    name temp_45_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_45_reload \
    op interface \
    ports { temp_45_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 569 \
    name temp_46_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_46_reload \
    op interface \
    ports { temp_46_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 570 \
    name temp_47_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_47_reload \
    op interface \
    ports { temp_47_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 571 \
    name temp_48_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_48_reload \
    op interface \
    ports { temp_48_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 572 \
    name temp_49_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_49_reload \
    op interface \
    ports { temp_49_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 573 \
    name temp_50_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_50_reload \
    op interface \
    ports { temp_50_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 574 \
    name temp_51_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_51_reload \
    op interface \
    ports { temp_51_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 575 \
    name temp_52_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_52_reload \
    op interface \
    ports { temp_52_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 576 \
    name temp_53_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_53_reload \
    op interface \
    ports { temp_53_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 577 \
    name temp_54_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_54_reload \
    op interface \
    ports { temp_54_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 578 \
    name temp_55_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_55_reload \
    op interface \
    ports { temp_55_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 579 \
    name temp_56_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_56_reload \
    op interface \
    ports { temp_56_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 580 \
    name temp_57_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_57_reload \
    op interface \
    ports { temp_57_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 581 \
    name temp_58_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_58_reload \
    op interface \
    ports { temp_58_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 582 \
    name temp_59_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_59_reload \
    op interface \
    ports { temp_59_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 583 \
    name temp_60_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_60_reload \
    op interface \
    ports { temp_60_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 584 \
    name temp_61_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_61_reload \
    op interface \
    ports { temp_61_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 585 \
    name temp_62_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_62_reload \
    op interface \
    ports { temp_62_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 586 \
    name temp_63_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_63_reload \
    op interface \
    ports { temp_63_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 587 \
    name temp_64_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_64_reload \
    op interface \
    ports { temp_64_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 588 \
    name temp_65_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_65_reload \
    op interface \
    ports { temp_65_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 589 \
    name temp_66_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_66_reload \
    op interface \
    ports { temp_66_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 590 \
    name temp_67_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_67_reload \
    op interface \
    ports { temp_67_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 591 \
    name temp_68_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_68_reload \
    op interface \
    ports { temp_68_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 592 \
    name temp_69_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_69_reload \
    op interface \
    ports { temp_69_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 593 \
    name temp_70_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_70_reload \
    op interface \
    ports { temp_70_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 594 \
    name temp_71_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_71_reload \
    op interface \
    ports { temp_71_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 595 \
    name temp_72_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_72_reload \
    op interface \
    ports { temp_72_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 596 \
    name temp_73_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_73_reload \
    op interface \
    ports { temp_73_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 597 \
    name temp_74_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_74_reload \
    op interface \
    ports { temp_74_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 598 \
    name temp_75_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_75_reload \
    op interface \
    ports { temp_75_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 599 \
    name temp_76_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_76_reload \
    op interface \
    ports { temp_76_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 600 \
    name temp_77_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_77_reload \
    op interface \
    ports { temp_77_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 601 \
    name temp_78_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_78_reload \
    op interface \
    ports { temp_78_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 602 \
    name temp_79_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_79_reload \
    op interface \
    ports { temp_79_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 603 \
    name temp_80_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_80_reload \
    op interface \
    ports { temp_80_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 604 \
    name temp_81_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_81_reload \
    op interface \
    ports { temp_81_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 605 \
    name temp_82_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_82_reload \
    op interface \
    ports { temp_82_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 606 \
    name temp_83_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_83_reload \
    op interface \
    ports { temp_83_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 607 \
    name temp_84_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_84_reload \
    op interface \
    ports { temp_84_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 608 \
    name temp_85_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_85_reload \
    op interface \
    ports { temp_85_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 609 \
    name temp_86_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_86_reload \
    op interface \
    ports { temp_86_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 610 \
    name temp_87_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_87_reload \
    op interface \
    ports { temp_87_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 611 \
    name temp_88_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_88_reload \
    op interface \
    ports { temp_88_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 612 \
    name temp_89_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_89_reload \
    op interface \
    ports { temp_89_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 613 \
    name temp_90_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_90_reload \
    op interface \
    ports { temp_90_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 614 \
    name temp_91_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_91_reload \
    op interface \
    ports { temp_91_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 615 \
    name temp_92_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_92_reload \
    op interface \
    ports { temp_92_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 616 \
    name temp_93_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_93_reload \
    op interface \
    ports { temp_93_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 617 \
    name temp_94_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_94_reload \
    op interface \
    ports { temp_94_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 618 \
    name temp_95_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_95_reload \
    op interface \
    ports { temp_95_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 619 \
    name temp_96_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_96_reload \
    op interface \
    ports { temp_96_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 620 \
    name temp_97_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_97_reload \
    op interface \
    ports { temp_97_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 621 \
    name temp_98_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_98_reload \
    op interface \
    ports { temp_98_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 622 \
    name temp_99_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_99_reload \
    op interface \
    ports { temp_99_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 623 \
    name temp_100_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_100_reload \
    op interface \
    ports { temp_100_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 624 \
    name temp_101_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_101_reload \
    op interface \
    ports { temp_101_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 625 \
    name temp_102_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_102_reload \
    op interface \
    ports { temp_102_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 626 \
    name temp_103_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_103_reload \
    op interface \
    ports { temp_103_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 627 \
    name temp_104_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_104_reload \
    op interface \
    ports { temp_104_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 628 \
    name temp_105_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_105_reload \
    op interface \
    ports { temp_105_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 629 \
    name temp_106_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_106_reload \
    op interface \
    ports { temp_106_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 630 \
    name temp_107_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_107_reload \
    op interface \
    ports { temp_107_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 631 \
    name temp_108_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_108_reload \
    op interface \
    ports { temp_108_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 632 \
    name temp_109_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_109_reload \
    op interface \
    ports { temp_109_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 633 \
    name temp_110_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_110_reload \
    op interface \
    ports { temp_110_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 634 \
    name temp_111_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_111_reload \
    op interface \
    ports { temp_111_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 635 \
    name temp_112_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_112_reload \
    op interface \
    ports { temp_112_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 636 \
    name temp_113_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_113_reload \
    op interface \
    ports { temp_113_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 637 \
    name temp_114_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_114_reload \
    op interface \
    ports { temp_114_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 638 \
    name temp_115_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_115_reload \
    op interface \
    ports { temp_115_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 639 \
    name temp_116_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_116_reload \
    op interface \
    ports { temp_116_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 640 \
    name temp_117_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_117_reload \
    op interface \
    ports { temp_117_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 641 \
    name temp_118_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_118_reload \
    op interface \
    ports { temp_118_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 642 \
    name temp_119_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_119_reload \
    op interface \
    ports { temp_119_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 643 \
    name temp_120_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_120_reload \
    op interface \
    ports { temp_120_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 644 \
    name temp_121_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_121_reload \
    op interface \
    ports { temp_121_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 645 \
    name temp_122_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_122_reload \
    op interface \
    ports { temp_122_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 646 \
    name temp_123_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_123_reload \
    op interface \
    ports { temp_123_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 647 \
    name temp_124_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_124_reload \
    op interface \
    ports { temp_124_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 648 \
    name temp_125_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_125_reload \
    op interface \
    ports { temp_125_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 649 \
    name temp_126_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_126_reload \
    op interface \
    ports { temp_126_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 650 \
    name temp_127_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_127_reload \
    op interface \
    ports { temp_127_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 651 \
    name temp_128_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_128_reload \
    op interface \
    ports { temp_128_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 652 \
    name temp_129_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_129_reload \
    op interface \
    ports { temp_129_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 653 \
    name temp_130_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_130_reload \
    op interface \
    ports { temp_130_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 654 \
    name temp_131_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_131_reload \
    op interface \
    ports { temp_131_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 655 \
    name temp_132_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_132_reload \
    op interface \
    ports { temp_132_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 656 \
    name temp_133_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_133_reload \
    op interface \
    ports { temp_133_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 657 \
    name temp_134_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_134_reload \
    op interface \
    ports { temp_134_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 658 \
    name temp_135_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_135_reload \
    op interface \
    ports { temp_135_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 659 \
    name temp_136_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_136_reload \
    op interface \
    ports { temp_136_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 660 \
    name temp_137_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_137_reload \
    op interface \
    ports { temp_137_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 661 \
    name temp_138_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_138_reload \
    op interface \
    ports { temp_138_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 662 \
    name temp_139_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_139_reload \
    op interface \
    ports { temp_139_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 663 \
    name temp_140_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_140_reload \
    op interface \
    ports { temp_140_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 664 \
    name temp_141_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_141_reload \
    op interface \
    ports { temp_141_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 665 \
    name temp_142_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_142_reload \
    op interface \
    ports { temp_142_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 666 \
    name temp_143_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_143_reload \
    op interface \
    ports { temp_143_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 667 \
    name temp_144_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_144_reload \
    op interface \
    ports { temp_144_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 668 \
    name temp_145_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_145_reload \
    op interface \
    ports { temp_145_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 669 \
    name temp_146_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_146_reload \
    op interface \
    ports { temp_146_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 670 \
    name temp_147_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_147_reload \
    op interface \
    ports { temp_147_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 671 \
    name temp_148_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_148_reload \
    op interface \
    ports { temp_148_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 672 \
    name temp_149_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_149_reload \
    op interface \
    ports { temp_149_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 673 \
    name temp_150_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_150_reload \
    op interface \
    ports { temp_150_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 674 \
    name temp_151_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_151_reload \
    op interface \
    ports { temp_151_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 675 \
    name temp_152_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_152_reload \
    op interface \
    ports { temp_152_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 676 \
    name temp_153_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_153_reload \
    op interface \
    ports { temp_153_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 677 \
    name temp_154_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_154_reload \
    op interface \
    ports { temp_154_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 678 \
    name temp_155_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_155_reload \
    op interface \
    ports { temp_155_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 679 \
    name temp_156_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_156_reload \
    op interface \
    ports { temp_156_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 680 \
    name temp_157_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_157_reload \
    op interface \
    ports { temp_157_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 681 \
    name temp_158_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_158_reload \
    op interface \
    ports { temp_158_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 682 \
    name temp_159_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_159_reload \
    op interface \
    ports { temp_159_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 683 \
    name temp_160_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_160_reload \
    op interface \
    ports { temp_160_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 684 \
    name temp_161_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_161_reload \
    op interface \
    ports { temp_161_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 685 \
    name temp_162_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_162_reload \
    op interface \
    ports { temp_162_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 686 \
    name temp_163_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_163_reload \
    op interface \
    ports { temp_163_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 687 \
    name temp_164_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_164_reload \
    op interface \
    ports { temp_164_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 688 \
    name temp_165_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_165_reload \
    op interface \
    ports { temp_165_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 689 \
    name temp_166_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_166_reload \
    op interface \
    ports { temp_166_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 690 \
    name temp_167_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_167_reload \
    op interface \
    ports { temp_167_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 691 \
    name temp_168_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_168_reload \
    op interface \
    ports { temp_168_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 692 \
    name temp_169_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_169_reload \
    op interface \
    ports { temp_169_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 693 \
    name temp_170_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_170_reload \
    op interface \
    ports { temp_170_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 694 \
    name temp_171_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_171_reload \
    op interface \
    ports { temp_171_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 695 \
    name temp_172_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_172_reload \
    op interface \
    ports { temp_172_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 696 \
    name temp_173_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_173_reload \
    op interface \
    ports { temp_173_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 697 \
    name temp_174_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_174_reload \
    op interface \
    ports { temp_174_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 698 \
    name temp_175_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_175_reload \
    op interface \
    ports { temp_175_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 699 \
    name temp_176_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_176_reload \
    op interface \
    ports { temp_176_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 700 \
    name temp_177_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_177_reload \
    op interface \
    ports { temp_177_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 701 \
    name temp_178_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_178_reload \
    op interface \
    ports { temp_178_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 702 \
    name temp_179_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_179_reload \
    op interface \
    ports { temp_179_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 703 \
    name temp_180_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_180_reload \
    op interface \
    ports { temp_180_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 704 \
    name temp_181_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_181_reload \
    op interface \
    ports { temp_181_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 705 \
    name temp_182_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_182_reload \
    op interface \
    ports { temp_182_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 706 \
    name temp_183_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_183_reload \
    op interface \
    ports { temp_183_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 707 \
    name temp_184_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_184_reload \
    op interface \
    ports { temp_184_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 708 \
    name temp_185_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_185_reload \
    op interface \
    ports { temp_185_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 709 \
    name temp_186_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_186_reload \
    op interface \
    ports { temp_186_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 710 \
    name temp_187_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_187_reload \
    op interface \
    ports { temp_187_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 711 \
    name temp_188_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_188_reload \
    op interface \
    ports { temp_188_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 712 \
    name temp_189_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_189_reload \
    op interface \
    ports { temp_189_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 713 \
    name temp_190_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_190_reload \
    op interface \
    ports { temp_190_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 714 \
    name temp_191_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_191_reload \
    op interface \
    ports { temp_191_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 715 \
    name temp_192_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_192_reload \
    op interface \
    ports { temp_192_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 716 \
    name temp_193_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_193_reload \
    op interface \
    ports { temp_193_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 717 \
    name temp_194_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_194_reload \
    op interface \
    ports { temp_194_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 718 \
    name temp_195_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_195_reload \
    op interface \
    ports { temp_195_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 719 \
    name temp_196_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_196_reload \
    op interface \
    ports { temp_196_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 720 \
    name temp_197_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_197_reload \
    op interface \
    ports { temp_197_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 721 \
    name temp_198_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_198_reload \
    op interface \
    ports { temp_198_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 722 \
    name temp_199_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_199_reload \
    op interface \
    ports { temp_199_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 723 \
    name temp_200_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_200_reload \
    op interface \
    ports { temp_200_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 724 \
    name temp_201_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_201_reload \
    op interface \
    ports { temp_201_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 725 \
    name temp_202_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_202_reload \
    op interface \
    ports { temp_202_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 726 \
    name temp_203_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_203_reload \
    op interface \
    ports { temp_203_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 727 \
    name temp_204_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_204_reload \
    op interface \
    ports { temp_204_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 728 \
    name temp_205_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_205_reload \
    op interface \
    ports { temp_205_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 729 \
    name temp_206_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_206_reload \
    op interface \
    ports { temp_206_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 730 \
    name temp_207_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_207_reload \
    op interface \
    ports { temp_207_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 731 \
    name temp_208_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_208_reload \
    op interface \
    ports { temp_208_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 732 \
    name temp_209_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_209_reload \
    op interface \
    ports { temp_209_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 733 \
    name temp_210_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_210_reload \
    op interface \
    ports { temp_210_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 734 \
    name temp_211_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_211_reload \
    op interface \
    ports { temp_211_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 735 \
    name temp_212_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_212_reload \
    op interface \
    ports { temp_212_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 736 \
    name temp_213_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_213_reload \
    op interface \
    ports { temp_213_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 737 \
    name temp_214_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_214_reload \
    op interface \
    ports { temp_214_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 738 \
    name temp_215_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_215_reload \
    op interface \
    ports { temp_215_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 739 \
    name temp_216_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_216_reload \
    op interface \
    ports { temp_216_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 740 \
    name temp_217_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_217_reload \
    op interface \
    ports { temp_217_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 741 \
    name temp_218_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_218_reload \
    op interface \
    ports { temp_218_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 742 \
    name temp_219_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_219_reload \
    op interface \
    ports { temp_219_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 743 \
    name temp_220_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_220_reload \
    op interface \
    ports { temp_220_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 744 \
    name temp_221_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_221_reload \
    op interface \
    ports { temp_221_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 745 \
    name temp_222_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_222_reload \
    op interface \
    ports { temp_222_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 746 \
    name temp_223_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_223_reload \
    op interface \
    ports { temp_223_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 747 \
    name temp_224_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_224_reload \
    op interface \
    ports { temp_224_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 748 \
    name temp_225_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_225_reload \
    op interface \
    ports { temp_225_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 749 \
    name temp_226_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_226_reload \
    op interface \
    ports { temp_226_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 750 \
    name temp_227_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_227_reload \
    op interface \
    ports { temp_227_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 751 \
    name temp_228_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_228_reload \
    op interface \
    ports { temp_228_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 752 \
    name temp_229_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_229_reload \
    op interface \
    ports { temp_229_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 753 \
    name temp_230_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_230_reload \
    op interface \
    ports { temp_230_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 754 \
    name temp_231_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_231_reload \
    op interface \
    ports { temp_231_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 755 \
    name temp_232_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_232_reload \
    op interface \
    ports { temp_232_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 756 \
    name temp_233_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_233_reload \
    op interface \
    ports { temp_233_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 757 \
    name temp_234_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_234_reload \
    op interface \
    ports { temp_234_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 758 \
    name temp_235_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_235_reload \
    op interface \
    ports { temp_235_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 759 \
    name temp_236_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_236_reload \
    op interface \
    ports { temp_236_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 760 \
    name temp_237_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_237_reload \
    op interface \
    ports { temp_237_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 761 \
    name temp_238_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_238_reload \
    op interface \
    ports { temp_238_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 762 \
    name temp_239_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_239_reload \
    op interface \
    ports { temp_239_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 763 \
    name temp_240_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_240_reload \
    op interface \
    ports { temp_240_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 764 \
    name temp_241_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_241_reload \
    op interface \
    ports { temp_241_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 765 \
    name temp_242_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_242_reload \
    op interface \
    ports { temp_242_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 766 \
    name temp_243_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_243_reload \
    op interface \
    ports { temp_243_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 767 \
    name temp_244_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_244_reload \
    op interface \
    ports { temp_244_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 768 \
    name temp_245_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_245_reload \
    op interface \
    ports { temp_245_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 769 \
    name temp_246_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_246_reload \
    op interface \
    ports { temp_246_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 770 \
    name temp_247_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_247_reload \
    op interface \
    ports { temp_247_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 771 \
    name temp_248_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_248_reload \
    op interface \
    ports { temp_248_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 772 \
    name temp_249_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_249_reload \
    op interface \
    ports { temp_249_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 773 \
    name temp_250_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_250_reload \
    op interface \
    ports { temp_250_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 774 \
    name temp_251_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_251_reload \
    op interface \
    ports { temp_251_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 775 \
    name temp_252_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_252_reload \
    op interface \
    ports { temp_252_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 776 \
    name temp_253_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_253_reload \
    op interface \
    ports { temp_253_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 777 \
    name temp_254_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_254_reload \
    op interface \
    ports { temp_254_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 778 \
    name temp_255_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_255_reload \
    op interface \
    ports { temp_255_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 779 \
    name sum_i_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sum_i_out \
    op interface \
    ports { sum_i_out { O 32 vector } sum_i_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 780 \
    name sum_r_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sum_r_out \
    op interface \
    ports { sum_r_out { O 32 vector } sum_r_out_ap_vld { O 1 bit } } \
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


