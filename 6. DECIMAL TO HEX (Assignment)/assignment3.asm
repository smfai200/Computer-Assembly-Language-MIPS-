.data
msg: .asciiz "\nEnter a Hex Digit: "
decimalmsg: .asciiz "\nIn Decimal, It is: "
choice: .asciiz "\nDo you want to enter another hex digit: "
errormsg: .asciiz "\nWrong input - Please enter a right input"
lockmsg: .asciiz "\n You have Exhausted All Your Tries! "

.text
li $s3,0
main:
	li $v0,4
	la $a0,msg
	syscall
	
	li $v0,12
	syscall
	move $s0,$v0 #Store the Value of User to $s0
	
decimalp: #Implements Checks
	sge $t0,$s0,'0'
	 sle $t1,$s0,'9'
	  and $t2, $t0, $t1
	beq $t2,1,numrange
	
	sge $t0,$s0,'A'
	 sle $t1,$s0,'F'
	  and $t3, $t0, $t1
	beq $t3,1,alpharange
	
  	b error
numrange: #If between 0-9
	subi $s0,$s0,48
	b display
alpharange: #If Between A-F
	subi $s0,$s0,55
display: #Display Decimal of Hex!
	li $v0,4
	la $a0,decimalmsg
	syscall
	
	li $v0,1
	move $a0,$s0
	syscall	 
	b choicep
choicep:
	li $v0,4
	la $a0,choice
	syscall
	
	li $v0,12
	syscall
	move $t0,$v0
	
	beq $t0,'y',main
	 beq $t0,'Y',main
	beq $t0,'n',exit
	 beq $t0,'N',exit
error:
	li $v0,4
	la $a0,errormsg
	syscall
	addi $s3,$s3,1
	beq $s3,3,lock
	b choicep
lock:
	li $v0,4
	la $a0,lockmsg
	syscall
exit:
	li $v0,10
	syscall
	
