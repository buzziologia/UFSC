.data 
    # --------------- ESTOQUE ---------------
    cafe:       	.word 1
    leite:      	.word 20
    chocolate:  	.word 20
    acucar:     	.word 20
    
    # ---------------------------------------------------- PROMPTS POR PROCEDIMENTO -------------------------------------------------------------
    
    marca: 		.asciiz 	"\n ===================== Coffe Break ===================== \n" 
    flush:     		.asciiz 	"\n \n \n \n \n \n \n \n \n"
    bem_vindo:  	.asciiz 	"\n Bem Vindo! \n"
    opc_invalida:	.asciiz		"\n Op��o inv�lida. Por favor, tente novamente. \n"
    precificacao:	.asciiz		"\n Menu: \n\n  Op��o              P ............. G\n  1. Caf� Puro       R$ 3,00         R$ 5,00\n  2. Caf� com Leite  R$ 4,50         R$ 6,50\n  3. Mocaccino       R$ 5,00         R$ 7,00\n\n" 
    espera:		.asciiz		"\n Preparando seu pedido! Estamos quase l�... \n"
    pronto:		.asciiz		"\n Seu caf� est� pronto! Volte sempre \n"
    
    # _______________________________________________________ SELECIONAR BEBIDA _________________________________________________________________
    
    sel_beb:    	.asciiz 	"\n Escolha sua bebida: \n     1 - Caf� Puro \n     2 - Caf� com Leite \n     3 - Mocaccino \n"
    conf_cafepuro:	.asciiz		"\n Caf� puro selecionado com sucesso! \n"
    conf_cafeleite:	.asciiz		"\n Caf� com leite selecionado com sucesso! \n"
    conf_moca:		.asciiz		"\n Mocaccino selecionado com sucesso! \n"
    
    # _______________________________________________________ SELECIONAR TAMANHO ________________________________________________________________
    
    sel_tam:    	.asciiz 	"\n Escolha o tamanho da bebida: \n     1 - Pequeno \n     2 - Grande \n"
    conf_tamanho_p:	.asciiz		"\n Tamanho pequeno selecionado com sucesso! \n"
    conf_tamanho_g:	.asciiz		"\n Tamanho grande selecionado com sucesso! \n"
    
    # _______________________________________________________ SELECIONAR ADOCANTE _______________________________________________________________
    
    sel_acu:    	.asciiz 	"\n Escolha o ado�ante: \n     1 - Com a��car \n     2 - Sem a��car \n"
    conf_com_acucar:	.asciiz		"\n Bebida com a��car selecionada com sucesso! \n"
    conf_sem_acucar:	.asciiz		"\n Bebida sem a��car selecionada com sucesso! \n" 
    
    # _______________________________________________________ VERIFICAR ESTOQUE _______________________________________________________________
    
    ing_insuf_1:	.asciiz		"\n O estoque de "
    ing_insuf_2:	.asciiz		" � insuficiente para o preparo da bebida.\n M�quina bloqueada, aguardando reposi��o... \n"
    prompt_cafe:	.asciiz		"Caf�"
    prompt_leite:	.asciiz		"Leite"
    prompt_chocolate:	.asciiz		"Chocolate"
    prompt_acucar:	.asciiz		"A��car"
    
    # Mensagens de reposi��o
    senha_prompt:   .asciiz  "\n Insira a senha para reposi��o: "
    reposicao_sucesso: .asciiz "\n Reposi��o realizada com sucesso!\n"
    reposicao_falha:   .asciiz "\n Senha incorreta ou tempo esgotado. Retornando ao menu principal...\n"
    
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
        
    values:
        .word 0     # 0
        .word 1     # 1
        .word 2     # 2
        .word 3     # 3
        .word 4     # 4
        .word 5     # 5
        .word 6     # 6
        .word 7     # 7
        .word 8     # 8
        .word 9     # 9
        .word 10    # a
        .word 11    # b
        .word 12    # c
        .word 13    # d
        .word 14    # e
        .word 15    # f

    nome_arquivo: .asciiz "C:\\Users\\vinir\\gitbuzzi\\UFSC\\OrganizacaoDEComputadores\\TrabalhoFinal\\pedido.txt"

vetor_str: .asciiz "Caf� Puro\nCaf� com Leite\nMocaccino\nPequeno\nGrande\nCom A��car\nSem A��car\n"

