.data 

# _______________________________________________________ ESTOQUE  ___________________________________________________________________
    
    	cafe:       			.word 		20
    	leite:      			.word 		20
    	chocolate:  			.word 		20
    	acucar:     			.word 		20
    
# _______________________________________________________ PROMPTS POR PROCEDIMENTO  __________________________________________________
    
    	marca: 				.asciiz 	"\n ===================== Coffee Break ===================== \n" 
    	flush:     			.asciiz 	"\n \n \n \n \n \n \n \n \n"
    	opc_invalida:			.asciiz		"\n Op��o inv�lida. Por favor, tente novamente. \n"
    	precificacao:			.asciiz		"\n Menu: \n\n  Op��o              P ............. G\n  1. Caf� Puro       R$ 3,00         R$ 5,00\n  2. Caf� com Leite  R$ 4,50         R$ 6,50\n  3. Mocaccino       R$ 5,00         R$ 7,00\n\n" 
    	espera:				.asciiz		"\n Preparando seu pedido! Estamos quase l�... \n"
    	pronto:				.asciiz		"\n Seu caf� est� pronto! Volte sempre \n"
    	desistir:			.asciiz		"\n Selecione 'F' para cancelar pedido! \n"
    
# _______________________________________________________ SELECIONAR BEBIDA  _________________________________________________________
    
    	sel_beb:    			.asciiz 	"\n Escolha sua bebida: \n\n     1 - Caf� Puro \n     2 - Caf� com Leite \n     3 - Mocaccino \n"
    	conf_cafepuro:			.asciiz		"\n Caf� puro selecionado com sucesso! \n"
    	conf_cafeleite:			.asciiz		"\n Caf� com leite selecionado com sucesso! \n"
    	conf_moca:			.asciiz		"\n Mocaccino selecionado com sucesso! \n"
    
# _______________________________________________________ SELECIONAR TAMANHO  ________________________________________________________
    
    	sel_tam:    			.asciiz 	"\n Escolha o tamanho da bebida: \n\n     1 - Pequeno \n     2 - Grande \n"
    	conf_tamanho_p:			.asciiz		"\n Tamanho pequeno selecionado com sucesso! \n"
    	conf_tamanho_g:			.asciiz		"\n Tamanho grande selecionado com sucesso! \n"
    
# _______________________________________________________ SELECIONAR ADOCANTE  _______________________________________________________
    
    	sel_acu:    			.asciiz 	"\n Escolha o ado�ante: \n\n     1 - Sem a��car \n     2 - Com a��car \n"
    	conf_com_acucar:		.asciiz		"\n Bebida com a��car selecionada com sucesso! \n"
    	conf_sem_acucar:		.asciiz		"\n Bebida sem a��car selecionada com sucesso! \n" 
    
# _______________________________________________________ VERIFICAR ESTOQUE __________________________________________________________
    
    	ing_insuf_1:			.asciiz		"\n O estoque de "
    	ing_insuf_2:			.asciiz		" � insuficiente para o preparo da bebida.\n M�quina bloqueada, aguardando reposi��o... \n"
    	prompt_cafe:			.asciiz		"Caf�"
    	prompt_leite:			.asciiz		"Leite"
    	prompt_chocolate:		.asciiz		"Chocolate"
    	prompt_acucar:			.asciiz		"A��car"
    
# _______________________________________________________ VERIFICAR ESTOQUE __________________________________________________________
    
    	senha_prompt:   		.asciiz  	"\n Insira a senha para reposi��o: "
    	reposicao_sucesso: 		.asciiz 	"\n Reposi��o realizada com sucesso!\n"
    	reposicao_falha:   		.asciiz 	"\n Opera��o mal sucedida. Retornando ao menu principal...\n"
    
# _______________________________________________________ GERADOR TXT ________________________________________________________________
    
    	nome_arquivo: 			.asciiz 	"C:\\Users\\vinir\\gitbuzzi\\UFSC\\OrganizacaoDEComputadores\\TrabalhoFinal\\ComprovanteFiscal.txt"  # Caminho para o arquivo
    	empresa_info: 			.asciiz 	"CoffeeBreak - Seu Cafe Perfeito\nEndereco: Rua dos Aromas, 123 - Centro - CafeLandia\nTelefone: (48) 1234-5678\nCNPJ: 12.345.678/0001-90\nObrigado por escolher CoffeeBreak!\n\n"
    
    	puro_str: 			.asciiz 	"Cafe Puro\n"
    	leite_str: 			.asciiz 	"Cafe com Leite\n"
    	mocaccino_str: 			.asciiz 	"Mocaccino\n"
    	pequeno_str: 			.asciiz 	"Pequeno\n"
    	grande_str: 			.asciiz 	"Grande\n"
    	acucar_str: 			.asciiz 	"Com Acucar\n"
    	sem_acucar_str: 		.asciiz 	"Sem Acucar\n"
    	erro_str: 			.asciiz 	"Erro ao abrir arquivo\n"
    	valor_pago_str: 		.asciiz 	"Valor Pago: R$ "
	preco_puro_pequeno_str: 	.asciiz 	"3,00\n"
    	preco_puro_grande_str: 		.asciiz 	"5,00\n"
    	preco_leite_pequeno_str: 	.asciiz 	"4,50\n"
    	preco_leite_grande_str: 	.asciiz 	"6,50\n"
	preco_mocaccino_pequeno_str: 	.asciiz 	"5,00\n"
    	preco_mocaccino_grande_str: 	.asciiz 	"7,00\n"
    	seu_pedido: 			.asciiz 	"Seu pedido foi:\n"
    
