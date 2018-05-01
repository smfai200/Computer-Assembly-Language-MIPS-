#TASK 1
.data
msg1: .asciiz "Enter a Number: "
resultmsg: .asciiz "The Value of $s0 is: "

.text
li $v0,4
la $a0,msg1
syscall

li $v0,5
syscall
move $t0,$v0

#NewLine
li $v0,11
li $a0,10
syscall

li $v0,4
la $a0,msg1
syscall

li $v0,5
syscall
move $t1,$v0
slt $s0, $t0, $t1

#NewLine
li $v0,11
li $a0,10
syscall

li $v0,4
la $a0,resultmsg
syscall

li $v0,1
move $a0,$s0
syscall


