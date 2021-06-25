module RF(
    input  [4:0]  rs,      //读操作地�?1
    input  [4:0]  rt,
    input  [4:0]  rd,       //写操作地�?1
    input  [31:0] WD,       //写入的数�?
    input         clk,
    input         RFWr,
    output [31:0] RD1,      //读出的数�?1
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
    if (RFWr)
        register[rd] <= WD;
end

assign RD1 = (rs==0)? 0:register[rs];
assign RD2 = (rt==0)? 0:register[rt];
endmodule