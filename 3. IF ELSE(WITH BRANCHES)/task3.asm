#TASK 3
.data
msg1: .asciiz "Enter Your Age: "
resultmsg: .asciiz "You are Eligible to Vote! "
errormsg: .asciiz "You are Not Eligible to Vote! "

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

#Conditional Branches
blt $t0,18,Else
   la $a1,resultmsg
   b display
   
Else:
   la $a1,errormsg
   b display

display:
  li $v0,4
  move $a0, $a1
  syscall
  b exit
  
exit:
  li $v0,10
  syscall
  


