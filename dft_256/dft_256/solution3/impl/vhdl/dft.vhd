-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dft is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    real_sample_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    real_sample_ce0 : OUT STD_LOGIC;
    real_sample_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    imag_sample_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    imag_sample_ce0 : OUT STD_LOGIC;
    imag_sample_we0 : OUT STD_LOGIC;
    imag_sample_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    imag_sample_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    imag_sample_address1 : OUT STD_LOGIC_VECTOR (7 downto 0);
    imag_sample_ce1 : OUT STD_LOGIC;
    imag_sample_we1 : OUT STD_LOGIC;
    imag_sample_d1 : OUT STD_LOGIC_VECTOR (31 downto 0);
    imag_sample_q1 : IN STD_LOGIC_VECTOR (31 downto 0);
    real_output_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    real_output_ce0 : OUT STD_LOGIC;
    real_output_we0 : OUT STD_LOGIC;
    real_output_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    real_output_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    imag_output_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    imag_output_ce0 : OUT STD_LOGIC;
    imag_output_we0 : OUT STD_LOGIC;
    imag_output_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    imag_output_q0 : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of dft is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "dft_dft,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.256000,HLS_SYN_LAT=331268,HLS_SYN_TPT=none,HLS_SYN_MEM=3,HLS_SYN_DSP=0,HLS_SYN_FF=1016,HLS_SYN_LUT=1295,HLS_VERSION=2022_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (5 downto 0) := "000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (5 downto 0) := "000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (5 downto 0) := "001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (5 downto 0) := "010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (5 downto 0) := "100000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv9_100 : STD_LOGIC_VECTOR (8 downto 0) := "100000000";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal trunc_ln18_fu_137_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln18_reg_164 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal icmp_ln15_fu_119_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal real_output_load_reg_180 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal imag_output_load_reg_185 : STD_LOGIC_VECTOR (31 downto 0);
    signal bitcast_ln19_fu_146_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bitcast_ln19_reg_190 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal bitcast_ln20_fu_150_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bitcast_ln20_reg_195 : STD_LOGIC_VECTOR (31 downto 0);
    signal temp_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal temp_ce0 : STD_LOGIC;
    signal temp_we0 : STD_LOGIC;
    signal temp_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_start : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_done : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_idle : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_ready : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_real_sample_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_real_sample_ce0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_ce0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_we0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_start : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_done : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_idle : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_ready : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_ce0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_we0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_ce0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_we0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_temp_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_temp_ce0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal zext_ln15_fu_131_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal k_fu_52 : STD_LOGIC_VECTOR (8 downto 0);
    signal add_ln15_fu_125_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component dft_dft_Pipeline_VITIS_LOOP_11_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        real_sample_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
        real_sample_ce0 : OUT STD_LOGIC;
        real_sample_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        temp_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
        temp_ce0 : OUT STD_LOGIC;
        temp_we0 : OUT STD_LOGIC;
        temp_d0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component dft_dft_Pipeline_VITIS_LOOP_17_3 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        bitcast_ln20 : IN STD_LOGIC_VECTOR (31 downto 0);
        bitcast_ln19 : IN STD_LOGIC_VECTOR (31 downto 0);
        imag_output_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
        imag_output_ce0 : OUT STD_LOGIC;
        imag_output_we0 : OUT STD_LOGIC;
        imag_output_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        zext_ln15 : IN STD_LOGIC_VECTOR (7 downto 0);
        real_output_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
        real_output_ce0 : OUT STD_LOGIC;
        real_output_we0 : OUT STD_LOGIC;
        real_output_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        trunc_ln : IN STD_LOGIC_VECTOR (7 downto 0);
        temp_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
        temp_ce0 : OUT STD_LOGIC;
        temp_q0 : IN STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component dft_temp_RAM_AUTO_1R1W IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (7 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (31 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    temp_U : component dft_temp_RAM_AUTO_1R1W
    generic map (
        DataWidth => 32,
        AddressRange => 256,
        AddressWidth => 8)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => temp_address0,
        ce0 => temp_ce0,
        we0 => temp_we0,
        d0 => grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_d0,
        q0 => temp_q0);

    grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86 : component dft_dft_Pipeline_VITIS_LOOP_11_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_start,
        ap_done => grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_done,
        ap_idle => grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_idle,
        ap_ready => grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_ready,
        real_sample_address0 => grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_real_sample_address0,
        real_sample_ce0 => grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_real_sample_ce0,
        real_sample_q0 => real_sample_q0,
        temp_address0 => grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_address0,
        temp_ce0 => grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_ce0,
        temp_we0 => grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_we0,
        temp_d0 => grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_d0);

    grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94 : component dft_dft_Pipeline_VITIS_LOOP_17_3
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_start,
        ap_done => grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_done,
        ap_idle => grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_idle,
        ap_ready => grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_ready,
        bitcast_ln20 => bitcast_ln20_reg_195,
        bitcast_ln19 => bitcast_ln19_reg_190,
        imag_output_address0 => grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_address0,
        imag_output_ce0 => grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_ce0,
        imag_output_we0 => grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_we0,
        imag_output_d0 => grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_d0,
        zext_ln15 => trunc_ln18_reg_164,
        real_output_address0 => grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_address0,
        real_output_ce0 => grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_ce0,
        real_output_we0 => grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_we0,
        real_output_d0 => grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_d0,
        trunc_ln => trunc_ln18_reg_164,
        temp_address0 => grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_temp_address0,
        temp_ce0 => grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_temp_ce0,
        temp_q0 => temp_q0);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_ready = ap_const_logic_1)) then 
                    grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                    grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_ready = ap_const_logic_1)) then 
                    grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    k_fu_52_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                k_fu_52 <= ap_const_lv9_0;
            elsif (((icmp_ln15_fu_119_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                k_fu_52 <= add_ln15_fu_125_p2;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then
                bitcast_ln19_reg_190 <= bitcast_ln19_fu_146_p1;
                bitcast_ln20_reg_195 <= bitcast_ln20_fu_150_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                imag_output_load_reg_185 <= imag_output_q0;
                real_output_load_reg_180 <= real_output_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln15_fu_119_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                trunc_ln18_reg_164 <= trunc_ln18_fu_137_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state3, icmp_ln15_fu_119_p2, grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_done, grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_done, ap_CS_fsm_state2, ap_CS_fsm_state6)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_done = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if (((icmp_ln15_fu_119_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state6) and (grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_done = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXX";
        end case;
    end process;
    add_ln15_fu_125_p2 <= std_logic_vector(unsigned(k_fu_52) + unsigned(ap_const_lv9_1));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_done)
    begin
        if ((grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;
    ap_ST_fsm_state5_blk <= ap_const_logic_0;

    ap_ST_fsm_state6_blk_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_done)
    begin
        if ((grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state6_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state6_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_state3, icmp_ln15_fu_119_p2)
    begin
        if (((icmp_ln15_fu_119_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state3, icmp_ln15_fu_119_p2)
    begin
        if (((icmp_ln15_fu_119_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    bitcast_ln19_fu_146_p1 <= real_output_load_reg_180;
    bitcast_ln20_fu_150_p1 <= imag_output_load_reg_185;
    grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_start <= grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_start_reg;
    grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_start <= grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_start_reg;
    icmp_ln15_fu_119_p2 <= "1" when (k_fu_52 = ap_const_lv9_100) else "0";

    imag_output_address0_assign_proc : process(ap_CS_fsm_state3, grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_address0, ap_CS_fsm_state6, zext_ln15_fu_131_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            imag_output_address0 <= zext_ln15_fu_131_p1(8 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            imag_output_address0 <= grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_address0;
        else 
            imag_output_address0 <= "XXXXXXXX";
        end if; 
    end process;


    imag_output_ce0_assign_proc : process(ap_CS_fsm_state3, grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_ce0, ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            imag_output_ce0 <= ap_const_logic_1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            imag_output_ce0 <= grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_ce0;
        else 
            imag_output_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    imag_output_d0 <= grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_d0;

    imag_output_we0_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_we0, ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            imag_output_we0 <= grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_we0;
        else 
            imag_output_we0 <= ap_const_logic_0;
        end if; 
    end process;

    imag_sample_address0 <= ap_const_lv8_0;
    imag_sample_address1 <= ap_const_lv8_0;
    imag_sample_ce0 <= ap_const_logic_0;
    imag_sample_ce1 <= ap_const_logic_0;
    imag_sample_d0 <= ap_const_lv32_0;
    imag_sample_d1 <= ap_const_lv32_0;
    imag_sample_we0 <= ap_const_logic_0;
    imag_sample_we1 <= ap_const_logic_0;

    real_output_address0_assign_proc : process(ap_CS_fsm_state3, grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_address0, ap_CS_fsm_state6, zext_ln15_fu_131_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            real_output_address0 <= zext_ln15_fu_131_p1(8 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            real_output_address0 <= grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_address0;
        else 
            real_output_address0 <= "XXXXXXXX";
        end if; 
    end process;


    real_output_ce0_assign_proc : process(ap_CS_fsm_state3, grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_ce0, ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            real_output_ce0 <= ap_const_logic_1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            real_output_ce0 <= grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_ce0;
        else 
            real_output_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    real_output_d0 <= grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_d0;

    real_output_we0_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_we0, ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            real_output_we0 <= grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_we0;
        else 
            real_output_we0 <= ap_const_logic_0;
        end if; 
    end process;

    real_sample_address0 <= grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_real_sample_address0;
    real_sample_ce0 <= grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_real_sample_ce0;

    temp_address0_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_address0, grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_temp_address0, ap_CS_fsm_state2, ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            temp_address0 <= grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_temp_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            temp_address0 <= grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_address0;
        else 
            temp_address0 <= "XXXXXXXX";
        end if; 
    end process;


    temp_ce0_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_ce0, grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_temp_ce0, ap_CS_fsm_state2, ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            temp_ce0 <= grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_temp_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            temp_ce0 <= grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_ce0;
        else 
            temp_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    temp_we0_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_we0, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            temp_we0 <= grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_we0;
        else 
            temp_we0 <= ap_const_logic_0;
        end if; 
    end process;

    trunc_ln18_fu_137_p1 <= k_fu_52(8 - 1 downto 0);
    zext_ln15_fu_131_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(k_fu_52),64));
end behav;
