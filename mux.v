`timescale 1ns / 1ps

module mux2 #(parameter WIDTH = 8)
(
    input [WIDTH-1:0] d0,
    input [WIDTH-1:0] d1,
    input select,               //与选择的输入序号相同
    output [WIDTH-1:0] out
);
    assign out = ( select == 1'b1 ) ? d1:d0;
endmodule


module mux4 #(parameter WIDTH = 8)
(
    input  [WIDTH-1:0] d0,
    input  [WIDTH-1:0] d1,
    input  [WIDTH-1:0] d2,
    input  [WIDTH-1:0] d3,
    input  [1:0] select,
    output reg [WIDTH-1:0] out
);
    always @(*) 
        begin
            case (select)
                2'b00: out = d0;
                2'b01: out = d1;
                2'b10: out = d2;
                2'b11: out = d3;
                default: ;
            endcase
        end
endmodule

module mux8 #(parameter WIDTH = 8)
(
    input  [WIDTH-1:0] d0,
    input  [WIDTH-1:0] d1,
    input  [WIDTH-1:0] d2,
    input  [WIDTH-1:0] d3,
    input  [WIDTH-1:0] d4,
    input  [WIDTH-1:0] d5,
    input  [WIDTH-1:0] d6,
    input  [WIDTH-1:0] d7,
    input  [2:0] select,
    output reg [WIDTH-1:0] out
);
    always @(*) 
        begin
            case (select)
                3'b000: out = d0;
                3'b001: out = d1;
                3'b010: out = d2;
                3'b011: out = d3;
                3'b100: out = d4;
                3'b101: out = d5;
                3'b110: out = d6;
                3'b111: out = d7;
                default: ;
            endcase
        end
endmodule


module mux16 #(parameter WIDTH = 8)
(
    input  [WIDTH-1:0] d0,
    input  [WIDTH-1:0] d1,
    input  [WIDTH-1:0] d2,
    input  [WIDTH-1:0] d3,
    input  [WIDTH-1:0] d4,
    input  [WIDTH-1:0] d5,
    input  [WIDTH-1:0] d6,
    input  [WIDTH-1:0] d7,
    input  [WIDTH-1:0] d8,
    input  [WIDTH-1:0] d9,
    input  [WIDTH-1:0] d10,
    input  [WIDTH-1:0] d11,
    input  [WIDTH-1:0] d12,
    input  [WIDTH-1:0] d13,
    input  [WIDTH-1:0] d14,
    input  [WIDTH-1:0] d15,
    input  [4:0] select,
    output reg [WIDTH-1:0] out
);
    always @(*) 
        begin
            case (select)
                4'b0000: out = d0;
                4'b0001: out = d1;
                4'b0010: out = d2;
                4'b0011: out = d3;
                4'b0100: out = d4;
                4'b0101: out = d5;
                4'b0110: out = d6;
                4'b0111: out = d7;
                4'b1000: out = d8;
                4'b1001: out = d9;
                4'b1010: out = d10;
                4'b1011: out = d11;
                4'b1100: out = d12;
                4'b1101: out = d13;
                4'b1110: out = d14;
                4'b1111: out = d15;
                default: ;
            endcase
        end
endmodule
