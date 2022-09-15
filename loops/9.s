.data
    text1: .asciiz "\n Introduce la contraseña: "
    text2: .asciiz "\n Contraseña correcta"
    text3: .asciiz "contraseña"
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
    Loop:
        lb $t3($t1)  # load a byte from each string
        lb $t4($t2)
        beqz $t3,IF3 # str1 end
        beqz $t4,IF4
        slt $t5,$t3,$t4  # compare two bytes
        bnez $t5,IF4
        addi $t1,$t1,1  # t1 points to the next byte of str1
        addi $t2,$t2,1
        j Loop

    IF4: 
        addi $v0,$zero,1
        j END_IF
    IF3:
        bnez $t4,IF4
        add $v0,$zero,$zero
    END_IF:
    jr $ra