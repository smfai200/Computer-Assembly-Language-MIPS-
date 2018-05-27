.data
msg: .asciiz "Enter a Number: "
result: .asciiz "The Result of Sum is: "
.text
li $s0,0

li $v0,4
la $a0,msg
syscall

li $v0,5
syscall
move $t0,$v0
   
b repeat

repeat:
   beq $t0,0,display
   add $s0, $s0, $t0 #SUMMING UP
   subi $t0,$t0,1
   j repeat
   
display:
   li $v0,4
   la $a0,result
   syscall

   li $v0,1
   move $a0,$s0
   syscall
   b exit
 
exit:
   li $v0,10
   syscall