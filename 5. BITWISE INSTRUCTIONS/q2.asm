#Write a program that convert upper case letter to lower case letter

.data
err: .asciiz "\n Not Even!"
upmsg: .asciiz "Enter a Number: "
pmsg: .asciiz "Result: "
.text
main:
  li $v0,4
  la $a0,upmsg
  syscall
  
  li $v0,5
  syscall
  move $t0,$v0
  
  li $v0,11
  li $a0,10
  syscall
  
  li $t1,50
  xori $t2,$t0,0x5555555
  
  li $t4,0x5555555
  xor $s2,$t1,$t4
  
  li $v0,4
  la $a0,upmsg
  syscall
  
li $v0,34
move $a0,$t2
syscall

li $v0,11
li $a0,10
syscall

  li $v0,4
  la $a0,upmsg
  syscall

li $v0,34
move $a0,$s2
syscall
  
li $v0,10
syscall
  