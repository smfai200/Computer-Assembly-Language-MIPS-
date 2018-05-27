.data
menu: .asciiz "\nSelect from the given menu."
menu1: .asciiz "\nPress U/u for displaying all upper case letters"
menu2: .asciiz "\nPress L/l for displaying all lower case letters"
menu3: .asciiz "\nPress D/d for displaying all numbers between 0-9"
menu4: .asciiz "\nPress E/e for Exit"
choice: .asciiz "\nEnter the character: "
neat: .asciiz ",  "
.text
menuchoice:
	li $t0,'A'
	li $t1,'a'
	li $t2,0

	li $v0,4
	la $a0,menu
	syscall

	li $v0,4
	la $a0,menu1
	syscall

	li $v0,4
	la $a0,menu2
	syscall

	li $v0,4
	la $a0,menu3
	syscall
	
	li $v0,4
	la $a0,menu4
	syscall

	li $v0,4
	la $a0,choice
	syscall

	li $v0,12
	syscall 
	move $s0,$v0
	
	li $v0,11
   	li $a0,10
   	syscall
	
	beq $s0,'E',exit
	 beq $s0,'e',exit
	beq $s0,'U',Upper
	 beq $s0,'u',Upper
	beq $s0,'L',Lower
	 beq $s0,'l',Lower
	beq $s0,'D',PrintNum
	 beq $s0,'d',PrintNum
	 b exit

Upper:
     bgt $t0,'Z',menuchoice
     
     li $v0,11
     move $a0,$t0
     syscall
     
     li $v0,11
     li $a0,10
     syscall
     
     addi $t0,$t0,1
     j Upper
   
Lower:
     bgt $t1,'z',menuchoice
     
     li $v0,11
     move $a0,$t1
     syscall
     
     li $v0,11
     li $a0,10
     syscall
     
     addi $t1,$t1,1
     j Lower
     
PrintNum:
     bgt $t2,9,menuchoice
     
     li $v0,1
     move $a0,$t2
     syscall
     
     li $v0,11
     li $a0,10
     syscall
     
     addi $t2,$t2,1
     j PrintNum
exit:
   li $v0,10
   syscall