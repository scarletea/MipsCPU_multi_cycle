`include "DEFINE.v"
module NPC(
	input  [31:2] PC,       //当前
	input  [1:0]  NPCOp,    //操作数
	input  [25:0] IMM,      //立即数
	output reg [31:2] NPC   //下一address
);
always @(*) 
   begin
      case (NPCOp)
          `NPC_PLUS4: NPC = PC + 1;
          `NPC_BRANCH: NPC = PC + {{14{IMM[15]}}, IMM[15:0]};
          `NPC_JUMP: NPC = {PC[31:28], IMM[25:0]};
          default: ;
      endcase
   end
endmodule