.data
    text1: .asciiz "\n ¿Cómo te llamas?  "
    text2: .asciiz "\n ¿Cuál es tu sexo (M o H)? "
    text3: .asciiz "M"
    text4: .asciiz "m"
    text5: .asciiz "A"
    text6: .asciiz "B"
    text7: .asciiz "n"
    buffer: .space 20
.text
main:
    # print
    addi $v0,4
    la $a0,text1
    syscall
    # get string 
    li $v0,8
    la $a0,buffer
    li $a1,20
    syscall   

    la $a0,text4  # pass address of buffer
    la $a1,buffer  # pass address of buffer
    jal IF2  # call strcmp

    beq $v0,$zero,IF # check result
    j main

    IF:
        li $v0,4
        la $a0,text2
        syscall
        j END_IF
    Exit:
    li $v0,10
    syscall

    IF2:
        add $t0,$zero,$zero
        add $t1,$zero,$a0
        add $t2,$zero,$a1
    IF4: 
        addi $v0,$zero,1
        j END_IF
    IF3:
        bnez $t4,IF4
        add $v0,$zero,$zero
    END_IF:
    jr $ra