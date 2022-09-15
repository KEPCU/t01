.data
    text1: .asciiz "\n"
    text2: .asciiz " "
.text
main:
     # index
    li $t0, 1

    li $t1, 1


    Loop:
        bge $t0,11, Exit
        li $t1, 1

        Loop2:
            bge $t1,11, Exit2

            # print int
            mul $a0, $t0, $t1
            li $v0, 1
            syscall

            # print text2
            li $v0, 4
            la $a0, text2
            syscall

            add $t1, $t1, 1
        j Loop2
        Exit2:

        # print text1
        li $v0, 4
        la $a0, text1
        syscall
        add $t0, $t0, 1

    j Loop
    Exit:

    jr $ra