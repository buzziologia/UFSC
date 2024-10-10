.data

# armazenando em estruturas as linhas a serem lidas, 
# os valores possíveis que o teclado pode retornar 
# e os códigos para aparecer no display
    
teclado:
    .word   0x11            # tecla 0
    .word   0x21            # tecla 1
    .word   0x41            # tecla 2
    .word   0x81            # tecla 3
    .word   0x12            # tecla 4
    .word   0x22            # tecla 5
    .word   0x42            # tecla 6
    .word   0x82            # tecla 7
    .word   0x14            # tecla 8
    .word   0x24            # tecla 9
    .word   0x44            # tecla A
    .word   0x84            # tecla B
    .word   0x18            # tecla C
    .word   0x28            # tecla D
    .word   0x48            # tecla E
    .word   0x88            # tecla F
    
numero_7seg:
    .word   0x3F            # 0
    .word   0x06            # 1
    .word   0x5B            # 2
    .word   0x4F            # 3
    .word   0x66            # 4
    .word   0x6D            # 5
    .word   0x7D            # 6
    .word   0x07            # 7
    .word   0x7F            # 8
    .word   0x6F            # 9
    .word   0x77            # A
    .word   0x7C            # B
    .word   0x39            # C
    .word   0x5E            # D
    .word   0x79            # E
    .word   0x71            # F

.text

main:   
    li  $s0, 0xffff0010     # salva endereço do display de 7 segmentos
    li  $s1, 0xffff0012     # salva endereço do selecionador de linhas
    li  $s2, 0xffff0014     # salva endereço do receptor de leitura do teclado

    li  $t1, 1          # $t1 recebe a linha a ser lida (1a linha)
    
loop:
    sb  $t1, 0($s1)     # armazena no selecionador a linha a ser inspecionada
    lb  $t2, 0($s2)     # $t2 recebe o valor recebido pelo teclado naquela linha
    
    beqz    $t2, proxima_linha      # se nenhuma tecla foi pressionada, vá para a próxima linha

    # Tecla pressionada
    li  $t3, 0          # inicia o contador_posição para saber qual tecla foi apertada para imprimir no 7seg 
    
pressionar_tecla:               # loop para encontrar qual tecla foi pressionada e colocar seu numero no display
    lw  $t4, teclado($t3) # $t4 recebe um valor de tecla para comparar do .data com a tecla pressionada
    beq $t4, $t2, display   # se a tecla for igual a pressionada, irá para o evento de imprimir o valor no display 7seg
    
    addi    $t3, $t3, 4     # soma o contador para ir para a proxima tecla a verificar
    beq $t3, 64, pressionar_tecla   # se o contador atingir o valor máximo, ele reinicia o loop para garantir que todas as teclas sejam verificadas
    
    j   pressionar_tecla        # volta para o loop para verificar a proxima tecla

proxima_linha:
    add $t1, $t1, $t1       # incrementa para a proxima linha ser lida
    beq $t1, 16, resetar_linhas    # se passar da 4a linha, volta para linha 1
    
    j   loop            # se nenhuma tecla foi pressionada, o ciclo reinicia para a próxima linha

resetar_linhas:
    li  $t1, 1          # Reseta a linha para 1
    j   loop            # Recomeça o loop

display:
    lw  $t5, numero_7seg($t3)   # $t5 recebe o valor para colocar no display 7 seg correspondente a qual tecla foi apertada
    sb  $t5, 0($s0)     # imprime no display 7seg o valor da tecla
    
    li  $t6, 0          # inicializa o temporizador
temporizador:                
    addi    $t6, $t6, 1     # incrementa o temporizador
    li  $t7, 100000         # define o valor do temporizador
    bne $t6, $t7, temporizador # compara o temporizador, espera um tempo
    
    j   loop            # Volta para a função loop para continuar escaneando as próximas teclas
