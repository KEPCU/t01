.data
    text1: .asciiz "\n ingresa la puntuacion "
    text2: .asciiz "inaceptable \n"
    text3: .asciiz "aceptable \n"
    text4: .asciiz "meritorio \n"
    text5: .asciiz "\n Esta puntuacion no es valida \n"
    text6: .asciiz "\n tu nivel de rendimiento es: "
    text7: .asciiz "\n te corresponde cobrar: "
.text
main:
    # print text1
    li $v0,4
    la $a0,text1
    syscall

    # get float
    li $v0,6
    syscall
    mov.s $f1, $f0

    li.s $f0, 0.0
    mov.s $f2, $f0

    c.eq.s $f1, $f2

    bc1f IF
    IF:
        li $v0,4
        la $a0,text2
        b END_IF
    END_IF:

    # print     
    
    syscall

    div.s $f12, $f1, $f2

    # print float
    li $v0,2
    syscall
    
   
    li $v0,10
    syscall