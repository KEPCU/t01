.data
    text1: .asciiz "\n Enter dividend: "
    text2: .asciiz "\n Enter divisor: " 
    text3: .asciiz "\n"    
    text4: .asciiz "\n Error! Can't divide by 0"
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

    # print text2
    li $v0, 4
    la $a0, text1
    syscall

    # get divisor
    li $v0,5
    syscall
    # print int
    move $a0, $v0
    li $v0, 1
    syscall
    move $t1,$a0

    # t1 = 0
    beq $t1, 0, IF 
        la $a0, text3
        li $v0, 4
        syscall

        div $a0, $t0, $t1
        li $v0, 1
        b END_IF
    IF:
        la $a0, text4
        li $v0, 4
    END_IF:
    syscall

jr $ra