.data
str: .space 128 
msg: .asciiz "Enter Character: \n"
msg1: .asciiz "\n After Reverse the String is :\n"

.text
li $s1,0
main:

 li $v0,4
 la $a0,msg
 syscall
 
input:
 li  $v0, 12
 syscall
 move $t0,$v0   
 
push:
	beq $t0,' ',popmsg
	subiu $sp,$sp,4
	sw $t0,($sp)
	addi $s1,$s1,1
	j input
popmsg:
	 li $v0,4
 	 la $a0,msg1
 	 syscall
pop:
	subi $s1,$s1,1
	lw $t0,0($sp)
	addu $sp,$sp,4
#	beqz $t0,exit
	blt $s1,0,exit
	li $v0,11
	move $a0,$t0
	syscall
	j pop
	
exit:
	li $v0,10
	syscall
	
	
	
