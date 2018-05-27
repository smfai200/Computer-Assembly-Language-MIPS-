.data

.text
li $t0,0

b repeat

repeat:
   bgt $t0,256,exit
   
   li $v0,11
   move $a0,$t0
   syscall
   
   li $v0,11
   li $a0,10
   syscall
   
   addi $t0,$t0,1
   j repeat
 
exit:
   li $v0,10
   syscall