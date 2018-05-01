#TASK 2
.data
msg1: .asciiz "Enter a Number: "
resultmsg: .asciiz "The Greatest of Three is: "

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

#NewLine
li $v0,11
li $a0,10
syscall

li $v0,4
la $a0,msg1
syscall

li $v0,5
syscall
move $t2,$v0

#DryRun Sample Data
#1: t0=11 t1=10 t2=12
#2: t0=12 t1=11 t2 =10
#3: t0=10 t1=12 t2=11
#Conditional Branches
blt $t0,$t1,Else # t0 < t1 = (1: False, 2: False, 3: True) 
	blt $t0,$t2,Else2 # t0 < t2 = (1: True, 2: False)
	  move $s0,$t0  # Execute for Case 2
	  b display
	
	Else2: # 
	  move $s0,$t2 # Execute for Case 1
	  b display
Else:
  blt $t1,$t2,Else2
   move $s0,$t1
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
  


