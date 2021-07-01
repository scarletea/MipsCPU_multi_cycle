`include "DEFINE.v"
`timescale 1ns / 1ps

module Ctrl(
   input  clk,
   input  rst,
   input  Zero,
   input  [5:0] Op,
   input  [5:0] Func,
   output reg RFWr,             //RF写使能信号，enable：1，disable：0
   output reg DMWr,             //DM读写控制信号，1为写，0为读
   output reg PCWr,             //PC写使能信号，enable：1，disable：0
   output reg IRWr,             //IR写使能信号，enable：1，disable：0
   output reg [1:0] EXTSel,     //扩展模式选择，0：直接扩展，1：零扩展，2：扩展后立即数置高位
   output reg [3:0] ALUOp,      //ALU控制信号，见ALU.v
   output reg [1:0] NPCOp,      //NPC控制信号,0：PC+4 1：分支地址 2：跳转地址
   output reg [1:0] RegSel,     //reg写入片选，0：写入rd，1：写入rt，2：写入$31 reg//ExtOp
   output reg [1:0] WDsel,      //回写片选，0为ALU结果，1为DM中读出的数据，2为PC,写入RF
   output reg BSel              //ALU片选，0为rt数据,1为imm扩展后数据
);

   parameter Fetch  = 4'b0000;
   parameter DCD    = 4'b0001;
   parameter MA     = 4'b0010;
   parameter MR     = 4'b0011;
   parameter MemWB  = 4'b0100;
   parameter MW     = 4'b0101;
   parameter Exe    = 4'b0110;
   parameter AluWB  = 4'b0111;
   parameter Br     = 4'b1000;
   parameter Jmp    = 4'b1001;

   wire RType;   // Type of R-Type Instruction
   wire IType;   // Type of Imm    Instruction  
   wire BrType;  // Type of Branch Instruction
   wire JType;   // Type of Jump   Instruction
   wire LdType;  // Type of Load   Instruction
   wire StType;  // Type of Store  Instruction
