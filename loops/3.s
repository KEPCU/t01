.data
    text1: .asciiz "\n Introduce un número entero positivo:  "
    text2: .asciiz " , "
    text3: .asciiz "\n"
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

    # print text
        li $v0, 4
        la $a0, text3
        syscall

    Loop:
        bge $t0,$t1, Exit

        # print int
        add $a0, $t0, 0
        li $v0, 1
        syscall

        # print text
        li $v0, 4
        la $a0, text2
        syscall

        add $t0, $t0, 2
        
        j Loop
    Exit:

    jr $ra