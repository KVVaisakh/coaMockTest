	.data
array: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
space: .asciiz " "
	.text
	.globl main
main:
	la $s0,array
	li $s1,0
	li $s2,11
loop:
	addi $t0,$s1,33
	sw $t0,0($s0)
	lw $t1,0($s0)
	add $a0,$t1,0
	li $v0,1
	syscall
	la $a0,space
	li $v0,4
	syscall
	addi $s1,$s1,1
	addi $s0,$s0,4
	bne $s1,$s2,loop
exit:
	li $v0,10
	syscall