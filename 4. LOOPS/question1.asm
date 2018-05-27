.data
starline: .asciiz "********************************"
nameline: .asciiz "SYED FAIZAN"

.text
li $t0,0

li $v0,4
la $a0,starline
syscall
b repeat

repeat:
   beq $t0,10,exit
   
   li $v0,11
   li $a0,10
   syscall
   
   li $v0,4
   la $a0,nameline
   syscall
   
   addi $t0,$t0,1
   j repeat
 
exit:
   li $v0,11
   li $a0,10
   syscall  
   
   li $v0,4
   la $a0,starline
   syscall
   
   li $v0,10
   syscall