# Tamanhos das strings em bytes (incluindo o caractere nulo)
tamanho_bebida: .word 11, 16, 9  # Tamanhos das bebidas
tamanho_tamanho: .word 7, 6      # Tamanhos dos tamanhos (pequeno, grande)
tamanho_acucar: .word 11, 11     # Tamanhos dos tipos de a��car
.text

main:
    # ========= Vari�veis Globais ===========
    # --------------- ESTOQUE ---------------
    lw  $s0, cafe
    lw  $s1, leite
    lw  $s2, chocolate
    lw  $s3, acucar
    
    # --------------- DISPLAY ---------------
    li  $t7, 0xffff0010  # 7SEG
    li  $t8, 0xffff0012  # SELECIONADOR
    li  $t9 , 0xffff0014  # RECEPTOR
    
    # Registradores
    # $s4 - bebida selecionada 
    # $s5 - tamanho (1 para pequeno ou 2 para grande)
    # $s6 - acucar (0 para sem ou 1 para com a��car)
    
    la  $a0, flush
    li  $v0, 4 
    syscall
    
    la  $a0, marca
    li  $v0, 4
    syscall
    
    la  $a0, precificacao
    li  $v0, 4
    syscall
    
selecionar:
    jal SELECIONAR_BEBIDA   
    move $s4, $v0
    
    jal SELECIONAR_TAMANHO  
    move $s5, $v0
    
    jal SELECIONAR_ADOCANTE
    move $s6, $v0

verificar:
    # Verifica a quantidade dos ingredientes, se suficiente, j preparar
    jal VERIFICAR_ESTOQUE
    move $t0, $v0  # Quantidade total de p�s
    beq $v0, 1, preparar  # Continua para prepara��o se o estoque for suficiente
    
    # Chama repositor
    move $a0, $v0
    jal REPOR_ESTOQUE

preparar:
    # Simula o tempo de preparo
    beq $s5, 1, tempo_pequeno 
    li $a0, 20  # Grande
    j contagem_regressiva
tempo_pequeno:
    li $a0, 10  # Pequeno

contagem_regressiva:
    jal CONTAGEM_REGRESSIVA  # Chama a fun��o de contagem regressiva
    # Atualiza o estoque
    beq $s4, 1, atualizar_estoque_cafe_puro
    beq $s4, 2, atualizar_estoque_cafe_leite
    beq $s4, 3, atualizar_estoque_moca

atualizar_estoque_cafe_puro:
    subi $s0, $s0, 1  # Decrementa o estoque de caf�
    j gerar

atualizar_estoque_cafe_leite:
    subi $s0, $s0, 1  # Decrementa o estoque de caf�
    subi $s1, $s1, 1  # Decrementa o estoque de leite
    j gerar

atualizar_estoque_moca:
    subi $s0, $s0, 1  # Decrementa o estoque de caf�
    subi $s1, $s1, 1  # Decrementa o estoque de leite
    subi $s2, $s2, 1  # Decrementa o estoque de chocolate
    j gerar

gerar:
    jal GERAR_NOTA
    j selecionar  # Retorna ao in�cio para permitir novo pedido
   



