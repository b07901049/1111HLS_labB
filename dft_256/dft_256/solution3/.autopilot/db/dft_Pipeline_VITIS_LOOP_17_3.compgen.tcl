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
set ID 7
set hasByteEnable 0
set MemName dft_dft_Pipeline_VITIS_LOOP_17_3_cos_coefficients_table_ROM_AUTO_1R
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
set ID 8
set hasByteEnable 0
set MemName dft_dft_Pipeline_VITIS_LOOP_17_3_sin_coefficients_table_ROM_AUTO_1R
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

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 11 \
    name imag_output \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename imag_output \
    op interface \
    ports { imag_output_address0 { O 8 vector } imag_output_ce0 { O 1 bit } imag_output_we0 { O 1 bit } imag_output_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'imag_output'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 13 \
    name real_output \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename real_output \
    op interface \
    ports { real_output_address0 { O 8 vector } real_output_ce0 { O 1 bit } real_output_we0 { O 1 bit } real_output_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'real_output'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 15 \
    name temp \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename temp \
    op interface \
    ports { temp_address0 { O 8 vector } temp_ce0 { O 1 bit } temp_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'temp'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name bitcast_ln20 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bitcast_ln20 \
    op interface \
    ports { bitcast_ln20 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name bitcast_ln19 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bitcast_ln19 \
    op interface \
    ports { bitcast_ln19 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name zext_ln15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln15 \
    op interface \
    ports { zext_ln15 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name trunc_ln \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_trunc_ln \
    op interface \
    ports { trunc_ln { I 8 vector } } \
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