# _______________________________________________________ MAPEAMENTO DOS SEGMENTOS ___________________________________________________
    
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
        
# ______________________________________________________________________________________________________________________________________   

.text
    
    	# ========= Vari�veis Globais ===========
    	# ------------------ ESTOQUE ------------------
	lw  	$s0, cafe
    	lw  	$s1, leite
    	lw  	$s2, chocolate
    	lw  	$s3, acucar
    
coffeebreak:    
    
    	# ------------------ DISPLAY ------------------
    	li  	$t7, 0xffff0010  	# 7SEG DIREITO
    	li 	$t6, 0xffff0011	 	# 7SEG ESQUERDO
    	li  	$t8, 0xffff0012  	# SELECIONADOR
    	li  	$t9, 0xffff0014  	# RECEPTOR
    
    	# =========== Dados Operador =============
    	# $s4 - bebida selecionada 
    	# $s5 - tamanho (1 para pequeno ou 2 para grande)
    	# $s6 - acucar (1 para sem ou 2 para com a��car)
    
    
selecionar:

    	la  	$a0, flush		# "Limpa" o terminal
    	li  	$v0, 4 
    	syscall
    
    	la  	$a0, marca		# Exibe a marca
    	li  	$v0, 4
    	syscall
    
    	la  	$a0, precificacao	# Exibe menu de pre�os
    	li  	$v0, 4
    	syscall

    	jal 	SELECIONAR_BEBIDA   
    	move 	$s4, $v0
    
    	jal 	SELECIONAR_TAMANHO  
    	move 	$s5, $v0
    
    	jal 	SELECIONAR_ADOCANTE
    	move 	$s6, $v0

verificar:

    	# Verifica a quantidade dos ingredientes, se suficiente, j preparar
    	jal 	VERIFICAR_ESTOQUE
    	beq 	$v0, 1, preparar  	# Continua para prepara��o se o estoque for suficiente
    
    	# Chama repositor
    	move 	$a0, $v0
    	jal 	REPOR_ESTOQUE

preparar:

    	la  	$a0, espera		# Exibe mensagem "Preparando seu pedido"
    	li  	$v0, 4 
    	syscall

    	jal 	PREPARAR		# Fun��o que calcula o tempo de preparo, fazendo chamada da fun��o contagem regressiva
    
    	la  	$a0, pronto		# Exibe mensagem "Seu pedido est� pronto"
    	li  	$v0, 4 
    	syscall

atualizar:
   	jal 	ATUALIZAR		# Atualiza os registradores de estoque, decrementando as doses utilizadas

gerar:
    	jal 	GERAR_TXT		# Gera nota fiscal
    	j 	coffeebreak  		# Retorna ao in�cio para permitir novo pedido
 
     
# **************************************************************************************************************************************************
#								P R O C E D I M E N T O S
# **************************************************************************************************************************************************

################################################################## SELECIONAR BEBIDA ##################################################################
# **************************************************************************************************************************************************

SELECIONAR_BEBIDA:
    	sw 	$ra, 0($sp)      	# Salva $ra na pilha
   
    	la 	$a0, sel_beb		# Exibe menu de op��es de bebidas
    	li 	$v0, 4
    	syscall
    
    	la  	$a0, desistir		# Exibe mensagem "Pressione 'F' para desist�ncia
    	li  	$v0, 4 
    	syscall

    	# L� a op��o do usu�rio
    	jal 	LER_TECLADO
    	lw 	$ra, 0($sp) 		# Restaura $ra da pilha
    	move 	$t0, $v0  		# Armazena a op��o lida em $t0

    	li 	$t1, 1  		# Op��o 1 - Caf� Puro
    	li 	$t2, 2  		# Op��o 2 - Caf� com leite
    	li 	$t3, 3  		# Op��o 3 - Mocaccino
    	li 	$t4, 15			# Desistir do pedido

    	# Verifica se a op��o est� dentro do intervalo v�lido
    	beq 	$t0, $t1, selecionar_cafe_puro
    	beq 	$t0, $t2, selecionar_cafe_leite
    	beq 	$t0, $t3, selecionar_mocaccino
    	beq 	$t0, $t4, selecionar

    	# Se a op��o for inv�lida, exibe mensagem e repete a sele��o
    	j opcao_invalida_bebida