GERAR_NOTA:
    # Salva $ra na pilha para retorno
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    # Passo 1: Abrir/criar o arquivo
    li $v0, 13               # Syscall para abrir/criar arquivo
    la $a0, nome_arquivo     # Nome do arquivo
    li $a1, 1                # Modo de acesso: 1 = Escrita
    li $a2, 511              # Permiss�es (777 em octal)
    syscall
    move $t0, $v0            # Salva o descritor do arquivo no $t0

    # Verifica erro ao abrir/criar o arquivo
    bltz $t0, finalizar      # Se $t0 < 0, termina o programa

    # Passo 2: Escrever a bebida no arquivo
    la $t1, vetor_str        # Carrega o endere�o base do vetor de strings
    la $t2, tamanho_bebida   # Carrega o endere�o do vetor de tamanhos das bebidas
    lw $t3, 0($t2)           # Carrega o tamanho da primeira bebida (Caf� Puro)
    sll $s4, $s4, 2          # Multiplica o �ndice da bebida por 4 (4 bytes por palavra)
    lw $t4, 0($t2)           # Carrega o tamanho da bebida
    add $t5, $t1, $t4        # Calcula o endere�o da bebida selecionada
    add $t5, $t5, $s4        # Ajusta o endere�o conforme o �ndice
    la $a1, ($t5)            # Carrega o endere�o da bebida
    lw $a2, ($t2)            # Carrega o tamanho da bebida
    li $v0, 15               # Syscall para escrever no arquivo
    move $a0, $t0            # Descritor do arquivo
    syscall

    # Verifica se a escrita foi bem-sucedida
    bltz $v0, fechar_arquivo  # Se a escrita falhar, fecha o arquivo

    # Passo 3: Escrever o tamanho no arquivo
    la $t2, tamanho_tamanho   # Carrega o endere�o do vetor de tamanhos dos tamanhos
    sll $s5, $s5, 2           # Multiplica o �ndice do tamanho por 4 (4 bytes por palavra)
    lw $t4, 0($t2)            # Carrega o tamanho do primeiro tamanho (Pequeno)
    add $t5, $t1, $t4         # Calcula o endere�o do tamanho selecionado
    add $t5, $t5, $s5         # Ajusta o endere�o conforme o �ndice
    la $a1, ($t5)             # Carrega o endere�o do tamanho
    lw $a2, ($t2)             # Carrega o tamanho do tamanho
    li $v0, 15                # Syscall para escrever no arquivo
    move $a0, $t0             # Descritor do arquivo
    syscall

    # Verifica se a escrita foi bem-sucedida
    bltz $v0, fechar_arquivo  # Se a escrita falhar, fecha o arquivo

    # Passo 4: Escrever o ado�ante no arquivo
    la $t2, tamanho_acucar    # Carrega o endere�o do vetor de tamanhos dos ado�antes
    sll $s6, $s6, 2           # Multiplica o �ndice do ado�ante por 4 (4 bytes por palavra)
    lw $t4, 0($t2)            # Carrega o tamanho do primeiro ado�ante (Sem A��car)
    add $t5, $t1, $t4         # Calcula o endere�o do ado�ante selecionado
    add $t5, $t5, $s6         # Ajusta o endere�o conforme o �ndice
    la $a1, ($t5)             # Carrega o endere�o do ado�ante
    lw $a2, ($t2)             # Carrega o tamanho do ado�ante
    li $v0, 15                # Syscall para escrever no arquivo
    move $a0, $t0             # Descritor do arquivo
    syscall

    # Verifica se a escrita foi bem-sucedida
    bltz $v0, fechar_arquivo  # Se a escrita falhar, fecha o arquivo

    # Passo 5: Fechar o arquivo
fechar_arquivo:
    li $v0, 16                # Syscall para fechar o arquivo
    move $a0, $t0             # Descritor do arquivo
    syscall

finalizar:
    # Restaura $ra e volta
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

# **************************************************************************************************************************************************
REPOR_ESTOQUE:
    sw $ra, 0($sp)      # Salva $ra na pilha
    la $a0, ing_insuf_1
    li $v0, 4
    syscall

    # Informa qual ingrediente est� em falta
    la $a0, prompt_cafe
    li $v0, 4
    syscall

    # L� a senha do usu�rio
    la $a0, senha_prompt
    li $v0, 4
    syscall

    # L� a senha do usu�rio
    jal LER_TECLADO

    # Verifica se a senha � igual a 'A'
    move $t0, $v0  # Armazena a op��o lida em $t0
    li $t1, 10     # Carrega o valor ASCII de 'A'
    beq $t0, $t1, senha_correta  # Se a senha for 'A', vai para a reposi��o

senha_incorreta:
    la $a0, reposicao_falha
    li $v0, 4
    syscall
    j selecionar

senha_correta:
    # Reposi��o do ingrediente que est� em falta
    beqz $s0, repor_cafe  # Se o estoque de caf� estiver insuficiente
    beqz $s1, repor_leite  # Se o estoque de leite estiver insuficiente
    beqz $s2, repor_chocolate  # Se o estoque de chocolate estiver insuficiente
    beqz $s3, repor_acucar  # Se o estoque de a��car estiver insuficiente

    # Se todos os ingredientes est�o suficientes, retorna ao menu
    la $a0, reposicao_falha
    li $v0, 4
    syscall
    j selecionar

repor_cafe:
    li $s0, 20  # Restaura o estoque de caf� para 20
    la $a0, reposicao_sucesso
    li $v0, 4
    syscall
    j selecionar

repor_leite:
    li $s1, 20  # Restaura o estoque de leite para 20
    la $a0, reposicao_sucesso
    li $v0, 4
    syscall
    j selecionar

