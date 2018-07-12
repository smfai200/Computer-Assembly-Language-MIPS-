.data
msg: .asciiz "Enter the value of b: "
msg1: .asciiz "Enter the value of c: "
rmsg: .asciiz "\nResult is: "
dmsg: .asciiz "."
.text
li $s6,1

li $v0,4
la $a0,msg
syscall

li $v0,5
syscall
move $t0,$v0 #b

li $v0,4
la $a0,msg1
syscall

li $v0,5
syscall
move $t1,$v0 #c

question1:
#A=(b*5)/(c*2)
li $t2,5
mult $t0,$t2
mflo $s0

li $t2,2
mult $t1,$t2
mflo $s1

div $s0,$s1
mflo $s0
mfhi $s1
b display

question2: #A=(b/2*c*6553667);
	div $t0,$t2
	mflo $t5

	li $t4,6553667
	mult $t1,$t4
	mflo $t6

	mult $t5,$t6
	mflo $s0
	mfhi $s1
	b display
	
display:
	li $v0,4
	la $a0,rmsg
	syscall
	
	li $v0,1
	move $a0,$s0
	syscall
	
	li $v0,4
	la $a0,dmsg
	syscall
	
	li $v0,1
	move $a0,$s1
	syscall
	addi $s6,$s6,1
	beq $s6,2,question2
	beq $s6,3,question3
	
question3:
#Later Implementation




