.data 
    b: .word 5            # Variável b armazenando -35
    d: .word 2            # Variável d armazenando 1
    e: .word 2            # Variável e armazenando 0
    c: .word              # Variável c sem valor inicial
    result: .word 0
    resultado: .word 0    # Variável para armazenar o resultado de d^3

.text
main:
    # Carregar valor de b em $t0
    lw $t0, b             # $t0 = b
    addi $t0, $t0, 35     # $t0 = b + 35 (corrigindo valor para que $t0 = 0)
    
    # Carregar valor de e em $t1 e somar com $t0
    lw $t1, e             # $t1 = e
    add $t0, $t0, $t1     # $t0 = b + 35 + e
    
    # Carregar valor de d em $t1
    lw $t1, d             # $t1 = d
    
    # Multiplicação de d^3
    mul $t2, $t1 $t1     # $t2 = d * d
    mul $t2, $t2, $t1	 # $t2 = d * d * d (d^3)
    
    # Guardar resultado de d^3 na memória (em "result")
    sw $t2, resultado        # Armazena d^3 em "result"
    
    # Subtrair o valor anterior de $t0 do valor de d^3
    sub $t0, $t2, $t0     # $t0 = d^3 - (b + 35 + e)
    
    # Guardar resultado final em c
    sw $t0, c             # Armazena o valor final de $t0 em "c"
    
    # Finalizar o programa com syscall para sair
    li $v0, 10            # syscall 10 para sair do programa
 syscall
