`timescale 1ns / 1ps

module PC(
    input clk,          //时钟信号
    input rst,          //复位信号
    input [31:2]NPC,    //下一条指令地址
    input PCWr,         //使能信号
    output reg [31:2]PC //当前指令地址
);
    reg [1:0] t;
    wire [31:0] PC_full;
    assign PC_full = {PC,t};

    always @(posedge clk,posedge rst) 
        begin
            if(rst)
                {PC,t} <= 32'h0000_3000;
            else if(PCWr)
                PC <= NPC;
        end
endmodule