.data
    text1: .asciiz "\n Bienvenido a la pizzeria Bella Napoli.\n Tipos de pizza \n 1- Vegetariana\n 2- No vegetariana \n "
    text2: .asciiz "\n Introduce el número correspondiente al tipo de pizza que quieres: "    
    text3: .asciiz "\n Ingredientes de pizzas vegetarianas\n 1- Pimiento \n 2- Tofu\n"
    text4: .asciiz "\n Introduce el ingrediente que deseas: "
    text5: .asciiz "\n Pizza vegetariana con mozzarella, tomate y "
    text6: .asciiz "pimiento \n"
    text7: .asciiz "tofu \n "
    text8: .asciiz "\n Ingredientes de pizzas no vegetarianas \n 1- Peperoni \n 2- Jamón \n 3- Salmón\n"
    text9: .asciiz "\n Introduce el ingrediente que deseas:"
    text10: .asciiz "\n Pizza no vegetarina con mozarrella, tomate y "
    text11: .asciiz "peperoni \n "
    text12: .asciiz "jamón \n "
    text13: .asciiz "salmón \n "
.text

main:
    # print text1
    li $v0, 4
    la $a0, text1
    syscall

    # print text2
    li $v0, 4
    la $a0, text2
    syscall

    # get 
    li $v0,5
    syscall
    move $t2, $v0

    # print 
    li $v0, 4
    la $a0, text3
    syscall
    

    # print int
    move $a0, $t2
    li $v0, 1
    syscall
    move $t0,$a0

    # t0 = 1
    beq $t0, 1, IF 
        li $v0, 4
        la $a0, text8
        syscall

        li $v0, 4
        la $a0, text9
        syscall

        # get
        li $v0,5
        syscall
        
        # print int
        move $a0, $v0
        li $v0, 1
        syscall
        move $t0,$a0

        # print 
        li $v0, 4
        la $a0, text10
        syscall

        beq $t0, 1, IF3
        beq $t0, 2, IF4
            # print 
            li $v0, 4
            la $a0, text13
            syscall
            b END_IF
        IF3:
            # print 
            li $v0, 4
            la $a0, text11
            syscall
            b END_IF
        IF4:
            # print 
            li $v0, 4
            la $a0, text12
            syscall
            b END_IF
        b END_IF
    IF:
        # print 
        li $v0, 4
        la $a0, text4
        syscall

        # get
        li $v0,5
        syscall

        # print int
        move $a0, $v0
        li $v0, 1
        syscall
        move $t0,$a0

        # print 
        li $v0, 4
        la $a0, text5
        syscall

        beq $t0, 1, IF2
            # print 
            li $v0, 4
            la $a0, text7
            syscall
            b END_IF
        IF2:
            # print 
            li $v0, 4
            la $a0, text6
            syscall
            b END_IF
    END_IF:

jr $ra