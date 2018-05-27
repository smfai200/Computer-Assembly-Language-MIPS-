#Write a program that convert upper case letter to lower case letter

.data
err: .asciiz "Error Occured!"
upmsg: .asciiz "Enter a Capital Alphabet: "
lmsg: .asciiz "Enter a Lower Alphabet: "
rmsg: .asciiz "\n The Result is: "

.text
li $s0,0x20
main:
  li $v0,4
  la $a0,upmsg
  syscall

   li $v0,12
   syscall
   move $t0,$v0

   blt $t0,'A',error
    bgt $t0,'Z',error

Upper:
  xor $t2,$t0,$s0
  li $v0,4
  la $a0,rmsg
  syscall
  
  li $v0,11
  move $a0,$t2
  syscall
  b exit
  
error:
  li $v0,4
  la $a0,err
  syscall
  
exit:
  li $v0,10
  syscall
  