.data
    text1: .asciiz "\n What's your age?: "
    text2: .asciiz "\n You're a minor"
    text3: .asciiz "\n You're a adult"
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
    move $t1,$a0

    # t1 > 18
    bge $t1, 18, IF 
        la $a0, text2
        b END_IF
    IF:
        la $a0, text3
    END_IF:
    li $v0, 4
    syscall
jr $ra