`timescale 1ns / 1ps

module IM(
    input [11:2] addr,
    output reg [31:0] ins
);
    reg [31:0] IMEM[1023:0];

    initial
    begin
        $readmemh("C://Users//hp//Desktop//MipsCPU_multi_cycle//code.txt",IMEM);
    end
    always @(*)
    begin
        ins = IMEM[addr];
    end
endmodule