selecionar_cafe_puro:
    	la 	$a0, conf_cafepuro	# Exibe mensagem de confirma��o
    	li 	$v0, 4
    	syscall
    	li 	$v0, 1  		# Retorna 1 para caf� puro
    	jr 	$ra			# Retorna ao chamador

selecionar_cafe_leite:
    	la 	$a0, conf_cafeleite	# Exibe mensagem de confirma��o
    	li 	$v0, 4
    	syscall
    	li	$v0, 2  		# Retorna 2 para caf� com leite
    	jr 	$ra			# Retorna ao chamador

selecionar_mocaccino:
    	la 	$a0, conf_moca		# Exibe mensagem de confirma��o
    	li 	$v0, 4
    	syscall
    	li 	$v0, 3  		# Retorna 3 para mocaccino
    	jr 	$ra			# Retorna ao chamador

opcao_invalida_bebida:
    	la 	$a0, opc_invalida	# Exibe mensagem de op��o inv�lida
    	li 	$v0, 4
    	syscall
    	j 	SELECIONAR_BEBIDA  	# Retorna para selecionar novamente
    
# **************************************************************************************************************************************************
################################################################## SELECIONAR TAMANHO ##################################################################
# **************************************************************************************************************************************************

SELECIONAR_TAMANHO:
    	sw 	$ra, 0($sp)      	# Salva $ra na pilha
    	
    	la 	$a0, sel_tam		# Exibe menu de op��es de bebidas
    	li 	$v0, 4
    	syscall
    
    	la  	$a0, desistir		# Exibe mensagem "Pressione 'F' para desist�ncia
    	li  	$v0, 4 
    	syscall

    	# L� a op��o do usu�rio
    	jal 	LER_TECLADO
    	lw 	$ra, 0($sp) 		# Restaura $ra da pilha
    	move 	$t0, $v0  		# Armazena a op��o lida em $t0

    	li 	$t1, 1  		# Op��o 1 - Pequeno
    	li 	$t2, 2  		# Op��o 2 - Grande
    	li 	$t4, 15 		# Desistir do pedido

    	# Verifica se a op��o est� dentro do intervalo v�lido
    	beq 	$t0, $t1, tamanho_pequeno
    	beq 	$t0, $t2, tamanho_grande
    	beq 	$t0, $t4, selecionar

    	# Se a op��o for inv�lida, exibe mensagem e repete a sele��o
    	j 	opcao_invalida_tamanho

tamanho_pequeno:
    	la 	$a0, conf_tamanho_p	# Exibe mensagem de confirma��o
    	li 	$v0, 4
    	syscall
    	li 	$v0, 1  		# Retorna 1 para pequeno
    	jr 	$ra			# Retorna ao chamador

tamanho_grande:
    	la 	$a0, conf_tamanho_g	# Exibe mensagem de confirma��o
    	li 	$v0, 4
    	syscall
    	li 	$v0, 2  		# Retorna 2 para grande
    	jr 	$ra			# Retorna ao chamador

opcao_invalida_tamanho:
    	la 	$a0, opc_invalida	# Exibe mensagem de op��o inv�lida
    	li 	$v0, 4
    	syscall
    	j 	SELECIONAR_TAMANHO  	# Retorna para selecionar tamanho novamente

# **************************************************************************************************************************************************
################################################################## SELECIONAR ADOCANTE ##################################################################
# **************************************************************************************************************************************************

SELECIONAR_ADOCANTE:
    	sw 	$ra, 0($sp)      	# Salva $ra na pilha
    	
	la 	$a0, sel_acu		# Exibe menu de op��es 
    	li 	$v0, 4
    	syscall
    
    	la  	$a0, desistir		# Exibe mensagem "Pressione 'F' para desist�ncia
    	li  	$v0, 4 
    	syscall

    	# L� a op��o do usu�rio
    	jal 	LER_TECLADO
    	lw 	$ra, 0($sp) 		# Restaura $ra da pilha
    	move 	$t0, $v0  		# Armazena a op��o lida em $t0

    	li 	$t1, 1  		# Op��o 1 - sem a��car
    	li 	$t2, 2  		# Op��o 2 - com a��car
    	li 	$t4, 15 		# Desistir do pedido

    	# Verifica se a op��o est� dentro do intervalo v�lido
    	beq 	$t0, $t1, ado_sem_acucar
    	beq 	$t0, $t2, ado_com_acucar
    	beq 	$t0, $t4, selecionar 

    	# Se a op��o for inv�lida, exibe mensagem e repete a sele��o
    	j opcao_invalida_adocante

