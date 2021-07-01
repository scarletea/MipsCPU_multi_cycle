`timescale 1ns / 1ps

module DM(
   input  [11:2] addr,
   input  [31:0] data_in,
   input  DMWr,
   input  clk,
   output reg [31:0] data_out
);
    reg [31:0] DMEM[1023:0];

    always @(posedge clk) 
        begin
            if (DMWr)
                DMEM[addr] <= data_in;
        `ifdef DEBUG
         $display("dmem[00-07]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", dmem[0], dmem[1], dmem[2], dmem[3], dmem[4], dmem[5], dmem[6], dmem[7]);
         $display("dmem[08-15]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", dmem[8], dmem[9], dmem[10], dmem[11],dmem[12], dmem[13], dmem[14], dmem[15]);
         $display("dmem[16-23]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", dmem[16], dmem[17], dmem[18], dmem[19], dmem[20],dmem[21], dmem[22], dmem[23]);
         $display("dmem[24-31]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", dmem[24], dmem[25], dmem[26], dmem[27], dmem[28], dmem[29], dmem[30], dmem[31]);
      `endif
            else
                data_out <= DMEM[addr];
        end
endmodule
