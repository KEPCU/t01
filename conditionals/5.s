.data
    text1: .asciiz "\n Cual es tu edad?: "
    text2: .asciiz "\n cual es tu ingreso mensual?: "
    text3: .asciiz "\n Tienes que cotizar"
    text4: .asciiz "\n No tienes que cotizar"
.text
main:
    # print text1
    li $v0, 4
    la $a0, text1
    syscall

    # get age
    li $v0,5
    syscall
    # print int
    move $a0, $v0
    li $v0, 1
    syscall
    move $t0,$a0

    # print text2
    li $v0, 4
    la $a0, text2
    syscall

    # get salary
    li $v0,5
    syscall
    # print int
    move $a0, $v0
    li $v0, 1
    syscall
    move $t1,$a0

    # t0 > 16
    bge $t0, 16, IF 
        la $a0, text4
        b END_IF
    IF:
        bge $t1, 1000, IF2
            la $a0, text4
            b END_IF2
        IF2: 
            la $a0, text3
        END_IF2:
    END_IF:
    li $v0, 4
    syscall
jr $ra