ado_com_acucar:
    	la 	$a0, conf_com_acucar	# Exibe mensagem de confirma��o
    	li	$v0, 4
    	syscall
    	li 	$v0, 2  		# Retorna 2 para 'com a��car'
    	jr 	$ra

ado_sem_acucar:
    	la 	$a0, conf_sem_acucar	# Exibe mensagem de confirma��o
    	li 	$v0, 4
    	syscall
    	li 	$v0, 1 	 		# Retorna 1 para 'sem a��car'
    	jr 	$ra

opcao_invalida_adocante:
    	la 	$a0, opc_invalida	# Exibe mensagem de op��o inv�lida
    	li 	$v0, 4
    	syscall
    	j 	SELECIONAR_ADOCANTE  	# Retorna para selecionar ado�ante novamente

# **************************************************************************************************************************************************
################################################################## VERIFICAR ESTOQUE ##################################################################
# **************************************************************************************************************************************************

VERIFICAR_ESTOQUE:
    	sw 	$ra, 0($sp)      			# Salva $ra na pilha
    	li 	$v0, 1           			# Inicializa a vari�vel de retorno como 1 ("True")
    
   	# Verifica o estoque de caf�
    	beq 	$s5, 1, verificar_cafe_pequeno  	# Se tamanho � pequeno
    	beq 	$s5, 2, verificar_cafe_grande    	# Se tamanho � grande

verificar_cafe_pequeno:
    	bge 	$s0, 1, verificar_leite          	# Se estoque de caf� >= 1
    	j 	estoque_insuficiente_cafe          	# Se n�o, n�o � poss�vel fazer um caf� pequeno

verificar_cafe_grande:
    	bge 	$s0, 2, verificar_leite          	# Se estoque de caf� >= 2
    	j 	estoque_insuficiente_cafe          	# Se n�o, n�o � poss�vel fazer um caf� grande

# Verifica o estoque de leite
verificar_leite:
    	beq 	$s5, 1, verificar_leite_pequeno  	# Se tamanho � pequeno
    	beq 	$s5, 2, verificar_leite_grande    	# Se tamanho � grande

verificar_leite_pequeno:
    	bge 	$s1, 1, verificar_chocolate       	# Se estoque de leite >= 1
    	j 	estoque_insuficiente_leite          	# Se n�o, n�o � poss�vel fazer um caf� pequeno

verificar_leite_grande:
    	bge 	$s1, 2, verificar_chocolate       	# Se estoque de leite >= 2
    	j 	estoque_insuficiente_leite          	# Se n�o, n�o � poss�vel fazer um caf� grande

# Verifica o estoque de chocolate
verificar_chocolate:
    	beq 	$s5, 1, verificar_chocolate_pequeno  	# Se tamanho � pequeno
    	beq 	$s5, 2, verificar_chocolate_grande    	# Se tamanho � grande

verificar_chocolate_pequeno:
    	bge 	$s2, 1, verificar_acucar            	# Se estoque de chocolate >= 1
    	j 	estoque_insuficiente_chocolate        	# Se n�o, n�o � poss�vel fazer um caf� pequeno

verificar_chocolate_grande:
    	bge 	$s2, 2, verificar_acucar            	# Se estoque de chocolate >= 2
    	j 	estoque_insuficiente_chocolate        	# Se n�o, n�o � poss�vel fazer um caf� grande

# Verifica o estoque de a��car
verificar_acucar:
    	beq 	$s5, 1, verificar_acucar_pequeno  	# Se tamanho � pequeno
    	beq 	$s5, 2, verificar_acucar_grande    	# Se tamanho � grande

verificar_acucar_pequeno:
    	bge 	$s3, 1, estoque_suficiente         	# Se estoque de a��car >= 1
    	j 	estoque_insuficiente_acucar          	# Se n�o, n�o � poss�vel fazer um caf� pequeno

verificar_acucar_grande:
    	bge 	$s3, 2, estoque_suficiente         	# Se estoque de a��car >= 2
    	j 	estoque_insuficiente_acucar          	# Se n�o, n�o � poss�vel fazer um caf� grande

estoque_suficiente:
    	li 	$v0, 1           			# Retorna 1 se todos os ingredientes estiverem dispon�veis
    	j 	fim_verificacao

estoque_insuficiente_cafe:
    	li 	$v0, 0           			# Retorna 0 se o estoque de caf� estiver insuficiente
    	la 	$a0, ing_insuf_1
    	li 	$v0, 4
    	syscall
    	la 	$a0, prompt_cafe
    	li 	$v0, 4
    	syscall
    	la 	$a0, ing_insuf_2
    	li 	$v0, 4
    	syscall
    	j 	REPOR_ESTOQUE  				# Chama a rotina de reposi��o

