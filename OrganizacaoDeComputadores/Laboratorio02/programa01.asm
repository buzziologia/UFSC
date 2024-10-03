    .data
    # Mapeamento dos segmentos para cada número de 0 a 9
    segment_map: .word 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x3F

    .text
    .globl main

main:
    li $t0, 0                # Inicializa o contador em 0
    li $t1, 11                # Define o limite do contador (10 números)
    la $t2, segment_map      # Carrega o endereço base do mapeamento dos segmentos

loop:
    beq $t0, $t1, end        # Se o contador atingir o limite, termina o loop

    lw $t3, 0($t2)           # Carrega o valor do segmento correspondente ao número atual
    li $t5, 0xFFFF0011       # Endereço do display de sete segmentos

    sb $t3, 0($t5)           # Escreve o valor no display de sete segmentos


continue:
    addi $t0, $t0, 1         # Incrementa o contador
    addi $t2, $t2, 4         # Move para o próximo valor no mapeamento dos segmentos
    j loop                   # Repete o loop

end:
    li $v0, 10               # Syscall para terminar o programa
    syscall
