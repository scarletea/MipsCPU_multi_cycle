module IM(
    input [11:2] addr,
    output reg [31:0] ins
);
    reg [31:0] IMEM[1023:0];

    assign ins = IMEM[addr];
endmodule