estoque_insuficiente_leite:
	li 	$v0, 0           			# Retorna 0 se o estoque de leite estiver insuficiente
    	la 	$a0, ing_insuf_1
    	li 	$v0, 4
    	syscall
    	la 	$a0, prompt_leite
    	li 	$v0, 4
    	syscall
    	la 	$a0, ing_insuf_2 
    	li 	$v0, 4
    	syscall
    	j 	REPOR_ESTOQUE  				# Chama a rotina de reposi��o

estoque_insuficiente_chocolate:
    	li 	$v0, 0           			# Retorna 0 se o estoque de chocolate estiver insuficiente
    	la 	$a0, ing_insuf_1
    	li 	$v0, 4
    	syscall
    	la 	$a0, prompt_chocolate
    	li 	$v0, 4
    	syscall
    	la 	$a0, ing_insuf_2
    	li 	$v0, 4
    	syscall
    	j 	REPOR_ESTOQUE  				# Chama a rotina de reposi��o

estoque_insuficiente_acucar:
    	li 	$v0, 0           			# Retorna 0 se o estoque de a��car estiver insuficiente
    	la 	$a0, ing_insuf_1
    	li 	$v0, 4
    	syscall
    	la 	$a0, prompt_acucar
    	li 	$v0, 4
    	syscall
    	la 	$a0, ing_insuf_2
    	li 	$v0, 4
    	syscall
    	j 	REPOR_ESTOQUE  				# Chama a rotina de reposi��o

fim_verificacao:
    	lw 	$ra, 0($sp) 				# Restaura $ra da pilha
    	jr $ra

# **************************************************************************************************************************************************
################################################################## REPOR ESTOQUE ##################################################################
# **************************************************************************************************************************************************

REPOR_ESTOQUE:
    	sw 	$ra, 0($sp)      		# Salva $ra na pilha
    	la 	$a0, ing_insuf_1
    	li $v0, 4
    	syscall

    	# L� a senha do usu�rio
    	la 	$a0, senha_prompt
    	li 	$v0, 4
    	syscall

    	# L� a senha do usu�rio
    	jal 	LER_TECLADO

    	# Verifica se a senha � igual a 'A'
    	move 	$t0, $v0  			# Armazena a op��o lida em $t0
    	li 	$t1, 10     			# Carrega o valor ASCII de 'A'
    	beq 	$t0, $t1, senha_correta  	# Se a senha for 'A', vai para a reposi��o

senha_incorreta:
    	la 	$a0, reposicao_falha		# Se senha incorreta, voltamos ao menu
    	li 	$v0, 4
    	syscall
    	j selecionar

senha_correta:
    	# Reposi��o do ingrediente que est� em falta
    	beqz 	$s0, repor_cafe  		# Se o estoque de caf� estiver insuficiente
    	beqz 	$s1, repor_leite  		# Se o estoque de leite estiver insuficiente
    	beqz 	$s2, repor_chocolate  		# Se o estoque de chocolate estiver insuficiente
    	beqz 	$s3, repor_acucar  		# Se o estoque de a��car estiver insuficiente

    	# Se todos os ingredientes est�o suficientes, retorna ao menu
    	la 	$a0, reposicao_falha
    	li 	$v0, 4
    	syscall
    	j 	selecionar

repor_cafe:
    	li 	$s0, 20  			# Restaura o estoque de caf� para 20
    	la 	$a0, reposicao_sucesso
    	li 	$v0, 4
    	syscall
    	j 	selecionar

repor_leite:
    	li 	$s1, 20  			# Restaura o estoque de leite para 20
    	la 	$a0, reposicao_sucesso
    	li 	$v0, 4
    	syscall
    	j 	selecionar

repor_chocolate:
    	li 	$s2, 20  			# Restaura o estoque de chocolate para 20
    	la 	$a0, reposicao_sucesso
    	li 	$v0, 4
    	syscall
    	j 	selecionar

repor_acucar:
    	li 	$s3, 20  			# Restaura o estoque de a��car para 20
    	la 	$a0, reposicao_sucesso
    	li 	$v0, 4
    	syscall
    	j selecionar

# **************************************************************************************************************************************************
################################################################## ATUALIZAR ##################################################################
# **************************************************************************************************************************************************

ATUALIZAR:
    	sw 	$ra, 0($sp)      			# Salva $ra na pilha
    	# Atualiza o estoque
    	beq 	$s4, 1, atualizar_estoque_cafe_puro
    	beq 	$s4, 2, atualizar_estoque_cafe_leite
    	beq 	$s4, 3, atualizar_estoque_moca
	
atualizar_estoque_cafe_puro:
    	sub 	$s0, $s0, $s5 				# Decrementa Caf� conforme tamanho
    	j 	atualizar_estoque_acucar
    

