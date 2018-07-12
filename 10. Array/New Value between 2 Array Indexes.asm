.data
num1: .word 10
num2: .word 20
.text

la $t0,num1
la $t1,num2

lw $t2,($t1)
lw $t3,($t0)
move $t0,$t2
move $t1,$t3

li $v0,1
move $a0,$t0
syscall

li $v0,11
li $a0,10
syscall

li $v0,1
move $a0,$t1
syscall
