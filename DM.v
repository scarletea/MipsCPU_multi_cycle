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
            else
                data_out <= DMEM[addr];
        end
endmodule
