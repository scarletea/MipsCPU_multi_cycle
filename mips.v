`timescale 1ns / 1ps

module mips(
   input clk,
   input rst,
   output test
);

wire Zero;
wire [5:0] Op;
wire [5:0] Func;
wire PCWr;
wire IRWr;
wire [1:0] RegSel;
wire [1:0] ExtSel;
wire RFWr;
wire BSel;
wire [1:0] NPCOp;
wire [4:0] ALUOp;
wire DMWr;
wire [1:0] WDSel;
wire [31:2] PC;
wire [31:2] NPC;
wire [25:0] IMM26;
wire [15:0] IMM16;
wire [31:0] IMM32;
wire [4:0] rs;
wire [4:0] rt;
wire [4:0] rd;
wire [4:0] RF_rd;
wire [31:0] WD;
wire [31:0] A_in;
wire [31:0] B_in;
wire [31:0] A_out;
wire [31:0] B_out;
wire [31:0] ALU_B;
wire [4:0] shamt;
wire [31:0] ALU_out;
wire [31:0] ALUout_out;
wire [31:0] IM_ins_out;
wire [31:0] ins;
wire [31:0] DM_out;
wire [31:0] DR_out;
wire [31:0] mux_RF_WD_0;
wire [31:2] mux_RF_WD_2;

assign Func = ins[5:0];
assign Op = ins[31:26];
assign IMM26 = ins[25:0];
assign rs = ins[25:21];
assign rt = ins[20:16];
assign rd = ins[15:11];
assign IMM16 = ins[15:0];
assign shamt = ins[10:6];
assign mux_RF_WD_0 = ALUout_out;
assign mux_RF_WD_2 = PC;

Ctrl U_CTRL(
   .clk(clk),.rst(rst),.Zero(Zero),.Op(Op),.Func(Func),
   .RFWr(RFWr),.DMWr(DMWr),.PCWr(PCWr),.IRWr(IRWr),
   .EXTSel(ExtSel),.ALUOp(ALUOp),.NPCOp(NPCOp),
   .RegSel(RegSel),.WDsel(WDSel),.BSel(BSel)
);
PC U_PC(
   .clk(clk),.rst(rst),.PCWr(PCWr),.NPC(NPC),.PC(PC)
);
NPC U_NPC(
   .PC(PC),.NPCOp(NPCOp),.IMM(IMM26),.NPC(NPC)
);
IM U_IM(
   .addr(PC[11:2]),.ins(IM_ins_out)
);
IR U_IR(
   .clk(clk),.rst(rst),.IRWr(IRWr),.ins_in(IM_ins_out),
   .ins_out(ins)
);
mux4 #(5) U_mux_RF_rd (
      .d0(rd), .d1(rt), .d2(5'd31), .d3(5'd0),
      .select(RegSel), .out(RF_rd)
);
RF U_RF(
   .rs(rs),.rt(rt),.rd(RF_rd),.WD(WD),.clk(clk),
   .RFWr(RFWr),.RD1(A_in),.RD2(B_in)
);
EXT U_EXT ( 
   .Imm_16(IMM16), .EXTSel(ExtSel), .Imm_32(IMM32) 
);
flopr #(32) U_A(
   .clk(clk),.rst(rst),.D(A_in),.Q(A_out)
);
flopr #(32) U_B(
   .clk(clk),.rst(rst),.D(B_in),.Q(B_out)
);
mux2 #(32) U_mux_ALU_B(
   .d0(B_out),.d1(IMM32),.select(BSel),.out(ALU_B)
);
ALU U_ALU(
   .A(A_out),.B(ALU_B),.ALUOp(ALUOp),.shamt(shamt),
   .Res(ALU_out),.ZF(Zero)
);
flopr #(32) U_ALUOut(
   .clk(clk),.rst(rst),.D(ALU_out),.Q(ALUout_out)
);
DM U_DM(
   .addr(ALUout_out[11:2]),.data_in(B_out),
   .DMWr(DMWr),.clk(clk),.data_out(DM_out)
);
flopr #(32) U_DR(
   .clk(clk),.rst(rst),.D(DM_out),.Q(DR_out)
);
mux4 #(32) U_mux_RF_WD(
   .d0(mux_RF_WD_0),.d1(DR_out),.d2({mux_RF_WD_2,2'b00}),
   .d3(32'b0),.select(WDSel),.out(WD)
);

endmodule