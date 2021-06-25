module flopr #(parameter WIDTH = 8)
(
               
   input  clk,
   input  rst,
   input  [WIDTH-1:0] D,
   output reg [WIDTH-1:0] Q
);
   always @(posedge clk or posedge rst) 
   begin
      if (rst) 
         Q <= 0;
      else 
         Q <= D;
   end
endmodule