//   wire MemType; // Type pf Memory Instruction(Load/Store)

   assign RType   = (Op == `INST_RTYPE_OP);
   assign IType   = 1'b0;//(Op == `INST_ORI_OP );//|| `INST_ADDIU_OP || `INST_ANDI_OP || `INST_XORI_OP);
   assign BrType  = (Op == `INST_BEQ_OP  );
   assign JType   = (Op == `INST_JAL_OP  );
	assign LdType  = (Op == `INST_LW_OP   );
	assign StType  = (Op == `INST_SW_OP   );
   assign Addi    = (Op == `INST_ADDI_OP ); 


   //FSM
   reg [3:0] nextstate;
   reg [3:0] state;

   always @(posedge clk or posedge rst) begin
	   if ( rst )
		   state <= Fetch;
      else
         state <= nextstate;
	end 

   always @(*) begin
      case (state)
         Fetch: 
            nextstate = DCD;
         DCD: 
         begin
            if ( RType || IType ) 
				   nextstate = Exe;
            else if ( LdType || StType ) 
               nextstate = MA;
            else if ( BrType )
               nextstate = Br;
            else if ( JType )
               nextstate = Jmp;
            else   //if op wrong
               nextstate = Fetch;
         end
         MA: 
         begin 
            if ( LdType )
				   nextstate = MR;   
            else if ( StType )
					nextstate = MW;   
			end
         MR:      nextstate = MemWB;
         MemWB:   nextstate = Fetch;
         MW:      nextstate = Fetch;
         Exe:     nextstate = AluWB;
         AluWB: 	nextstate = Fetch;
         Br:      nextstate = Fetch;
         Jmp: 	   nextstate = Fetch;
			default: ;
       endcase
   end



//Ctrl Signal
    always @(*)
    begin
	   case (state)
		   Fetch:
         begin
            PCWr   = 1'b1;
            NPCOp  = `NPC_PLUS_4;
            IRWr   = 1'b1;
            RFWr   = 1'b0;
            DMWr   = 1'b0;
			end
         DCD:
         begin
            PCWr   = 1'b0;
            IRWr   = 1'b0;
            RFWr   = 1'b0;
            DMWr   = 1'b0;
            if (IType||RType||JType)
               EXTSel = `EXT_UNSIGNED;
            else if (LdType||StType||Addi||BrType)
					EXTSel  = `EXT_SIGNED;
				else
               EXTSel = 0;
			end	
         Exe: 	
         begin
            PCWr   = 1'b0;
            IRWr   = 1'b0;
            RFWr   = 1'b0;
            DMWr   = 1'b0;
            if (IType)
               BSel   = `B_EXT;
            else
               BSel   = `B_RT;			
            		
            if (Op == `INST_ORI_OP)
               ALUOp  = `ALU_ORI_OP;
            else if (Op == `INST_ADDI_OP)
               ALUOp  = `ALU_ADDI_OP;
            else if (Op == `INST_ADDIU_OP)
               ALUOp  = `ALU_ADDIU_OP;
            else if (Op == `INST_ANDI_OP)
               ALUOp  = `ALU_ANDI_OP;
            else if (Op == `INST_XORI_OP)
               ALUOp  = `ALU_XORI_OP;
            else if (Op == `INST_RTYPE_OP) 
            begin
               case (Func)
                  `INST_ADDU_FUNC: ALUOp = `ALU_ADDU_OP;
                  `INST_SUBU_FUNC: ALUOp = `ALU_SUBU_OP;
                  `INST_ADD_FUNC:  ALUOp = `ALU_ADD_OP;
                  `INST_SUB_FUNC:  ALUOp = `ALU_SUB_OP;
                  `INST_AND_FUNC:  ALUOp = `ALU_AND_OP;
                  `INST_OR_FUNC:   ALUOp = `ALU_OR_OP;
                  `INST_XOR_FUNC:  ALUOp = `ALU_XOR_OP;
                  `INST_NOR_FUNC:  ALUOp = `ALU_NOR_OP;
                  `INST_SLT_FUNC:  ALUOp = `ALU_SLT_OP;
                  `INST_SLTU_FUNC: ALUOp = `ALU_SLTU_OP;
                  /*
                  `INST_SLL_FUNC:  ALUOp = `ALU_SLL_OP;
                  `INST_SRL_FUNC:  ALUOp = `ALU_SRL_OP;
                  `INST_SRA_FUNC:  ALUOp = `ALU_SRA_OP;
                  `INST_SLLV_FUNC: ALUOp = `ALU_SLLV_OP;
                  `INST_SRLV_FUNC: ALUOp = `ALU_SRLV_OP;
                  `INST_SRAV_FUNC: ALUOp = `ALU_SRAV_OP;
                  */
                   default: ;
               endcase
            end
		   end 
         MA: 
         begin
            PCWr   = 1'b0;
            IRWr   = 1'b0;
            RFWr   = 1'b0;
            DMWr   = 1'b0;            
            BSel  = `B_EXT;
            ALUOp  = `ALU_ADDU_OP;
			end 
         Br: 
         begin           
				PCWr=Zero;
            NPCOp  = `NPC_BRANCH;
            IRWr   = 1'b0;
            RFWr   = 1'b0;
            DMWr   = 1'b0;
            BSel  = `B_RT;
            ALUOp  = `ALU_SUBU_OP;
			end 
         Jmp: 	
         begin
            PCWr   = 1'b1;
            NPCOp  = `NPC_JUMP;
            IRWr   = 1'b0;
            RFWr   = 1'b1;
            DMWr   = 1'b0;            
            RegSel  = `RegSel_31;
            WDsel  = `WDSel_FromPC;            
			end 
         MR:  
         begin
            PCWr   = 1'b0;
            IRWr   = 1'b0;
            RFWr   = 1'b0;
            DMWr   = 1'b0;           
			end 
         MW:  
         begin
            PCWr   = 1'b0;
            NPCOp  = 0;
            IRWr   = 1'b0;
            RFWr   = 1'b0;
            DMWr   = 1'b1;
            EXTSel = 0;
            RegSel = 0;
            WDsel  = 0;
            BSel   = 0;
            ALUOp  = 0;
			end
         AluWB: 	
         begin
            PCWr   = 1'b0;
            IRWr   = 1'b0;
            RFWr   = 1'b1;
            DMWr   = 1'b0;
            if (IType)
               RegSel = `RegSel_RT;
            else
               RegSel = `RegSel_RD;
               WDsel  = `WDSel_FromALU;
               BSel   = 0;
               ALUOp  = 0;
			end
         MemWB: 
         begin
            PCWr   = 1'b0;
            IRWr   = 1'b0;
            RFWr  = 1'b1;
            DMWr   = 1'b0;            
            RegSel = `RegSel_RT;
            WDsel  = `WDSel_FromMEM;
			end 
			default: 
         begin
            PCWr   = 1'b0;
            NPCOp  = 0;
            IRWr   = 1'b0;
            RFWr  = 1'b0;
            DMWr   = 1'b0;
            EXTSel  = 0;
            RegSel = 0;
            WDsel  = 0;
            BSel   = 0;
            ALUOp  = 0;
			end 
	   endcase
   end 
endmodule
