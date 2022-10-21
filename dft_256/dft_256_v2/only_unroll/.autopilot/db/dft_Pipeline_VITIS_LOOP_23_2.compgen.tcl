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
set ID 1025
set hasByteEnable 0
set MemName dft_dft_Pipeline_VITIS_LOOP_23_2_cos_coefficients_table_ROM_AUTO_1R
set CoreName ap_simcore_mem
set PortList { 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 }
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
    port_num 255 \
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
    port_num 255 \
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
set ID 1026
set hasByteEnable 0
set MemName dft_dft_Pipeline_VITIS_LOOP_23_2_sin_coefficients_table_ROM_AUTO_1R
set CoreName ap_simcore_mem
set PortList { 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 }
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
    port_num 255 \
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
    port_num 255 \
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
    id 1284 \
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
    id 1285 \
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


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1027 \
    name temp_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_1 \
    op interface \
    ports { temp_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1028 \
    name sum_r \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sum_r \
    op interface \
    ports { sum_r { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1029 \
    name sum_i \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sum_i \
    op interface \
    ports { sum_i { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1030 \
    name temp_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_2 \
    op interface \
    ports { temp_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1031 \
    name temp_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_3 \
    op interface \
    ports { temp_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1032 \
    name temp_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_4 \
    op interface \
    ports { temp_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1033 \
    name temp_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_5 \
    op interface \
    ports { temp_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1034 \
    name temp_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_6 \
    op interface \
    ports { temp_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1035 \
    name temp_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_7 \
    op interface \
    ports { temp_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1036 \
    name temp_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_8 \
    op interface \
    ports { temp_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1037 \
    name temp_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_9 \
    op interface \
    ports { temp_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1038 \
    name temp_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_10 \
    op interface \
    ports { temp_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1039 \
    name temp_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_11 \
    op interface \
    ports { temp_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1040 \
    name temp_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_12 \
    op interface \
    ports { temp_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1041 \
    name temp_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_13 \
    op interface \
    ports { temp_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1042 \
    name temp_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_14 \
    op interface \
    ports { temp_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1043 \
    name temp_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_15 \
    op interface \
    ports { temp_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1044 \
    name temp_load_16 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_16 \
    op interface \
    ports { temp_load_16 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1045 \
    name temp_load_17 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_17 \
    op interface \
    ports { temp_load_17 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1046 \
    name temp_load_18 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_18 \
    op interface \
    ports { temp_load_18 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1047 \
    name temp_load_19 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_19 \
    op interface \
    ports { temp_load_19 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1048 \
    name temp_load_20 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_20 \
    op interface \
    ports { temp_load_20 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1049 \
    name temp_load_21 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_21 \
    op interface \
    ports { temp_load_21 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1050 \
    name temp_load_22 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_22 \
    op interface \
    ports { temp_load_22 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1051 \
    name temp_load_23 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_23 \
    op interface \
    ports { temp_load_23 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1052 \
    name temp_load_24 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_24 \
    op interface \
    ports { temp_load_24 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1053 \
    name temp_load_25 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_25 \
    op interface \
    ports { temp_load_25 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1054 \
    name temp_load_26 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_26 \
    op interface \
    ports { temp_load_26 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1055 \
    name temp_load_27 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_27 \
    op interface \
    ports { temp_load_27 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1056 \
    name temp_load_28 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_28 \
    op interface \
    ports { temp_load_28 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1057 \
    name temp_load_29 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_29 \
    op interface \
    ports { temp_load_29 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1058 \
    name temp_load_30 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_30 \
    op interface \
    ports { temp_load_30 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1059 \
    name temp_load_31 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_31 \
    op interface \
    ports { temp_load_31 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1060 \
    name temp_load_32 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_32 \
    op interface \
    ports { temp_load_32 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1061 \
    name temp_load_33 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_33 \
    op interface \
    ports { temp_load_33 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1062 \
    name temp_load_34 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_34 \
    op interface \
    ports { temp_load_34 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1063 \
    name temp_load_35 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_35 \
    op interface \
    ports { temp_load_35 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1064 \
    name temp_load_36 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_36 \
    op interface \
    ports { temp_load_36 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1065 \
    name temp_load_37 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_37 \
    op interface \
    ports { temp_load_37 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1066 \
    name temp_load_38 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_38 \
    op interface \
    ports { temp_load_38 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1067 \
    name temp_load_39 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_39 \
    op interface \
    ports { temp_load_39 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1068 \
    name temp_load_40 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_40 \
    op interface \
    ports { temp_load_40 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1069 \
    name temp_load_41 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_41 \
    op interface \
    ports { temp_load_41 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1070 \
    name temp_load_42 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_42 \
    op interface \
    ports { temp_load_42 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1071 \
    name temp_load_43 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_43 \
    op interface \
    ports { temp_load_43 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1072 \
    name temp_load_44 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_44 \
    op interface \
    ports { temp_load_44 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1073 \
    name temp_load_45 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_45 \
    op interface \
    ports { temp_load_45 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1074 \
    name temp_load_46 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_46 \
    op interface \
    ports { temp_load_46 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1075 \
    name temp_load_47 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_47 \
    op interface \
    ports { temp_load_47 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1076 \
    name temp_load_48 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_48 \
    op interface \
    ports { temp_load_48 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1077 \
    name temp_load_49 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_49 \
    op interface \
    ports { temp_load_49 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1078 \
    name temp_load_50 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_50 \
    op interface \
    ports { temp_load_50 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1079 \
    name temp_load_51 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_51 \
    op interface \
    ports { temp_load_51 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1080 \
    name temp_load_52 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_52 \
    op interface \
    ports { temp_load_52 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1081 \
    name temp_load_53 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_53 \
    op interface \
    ports { temp_load_53 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1082 \
    name temp_load_54 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_54 \
    op interface \
    ports { temp_load_54 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1083 \
    name temp_load_55 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_55 \
    op interface \
    ports { temp_load_55 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1084 \
    name temp_load_56 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_56 \
    op interface \
    ports { temp_load_56 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1085 \
    name temp_load_57 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_57 \
    op interface \
    ports { temp_load_57 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1086 \
    name temp_load_58 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_58 \
    op interface \
    ports { temp_load_58 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1087 \
    name temp_load_59 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_59 \
    op interface \
    ports { temp_load_59 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1088 \
    name temp_load_60 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_60 \
    op interface \
    ports { temp_load_60 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1089 \
    name temp_load_61 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_61 \
    op interface \
    ports { temp_load_61 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1090 \
    name temp_load_62 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_62 \
    op interface \
    ports { temp_load_62 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1091 \
    name temp_load_63 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_63 \
    op interface \
    ports { temp_load_63 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1092 \
    name temp_load_64 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_64 \
    op interface \
    ports { temp_load_64 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1093 \
    name temp_load_65 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_65 \
    op interface \
    ports { temp_load_65 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1094 \
    name temp_load_66 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_66 \
    op interface \
    ports { temp_load_66 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1095 \
    name temp_load_67 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_67 \
    op interface \
    ports { temp_load_67 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1096 \
    name temp_load_68 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_68 \
    op interface \
    ports { temp_load_68 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1097 \
    name temp_load_69 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_69 \
    op interface \
    ports { temp_load_69 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1098 \
    name temp_load_70 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_70 \
    op interface \
    ports { temp_load_70 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1099 \
    name temp_load_71 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_71 \
    op interface \
    ports { temp_load_71 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1100 \
    name temp_load_72 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_72 \
    op interface \
    ports { temp_load_72 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1101 \
    name temp_load_73 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_73 \
    op interface \
    ports { temp_load_73 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1102 \
    name temp_load_74 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_74 \
    op interface \
    ports { temp_load_74 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1103 \
    name temp_load_75 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_75 \
    op interface \
    ports { temp_load_75 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1104 \
    name temp_load_76 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_76 \
    op interface \
    ports { temp_load_76 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1105 \
    name temp_load_77 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_77 \
    op interface \
    ports { temp_load_77 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1106 \
    name temp_load_78 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_78 \
    op interface \
    ports { temp_load_78 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1107 \
    name temp_load_79 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_79 \
    op interface \
    ports { temp_load_79 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1108 \
    name temp_load_80 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_80 \
    op interface \
    ports { temp_load_80 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1109 \
    name temp_load_81 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_81 \
    op interface \
    ports { temp_load_81 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1110 \
    name temp_load_82 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_82 \
    op interface \
    ports { temp_load_82 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1111 \
    name temp_load_83 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_83 \
    op interface \
    ports { temp_load_83 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1112 \
    name temp_load_84 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_84 \
    op interface \
    ports { temp_load_84 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1113 \
    name temp_load_85 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_85 \
    op interface \
    ports { temp_load_85 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1114 \
    name temp_load_86 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_86 \
    op interface \
    ports { temp_load_86 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1115 \
    name temp_load_87 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_87 \
    op interface \
    ports { temp_load_87 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1116 \
    name temp_load_88 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_88 \
    op interface \
    ports { temp_load_88 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1117 \
    name temp_load_89 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_89 \
    op interface \
    ports { temp_load_89 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1118 \
    name temp_load_90 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_90 \
    op interface \
    ports { temp_load_90 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1119 \
    name temp_load_91 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_91 \
    op interface \
    ports { temp_load_91 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1120 \
    name temp_load_92 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_92 \
    op interface \
    ports { temp_load_92 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1121 \
    name temp_load_93 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_93 \
    op interface \
    ports { temp_load_93 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1122 \
    name temp_load_94 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_94 \
    op interface \
    ports { temp_load_94 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1123 \
    name temp_load_95 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_95 \
    op interface \
    ports { temp_load_95 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1124 \
    name temp_load_96 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_96 \
    op interface \
    ports { temp_load_96 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1125 \
    name temp_load_97 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_97 \
    op interface \
    ports { temp_load_97 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1126 \
    name temp_load_98 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_98 \
    op interface \
    ports { temp_load_98 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1127 \
    name temp_load_99 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_99 \
    op interface \
    ports { temp_load_99 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1128 \
    name temp_load_100 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_100 \
    op interface \
    ports { temp_load_100 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1129 \
    name temp_load_101 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_101 \
    op interface \
    ports { temp_load_101 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1130 \
    name temp_load_102 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_102 \
    op interface \
    ports { temp_load_102 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1131 \
    name temp_load_103 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_103 \
    op interface \
    ports { temp_load_103 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1132 \
    name temp_load_104 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_104 \
    op interface \
    ports { temp_load_104 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1133 \
    name temp_load_105 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_105 \
    op interface \
    ports { temp_load_105 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1134 \
    name temp_load_106 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_106 \
    op interface \
    ports { temp_load_106 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1135 \
    name temp_load_107 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_107 \
    op interface \
    ports { temp_load_107 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1136 \
    name temp_load_108 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_108 \
    op interface \
    ports { temp_load_108 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1137 \
    name temp_load_109 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_109 \
    op interface \
    ports { temp_load_109 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1138 \
    name temp_load_110 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_110 \
    op interface \
    ports { temp_load_110 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1139 \
    name temp_load_111 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_111 \
    op interface \
    ports { temp_load_111 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1140 \
    name temp_load_112 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_112 \
    op interface \
    ports { temp_load_112 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1141 \
    name temp_load_113 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_113 \
    op interface \
    ports { temp_load_113 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1142 \
    name temp_load_114 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_114 \
    op interface \
    ports { temp_load_114 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1143 \
    name temp_load_115 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_115 \
    op interface \
    ports { temp_load_115 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1144 \
    name temp_load_116 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_116 \
    op interface \
    ports { temp_load_116 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1145 \
    name temp_load_117 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_117 \
    op interface \
    ports { temp_load_117 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1146 \
    name temp_load_118 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_118 \
    op interface \
    ports { temp_load_118 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1147 \
    name temp_load_119 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_119 \
    op interface \
    ports { temp_load_119 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1148 \
    name temp_load_120 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_120 \
    op interface \
    ports { temp_load_120 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1149 \
    name temp_load_121 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_121 \
    op interface \
    ports { temp_load_121 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1150 \
    name temp_load_122 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_122 \
    op interface \
    ports { temp_load_122 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1151 \
    name temp_load_123 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_123 \
    op interface \
    ports { temp_load_123 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1152 \
    name temp_load_124 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_124 \
    op interface \
    ports { temp_load_124 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1153 \
    name temp_load_125 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_125 \
    op interface \
    ports { temp_load_125 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1154 \
    name temp_load_126 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_126 \
    op interface \
    ports { temp_load_126 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1155 \
    name temp_load_127 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_127 \
    op interface \
    ports { temp_load_127 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1156 \
    name temp_load_128 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_128 \
    op interface \
    ports { temp_load_128 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1157 \
    name temp_load_129 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_129 \
    op interface \
    ports { temp_load_129 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1158 \
    name temp_load_130 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_130 \
    op interface \
    ports { temp_load_130 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1159 \
    name temp_load_131 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_131 \
    op interface \
    ports { temp_load_131 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1160 \
    name temp_load_132 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_132 \
    op interface \
    ports { temp_load_132 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1161 \
    name temp_load_133 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_133 \
    op interface \
    ports { temp_load_133 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1162 \
    name temp_load_134 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_134 \
    op interface \
    ports { temp_load_134 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1163 \
    name temp_load_135 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_135 \
    op interface \
    ports { temp_load_135 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1164 \
    name temp_load_136 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_136 \
    op interface \
    ports { temp_load_136 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1165 \
    name temp_load_137 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_137 \
    op interface \
    ports { temp_load_137 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1166 \
    name temp_load_138 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_138 \
    op interface \
    ports { temp_load_138 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1167 \
    name temp_load_139 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_139 \
    op interface \
    ports { temp_load_139 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1168 \
    name temp_load_140 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_140 \
    op interface \
    ports { temp_load_140 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1169 \
    name temp_load_141 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_141 \
    op interface \
    ports { temp_load_141 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1170 \
    name temp_load_142 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_142 \
    op interface \
    ports { temp_load_142 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1171 \
    name temp_load_143 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_143 \
    op interface \
    ports { temp_load_143 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1172 \
    name temp_load_144 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_144 \
    op interface \
    ports { temp_load_144 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1173 \
    name temp_load_145 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_145 \
    op interface \
    ports { temp_load_145 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1174 \
    name temp_load_146 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_146 \
    op interface \
    ports { temp_load_146 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1175 \
    name temp_load_147 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_147 \
    op interface \
    ports { temp_load_147 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1176 \
    name temp_load_148 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_148 \
    op interface \
    ports { temp_load_148 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1177 \
    name temp_load_149 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_149 \
    op interface \
    ports { temp_load_149 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1178 \
    name temp_load_150 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_150 \
    op interface \
    ports { temp_load_150 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1179 \
    name temp_load_151 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_151 \
    op interface \
    ports { temp_load_151 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1180 \
    name temp_load_152 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_152 \
    op interface \
    ports { temp_load_152 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1181 \
    name temp_load_153 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_153 \
    op interface \
    ports { temp_load_153 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1182 \
    name temp_load_154 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_154 \
    op interface \
    ports { temp_load_154 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1183 \
    name temp_load_155 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_155 \
    op interface \
    ports { temp_load_155 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1184 \
    name temp_load_156 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_156 \
    op interface \
    ports { temp_load_156 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1185 \
    name temp_load_157 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_157 \
    op interface \
    ports { temp_load_157 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1186 \
    name temp_load_158 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_158 \
    op interface \
    ports { temp_load_158 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1187 \
    name temp_load_159 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_159 \
    op interface \
    ports { temp_load_159 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1188 \
    name temp_load_160 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_160 \
    op interface \
    ports { temp_load_160 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1189 \
    name temp_load_161 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_161 \
    op interface \
    ports { temp_load_161 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1190 \
    name temp_load_162 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_162 \
    op interface \
    ports { temp_load_162 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1191 \
    name temp_load_163 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_163 \
    op interface \
    ports { temp_load_163 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1192 \
    name temp_load_164 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_164 \
    op interface \
    ports { temp_load_164 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1193 \
    name temp_load_165 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_165 \
    op interface \
    ports { temp_load_165 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1194 \
    name temp_load_166 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_166 \
    op interface \
    ports { temp_load_166 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1195 \
    name temp_load_167 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_167 \
    op interface \
    ports { temp_load_167 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1196 \
    name temp_load_168 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_168 \
    op interface \
    ports { temp_load_168 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1197 \
    name temp_load_169 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_169 \
    op interface \
    ports { temp_load_169 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1198 \
    name temp_load_170 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_170 \
    op interface \
    ports { temp_load_170 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1199 \
    name temp_load_171 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_171 \
    op interface \
    ports { temp_load_171 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1200 \
    name temp_load_172 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_172 \
    op interface \
    ports { temp_load_172 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1201 \
    name temp_load_173 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_173 \
    op interface \
    ports { temp_load_173 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1202 \
    name temp_load_174 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_174 \
    op interface \
    ports { temp_load_174 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1203 \
    name temp_load_175 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_175 \
    op interface \
    ports { temp_load_175 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1204 \
    name temp_load_176 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_176 \
    op interface \
    ports { temp_load_176 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1205 \
    name temp_load_177 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_177 \
    op interface \
    ports { temp_load_177 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1206 \
    name temp_load_178 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_178 \
    op interface \
    ports { temp_load_178 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1207 \
    name temp_load_179 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_179 \
    op interface \
    ports { temp_load_179 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1208 \
    name temp_load_180 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_180 \
    op interface \
    ports { temp_load_180 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1209 \
    name temp_load_181 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_181 \
    op interface \
    ports { temp_load_181 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1210 \
    name temp_load_182 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_182 \
    op interface \
    ports { temp_load_182 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1211 \
    name temp_load_183 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_183 \
    op interface \
    ports { temp_load_183 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1212 \
    name temp_load_184 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_184 \
    op interface \
    ports { temp_load_184 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1213 \
    name temp_load_185 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_185 \
    op interface \
    ports { temp_load_185 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1214 \
    name temp_load_186 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_186 \
    op interface \
    ports { temp_load_186 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1215 \
    name temp_load_187 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_187 \
    op interface \
    ports { temp_load_187 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1216 \
    name temp_load_188 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_188 \
    op interface \
    ports { temp_load_188 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1217 \
    name temp_load_189 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_189 \
    op interface \
    ports { temp_load_189 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1218 \
    name temp_load_190 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_190 \
    op interface \
    ports { temp_load_190 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1219 \
    name temp_load_191 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_191 \
    op interface \
    ports { temp_load_191 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1220 \
    name temp_load_192 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_192 \
    op interface \
    ports { temp_load_192 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1221 \
    name temp_load_193 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_193 \
    op interface \
    ports { temp_load_193 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1222 \
    name temp_load_194 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_194 \
    op interface \
    ports { temp_load_194 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1223 \
    name temp_load_195 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_195 \
    op interface \
    ports { temp_load_195 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1224 \
    name temp_load_196 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_196 \
    op interface \
    ports { temp_load_196 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1225 \
    name temp_load_197 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_197 \
    op interface \
    ports { temp_load_197 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1226 \
    name temp_load_198 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_198 \
    op interface \
    ports { temp_load_198 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1227 \
    name temp_load_199 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_199 \
    op interface \
    ports { temp_load_199 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1228 \
    name temp_load_200 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_200 \
    op interface \
    ports { temp_load_200 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1229 \
    name temp_load_201 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_201 \
    op interface \
    ports { temp_load_201 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1230 \
    name temp_load_202 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_202 \
    op interface \
    ports { temp_load_202 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1231 \
    name temp_load_203 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_203 \
    op interface \
    ports { temp_load_203 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1232 \
    name temp_load_204 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_204 \
    op interface \
    ports { temp_load_204 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1233 \
    name temp_load_205 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_205 \
    op interface \
    ports { temp_load_205 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1234 \
    name temp_load_206 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_206 \
    op interface \
    ports { temp_load_206 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1235 \
    name temp_load_207 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_207 \
    op interface \
    ports { temp_load_207 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1236 \
    name temp_load_208 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_208 \
    op interface \
    ports { temp_load_208 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1237 \
    name temp_load_209 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_209 \
    op interface \
    ports { temp_load_209 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1238 \
    name temp_load_210 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_210 \
    op interface \
    ports { temp_load_210 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1239 \
    name temp_load_211 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_211 \
    op interface \
    ports { temp_load_211 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1240 \
    name temp_load_212 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_212 \
    op interface \
    ports { temp_load_212 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1241 \
    name temp_load_213 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_213 \
    op interface \
    ports { temp_load_213 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1242 \
    name temp_load_214 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_214 \
    op interface \
    ports { temp_load_214 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1243 \
    name temp_load_215 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_215 \
    op interface \
    ports { temp_load_215 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1244 \
    name temp_load_216 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_216 \
    op interface \
    ports { temp_load_216 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1245 \
    name temp_load_217 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_217 \
    op interface \
    ports { temp_load_217 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1246 \
    name temp_load_218 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_218 \
    op interface \
    ports { temp_load_218 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1247 \
    name temp_load_219 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_219 \
    op interface \
    ports { temp_load_219 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1248 \
    name temp_load_220 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_220 \
    op interface \
    ports { temp_load_220 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1249 \
    name temp_load_221 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_221 \
    op interface \
    ports { temp_load_221 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1250 \
    name temp_load_222 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_222 \
    op interface \
    ports { temp_load_222 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1251 \
    name temp_load_223 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_223 \
    op interface \
    ports { temp_load_223 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1252 \
    name temp_load_224 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_224 \
    op interface \
    ports { temp_load_224 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1253 \
    name temp_load_225 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_225 \
    op interface \
    ports { temp_load_225 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1254 \
    name temp_load_226 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_226 \
    op interface \
    ports { temp_load_226 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1255 \
    name temp_load_227 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_227 \
    op interface \
    ports { temp_load_227 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1256 \
    name temp_load_228 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_228 \
    op interface \
    ports { temp_load_228 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1257 \
    name temp_load_229 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_229 \
    op interface \
    ports { temp_load_229 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1258 \
    name temp_load_230 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_230 \
    op interface \
    ports { temp_load_230 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1259 \
    name temp_load_231 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_231 \
    op interface \
    ports { temp_load_231 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1260 \
    name temp_load_232 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_232 \
    op interface \
    ports { temp_load_232 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1261 \
    name temp_load_233 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_233 \
    op interface \
    ports { temp_load_233 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1262 \
    name temp_load_234 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_234 \
    op interface \
    ports { temp_load_234 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1263 \
    name temp_load_235 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_235 \
    op interface \
    ports { temp_load_235 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1264 \
    name temp_load_236 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_236 \
    op interface \
    ports { temp_load_236 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1265 \
    name temp_load_237 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_237 \
    op interface \
    ports { temp_load_237 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1266 \
    name temp_load_238 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_238 \
    op interface \
    ports { temp_load_238 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1267 \
    name temp_load_239 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_239 \
    op interface \
    ports { temp_load_239 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1268 \
    name temp_load_240 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_240 \
    op interface \
    ports { temp_load_240 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1269 \
    name temp_load_241 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_241 \
    op interface \
    ports { temp_load_241 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1270 \
    name temp_load_242 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_242 \
    op interface \
    ports { temp_load_242 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1271 \
    name temp_load_243 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_243 \
    op interface \
    ports { temp_load_243 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1272 \
    name temp_load_244 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_244 \
    op interface \
    ports { temp_load_244 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1273 \
    name temp_load_245 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_245 \
    op interface \
    ports { temp_load_245 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1274 \
    name temp_load_246 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_246 \
    op interface \
    ports { temp_load_246 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1275 \
    name temp_load_247 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_247 \
    op interface \
    ports { temp_load_247 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1276 \
    name temp_load_248 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_248 \
    op interface \
    ports { temp_load_248 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1277 \
    name temp_load_249 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_249 \
    op interface \
    ports { temp_load_249 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1278 \
    name temp_load_250 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_250 \
    op interface \
    ports { temp_load_250 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1279 \
    name temp_load_251 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_251 \
    op interface \
    ports { temp_load_251 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1280 \
    name temp_load_252 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_252 \
    op interface \
    ports { temp_load_252 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1281 \
    name temp_load_253 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_253 \
    op interface \
    ports { temp_load_253 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1282 \
    name temp_load_254 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_254 \
    op interface \
    ports { temp_load_254 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1283 \
    name temp_load_255 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_temp_load_255 \
    op interface \
    ports { temp_load_255 { I 32 vector } } \
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


