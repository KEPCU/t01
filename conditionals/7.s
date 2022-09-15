.data
    text1: .asciiz "\n cual es tu renta anual?: "
    text2: .asciiz "\n tienes que pagar "
.text
main:
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
    move $t0,$a0

    # a0 <  t0
    li $a0, 10000
    bge $a0 , $t0 , IF 
    li $a0, 20000
    bge $a0 , $t1 , IF2 
    li $a0, 35000
    bge $a0 , $t1 , IF3 
    li $a0, 60000
    bge $a0 , $t1 , IF4 
        mul $a0, $t0, 45
        b END_IF
    IF:
        mul $a0, $t0, 5
        b END_IF
    IF2:
        mul $a0, $t0, 15
        b END_IF
    IF3:
        mul $a0, $t0, 20
        b END_IF
    IF4:
        mul $a0, $t0, 30
        b END_IF    
    END_IF:
    move $t0,$a0
    li $v0, 4
    la $a0, text2
    syscall

    div $a0, $t0, 100
    li $v0, 1
    syscall

jr $ra