atualizar_estoque_cafe_leite:
    	sub 	$s0, $s0, $s5 				# Decrementa Caf� conforme tamanho
    	sub 	$s1, $s1, $s5 				# Decrementa Leite conforme tamanho
    	j 	atualizar_estoque_acucar
    

atualizar_estoque_moca:
    	sub 	$s0, $s0, $s5 				# Decrementa Caf� conforme tamanho
    	sub 	$s1, $s1, $s5 				# Decrementa Leite conforme tamanho
    	sub 	$s2, $s2, $s5 				# Decrementa Chocolate conforme tamanho
    	j 	atualizar_estoque_acucar

atualizar_estoque_acucar:
    	subi 	$t0, $s6, 1
    	mul 	$t0, $t0, $s5
    	sub 	$s3, $s3, $t0
    	j 	gerar  
    
# **************************************************************************************************************************************************
################################################################## GERAR TXT ##################################################################
# **************************************************************************************************************************************************

GERAR_TXT:
    	# Passo 1: Abrir/criar o arquivo
    	li 	$v0, 13               			# Syscall para abrir/criar arquivo
    	la 	$a0, nome_arquivo     			# Nome do arquivo
    	li 	$a1, 1                			# Modo de acesso: 1 = Escrita
    	li 	$a2, 511              			# Permiss�es (decimal equivalente a 777 em octal)
    	syscall
    	move 	$t0, $v0            			# Salva o descritor do arquivo no $t0

    	# Verifica se o arquivo foi aberto com sucesso
    	bltz 	$v0, erro_abrir_arquivo  		# Se $v0 < 0, ocorreu erro

    	# Passo 2: Escrever no arquivo
    	# Escreve a bebida selecionada
    	li $v0, 15               			# Syscall para escrever no arquivo
    	move $a0, $t0            			# Descritor do arquivo
    
    	la 	$a1, empresa_info
    	li 	$a2, 170
    	syscall
    	li 	$v0, 15               			# Syscall para escrever no arquivo
    	move 	$a0, $t0            			# Descritor do arquivo
    
    	la 	$a1, seu_pedido
    	li 	$a2, 16
    	syscall
    	li 	$v0, 15               			# Syscall para escrever no arquivo
    	move 	$a0, $t0            			# Descritor do arquivo
    
    	beq 	$s4, 1, escreve_cafe_puro
    	beq 	$s4, 2, escreve_cafe_com_leite
    	beq 	$s4, 3, escreve_mocaccino
    	j 	verifica_tamanho

escreve_cafe_puro:
    	la 	$a1, puro_str         			# Ponteiro para a string "Cafe Puro"
    	li 	$a2, 10               			# N�mero de bytes a serem escritos
    	syscall
    	j 	verifica_tamanho

escreve_cafe_com_leite:
    	la 	$a1, leite_str        			# Ponteiro para a string "Cafe com Leite"
    	li 	$a2, 15               			# N�mero de bytes a serem escritos
    	syscall
    	j 	verifica_tamanho

escreve_mocaccino:
    	la 	$a1, mocaccino_str    			# Ponteiro para a string "Mocaccino"
    	li 	$a2, 10               			# N�mero de bytes a serem escritos
    	syscall
    	j 	verifica_tamanho

verifica_tamanho:
    	# Escreve o tamanho
    	li 	$v0, 15               			# Syscall para escrever no arquivo
    	move 	$a0, $t0            			# Descritor do arquivo
    	beq 	$s5, 1, escreve_pequeno
    	beq 	$s5, 2, escreve_grande
    	j 	verifica_acucar

escreve_pequeno:
    	la 	$a1, pequeno_str      			# Ponteiro para a string "Pequeno"
    	li 	$a2, 8                			# N�mero de bytes a serem escritos
    	syscall
    	j 	verifica_acucar

escreve_grande:
    	la 	$a1, grande_str       			# Ponteiro para a string "Grande"
    	li 	$a2, 7                			# N�mero de bytes a serem escritos
    	syscall
    	j 	verifica_acucar

verifica_acucar:
    	# Escreve se tem a��car ou n�o
    	li 	$v0, 15               			# Syscall para escrever no arquivo
    	move 	$a0, $t0            			# Descritor do arquivo
    	beq 	$s6, 1, escreve_sem_acucar
    	beq 	$s6, 2, escreve_com_acucar 
    	j 	imprime_preco

escreve_sem_acucar:
    	la 	$a1, sem_acucar_str   			# Ponteiro para a string "Sem Acucar"
    	li 	$a2, 11               			# N�mero de bytes a serem escritos
    	syscall
    	j 	imprime_preco

escreve_com_acucar:
    	la 	$a1, acucar_str       			# Ponteiro para a string "Com Acucar"
    	li 	$a2, 11               			# N�mero de bytes a serem escritos
    	syscall
    	j 	imprime_preco

