module ALU (
    input   [31:0] A, 
    input   [31:0] B,
    input   [3:0]  ALUOp,
    input   [4:0] shamt,
    output reg [31:0] C,
    output  Zero