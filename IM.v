module IM(
    input [11:2] addr,
    output [31:0] dout
);
    reg [31:0] MEM[1023:0];

    //
    //
    //
    //
    assign dout = MEM[addr];
endmodule