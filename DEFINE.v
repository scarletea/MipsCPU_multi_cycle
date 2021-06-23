`define RstEnable       1'b1
`define RstDisable      1'b0
`define ZeroWord        32'h00000000        //32位数值0
`define WriteEnable     1'b1
`define WriteDisable    1'b0
`define ReadEnable      1'b1
`define ReadDisable     1'b0
`define AluOpBus        7:0                 //译码阶段输出aluop_o的宽度
`define AluSelBus       2:0                 //译码阶段输出alusel_o的宽度
`define InsValid        1'b0                //指令有效
`define InsInvalid      1'b1
`define True_v          1'b1                //逻辑真
`define False_v         1'b0
`define ChipEnable      1'b1                //芯片使能
`define ChipDisable     1'b0


`define EXE_ORI         6'b001101           //ori指令码
`define EXE_NOP         6'b000000
//AluOp
`define EXE_OR_OP       8'b00100101
`define EXE_NOR_OP      8'b00000000
//AluSel
`define EXE_RES_LOGIC   3'b001

`define EXE_RES_NOP     3'b000


`define InstAddrBus     31:0                //ROM地址总线宽度
`define InstBus         31:0                //ROM数据总线宽度
`define InstMemNum      131071              //ROM实际大小128KB
`define InstMemLog2     17                  //ROM实际使用地址线宽度


`define RegAddrBus      4:0                 //Regfile地址线宽度
`define RegBus          31:0                //Regfile数据线宽度
`define RegWidth        32                  //通用寄存器宽度
`define DoubleRegWidth  64                  //两倍通用寄存器宽度
`define DoubleRegBus    63:0                //两倍通用寄存器数据线宽度
`define RegNum          32                  //通用寄存器数量
`define RegNumLog2      5                   //寻址通用寄存器使用的地址位数
`define NOPRegAddr      5'b00000

