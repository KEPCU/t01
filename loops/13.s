.data
msg1:.asciiz "Please insert text (max 20 characters): "
msg2:.asciiz "\nNOT SAME"
msg3:.asciiz "\nSAME"
str1: .space 20
str2: .space 20
.text
.globl main
main:
addi $v0,4
la $a0,msg1
syscall
li $v0,8
la $a0,str1
addi $a1,$zero,20
syscall   #got string 1
li $v0,4
la $a0,msg1
syscall
li $v0,8
la $a0,str2
addi $a1,$zero,20
syscall   #got string 2

la $a0,str1  #pass address of str1
la $a1,str2  #pass address of str2
jal strcmp  #call strcmp

beq $v0,$zero,ok #check result
li $v0,4
la $a0,msg2
syscall
j exit
ok:
li $v0,4
la $a0,msg3
syscall
exit:
li $v0,10
syscall

strcmp:
add $t0,$zero,$zero
add $t1,$zero,$a0
add $t2,$zero,$a1
loop:
lb $t3($t1)  #load a byte from each string
lb $t4($t2)
beqz $t3,checkt2 #str1 end
beqz $t4,missmatch
slt $t5,$t3,$t4  #compare two bytes
bnez $t5,missmatch
addi $t1,$t1,1  #t1 points to the next byte of str1
addi $t2,$t2,1
j loop

missmatch: 
addi $v0,$zero,1
j endfunction
checkt2:
bnez $t4,missmatch
add $v0,$zero,$zero

endfunction:
jr $ra