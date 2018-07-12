.data
msg0: .asciiz "Enter Divisor: "
msg01: .asciiz "Enter Divident: "
msg: .asciiz "Quotient is: "
msg1: .asciiz "\nRemainder Is: "

.text
main: #---------------------

li $v0,4
la $a0,msg0
syscall

li $v0,5
syscall
move $t0,$v0

li $v0,4
la $a0,msg01
syscall

li $v0,5
syscall
move $t1,$v0

div $t1, $t0
mflo $s0
mfhi $s1

li $v0,4
la $a0,msg
syscall

li $v0,1
move $a0,$s0
syscall

li $v0,4
la $a0,msg1
syscall

li $v0,1
move $a0,$s1
syscall