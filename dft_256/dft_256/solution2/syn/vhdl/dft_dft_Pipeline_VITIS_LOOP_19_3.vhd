-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dft_dft_Pipeline_VITIS_LOOP_19_3 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    sum_i_load : IN STD_LOGIC_VECTOR (31 downto 0);
    sum_r_load : IN STD_LOGIC_VECTOR (31 downto 0);
    sum_i_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    sum_i_ce0 : OUT STD_LOGIC;
    sum_i_we0 : OUT STD_LOGIC;
    sum_i_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    zext_ln17 : IN STD_LOGIC_VECTOR (7 downto 0);
    sum_r_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    sum_r_ce0 : OUT STD_LOGIC;
    sum_r_we0 : OUT STD_LOGIC;
    sum_r_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    trunc_ln : IN STD_LOGIC_VECTOR (7 downto 0);
    temp_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    temp_ce0 : OUT STD_LOGIC;
    temp_q0 : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of dft_dft_Pipeline_VITIS_LOOP_19_3 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_ST_fsm_pp0_stage1 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_ST_fsm_pp0_stage2 : STD_LOGIC_VECTOR (4 downto 0) := "00100";
    constant ap_ST_fsm_pp0_stage3 : STD_LOGIC_VECTOR (4 downto 0) := "01000";
    constant ap_ST_fsm_pp0_stage4 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv9_100 : STD_LOGIC_VECTOR (8 downto 0) := "100000000";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage4 : signal is "none";
    signal ap_block_state5_pp0_stage4_iter0 : BOOLEAN;
    signal ap_block_state10_pp0_stage4_iter1 : BOOLEAN;
    signal ap_block_pp0_stage4_subdone : BOOLEAN;
    signal icmp_ln19_reg_300 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage4 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal cos_coefficients_table_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal cos_coefficients_table_ce0 : STD_LOGIC;
    signal cos_coefficients_table_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal sin_coefficients_table_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sin_coefficients_table_ce0 : STD_LOGIC;
    signal sin_coefficients_table_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_153_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal reg_161 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state6_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state11_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal ap_CS_fsm_pp0_stage1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage1 : signal is "none";
    signal ap_block_state2_pp0_stage1_iter0 : BOOLEAN;
    signal ap_block_state7_pp0_stage1_iter1 : BOOLEAN;
    signal ap_block_state12_pp0_stage1_iter2 : BOOLEAN;
    signal ap_block_pp0_stage1_11001 : BOOLEAN;
    signal sum_i_addr_reg_290 : STD_LOGIC_VECTOR (7 downto 0);
    signal sum_i_addr_reg_290_pp0_iter1_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal sum_i_addr_reg_290_pp0_iter2_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal sum_r_addr_reg_295 : STD_LOGIC_VECTOR (7 downto 0);
    signal sum_r_addr_reg_295_pp0_iter1_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal sum_r_addr_reg_295_pp0_iter2_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal icmp_ln19_fu_196_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln19_reg_300_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal ifzero_fu_228_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ifzero_reg_319 : STD_LOGIC_VECTOR (0 downto 0);
    signal ifzero_reg_319_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal ifzero_reg_319_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal temp_load_reg_323 : STD_LOGIC_VECTOR (31 downto 0);
    signal cos_coefficients_table_load_reg_328 : STD_LOGIC_VECTOR (31 downto 0);
    signal sin_coefficients_table_load_reg_333 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_157_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_reg_338 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul1_reg_348 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_pp0_stage2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage2 : signal is "none";
    signal ap_block_state3_pp0_stage2_iter0 : BOOLEAN;
    signal ap_block_state8_pp0_stage2_iter1 : BOOLEAN;
    signal ap_block_state13_pp0_stage2_iter2 : BOOLEAN;
    signal ap_block_pp0_stage2_11001 : BOOLEAN;
    signal ap_enable_reg_pp0_iter0_reg : STD_LOGIC := '0';
    signal ap_block_pp0_stage2_subdone : BOOLEAN;
    signal zext_ln17_cast_fu_167_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal n_2_cast2_fu_211_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln21_fu_222_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal index_fu_50 : STD_LOGIC_VECTOR (7 downto 0);
    signal add_ln20_fu_216_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_index_load : STD_LOGIC_VECTOR (7 downto 0);
    signal add5_fu_54 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_sig_allocacmp_add5_load : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage1 : BOOLEAN;
    signal add276_fu_58 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_sig_allocacmp_add276_load : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage2 : BOOLEAN;
    signal n_fu_62 : STD_LOGIC_VECTOR (8 downto 0);
    signal add_ln19_fu_202_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_sig_allocacmp_n_2 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_fu_153_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_153_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_157_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_pp0_stage3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage3 : signal is "none";
    signal ap_block_pp0_stage3 : BOOLEAN;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_block_pp0_stage4_11001 : BOOLEAN;
    signal ap_condition_exit_pp0_iter1_stage2 : STD_LOGIC;
    signal ap_idle_pp0_0to0 : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_idle_pp0_1to2 : STD_LOGIC;
    signal ap_block_pp0_stage1_subdone : BOOLEAN;
    signal ap_block_state4_pp0_stage3_iter0 : BOOLEAN;
    signal ap_block_state9_pp0_stage3_iter1 : BOOLEAN;
    signal ap_block_pp0_stage3_subdone : BOOLEAN;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component dft_fadd_32ns_32ns_32_5_full_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component dft_fmul_32ns_32ns_32_4_max_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component dft_dft_Pipeline_VITIS_LOOP_19_3_cos_coefficients_table_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (7 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component dft_dft_Pipeline_VITIS_LOOP_19_3_sin_coefficients_table_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (7 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component dft_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    cos_coefficients_table_U : component dft_dft_Pipeline_VITIS_LOOP_19_3_cos_coefficients_table_ROM_AUTO_1R
    generic map (
        DataWidth => 32,
        AddressRange => 256,
        AddressWidth => 8)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => cos_coefficients_table_address0,
        ce0 => cos_coefficients_table_ce0,
        q0 => cos_coefficients_table_q0);

    sin_coefficients_table_U : component dft_dft_Pipeline_VITIS_LOOP_19_3_sin_coefficients_table_ROM_AUTO_1R
    generic map (
        DataWidth => 32,
        AddressRange => 256,
        AddressWidth => 8)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => sin_coefficients_table_address0,
        ce0 => sin_coefficients_table_ce0,
        q0 => sin_coefficients_table_q0);

    fadd_32ns_32ns_32_5_full_dsp_1_U5 : component dft_fadd_32ns_32ns_32_5_full_dsp_1
    generic map (
        ID => 1,
        NUM_STAGE => 5,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_153_p0,
        din1 => grp_fu_153_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_153_p2);

    fmul_32ns_32ns_32_4_max_dsp_1_U6 : component dft_fmul_32ns_32ns_32_4_max_dsp_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => temp_load_reg_323,
        din1 => grp_fu_157_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_157_p2);

    flow_control_loop_pipe_sequential_init_U : component dft_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage4,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage2_subdone) and (ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then 
                    ap_enable_reg_pp0_iter0_reg <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage4)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage4_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage4))) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage2_subdone) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
                    ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage4_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage4))) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    add276_fu_58_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                add276_fu_58 <= sum_i_load;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
                add276_fu_58 <= reg_161;
            end if; 
        end if;
    end process;

    add5_fu_54_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                add5_fu_54 <= sum_r_load;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                add5_fu_54 <= reg_161;
            end if; 
        end if;
    end process;

    ap_loop_exit_ready_pp0_iter1_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_idle_pp0_0to0 = ap_const_logic_1) and (ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage2))) then 
                ap_loop_exit_ready_pp0_iter1_reg <= ap_const_logic_0;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage4_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage4))) then 
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
            end if; 
        end if;
    end process;

    index_fu_50_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (icmp_ln19_fu_196_p2 = ap_const_lv1_0))) then 
                    index_fu_50 <= add_ln20_fu_216_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    index_fu_50 <= ap_const_lv8_0;
                end if;
            end if; 
        end if;
    end process;

    n_fu_62_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (icmp_ln19_fu_196_p2 = ap_const_lv1_0))) then 
                    n_fu_62 <= add_ln19_fu_202_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    n_fu_62 <= ap_const_lv9_0;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln19_reg_300 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                cos_coefficients_table_load_reg_328 <= cos_coefficients_table_q0;
                sin_coefficients_table_load_reg_333 <= sin_coefficients_table_q0;
                temp_load_reg_323 <= temp_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln19_reg_300 <= icmp_ln19_fu_196_p2;
                icmp_ln19_reg_300_pp0_iter1_reg <= icmp_ln19_reg_300;
                ifzero_reg_319_pp0_iter1_reg <= ifzero_reg_319;
                ifzero_reg_319_pp0_iter2_reg <= ifzero_reg_319_pp0_iter1_reg;
                sum_i_addr_reg_290 <= zext_ln17_cast_fu_167_p1(8 - 1 downto 0);
                sum_i_addr_reg_290_pp0_iter1_reg <= sum_i_addr_reg_290;
                sum_i_addr_reg_290_pp0_iter2_reg <= sum_i_addr_reg_290_pp0_iter1_reg;
                sum_r_addr_reg_295 <= zext_ln17_cast_fu_167_p1(8 - 1 downto 0);
                sum_r_addr_reg_295_pp0_iter1_reg <= sum_r_addr_reg_295;
                sum_r_addr_reg_295_pp0_iter2_reg <= sum_r_addr_reg_295_pp0_iter1_reg;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln19_fu_196_p2 = ap_const_lv1_0))) then
                ifzero_reg_319 <= ifzero_fu_228_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                mul1_reg_348 <= grp_fu_157_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                mul_reg_338 <= grp_fu_157_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then
                reg_161 <= grp_fu_153_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_block_pp0_stage4_subdone, ap_block_pp0_stage2_subdone, ap_condition_exit_pp0_iter1_stage2, ap_idle_pp0_0to0, ap_block_pp0_stage0_subdone, ap_idle_pp0_1to2, ap_block_pp0_stage1_subdone, ap_block_pp0_stage3_subdone, ap_start_int)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((ap_start_int = ap_const_logic_0) and (ap_idle_pp0_1to2 = ap_const_logic_1))) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage1 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage1_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage2;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                end if;
            when ap_ST_fsm_pp0_stage2 => 
                if (((ap_idle_pp0_0to0 = ap_const_logic_1) and (ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage2))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage2_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage3;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage2;
                end if;
            when ap_ST_fsm_pp0_stage3 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage3_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage4;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage3;
                end if;
            when ap_ST_fsm_pp0_stage4 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage4_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage4;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXX";
        end case;
    end process;
    add_ln19_fu_202_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_n_2) + unsigned(ap_const_lv9_1));
    add_ln20_fu_216_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_index_load) + unsigned(trunc_ln));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
    ap_CS_fsm_pp0_stage1 <= ap_CS_fsm(1);
    ap_CS_fsm_pp0_stage2 <= ap_CS_fsm(2);
    ap_CS_fsm_pp0_stage3 <= ap_CS_fsm(3);
    ap_CS_fsm_pp0_stage4 <= ap_CS_fsm(4);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage2_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage2_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage3 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage3_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage4_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage4_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state10_pp0_stage4_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state11_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state12_pp0_stage1_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state13_pp0_stage2_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage1_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage2_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage3_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage4_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state6_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state7_pp0_stage1_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state8_pp0_stage2_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state9_pp0_stage3_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage4_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage4, ap_block_pp0_stage4_subdone, icmp_ln19_reg_300)
    begin
        if (((icmp_ln19_reg_300 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage4_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage4))) then 
            ap_condition_exit_pp0_iter0_stage4 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage4 <= ap_const_logic_0;
        end if; 
    end process;


    ap_condition_exit_pp0_iter1_stage2_assign_proc : process(ap_enable_reg_pp0_iter1, icmp_ln19_reg_300_pp0_iter1_reg, ap_CS_fsm_pp0_stage2, ap_block_pp0_stage2_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage2_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2) and (icmp_ln19_reg_300_pp0_iter1_reg = ap_const_lv1_1))) then 
            ap_condition_exit_pp0_iter1_stage2 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter1_stage2 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage2, ap_block_pp0_stage2_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter1_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage2_subdone) and (ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_enable_reg_pp0_iter0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0_reg, ap_start_int)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then 
            ap_enable_reg_pp0_iter0 <= ap_start_int;
        else 
            ap_enable_reg_pp0_iter0 <= ap_enable_reg_pp0_iter0_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_0to0_assign_proc : process(ap_enable_reg_pp0_iter0)
    begin
        if ((ap_enable_reg_pp0_iter0 = ap_const_logic_0)) then 
            ap_idle_pp0_0to0 <= ap_const_logic_1;
        else 
            ap_idle_pp0_0to0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_1to2_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0_1to2 <= ap_const_logic_1;
        else 
            ap_idle_pp0_1to2 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage4;

    ap_ready_int_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage4, ap_block_pp0_stage4_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage4_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage4))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_add276_load_assign_proc : process(ap_enable_reg_pp0_iter2, reg_161, ap_CS_fsm_pp0_stage2, add276_fu_58, ap_block_pp0_stage2)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage2) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
            ap_sig_allocacmp_add276_load <= reg_161;
        else 
            ap_sig_allocacmp_add276_load <= add276_fu_58;
        end if; 
    end process;


    ap_sig_allocacmp_add5_load_assign_proc : process(ap_enable_reg_pp0_iter2, reg_161, ap_CS_fsm_pp0_stage1, add5_fu_54, ap_block_pp0_stage1)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            ap_sig_allocacmp_add5_load <= reg_161;
        else 
            ap_sig_allocacmp_add5_load <= add5_fu_54;
        end if; 
    end process;


    ap_sig_allocacmp_index_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, index_fu_50, ap_loop_init)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_sig_allocacmp_index_load <= ap_const_lv8_0;
        else 
            ap_sig_allocacmp_index_load <= index_fu_50;
        end if; 
    end process;


    ap_sig_allocacmp_n_2_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, n_fu_62)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_sig_allocacmp_n_2 <= ap_const_lv9_0;
        else 
            ap_sig_allocacmp_n_2 <= n_fu_62;
        end if; 
    end process;

    cos_coefficients_table_address0 <= zext_ln21_fu_222_p1(8 - 1 downto 0);

    cos_coefficients_table_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            cos_coefficients_table_ce0 <= ap_const_logic_1;
        else 
            cos_coefficients_table_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    grp_fu_153_p0_assign_proc : process(ap_enable_reg_pp0_iter1, ap_CS_fsm_pp0_stage1, ap_CS_fsm_pp0_stage2, ap_sig_allocacmp_add5_load, ap_block_pp0_stage1, ap_sig_allocacmp_add276_load, ap_block_pp0_stage2)
    begin
        if ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then
            if (((ap_const_boolean_0 = ap_block_pp0_stage2) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
                grp_fu_153_p0 <= ap_sig_allocacmp_add276_load;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                grp_fu_153_p0 <= ap_sig_allocacmp_add5_load;
            else 
                grp_fu_153_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            grp_fu_153_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_153_p1_assign_proc : process(ap_enable_reg_pp0_iter1, ap_CS_fsm_pp0_stage1, mul_reg_338, mul1_reg_348, ap_CS_fsm_pp0_stage2, ap_block_pp0_stage1, ap_block_pp0_stage2)
    begin
        if ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then
            if (((ap_const_boolean_0 = ap_block_pp0_stage2) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
                grp_fu_153_p1 <= mul1_reg_348;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                grp_fu_153_p1 <= mul_reg_338;
            else 
                grp_fu_153_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            grp_fu_153_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_157_p1_assign_proc : process(ap_enable_reg_pp0_iter0, cos_coefficients_table_load_reg_328, sin_coefficients_table_load_reg_333, ap_CS_fsm_pp0_stage2, ap_block_pp0_stage2, ap_CS_fsm_pp0_stage3, ap_block_pp0_stage3)
    begin
        if ((ap_enable_reg_pp0_iter0 = ap_const_logic_1)) then
            if (((ap_const_boolean_0 = ap_block_pp0_stage3) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage3))) then 
                grp_fu_157_p1 <= sin_coefficients_table_load_reg_333;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage2) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
                grp_fu_157_p1 <= cos_coefficients_table_load_reg_328;
            else 
                grp_fu_157_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            grp_fu_157_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    icmp_ln19_fu_196_p2 <= "1" when (ap_sig_allocacmp_n_2 = ap_const_lv9_100) else "0";
    ifzero_fu_228_p2 <= "1" when (add_ln19_fu_202_p2 = ap_const_lv9_100) else "0";
    n_2_cast2_fu_211_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_n_2),64));
    sin_coefficients_table_address0 <= zext_ln21_fu_222_p1(8 - 1 downto 0);

    sin_coefficients_table_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            sin_coefficients_table_ce0 <= ap_const_logic_1;
        else 
            sin_coefficients_table_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    sum_i_address0 <= sum_i_addr_reg_290_pp0_iter2_reg;

    sum_i_ce0_assign_proc : process(ap_enable_reg_pp0_iter2, ap_CS_fsm_pp0_stage2, ap_block_pp0_stage2_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
            sum_i_ce0 <= ap_const_logic_1;
        else 
            sum_i_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    sum_i_d0 <= reg_161;

    sum_i_we0_assign_proc : process(ap_enable_reg_pp0_iter2, ifzero_reg_319_pp0_iter2_reg, ap_CS_fsm_pp0_stage2, ap_block_pp0_stage2_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2) and (ifzero_reg_319_pp0_iter2_reg = ap_const_lv1_1))) then 
            sum_i_we0 <= ap_const_logic_1;
        else 
            sum_i_we0 <= ap_const_logic_0;
        end if; 
    end process;

    sum_r_address0 <= sum_r_addr_reg_295_pp0_iter2_reg;

    sum_r_ce0_assign_proc : process(ap_enable_reg_pp0_iter2, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            sum_r_ce0 <= ap_const_logic_1;
        else 
            sum_r_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    sum_r_d0 <= reg_161;

    sum_r_we0_assign_proc : process(ap_enable_reg_pp0_iter2, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_11001, ifzero_reg_319_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ifzero_reg_319_pp0_iter2_reg = ap_const_lv1_1))) then 
            sum_r_we0 <= ap_const_logic_1;
        else 
            sum_r_we0 <= ap_const_logic_0;
        end if; 
    end process;

    temp_address0 <= n_2_cast2_fu_211_p1(8 - 1 downto 0);

    temp_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            temp_ce0 <= ap_const_logic_1;
        else 
            temp_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    zext_ln17_cast_fu_167_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(zext_ln17),64));
    zext_ln21_fu_222_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_index_load),64));
end behav;
