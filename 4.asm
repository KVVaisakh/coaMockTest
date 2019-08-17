	.data
array: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	.text
	.globl main
main:
	la $s0,array
	li $s1,0
	li $s2,11
	li $t1,0
loop:
	lw $t0,0($s0)
	andi $t0,$t0,1
	beq $t0,1,update
	back:
	addi $s1,$s1,1
	addi $s0,$s0,4
	bne $s1,$s2,loop
	j exit
update:
	addi $t1,$t1,1
	j back
exit:
	add $a0,$t1,0
	li $v0,1
	syscall
	li $v0,10
	syscall