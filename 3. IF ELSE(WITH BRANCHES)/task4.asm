#TASK 4
.data
msg1: .asciiz "Enter a Number: "
resultmsg: .asciiz "The Result is: "

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

blt $t0,$t1,Else 
  add $s1,$t0,$t1
  move $s0,$s1
  b display
  
Else:
  sub $s1,$t0,$t1
  move $s0,$s1
  b display

display:
  li $v0,4
  la $a0,resultmsg
  syscall
	  
  li $v0,1
  move $a0,$s0
  syscall
  b exit
  
exit:
  li $v0,10
  syscall
  


