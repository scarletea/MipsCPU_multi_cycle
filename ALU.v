`include "DEFINE.v"
`timescale 1ns / 1ps

module ALU (
    input   [31:0] A, 
    input   [31:0] B,
    input   [4:0]  ALUOp,
    input   [4:0] shamt,
    output reg [31:0] Res,
    output wire ZF              //输入两个数是否相等,相等为1，不相等为0
);

    always @( A or B or ALUOp or shamt ) 
        begin
            case(ALUOp)
                `ALU_ADDU_OP:   Res = A + B;
                `ALU_SUBU_OP:   Res = A - B;
                `ALU_ORI_OP:    Res = A | B;
                `ALU_ADD_OP:    Res = A + B;
                `ALU_SUB_OP:    Res = A - B;
                `ALU_AND_OP:    Res = A & B;
                `ALU_OR_OP:     Res = A | B;
                `ALU_XOR_OP:    Res = A ^ B;
                `ALU_NOR_OP:    Res = ~(A | B);
                `ALU_SLT_OP:    Res = ($signed(A) < $signed(B))?1:0;
                `ALU_SLTU_OP:   Res = (A < B)?1:0;
                `ALU_ADDI_OP:   Res = A + B;
                `ALU_ADDIU_OP:  Res = A + B;
                `ALU_ANDI_OP:   Res = A & B;
                `ALU_XORI_OP:   Res = A ^ B;
                `ALU_SLL_OP:  Res = B >> shamt;
                `ALU_SRL_OP:  Res = B << shamt;
                `ALU_SLLV_OP: Res = B >> A;
                `ALU_SRLV_OP: Res = B << A;
                default: ;
            endcase
        end
        assign ZF = (A == B) ? 1 : 0;
endmodule