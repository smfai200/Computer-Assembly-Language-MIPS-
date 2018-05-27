#Write a program that convert upper case letter to lower case letter

.data
err: .asciiz "\n ODD!"
upmsg: .asciiz "Result: "
pmsg: .asciiz ""

.text
main:
  li $v0,4
  la $a0,upmsg
  syscall
  
  li $v0,5
  syscall
  move $t0,$v0
  
  ori $t2,$t0,0xAAAAAAA
  li $t4,0xAAAAAAA
  
  li $t1,50
  or $s2,$t1,$t4
  
  li $v0,4
  la $a0,upmsg
  syscall
  
  li $v0,35
  move $a0,$t2
  syscall

  li $v0,11
  li $a0,10
  syscall

  li $v0,4
  la $a0,upmsg
  syscall

  li $v0,35
  move $a0,$s2
  syscall
  
  li $v0,10
  syscall
  