.data
    text1: .asciiz "\n What's your age?: "
    text2: .asciiz "\n el precio de entrada es "
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


    li $a0, 3
    bge $a0, $t0, IF
        li $a0, 18
    bge $a0, $t0, IF2
        li $a0, 10
        move $t0,$a0
        b END_IF
    IF:
        li $a0, 0
        move $t0,$a0
        b END_IF
    IF2:
        li $a0, 4
        move $t0,$a0
    END_IF:
    la $a0, text2
    li $v0, 4
    syscall

    move $a0,$t0
    li $v0, 1
    syscall

jr $ra