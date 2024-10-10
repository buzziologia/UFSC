.data
    # Mapeamento dos segmentos para cada número de 0 a 9
    segment_map:
        .word   0x3F      # 0
        .word   0x06      # 1
        .word   0x5B      # 2
        .word   0x4F      # 3
        .word   0x66      # 4
        .word   0x6D      # 5
        .word   0x7D      # 6
        .word   0x07      # 7
        .word   0x7F      # 8
        .word   0x6F      # 9

.text

main:
    li $t0, 0              # Inicializa o contador em 0
    li $t1, 10             # Define o limite do contador (10 números)
    la $t2, segment_map    # Carrega o endereço base do mapeamento dos segmentos

loop:
    lw $t3, 0($t2)         # Carrega o valor do segmento correspondente ao número atual
    li $t5, 0xFFFF0010     # Endereço do display de sete segmentos

    sb $t3, 0($t5)         # Escreve o valor no display de sete segmentos
    addi $t0, $t0, 1       # Incrementa o contador
    addi $t2, $t2, 4       # Move para o próximo valor no mapeamento dos segmentos

    # Se atingir 10, reseta o contador e volta a 0
    beq $t0, $t1, reset    # Se o contador atingir o limite, reseta

    j loop                  # Repete o loop

reset:
    li $t0, 0               # Reseta o contador para 0
    la $t2, segment_map     # Reseta o endereço base do mapeamento dos segmentos
    j loop                  # Volta para o loop

end:
    li $v0, 10              # Syscall para terminar o programa
    syscall
