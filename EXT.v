`include "DEFINE.v"
`timescale 1ns / 1ps

module EXT
(
   input  [15:0] Imm_16,
   input  [1:0]  EXTSel,
   output reg [31:0] Imm_32
);
   always @(*) 
      begin
         case (EXTSel)
            `EXT_UNSIGNED:    Imm_32 = {16'd0, Imm_16};
            `EXT_SIGNED:      Imm_32 = {{16{Imm_16[15]}}, Imm_16};
            `EXT_POS_H:       Imm_32 = {Imm_16, 16'd0};
            default: ;
         endcase
      end
endmodule
