.data
upmsg: .asciiz "Enter Number: "
pmsg: .asciiz ""

.text
main:
  li $s0,8
  
  li $v0,4
  la $a0,upmsg
  syscall
  
  li $v0,5
  syscall
  move $t0,$v0
  not $t1,$t0
   not $t2,$s0
   
  li $v0,35
  move $a0,$t1
  syscall
  
  li $v0,11
  li $a0,10
  syscall
  
  li $v0,35
  move $a0,$t2
  syscall
  