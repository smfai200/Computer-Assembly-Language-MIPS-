.data
str: .space 128 
msg: .asciiz "Enter a String to reverse :\n"
msg1: .asciiz "After Reverse the String is :\n"

.text
main:

 li $v0,4
 la $a0,msg
 syscall

 li    $v0, 8      
 la    $a0, str     
 li    $a1, 128   
 syscall

 li $t1, 0
 li $s0,0
 li $t2,4
 
push:
	lbu $t0, str($t1)
	beqz $t0,popmsg
	subiu $sp,$sp,4
	sw $t0,($sp)
	addi $t1,$t1,1
	j push
popmsg:
	 li $v0,4
 	 la $a0,msg1
 	 syscall
pop:
	addu $sp,$sp,4
	lw $t0,0($sp)
	beqz $t0,exit
	li $v0,11
	move $a0,$t0
	syscall
	j pop
	
exit:
	li $v0,10
	syscall
	
	
	