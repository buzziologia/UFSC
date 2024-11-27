.data 
    # --------------- ESTOQUE ---------------
    # Ingredientes      # Quantidade Inicial
    cafe:       .word 20
    leite:      .word 20
    chocolate:  .word 20
    acucar:     .word 20
    
    # --------------- TAMANHO ---------------
    tamanho:    .word 1
    
    # --------------- PROMPTS ---------------
    marca:      .asciiz "CoffeBreak \n"
    bem_vindo:  .asciiz "Bem Vindo \n"
    sel_beb:    .asciiz "Escolha sua bebida: \n1 - Café Puro \n2 - Café com Leite \n3 - Mocaccino"
    sel_tam:    .asciiz "Escolha o tamanho da bebida: \n1 - Pequeno \n2 - Grande"
    sel_acu:    .asciiz "Escolha o adoçante: \n1 - Com açucar \n2 - Sem açucar"
    branco:     .asciiz "\n \n "
    quebra_pagina: .asciiz "--------------- Coffe Break --------------- \n" 
    
    # --------------- Mapeamento dos segmentos ---------------
    teclado:
        .word 0x11  # tecla 0
        .word 0x21  # tecla 1
        .word 0x41  # tecla 2
        .word 0x81  # tecla 3
        .word 0x12  # tecla 4
        .word 0x22  # tecla 5
        .word 0x42  # tecla 6
        .word 0x82  # tecla 7
        .word 0x14  # tecla 8
        .word 0x24  # tecla 9
        .word 0x44  # tecla A
        .word 0x84  # tecla B
        .word 0x18  # tecla C
        .word 0x28  # tecla D
        .word 0x48  # tecla E
        .word 0x88  # tecla F
    
    numero_7seg:
        .word 0x3F  # 0
        .word 0x06  # 1
        .word 0x5B  # 2
        .word 0x4F  # 3
        .word 0x66  # 4
        .word 0x6D  # 5
        .word 0x7D  # 6
        .word 0x07  # 7
        .word 0x7F  # 8
        .word 0x6F  # 9
        .word 0x77  # A
        .word 0x7C  # B
        .word 0x39  # C
        .word 0x5E  # D
        .word 0x79  # E
        .word 0x71  # F

.text
.globl main

main:
    # --------------- ESTOQUE ---------------
    lw $s0, cafe
    lw $s1, leite
    lw $s2, chocolate
    lw $s3, acucar
    
    # --------------- DISPLAY ---------------
    li $s4, 0xffff0010  # 7SEG
    li $s5, 0xffff0012  # SELECIONADOR
    li $s6, 0xffff0014  # RECEPTOR
    
    j COFFE_BREAK
        
COFFE_BREAK: 
    jal SELECIONAR_BEBIDA   # Selecionar bebida

    j COFFE_BREAK          # Voltar para COFFE_BREAK para nova seleção

SELECIONAR_BEBIDA:
    # Quebra página
    la $a0, quebra_pagina
    li $v0, 4
    syscall
    
    # Seleção de bebida
    la $a0, sel_beb
    li $v0, 4
    syscall
    
    jal LER_TECLADO       # Chama a função para ler o teclado
    move $t0, $v0         # Move o valor retornado para $t0 (apenas para exemplo)

    # Imprimir o valor retornado (apenas para verificação)
    move $a0, $t0
    li $v0, 1             # Syscall para imprimir inteiro
    syscall               # Chama syscall

    jr $ra                # Retorna para o chamador

# Função para ler o teclado e exibir no display de 7 segmentos
LER_TECLADO:
    li $t1, 1            # $t1 recebe a linha a ser lida (1a linha)

scan_loop:
    sb $t1, 0($s5)       # Armazena no selecionador a linha a ser inspecionada
    lb $t2, 0($s6)       # $t2 recebe o valor recebido pelo teclado naquela linha
    
    beqz $t2, next_line  # Se nenhuma tecla foi pressionada, vá para a próxima linha

    # Tecla pressionada
    li $t3, 0            # Inicia o contador_posição para saber qual tecla foi apertada

find_key:
    lw $t4, teclado($t3)  # $t4 recebe um valor de tecla do .data para comparar com a tecla pressionada
    beq $t4, $t2, display # Se a tecla for igual a pressionada, vai para o evento de imprimir o valor no display 7 seg
    
    addi $t3, $t3, 4     # Soma o contador para ir para a próxima tecla a verificar
    blt $t3, 64, find_key # Se o contador atingir o valor máximo, ele reinicia o loop para garantir que todas as teclas sejam verificadas

    j scan_loop          # Volta para o loop para verificar a próxima tecla

next_line:
    add $t1, $t1, $t1    # Incrementa para a próxima linha ser lida
    beq $t1, 16, reset_lines  # Se passar da 4ª linha, volta para a linha 1
    
    j scan_loop          # Reinicia o ciclo para a próxima linha

reset_lines:
    li $t1, 1            # Reseta a linha para 1
    j scan_loop          # Recomeça o loop

display:
    lw $t5, numero_7seg($t3)  # $t5 recebe o valor para colocar no display 7 seg correspondente à tecla apertada
    sb $t5, 0($s4)      # Imprime no display 7 seg o valor da tecla
    
    li $t6, 0           # Inicializa o temporizador
delay_loop:                
    addi $t6, $t6, 1    # Incrementa o temporizador
    li $t7, 100000      # Define o valor do temporizador
    bne $t6, $t7, delay_loop  # Compara o temporizador, espera um tempo
    
    move $v0, $t3       # Move o valor da tecla pressionada (índice) para $v0
    jr $ra              # Retorna para o chamador
