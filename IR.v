module IR (
   input    clk,
   input    rst,
   input    IRWr, 
   input  [31:0] ins_in,       //指令输入
   output reg [31:0] ins_out      //指令输出
);
    always @(posedge clk or posedge rst) 
        begin
            if(rst)
                ins_in <= 0;
            else if (IRWr)
                ins_out <= ins_in;
        end

endmodule