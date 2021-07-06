
//AluOp
`define ALU_ADDU_OP         5'b00000
`define ALU_SUBU_OP         5'b00001
`define ALU_ORI_OP          5'b00010
`define ALU_ADD_OP          5'b00011
`define ALU_SUB_OP          5'b00100
`define ALU_AND_OP          5'b00101
`define ALU_OR_OP           5'b00110
`define ALU_XOR_OP          5'b00111
`define ALU_NOR_OP          5'b01000
`define ALU_SLT_OP          5'b01001
`define ALU_SLTU_OP         5'b01010
`define ALU_ADDI_OP         5'b01011
`define ALU_ADDIU_OP        5'b01100
`define ALU_ANDI_OP         5'b01101
`define ALU_XORI_OP         5'b01110
`define ALU_SRL_OP          5'b01111
`define ALU_SLL_OP          5'b10000
`define ALU_SRLV_OP         5'b10001
`define ALU_SLLV_OP         5'b10010


//EXTSel
`define EXT_UNSIGNED        2'b00
`define EXT_SIGNED          2'b01
`define EXT_POS_H           2'b10

//NPCOp
`define NPC_PLUS_4          2'b00
`define NPC_BRANCH          2'b01
`define NPC_JUMP            2'b10

//BOp
`define B_RT                1'b0
`define B_EXT               1'b1


//InsOp
`define INST_RTYPE_OP       6'b000000
`define INST_LW_OP          6'b100011
`define INST_SW_OP          6'b101011
`define INST_ORI_OP         6'b001101  
`define INST_BEQ_OP         6'b000100
`define INST_JAL_OP         6'b000011
`define INST_ADDI_OP        6'b001000
`define INST_ADDIU_OP       6'b001001
`define INST_ANDI_OP        6'b001100
`define INST_XORI_OP        6'b001110

//Ins_Func
`define INST_ADDU_FUNC      6'b100001
`define INST_SUBU_FUNC      6'b100011
`define INST_ADD_FUNC       6'b100000
`define INST_SUB_FUNC       6'b100010
`define INST_AND_FUNC       6'b100100
`define INST_OR_FUNC        6'b100101
`define INST_XOR_FUNC       6'b100110
`define INST_NOR_FUNC       6'b100111
`define INST_SLT_FUNC       6'b101010
`define INST_SLTU_FUNC      6'b101011
`define INST_SLL_FUNC       6'b000000
`define INST_SRL_FUNC       6'b000010
`define INST_SLLV_FUNC      6'b000100 
`define INST_SRLV_FUNC      6'b000110

// RF
`define RegSel_RD   2'b00
`define RegSel_RT   2'b01
`define RegSel_31   2'b10


`define WDSel_FromALU 2'b00
`define WDSel_FromMEM 2'b01
`define WDSel_FromPC  2'b10