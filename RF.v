`timescale 1ns / 1ps

module RF(
    input  [4:0]  rs,      //读操作地址
    input  [4:0]  rt,
    input  [4:0]  rd,       //写入的操作地址
    input  [31:0] WD,       //写入的数
    input         clk,
    input         RFWr,
    output [31:0] RD1,      //读出的数1
    output [31:0] RD2
);
    reg [31:0] register [31:0];
    integer i;
    initial 
    begin
        for (i = 0; i < 32; i = i + 1)
        register[i] = 0;
    end

    always @(posedge clk) 
        begin
            if (RFWr==1)
                begin
                    register[rd] <= WD;
                end
            $display("R[00-07]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", register[0], register[1], register[2], register[3], register[4], register[5], register[6], register[7]);
            $display("R[08-15]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", register[8], register[9],  register[10], register[11], register[12], register[13], register[14], register[15]);
            $display("R[16-23]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", register[16], register[17], register[18], register[19], register[20], register[21], register[22], register[23]);
            $display("R[24-31]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", register[24], register[25], register[26], register[27], register[28], register[29], register[30], register[31]);

        end

    assign RD1 = (rs==0)? 0:register[rs];
    assign RD2 = (rt==0)? 0:register[rt];
endmodule