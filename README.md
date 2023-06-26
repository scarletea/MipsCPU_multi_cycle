# MipsCPU_multi_cycle
QUT青岛理工大学|2019级计算机组成原理课程设计|无流水线多周期MIPS
实现25条指令
实现addu，subu，ori，lw，sw，beq，jal，add，sub，and，or，xor，nor，slt，sltu，addi，addiu，andi，xori，sll，srl，sllv，srlv，slti，sltiu共25条指令。

# 注意
因mars中会将addi/addiu指令变为lui，ori，add三条指令，code中的十六进制机器码也因此不会直接是addi。
若立即数为负数，则在测试时无法体现正确的addi波形（signed extend），可通过手动修改addi/addiu以及其他跳转相关指令的十六进制机器码解决。

# 声明
每年的课程内容会有所变动或调整，所有文件仅供参考。
请勿抄袭，学术不端，后果自负。
