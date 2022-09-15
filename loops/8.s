.data
    text1: .asciiz "Introduce la altura del triángulo (entero positivo): "
    text2: .asciiz "\n"
    text3: .asciiz " "
.text
main:
     # index
    li $t0, 1

    li $t3, 0

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
    add $t2, $a0, 1

     # print text2
    li $v0, 4
    la $a0, text2
    syscall

    Loop:
        bge $t0, $t2, Exit
        add $t1, $t0, 0

        Loop2:
            bge $t3,$t1, Exit2

            # print int
            add $t4, $t1, 0
            move $a0, $t4
            li $v0, 1
            syscall

            # print text3
            li $v0, 4
            la $a0, text3
            syscall

            sub $t1, $t1, 2
        j Loop2
        Exit2:

        # print text2
        li $v0, 4
        la $a0, text2
        syscall
        add $t0, $t0, 2

    j Loop
    Exit:

    jr $ra