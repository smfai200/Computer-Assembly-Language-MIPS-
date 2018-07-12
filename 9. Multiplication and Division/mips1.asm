.data
msg: .asciiz "Quotient is: "
msg1: .asciiz "\nRemainder Is: "

.text
main: #---------------------
addi $t0, $0, 60
addi $t1, $0, 7
div $t0, $t1
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