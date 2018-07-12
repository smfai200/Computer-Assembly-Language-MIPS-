.data
array: .space 40
msg: .asciiz "Enter the Number for Table Generation: "

.text
la $t3,array
li $t1,1
li $s0,0
input:
	li $v0,4
	la $a0,msg
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0

tableloop:
	mul $t2,$t0,$t1
	sw $t2,($t3)
	addi $t3,$t3,4
	beq $t1,10,predisplay
	addi $t1,$t1,1
	b tableloop

predisplay:
	la $t3,array
	li $s3,'*'
	li $s4,'='
	li $s5,1
	
display:
	li $v0,1
	move $a0,$t0
	syscall
	
	li $v0,11
	move $a0,$s3
	syscall
	
	li $v0,1
	move $a0,$s5
	syscall
	
	li $v0,11
	move $a0,$s4
	syscall
	
	li $v0,1
	lw $a0,($t3)
	syscall
	
	li $v0,11
	li $a0,10
	syscall
	
	beq $s5,10,exit
	addi $t3,$t3,4
	addi $s5,$s5,1
	b display

exit:
	li $v0,10
	syscall
	
	
	