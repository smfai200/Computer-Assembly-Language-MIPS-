.data
msg0: .asciiz "Enter a Number: "
rmsg: .asciiz "Answer is: "

.text
li $t1,2

li $v0,4
la $a0,msg0
syscall

li $v0,5
syscall
move $t0,$v0

sll $s0,$t0,4
mult $t0,$t1
mflo $t3

add $s0,$s0,$t3
display:
	li $v0,4
	la $a0,rmsg
	syscall
	
	li $v0,1
	move $a0,$s0
	syscall