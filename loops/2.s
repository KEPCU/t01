.data
    text1: .asciiz "\n ¿Cuántos años tienes? "
    text2: .asciiz "\n Has cumplido "
    text3: .asciiz " años"
    buffer: .space 20
.text
main:
     # index
    li $t0, 1

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
    add $t1, $a0, 1

    Loop:
        bge $t0,$t1, Exit

        # print text
        li $v0, 4
        la $a0, text2
        syscall

        # print int
        add $a0, $t0, 0
        li $v0, 1
        syscall

        # print text
        li $v0, 4
        la $a0, text3
        syscall

        add $t0, $t0, 1
        
        j Loop
    Exit:

    jr $ra