.data
msg: .asciiz "\nEnter A Number: "
menu: .ascii "\nPress 4 for Dividing by 4"
menu1: .ascii "\nPress 8 for Dividing by 8"
menu2: .ascii "\nPress 16 for Dividing by 16"
menu3: .asciiz "\nEnter a Choice: "
errormsg: .asciiz " Invalid Choice "
resmsg: .asciiz "\n Result is: "
.text
main:
	li $v0,4
	la $a0,msg
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	bltz $t0,error
	
	li $v0,4
	la $a0,menu
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	beq $t1,4,four
	 beq $t1,8,eight
	  beq $t1,16,sixteen
	b error
	
four:
	srl $s0,$t0,2
	b display
eight:
	srl $s0,$t0,3
	b display
sixteen:
	li $t1,4
	srlv $s0,$t0,$t1
	b display
	
display:
	li $v0,4
	la $a0,resmsg
	syscall
	
	li $v0,1
	move $a0,$s0
	syscall
	b exit
	
error:
	li $v0,4
	la $a0,errormsg
	syscall 
	
	b main

exit:
	li $v0,10
	syscall
	
	