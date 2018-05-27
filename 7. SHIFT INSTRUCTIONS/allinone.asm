.data
msg: .asciiz "\nEnter A Number: "
menu: .ascii "\nPress 1 for Multiplication"
menu1: .ascii "\nPress 2 for Divison"
menu2: .ascii "\nPress 3 for ROL/ROR"
menu3: .ascii "\nPress 4 for Exit"
menu4: .asciiz "\nEnter a Choice: "

menu0: .ascii "\nPress 4 for Multiply by 4"
menu01: .ascii "\nPress 8 for Multiply by 8"
menu02: .ascii "\nPress 16 for Multiply by 16"
menu03: .asciiz "\nEnter a Choice: "

menu11: .ascii "\nPress 4 for Division by 4"
menu12: .ascii "\nPress 8 for Division by 8"
menu13: .ascii "\nPress 16 for Division by 16"
menu14: .asciiz "\nEnter a Choice: "

rolmenu: .ascii "\n Press 1 for Rol Left"
rolmenu2: .ascii "\n Press 2 for Rol Right"
rolmenu3: .asciiz "\nEnter a Choice: "
rolopt: .asciiz "\n Enter the Amount of Roll: "

errormsg: .asciiz " Invalid Choice "
resmsg: .asciiz "\n Result is: "

.text
main:
	li $v0,4
	la $a0,menu
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	beq $t1,1,inputuser
	 beq $t1,2,inputuser
	  beq $t1,3,inputuser
	   beq $t1,4,exit
	b error
	
inputuser:
	li $v0,4
	la $a0,msg
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	beq $t1,1,multiply
	 beq $t1,2,division
	  beq $t1,3,roller
multiply:
	li $v0,4
	la $a0,menu0
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	beq $t1,4,fourmul
	 beq $t1,8,eightmul
	  beq $t1,16,sixteenmul
	b error
	
	fourmul:
		sll $s0,$t0,2
		b display
	eightmul:
		sll $s0,$t0,3
		b display
	sixteenmul:
		li $t1,4
		sllv $s0,$t0,$t1
		b display
division:
	li $v0,4
	la $a0,menu11
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	beq $t1,4,fourdiv
	 beq $t1,8,eightdiv
	  beq $t1,16,sixteendiv
	b error
	
	fourdiv:
		sra $s0,$t0,2
		b display
	eightdiv:
		sra $s0,$t0,3
		b display
	sixteendiv:
		li $t1,4
		srav $s0,$t0,$t1
		b display
roller:
	li $v0,4
	la $a0,rolmenu
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	li $v0,4
	la $a0,rolopt
	syscall
	
	li $v0,5
	syscall
	move $t2,$v0
	beq $t1,1,roleft
	 beq $t1,2,roright
	 
	 roleft:
		rol $s0,$t0,$t2
		b display
	roright:
		ror $s0,$t0,$t2
		b display
	b error
error:
	li $v0,4
	la $a0,errormsg
	syscall 
	b main
	
display:
	li $v0,4
	la $a0,resmsg
	syscall
	
	li $v0,1
	move $a0,$s0
	syscall
	b main
	
exit:
	li $v0,10
	syscall