repor_chocolate:
    li $s2, 20  # Restaura o estoque de chocolate para 20
    la $a0, reposicao_sucesso
    li $v0, 4
    syscall
    j selecionar

repor_acucar:
    li $s3, 20  # Restaura o estoque de a��car para 20
    la $a0, reposicao_sucesso
    li $v0, 4
    syscall
    j selecionar
    
# **************************************************************************************************************************************************

CONTAGEM_REGRESSIVA:
    move $t0, $a0  # Inicializa o contador com o n�mero de segundos do argumento
    li $t1, 0  # Define o limite do contador, que no caso de contagem regressiva � 0
    la $t2, numero_7seg  # Carrega o endere�o base do mapeamento dos segmentos

loop_contagem:
    lw $t3, 0($t2)  # Carrega o valor do segmento correspondente ao n�mero atual
    sb $t3, 0($t7)  # Escreve o valor no display de sete segmentos
    addi $t0, $t0, -1  # Decrementa o contador
    addi $t2, $t2, -4  # Move para o pr�ximo valor no mapeamento dos segmentos

    # Rotina de delay
    li $a0, 1  # Define o atraso em segundos (1 segundo)
    li $v0, 30  # Syscall para pausa
    syscall  # Executa o syscall

    # Se atingir 0, reseta o contador e retorna
    beq $t0, $t1, retorno_contagem

    j loop_contagem  # Repete o loop

retorno_contagem:
    jr $ra  # Retorna para o chamador

# **************************************************************************************************************************************************

SELECIONAR_BEBIDA:
    sw $ra, 0($sp)      # Salva $ra na pilha
    la $a0, sel_beb
    li $v0, 4
    syscall

    # L� a op��o do usu�rio
    jal LER_TECLADO
    lw $ra, 0($sp) # Restaura $ra da pilha
    move $t0, $v0  # Armazena a op��o lida em $t0

    li $t1, 1  # Op��o 1
    li $t2, 2  # Op��o 2
    li $t3, 3  # Op��o 3

    # Verifica se a op��o est� dentro do intervalo v�lido
    beq $t0, $t1, selecionar_cafe_puro
    beq $t0, $t2, selecionar_cafe_leite
    beq $t0, $t3, selecionar_mocaccino

    # Se a op��o for inv�lida, exibe mensagem e repete a sele��o
    j opcao_invalida

selecionar_cafe_puro:
    la $a0, conf_cafepuro
    li $v0, 4
    syscall
    li $v0, 1  # Retorna 1 para caf� puro
    jr $ra

selecionar_cafe_leite:
    la $a0, conf_cafeleite
    li $v0, 4
    syscall
    li $v0, 2  # Retorna 2 para caf� com leite
    jr $ra

selecionar_mocaccino:
    la $a0, conf_moca
    li $v0, 4
    syscall
    li $v0, 3  # Retorna 3 para mocaccino
    jr $ra

opcao_invalida:
    la $a0, opc_invalida
    li $v0, 4
    syscall
    j SELECIONAR_BEBIDA  # Retorna para selecionar novamente

# **************************************************************************************************************************************************

SELECIONAR_TAMANHO:
    sw $ra, 0($sp)      # Salva $ra na pilha
    la $a0, sel_tam
    li $v0, 4
    syscall

    # L� a op��o do usu�rio
    jal LER_TECLADO
    lw $ra, 0($sp) # Restaura $ra da pilha
    move $t0, $v0  # Armazena a op��o lida em $t0

    li $t1, 1  # Op��o 1
    li $t2, 2  # Op��o 2

    # Verifica se a op��o est� dentro do intervalo v�lido
    beq $t0, $t1, tamanho_pequeno
    beq $t0, $t2, tamanho_grande

    # Se a op��o for inv�lida, exibe mensagem e repete a sele��o
    j opcao_invalida_tamanho

tamanho_pequeno:
    la $a0, conf_tamanho_p
    li $v0, 4
    syscall
    li $v0, 1  # Retorna 1 para pequeno
    jr $ra

tamanho_grande:
    la $a0, conf_tamanho_g
    li $v0, 4
    syscall
    li $v0, 2  # Retorna 2 para grande
    jr $ra

opcao_invalida_tamanho:
    la $a0, opc_invalida
    li $v0, 4
    syscall
    j SELECIONAR_TAMANHO  # Retorna para selecionar tamanho novamente

# **************************************************************************************************************************************************

