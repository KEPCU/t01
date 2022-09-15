.data
    text1: .asciiz "\n Enter dividend: "
    text2: .asciiz "\n Enter divisor: "    
    text3: .asciiz "\n Error! Can't divide by 0"
.text

    # print
    main:
    li $v0,4
    la $a0,text1
    syscall

    # get
    li $v0,6
    syscall

    li $v0,10
    syscall
    mov.s $f1, $f0

    # print    
    li $v0,4
    la $a0,text2
    syscall

    # get
    li $v0,6
    syscall
    mov.s $f2, $f0

    # f2 = 0
    beq $f2,0, IF 
        div.s $f12, $f1, $f2
        li $v0,10
        
        b END_IF
    IF:
        li $v0,4
        la $a0,text3

    END_IF:
    syscall

jr $ra