imprime_preco:
    	# Imprime o pre�o
    	li 	$v0, 15               			# Syscall para escrever no arquivo
    	move 	$a0, $t0            			# Descritor do arquivo
    	la 	$a1, valor_pago_str   			# Ponteiro para a string "Valor Pago: R$ "
    	li 	$a2, 14               			# N�mero de bytes a serem escritos
    	syscall

    	beq 	$s4, 1, preco_cafe_puro
    	beq 	$s4, 2, preco_cafe_com_leite
    	beq 	$s4, 3, preco_mocaccino
    	j 	fim

preco_cafe_puro:
    	beq 	$s5, 1, preco_puro_pequeno
    	la 	$a1, preco_puro_grande_str  		# Ponteiro para a string "5,00"
    	li 	$a2, 5                			# N�mero de bytes a serem escritos
    	j 	imprime_preco_final

preco_puro_pequeno:
    	la 	$a1, preco_puro_pequeno_str  		# Ponteiro para a string "3,00"
    	li 	$a2, 5               	 		# N�mero de bytes a serem escritos
    	j 	imprime_preco_final

preco_cafe_com_leite:
    	beq 	$s5, 1, preco_leite_pequeno
    	la	$a1, preco_leite_grande_str  		# Ponteiro para a string "6,50"
    	li 	$a2, 5                			# N�mero de bytes a serem escritos
    	j 	imprime_preco_final

preco_leite_pequeno:
    	la 	$a1, preco_leite_pequeno_str  		# Ponteiro para a string "4,50"
    	li 	$a2, 5                			# N�mero de bytes a serem escritos
    	j 	imprime_preco_final

preco_mocaccino:
    	beq 	$s5, 1, preco_mocaccino_pequeno
    	la 	$a1, preco_mocaccino_grande_str  	# Ponteiro para a string "7,00"
    	li 	$a2, 5                			# N�mero de bytes a serem escritos
    	j 	imprime_preco_final

preco_mocaccino_pequeno:
    	la 	$a1, preco_mocaccino_pequeno_str  	# Ponteiro para a string "5,00"
    	li 	$a2, 5                			# N�mero de bytes a serem escritos
    	j 	imprime_preco_final

imprime_preco_final:
    	li 	$v0, 15               			# Syscall para escrever no arquivo
    	move 	$a0, $t0            			# Descritor do arquivo
    	syscall

fim:
    	# Passo 3: Fechar o arquivo
    	li 	$v0, 16               			# Syscall para fechar o arquivo
    	move 	$a0, $t0            			# Descritor do arquivo
    	syscall

    	jr $ra                   			# Retorna ao chamador

erro_abrir_arquivo:
    	# Imprime mensagem de erro
    	li 	$v0, 4
    	la 	$a0, erro_str
    	syscall

    	# Finaliza o programa
    	li 	$v0, 10               			# Syscall para encerrar o programa
    	syscall

# **************************************************************************************************************************************************
################################################################## CONTAGEM CAPSULAS ##################################################################
# **************************************************************************************************************************************************

PREPARAR:
    	sw 	$ra, 0($sp)     	# Salva $ra na pilha
    
    	li	$t0, 5 			# tempo = 5 seg para a �gua
    	mul 	$t0, $t0, $s5		# tempo = tempo x tamanho
    	
    	li 	$t1, 0		
    		
    	# Como o �ndice de cada bebida j� representa a quantidade total de doses utilizadas podemos fazer:
    	mul 	$t1, $s4, $s5		# $t1 receber a quantidade total de doses vezes o tamanho
    	
    	add 	$t0, $t0, $t1		# tempo total � acrescido de $t1
    
    	move 	$a0, $t0		# Fazemos a contagem regressiva do tempo total
    	jal 	CONTAGEM_REGRESSIVA
    	lw 	$ra, 0($sp)
   
    	jr 	$ra			# Retorna ao chamador
    
# **************************************************************************************************************************************************
################################################################## LER TECLADO ##################################################################
# **************************************************************************************************************************************************

LER_TECLADO:
ler: 
        li 	$t0, 1             # $t0 recebe a linha a ser lida (1a linha)

scan_loop:
        sb  	$t0, 0($t8)        	# Armazena no selecionador a linha a ser inspecionada
        lb  	$t1, 0($t9)        	# $t1 recebe o valor recebido pelo teclado naquela linha
        andi  	$t1, $t1, 0xFF              
        
        beq  	$t1, $zero, next_line  	# Se nenhuma tecla foi pressionada, v� para a pr�xima linha

        # Tecla pressionada
        li  	$t2, 0            	# Inicia o contador_posi��o para saber qual tecla foi apertada

