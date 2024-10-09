.data
    # Mapeamento dos segmentos para cada valor hexadecimal de 0 a F
    segment_map: .word 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F  # 0 a 9
    segment_map_extra: .word 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71  # A a F

.text
.globl main

main:
    li $t0, 0xFFFF0014       # Endereço para ler do teclado hexadecimal
    li $t1, 0xFFFF0010       # Endereço do display de sete segmentos (direita)
    li $t2, 0xFFFF0011       # Endereço do display de sete segmentos (esquerda)

loop:
    lb $t3, 0($t0)           # Lê o valor do teclado hexadecimal
    
    beqz $t3, loop           # Se nenhum valor foi pressionado, continua no loop
    andi $t4, $t3, 0xF       # Pega a coluna do valor (os 4 bits menos significativos)

    blt $t4, 10, show_digit  # Se for de 0 a 9, pula para exibir o dígito

    sub $t4, $t4, 10         # Ajusta o valor para o intervalo A-F
    la $t5, segment_map_extra # Carrega o endereço da tabela de A-F
    lw $t6, 0($t5)           # Carrega o valor correspondente ao caractere (A-F)
    j display

show_digit:
    la $t5, segment_map      # Carrega o endereço da tabela de 0-9
    sll $t4, $t4, 2          # Multiplica o índice por 4 (tamanho de um word)
    lw $t6, 0($t5)           # Carrega o valor correspondente ao número (0-9)

display:
    sb $t6, 0($t1)           # Exibe o valor no display de sete segmentos (direito)

    # Repete o processo
    j loop
