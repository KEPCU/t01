.data
    text1: .asciiz "\n Introduce una palabra:"
    text2: .asciiz "\n"
    buffer: .space 20
.text
main:
     # index
    li $t0, 0

    # iterations
    li $t1, 10 

    # print text1
    li $v0, 4
    la $a0, text1
    syscall

    # get 
    li $v0,8 
    la $a0, buffer 
    li $a1, 20 
    syscall

    move $t2,$a0 

    # print string
    li $v0, 4
    syscall
    la $a0, buffer 

    Loop:
        beq $t0,$t1, Exit

        li $v0, 4 
        la $a0, buffer
        syscall

        add $t0, $t0, 1
    j Loop
    Exit:

    jr $ra