find_key:
        lw  	$t3, teclado($t2)  	# $t3 recebe um valor de tecla do .data para comparar com a tecla pressionada
        beq  	$t3, $t1, display 	# Se a tecla for igual a pressionada, vai para o evento de imprimir o valor no display 7 seg
    
        addi  	$t2, $t2, 4     	# Soma o contador para ir para a pr�xima tecla a verificar
        bne  	$t2, 64, find_key 	# Se o contador atingir o valor m�ximo, ele reinicia o loop para garantir que todas as teclas sejam verificadas

        j  	scan_loop          	# Volta para o loop para verificar a pr�xima tecla
        
display:
        li	$t4, 0			# Inicializa o temporizador para delay
        
        lw  	$t5, numero_7seg($t2)  	# $t5 recebe o valor para colocar no display 7 seg correspondente a tecla pressionada
        lw	$t6, values($t2)	# $t6 recebe o valor inteiro correspondente a tecla pressionada
        
        sb  	$t5, 0($t7)		# Imprime no display 7 seg o valor da tecla
        
    delay_loop:                
        addi  	$t4, $t4, 1    		# Incrementa o temporizador
        bne  	$t4, 25, delay_loop  	# Compara o temporizador
    
        j  	end_leitura
        
    next_line:
        sll  	$t0, $t0, 1	    	# Incrementa para a pr�xima linha ser lida
        bne  	$t0, 16, scan_loop  	# Se passar da 4� linha, volta para a linha 1

        li  	$t0, 1            	# Reseta a linha para 1
        j  	ler          		# Recome�a o loop

    end_leitura:	
        li  	$t0, 0   		# Carrega o valor 0 (todas as luzes apagadas)
        sb  	$t0, 0($t7) 		# Apaga o display
      	
        move 	$v0, $t6		# $v0 recebe o valor inteiro da tecla pressionada
        move	$v1, $t1		# $v1 recebe a tecla pressionada
      	
        jr 	$ra              	# Retorna para o chamador

# **************************************************************************************************************************************************
################################################################## CONTAGEM REGRESSIVA ##################################################################
# **************************************************************************************************************************************************

CONTAGEM_REGRESSIVA:
    	move 	$t0, $a0  		# Inicializa o contador com o n�mero de segundos do argumento
    	li 	$t1, 0  		# Define o limite do contador, que no caso de contagem regressiva � 0
    	la 	$t2, numero_7seg  	# Carrega o endere�o base do mapeamento dos segmentos

loop_contagem:
    	# Calcula as unidades e as dezenas
    	move 	$t3, $t0      		# Armazena o valor original de $t0
    	div 	$t0, $t0, 10   		# Divide por 10 para obter a dezena
    	mfhi 	$t4           		# Resto da divis�o (unidade)
    	mflo 	$t0           		# Quociente da divis�o (dezena)

    	# Carrega o valor correspondente � dezena
    	sll 	$t5, $t0, 2    		# Multiplica por 4 (tamanho de um word)
    	add 	$t5, $t5, $t2  		# Adiciona ao endere�o base
    	lw 	$t6, 0($t5)     	# Carrega o valor do segmento correspondente � dezena

    	# Carrega o valor correspondente � unidade
    	sll 	$t7, $t4, 2    		# Multiplica por 4 (tamanho de um word)
    	add 	$t7, $t7, $t2  		# Adiciona ao endere�o base
    	lw 	$t8, 0($t7)     	# Carrega o valor do segmento correspondente � unidade

    	# Escreve o valor no display de sete segmentos
    	li 	$t9, 0xFFFF0011  	# Endere�o do display da dezena
    	sb 	$t6, 0($t9)      	# Escreve o valor da dezena no display

    	li 	$t9, 0xFFFF0010  	# Endere�o do display da unidade
    	sb 	$t8, 0($t9)      	# Escreve o valor da unidade no display

    	# Rotina de delay
    	li 	$a0, 1  		# Define o atraso em segundos (1 segundo)
    	li 	$v0, 30  		# Syscall para pausa
    	syscall  			# Executa o syscall

    	# Decrementa o contador
    	addi	$t3, $t3, -1  		# Decrementa o contador
    	move 	$t0, $t3      		# Atualiza $t0 com o novo valor do contador

    	# Se atingir 0, reseta o contador e retorna
    	beq 	$t0, $t1, retorno_contagem

    	j 	loop_contagem  		# Repete o loop

retorno_contagem:
	# Apaga todas as luzes do display
    	li      $t9, 0xFFFF0011       	# Endere�o do display da dezena
    	sb      $zero, 0($t9)         	# Escreve 0x00 para apagar o display da dezena

    	li      $t9, 0xFFFF0010       	# Endere�o do display da unidade
    	sb      $zero, 0($t9)         	# Escreve 0x00 para apagar o display da unidade
    	jr 	$ra  			# Retorna para o chamador
    
# **************************************************************************************************************************************************
#								F I M	P R O C E D I M E N T O S
# **************************************************************************************************************************************************


