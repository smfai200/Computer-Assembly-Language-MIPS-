.data
msg: .asciiz "Enter a Number: "

.text
li $s0,0

b repeat

repeat:
   li $v0,4
   la $a0,msg
   syscall
   
   li $v0,5
   syscall
   move $t0,$v0
   
   beqz $t0,display
   
   add $s0, $s0, $t0 #SUMMING UP
   
   li $v0,11
   li $a0,10
   syscall
 
   j repeat
   
display:
   li $v0,1
   move $a0,$s0
   syscall
   b exit
 
exit:
   li $v0,10
   syscall