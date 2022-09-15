.data
    text1: .asciiz "\n Enter number: "
    text2: .asciiz "\n Is par " 
    text3: .asciiz "\n Is odd"
.text
main:
    # print text1
    li $v0, 4
    la $a0, text1
    syscall

    # get dividend
    li $v0,5
    syscall
    # print int
    move $a0, $v0
    li $v0, 1
    syscall
    move $t0,$a0

    div $a0, $t0,2
    mfhi $t1

    # t1 = 0
    beq $t1, 0, IF 
        la $a0, text3
        b END_IF
    IF:
        la $a0, text2
    END_IF:
    li $v0, 4
    syscall

jr $ra

