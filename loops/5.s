.data
    text1: .asciiz "\n ¿Cantidad a invertir?  "
    text2: .asciiz "\n ¿Interés porcentual anual? "
    text3: .asciiz "\n ¿Años? "
    text4: .asciiz "\n Capital tras "
    text5: .asciiz " años: "
    buffer: .space 20
.text
main:
     # index
    li $t0, 1

    # print text1
    li $v0, 4
    la $a0, text1
    syscall

    # get 
    li $v0,6
    syscall
    mov.s $f1, $f0

    # print text2
    li $v0, 4
    la $a0, text2
    syscall

    # get 
    li $v0,6
    syscall
    mov.s $f2, $f0

    # print text3
    li $v0, 4
    la $a0, text3
    syscall

    # get 
    li $v0,5
    syscall
    add $t1, $v0, 1
    
    li.s $f5, 1.0
    li.s $f6, 10.0
    

    Loop:
        bge $t0,$t1, Exit

        # print text
        li $v0, 4
        la $a0, text4
        syscall

        # print int
        add $a0, $t0, 0
        li $v0, 1
        syscall

        # print text
        li $v0, 4
        la $a0, text5
        syscall

        add.s $f3, $f2 , $f5
        div.s $f3, $f3, $f6
        mul.s $f1, $f1, $f3

        mul.s $f12, $f1, $f5
        # print float
        li $v0,2
        syscall

        add $t0, $t0, 1
        
        j Loop
    Exit:

    jr $ra