.data
msg: .asciiz "\nEnter A Number: "
errormsg: .asciiz " Invalid Choice "
resmsg: .asciiz "\n Result is: "

.text
li $s0,0
main:
	li $v0,4
	la $a0,msg
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	move $s2,$t0
display:
	li $v0,4
	la $a0,resmsg
	syscall
	
	li $v0,35
	move $a0,$s2
	syscall
	
	beq $s0,0,roleft
	 beq $s0,1,roright
	b exit
roleft:
	rol $s2,$s2,2
	addi $s0,$s0,1
	b display
roright:
	ror $s2,$t0,4
	addi $s0,$s0,1 #sets value 2
	b display
exit:
	li $v0,10
	syscall
	
	