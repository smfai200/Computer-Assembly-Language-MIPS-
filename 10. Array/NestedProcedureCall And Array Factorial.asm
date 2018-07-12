.data
array1: .space 20

.text
la $t0,array1
li $t1,2
li $t2,3
li $t3,4
li $t4,5
li $t5,6

sw $t1,($t0)
addi $t0,$t0,4

sw $t2,($t0)
addi $t0,$t0,4

sw $t3,($t0)
addi $t0,$t0,4

sw $t4,($t0)
addi $t0,$t0,4

sw $t5,($t0)

li $s1,0
la $t0,array1 #reload array

arraytofact:
	lw $a0,0($t0)
	move $s4,$a0
	beq $a0,6,exit
	li $t2,1
	jal factorial
	move $s0,$v0 #store return value
	add $s1,$s1,$s0 #Sum up all
	addi $t0,$t0,4
	j arraytofact
	
factorial:
	beq $s4,1,exitfact
	mul $t2, $s4, $t2
	subi $s4,$s4,1
	move $v0,$t2
	j factorial
	
exitfact:
	jr $ra
	
exit:
	li $v0,1
	move $a0,$s1
	syscall