SELECIONAR_ADOCANTE:
    sw $ra, 0($sp)      # Salva $ra na pilha
    la $a0, sel_acu
    li $v0, 4
    syscall

    # L� a op��o do usu�rio
    jal LER_TECLADO
    lw $ra, 0($sp) # Restaura $ra da pilha
    move $t0, $v0  # Armazena a op��o lida em $t0

    li $t1, 1  # Op��o 1
    li $t2, 2  # Op��o 2

    # Verifica se a op��o est� dentro do intervalo v�lido
    beq $t0, $t1, ado_com_acucar
    beq $t0, $t2, ado_sem_acucar

    # Se a op��o for inv�lida, exibe mensagem e repete a sele��o
    j opcao_invalida_adocante

ado_com_acucar:
    la $a0, conf_com_acucar
    li $v0, 4
    syscall
    li $v0, 1  # Retorna 1 para com a��car
    jr $ra

ado_sem_acucar:
    la $a0, conf_sem_acucar
    li $v0, 4
    syscall
    li $v0, 2  # Retorna 2 para sem a��car
    jr $ra

opcao_invalida_adocante:
    la $a0, opc_invalida
    li $v0, 4
    syscall
    j SELECIONAR_ADOCANTE  # Retorna para selecionar ado�ante novamente

# **************************************************************************************************************************************************

LER_TECLADO:
    ler: 
        li $t0, 1             # $t0 recebe a linha a ser lida (1a linha)

    scan_loop:
        sb  $t0, 0($t8)        # Armazena no selecionador a linha a ser inspecionada
        lb  $t1, 0($t9)        # $t1 recebe o valor recebido pelo teclado naquela linha
        andi  $t1, $t1, 0xFF              
        
        beq  $t1, $zero, next_line  	# Se nenhuma tecla foi pressionada, v� para a pr�xima linha

        # Tecla pressionada
        li  $t2, 0            	# Inicia o contador_posi��o para saber qual tecla foi apertada

    find_key:
        lw  $t3, teclado($t2)  	# $t3 recebe um valor de tecla do .data para comparar com a tecla pressionada
        beq  $t3, $t1, display 	# Se a tecla for igual a pressionada, vai para o evento de imprimir o valor no display 7 seg
    
        addi  $t2, $t2, 4     	# Soma o contador para ir para a pr�xima tecla a verificar
        bne  $t2, 64, find_key 	# Se o contador atingir o valor m�ximo, ele reinicia o loop para garantir que todas as teclas sejam verificadas

        j  scan_loop          	# Volta para o loop para verificar a pr�xima tecla
        
    display:
        li	$t4, 0			# Inicializa o temporizador para delay
        
        lw  $t5, numero_7seg($t2)  	# $t5 recebe o valor para colocar no display 7 seg correspondente a tecla pressionada
        lw	$t6, values($t2)	# $t6 recebe o valor inteiro correspondente a tecla pressionada
        
        sb  $t5, 0($t7)		# Imprime no display 7 seg o valor da tecla
        
    delay_loop:                
        addi  $t4, $t4, 1    		# Incrementa o temporizador
        bne  $t4, 100, delay_loop  	# Compara o temporizador
    
        j  end_leitura
        
    next_line:
        sll  $t0, $t0, 1	    	# Incrementa para a pr�xima linha ser lida
        bne  $t0, 16, scan_loop  	# Se passar da 4� linha, volta para a linha 1

        li  $t0, 1            	# Reseta a linha para 1
        j  ler          		# Recome�a o loop

    end_leitura:	
        li  $t0, 0   		# Carrega o valor 0 (todas as luzes apagadas)
        sb  $t0, 0($t7) 		# Apaga o display
      	
        move 	$v0, $t6		# $v0 recebe o valor inteiro da tecla pressionada
        move	$v1, $t1		# $v1 recebe a tecla pressionada
      	
        jr 	$ra              	# Retorna para o chamador

# **************************************************************************************************************************************************
# **************************************************************************************************************************************************

VERIFICAR_ESTOQUE:
    sw $ra, 0($sp)      # Salva $ra na pilha
    li $v0, 1           # Inicializa a vari�vel de retorno como 1 

    # Verifica o estoque de caf�
    beq $s5, 1, verificar_cafe_pequeno  # Se tamanho � pequeno
    beq $s5, 2, verificar_cafe_grande    # Se tamanho � grande

