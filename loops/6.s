.data
    text1: .asciiz "\n Introduce la altura del triángulo (entero positivo): "
    text2: .asciiz "*"
    text3: .asciiz "\n"
.text
main:
     # index
    li $t0, 0

    li $t1, 0 

    # print text1
    li $v0, 4
    la $a0, text1
    syscall

    # get 
    li $v0,5
    syscall

    # print int
    move $a0, $v0
    li $v0, 1
    syscall
    add $t2, $a0, 1

    # print text3
    li $v0, 4
    la $a0, text3
    syscall

    Loop:
        bge $t0,$t2, Exit
        li $t1, 0 

        Loop2:
            bge $t1,$t0, Exit2

            # print text2
            li $v0, 4
            la $a0, text2
            syscall

            add $t1, $t1, 1
        j Loop2
        Exit2:
        # print text3
        li $v0, 4
        la $a0, text3
        syscall
        add $t0, $t0, 1
    j Loop
    Exit:

    jr $ra