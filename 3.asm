	.data
array: .asciiz "vaisakhkvarrier"
space: .asciiz " "
a:	.byte 'a'
e:	.byte 'e'
i:	.byte 'i'
o:	.byte 'o'
u:	.byte 'u'
blank: .byte '*'
	.text
	.globl main
main:
	la $s0,array
	li $s1,0
	li $s2,16
	li $t1,0
	lb $t2,a
	lb $t3,e
	lb $t4,i
	lb $t5,o
	lb $t6,u
loop:
	lw $t0,0($s0)
	seq $s3,$t0,$t2
	beq $s3,1,ayes
	seq $s3,$t0,$t3
	beq $s3,1,eyes
	seq $s3,$t0,$t4
	beq $s3,1,iyes
	seq $s3,$t0,$t5
	beq $s3,1,oyes
	seq $s3,$t0,$t6
	beq $s3,1,uyes
	back:		
	addi $s1,$s1,1
	addi $s0,$s0,4
	bne $s1,$s2,loop
ayes:
	addi $t1,$t1,1
	lb $t2,blank
	j back
eyes:
	addi $t1,$t1,1
	lb $t3,blank
	j back
iyes:
	addi $t1,$t1,1
	lb $t4,blank
	j back
oyes:
	addi $t1,$t1,1
	lb $t5,blank
	j back
uyes:
	addi $t1,$t1,1
	lb $t6,blank
	j back
exit:
	add $a0,$t1,0
	li $v0,1
	syscall
	li $v0,10
	syscall