verificar_cafe_pequeno:
    bge $s0, 1, verificar_leite          # Se estoque de caf� >= 1
    j estoque_insuficiente_cafe          # Se n�o, n�o � poss�vel fazer um caf� pequeno

verificar_cafe_grande:
    bge $s0, 2, verificar_leite          # Se estoque de caf� >= 2
    j estoque_insuficiente_cafe          # Se n�o, n�o � poss�vel fazer um caf� grande

# Verifica o estoque de leite
verificar_leite:
    beq $s5, 1, verificar_leite_pequeno  # Se tamanho � pequeno
    beq $s5, 2, verificar_leite_grande    # Se tamanho � grande

verificar_leite_pequeno:
    bge $s1, 1, verificar_chocolate       # Se estoque de leite >= 1
    j estoque_insuficiente_leite          # Se n�o, n�o � poss�vel fazer um caf� pequeno

verificar_leite_grande:
    bge $s1, 2, verificar_chocolate       # Se estoque de leite >= 2
    j estoque_insuficiente_leite          # Se n�o, n�o � poss�vel fazer um caf� grande

# Verifica o estoque de chocolate
verificar_chocolate:
    beq $s5, 1, verificar_chocolate_pequeno  # Se tamanho � pequeno
    beq $s5, 2, verificar_chocolate_grande    # Se tamanho � grande

verificar_chocolate_pequeno:
    bge $s2, 1, verificar_acucar            # Se estoque de chocolate >= 1
    j estoque_insuficiente_chocolate        # Se n�o, n�o � poss�vel fazer um caf� pequeno

verificar_chocolate_grande:
    bge $s2, 2, verificar_acucar            # Se estoque de chocolate >= 2
    j estoque_insuficiente_chocolate        # Se n�o, n�o � poss�vel fazer um caf� grande

# Verifica o estoque de a��car
verificar_acucar:
    beq $s5, 1, verificar_acucar_pequeno  # Se tamanho � pequeno
    beq $s5, 2, verificar_acucar_grande    # Se tamanho � grande

verificar_acucar_pequeno:
    bge $s3, 1, estoque_suficiente         # Se estoque de a��car >= 1
    j estoque_insuficiente_acucar          # Se n�o, n�o � poss�vel fazer um caf� pequeno

verificar_acucar_grande:
    bge $s3, 2, estoque_suficiente         # Se estoque de a��car >= 2
    j estoque_insuficiente_acucar          # Se n�o, n�o � poss�vel fazer um caf� grande ```assembly
estoque_suficiente:
    li $v0, 1           # Retorna 1 se todos os ingredientes estiverem dispon�veis
    j fim_verificacao

estoque_insuficiente_cafe:
    li $v0, 0           # Retorna 0 se o estoque de caf� estiver insuficiente
    la $a0, ing_insuf_1
    li $v0, 4
    syscall
    la $a0, prompt_cafe
    li $v0, 4
    syscall
    la $a0, ing_insuf_2
    li $v0, 4
    syscall
    j REPOR_ESTOQUE  # Chama a rotina de reposi��o

estoque_insuficiente_leite:
    li $v0, 0           # Retorna 0 se o estoque de leite estiver insuficiente
    la $a0, ing_insuf_1
    li $v0, 4
    syscall
    la $a0, prompt_leite
    li $v0, 4
    syscall
    la $a0, ing_insuf_2 
    li $v0, 4
    syscall
    j REPOR_ESTOQUE  # Chama a rotina de reposi��o

estoque_insuficiente_chocolate:
    li $v0, 0           # Retorna 0 se o estoque de chocolate estiver insuficiente
    la $a0, ing_insuf_1
    li $v0, 4
    syscall
    la $a0, prompt_chocolate
    li $v0, 4
    syscall
    la $a0, ing_insuf_2
    li $v0, 4
    syscall
    j REPOR_ESTOQUE  # Chama a rotina de reposi��o

estoque_insuficiente_acucar:
    li $v0, 0           # Retorna 0 se o estoque de a��car estiver insuficiente
    la $a0, ing_insuf_1
    li $v0, 4
    syscall
    la $a0, prompt_acucar
    li $v0, 4
    syscall
    la $a0, ing_insuf_2
    li $v0, 4
    syscall
    j REPOR_ESTOQUE  # Chama a rotina de reposi��o

fim_verificacao:
    lw $ra, 0($sp) # Restaura $ra da pilha
    jr $ra