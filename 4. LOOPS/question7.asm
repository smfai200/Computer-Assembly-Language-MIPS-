.data
msg: .asciiz "Enter the Nth Term: "
neat: .asciiz ", "
.text
li $s0,0
li $s1,1
li $s2,0

li $v0,4
la $a0,msg
syscall
   
li $v0,5
syscall
move $t0,$v0

li $v0,1 # PRINTS 0
move $a0,$s0
syscall

li $v0,4 #PRINTS ,  
la $a0,neat
syscall

li $v0,1 #PRINTS 1
move $a0,$s1
syscall

add $s2,$s0,$s1

b repeat

repeat:
   li $v0,4 #PRINTS ,  
   la $a0,neat
   syscall
   
   li $v0,1
   move $a0,$s2
   syscall
   
   move $s0,$s1
   move $s1,$s2
   add $s2,$s0,$s1
   
   
   bgt $s2,$t0,exit
   j repeat
   
exit:
   li $v0,10
   syscall