.data 
    text1: .asciiz "Introduce un número entero positivo mayor que 2:  "
    text2: .asciiz "\n primo"
    text3: .asciiz "\n no primo"
.text
main:
    li $v0, 4
    la $a0, text1
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0
    
    add $t1, $t1, 1
    add $t2, $t2, 2
    ble $t0, $t1, Loop2
    beq $t0, $t2, Loop
    div $t0, $t2
    
    mflo $s0
    
    mfhi $s1

    beq $s1, $zero, Loop
    Loop:
        li $v0, 4
        la $a0, text2
        syscall
        j Exit
    Loop2:
        li $v0, 4
        la $a0, text3
        syscall
        j Exit
    Exit:
        li $v0, 10
        syscall

jr $ra