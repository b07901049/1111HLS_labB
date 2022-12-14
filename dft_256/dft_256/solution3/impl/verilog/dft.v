// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="dft_dft,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.256000,HLS_SYN_LAT=331268,HLS_SYN_TPT=none,HLS_SYN_MEM=3,HLS_SYN_DSP=0,HLS_SYN_FF=1016,HLS_SYN_LUT=1295,HLS_VERSION=2022_1}" *)

module dft (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        real_sample_address0,
        real_sample_ce0,
        real_sample_q0,
        imag_sample_address0,
        imag_sample_ce0,
        imag_sample_we0,
        imag_sample_d0,
        imag_sample_q0,
        imag_sample_address1,
        imag_sample_ce1,
        imag_sample_we1,
        imag_sample_d1,
        imag_sample_q1,
        real_output_address0,
        real_output_ce0,
        real_output_we0,
        real_output_d0,
        real_output_q0,
        imag_output_address0,
        imag_output_ce0,
        imag_output_we0,
        imag_output_d0,
        imag_output_q0
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_state2 = 6'd2;
parameter    ap_ST_fsm_state3 = 6'd4;
parameter    ap_ST_fsm_state4 = 6'd8;
parameter    ap_ST_fsm_state5 = 6'd16;
parameter    ap_ST_fsm_state6 = 6'd32;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [7:0] real_sample_address0;
output   real_sample_ce0;
input  [31:0] real_sample_q0;
output  [7:0] imag_sample_address0;
output   imag_sample_ce0;
output   imag_sample_we0;
output  [31:0] imag_sample_d0;
input  [31:0] imag_sample_q0;
output  [7:0] imag_sample_address1;
output   imag_sample_ce1;
output   imag_sample_we1;
output  [31:0] imag_sample_d1;
input  [31:0] imag_sample_q1;
output  [7:0] real_output_address0;
output   real_output_ce0;
output   real_output_we0;
output  [31:0] real_output_d0;
input  [31:0] real_output_q0;
output  [7:0] imag_output_address0;
output   imag_output_ce0;
output   imag_output_we0;
output  [31:0] imag_output_d0;
input  [31:0] imag_output_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[7:0] real_output_address0;
reg real_output_ce0;
reg real_output_we0;
reg[7:0] imag_output_address0;
reg imag_output_ce0;
reg imag_output_we0;

(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [7:0] trunc_ln18_fu_137_p1;
reg   [7:0] trunc_ln18_reg_164;
wire    ap_CS_fsm_state3;
wire   [0:0] icmp_ln15_fu_119_p2;
reg   [31:0] real_output_load_reg_180;
wire    ap_CS_fsm_state4;
reg   [31:0] imag_output_load_reg_185;
wire   [31:0] bitcast_ln19_fu_146_p1;
reg   [31:0] bitcast_ln19_reg_190;
wire    ap_CS_fsm_state5;
wire   [31:0] bitcast_ln20_fu_150_p1;
reg   [31:0] bitcast_ln20_reg_195;
reg   [7:0] temp_address0;
reg    temp_ce0;
reg    temp_we0;
wire   [31:0] temp_q0;
wire    grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_start;
wire    grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_done;
wire    grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_idle;
wire    grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_ready;
wire   [7:0] grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_real_sample_address0;
wire    grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_real_sample_ce0;
wire   [7:0] grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_address0;
wire    grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_ce0;
wire    grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_we0;
wire   [31:0] grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_d0;
wire    grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_start;
wire    grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_done;
wire    grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_idle;
wire    grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_ready;
wire   [7:0] grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_address0;
wire    grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_ce0;
wire    grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_we0;
wire   [31:0] grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_d0;
wire   [7:0] grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_address0;
wire    grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_ce0;
wire    grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_we0;
wire   [31:0] grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_d0;
wire   [7:0] grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_temp_address0;
wire    grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_temp_ce0;
reg    grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_start_reg;
wire    ap_CS_fsm_state2;
reg    grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_start_reg;
wire    ap_CS_fsm_state6;
wire   [63:0] zext_ln15_fu_131_p1;
reg   [8:0] k_fu_52;
wire   [8:0] add_ln15_fu_125_p2;
reg   [5:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'd1;
#0 grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_start_reg = 1'b0;
#0 grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_start_reg = 1'b0;
end

dft_temp_RAM_AUTO_1R1W #(
    .DataWidth( 32 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
temp_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(temp_address0),
    .ce0(temp_ce0),
    .we0(temp_we0),
    .d0(grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_d0),
    .q0(temp_q0)
);

dft_dft_Pipeline_VITIS_LOOP_11_1 grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_start),
    .ap_done(grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_done),
    .ap_idle(grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_idle),
    .ap_ready(grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_ready),
    .real_sample_address0(grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_real_sample_address0),
    .real_sample_ce0(grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_real_sample_ce0),
    .real_sample_q0(real_sample_q0),
    .temp_address0(grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_address0),
    .temp_ce0(grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_ce0),
    .temp_we0(grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_we0),
    .temp_d0(grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_d0)
);

dft_dft_Pipeline_VITIS_LOOP_17_3 grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_start),
    .ap_done(grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_done),
    .ap_idle(grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_idle),
    .ap_ready(grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_ready),
    .bitcast_ln20(bitcast_ln20_reg_195),
    .bitcast_ln19(bitcast_ln19_reg_190),
    .imag_output_address0(grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_address0),
    .imag_output_ce0(grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_ce0),
    .imag_output_we0(grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_we0),
    .imag_output_d0(grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_d0),
    .zext_ln15(trunc_ln18_reg_164),
    .real_output_address0(grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_address0),
    .real_output_ce0(grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_ce0),
    .real_output_we0(grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_we0),
    .real_output_d0(grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_d0),
    .trunc_ln(trunc_ln18_reg_164),
    .temp_address0(grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_temp_address0),
    .temp_ce0(grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_temp_ce0),
    .temp_q0(temp_q0)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_start_reg <= 1'b1;
        end else if ((grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_ready == 1'b1)) begin
            grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_start_reg <= 1'b1;
        end else if ((grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_ready == 1'b1)) begin
            grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        k_fu_52 <= 9'd0;
    end else if (((icmp_ln15_fu_119_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        k_fu_52 <= add_ln15_fu_125_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        bitcast_ln19_reg_190 <= bitcast_ln19_fu_146_p1;
        bitcast_ln20_reg_195 <= bitcast_ln20_fu_150_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        imag_output_load_reg_185 <= imag_output_q0;
        real_output_load_reg_180 <= real_output_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln15_fu_119_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        trunc_ln18_reg_164 <= trunc_ln18_fu_137_p1;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

always @ (*) begin
    if ((grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_done == 1'b0)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln15_fu_119_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln15_fu_119_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        imag_output_address0 = zext_ln15_fu_131_p1;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        imag_output_address0 = grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_address0;
    end else begin
        imag_output_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        imag_output_ce0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        imag_output_ce0 = grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_ce0;
    end else begin
        imag_output_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        imag_output_we0 = grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_we0;
    end else begin
        imag_output_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        real_output_address0 = zext_ln15_fu_131_p1;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        real_output_address0 = grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_address0;
    end else begin
        real_output_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        real_output_ce0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        real_output_ce0 = grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_ce0;
    end else begin
        real_output_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        real_output_we0 = grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_we0;
    end else begin
        real_output_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        temp_address0 = grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_temp_address0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        temp_address0 = grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_address0;
    end else begin
        temp_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        temp_ce0 = grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_temp_ce0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        temp_ce0 = grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_ce0;
    end else begin
        temp_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        temp_we0 = grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_temp_we0;
    end else begin
        temp_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((icmp_ln15_fu_119_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == ap_CS_fsm_state6) & (grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln15_fu_125_p2 = (k_fu_52 + 9'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign bitcast_ln19_fu_146_p1 = real_output_load_reg_180;

assign bitcast_ln20_fu_150_p1 = imag_output_load_reg_185;

assign grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_start = grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_ap_start_reg;

assign grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_start = grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_ap_start_reg;

assign icmp_ln15_fu_119_p2 = ((k_fu_52 == 9'd256) ? 1'b1 : 1'b0);

assign imag_output_d0 = grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_imag_output_d0;

assign imag_sample_address0 = 8'd0;

assign imag_sample_address1 = 8'd0;

assign imag_sample_ce0 = 1'b0;

assign imag_sample_ce1 = 1'b0;

assign imag_sample_d0 = 32'd0;

assign imag_sample_d1 = 32'd0;

assign imag_sample_we0 = 1'b0;

assign imag_sample_we1 = 1'b0;

assign real_output_d0 = grp_dft_Pipeline_VITIS_LOOP_17_3_fu_94_real_output_d0;

assign real_sample_address0 = grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_real_sample_address0;

assign real_sample_ce0 = grp_dft_Pipeline_VITIS_LOOP_11_1_fu_86_real_sample_ce0;

assign trunc_ln18_fu_137_p1 = k_fu_52[7:0];

assign zext_ln15_fu_131_p1 = k_fu_52;

endmodule //dft
