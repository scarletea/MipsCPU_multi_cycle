`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/30 21:46:26
// Design Name: 
// Module Name: mips_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mips_tb(    );
   reg clk, rst;
   mips U_MIPS(
      .clk(clk), .rst(rst)
   );
initial begin
    clk = 0;
    rst = 1;
    #100;
    rst=0;
    forever
        #100
        clk = ~clk;
end

endmodule