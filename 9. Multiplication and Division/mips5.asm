.data
msg: .asciiz "Enter a Number: "
rmsg: .asciiz "Factorial is: "

.text
li $v0,4
la $a0,msg
syscall

li $v0,5
syscall
move $t0,$v0

move $s0,$t0
move $s1,$t0
factorial:
	beq $t0,0,fact0
  loop_:
  	beq $s1,1,display
  	subi $s1,$s1,1
  	mult $s0,$s1
  	mflo $s0
  	b loop_
fact0:
	li $s0,1
	b display

display:
	li $v0,4
	la $a0,rmsg
	syscall
	
	li $v0,1
	move $a0,$s0
	syscall