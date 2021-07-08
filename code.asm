# Test File for 7 Instruction, include:
# ADDU/SUBU/LW/SW/ORI/BEQ/JAL   
################################################################
### Make sure following Settings :
# Settings -> Memory Configuration -> Compact, Data at address 0

.text
	ori $29, $0, 12
	ori $2, $0, 0x1234
	ori $3, $0, 0x3456
	addu $4, $2, $3
	subu $6, $3, $4
	
	add $7, $2, $3
	sub $8, $3, $4
	and $9, $2, $3
	or $10, $3, $4
	xor $11, $0, $2
	nor $12, $13, $1
	slt $13, $8, $7
	slt $13, $10 , $11
	sltu $14, $8, $7
	addi $15, $2, 0xf234
	addiu $16, $2, 0xf234
	andi $17, $2, 0x0004
	xori $18, $3, 0x3450
	sll $15, $15, 4
	srl $16, $16, 4
	srlv $15, $15, $17
	sllv $16, $16, $17
	
	sw $2, 0($0)
	sw $3, 4($0)
	sw $4, 4($29)
	lw $5, 0($0)
	beq $2, $5, _lb2
	_lb1:
	lw $3, 4($29)
	_lb2:
	lw $5, 4($0)
	beq $3, $5, _lb1
	jal F_Test_JAL	
	
F_Test_JAL:
	subu $6, $6, $2
	sw $6, -4($29)
	
