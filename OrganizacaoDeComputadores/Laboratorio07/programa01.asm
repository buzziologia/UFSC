.data
	prompt: .asciiz "Digite a ordem da matriz: "
.text
main:
	li 	$v0, 4              	# C�digo da syscall para imprimir uma string (syscall 4)
	la 	$a0, prompt         	# Carrega o endere�o da mensagem
	syscall                		# Executa a syscall para exibir a mensagem
    
	li 	$v0, 5              	# C�digo da syscall para ler um n�mero inteiro (syscall 5)
	syscall                		# Executa a syscall para ler o n�mero
	move 	$s0, $v0		# $s0 = MAX

	# ------------------ Cria��o das matrizes --------------------
			
	move 	$a0, $s0		# Par�metro da fun��o (MAX)		
	jal 	cria_matriz
	move 	$s1, $v0		# Salva o endere�o de A em $s1
	
	move 	$a0, $s0		# Par�metro da fun��o (MAX)		
	jal 	cria_matriz
	move 	$s2, $v0		# Salva o endere�o de B em $s2
	
	# ------------- Soma de A com a transposta de B --------------

	li	$t0, 0			# $t0 = i = 0
for_i:
	bge 	$t0, $s0, encerrar 	# se (i >= MAX): fim
	li 	$t1, 0 			# $t1 = j = 0
	
for_j:
	bge 	$t1, $s0, fim_for_j 	# se (i >= MAX): proxima itera��o do for i
	
	# ------ Calcula endere�o de A[i][j] --------
	
	mul	$t2, $t0, $s0		# $t2 = i * MAX
	add 	$t2, $t2, $t1		# $t2 = i * MAX + j
	mul 	$t2, $t2, 4		# $t2 = (i * MAX + j) * 4 => offset
	add 	$t2, $t2, $s1		# endere�o de A[i][j] = A.end_base + offset
	
	lw 	$t3, 0($t2)
	
	# ------ Calcula endere�o de B[i][j] -------- 
	
	mul	$t4, $t1, $s0		# $t2 = j * MAX
	add 	$t4, $t4, $t0		# $t2 = j * MAX + i
	mul 	$t4, $t4, 4		# $t2 = (j * MAX + i) * 4 => offset
	add 	$t4, $t4, $s2		# endere�o de B[j][i] = B.end_base + offset
	
	lw 	$t5, 0($t4)
	
	# ----------- A[i][j] + B[i][j] ------------- 
	
	add 	$t3, $t3, $t5
    	sw 	$t3, 0($t2)		# Armazena o resultado em A[i][j]
    	
    	# -------------------------------------------
    	
    	addi	$t1, $t1, 1		# j++
    	j 	for_j			# Volta pro loop de colunas
	
fim_for_j:
	add	$t0, $t0, 1		# i++
	j	for_i			# Volta pro loop de linhas	
	
encerrar:
    	li 	$v0, 10             	# C�digo para encerrar o programa
    	syscall                		# Executa a syscall para sair
    	
# ----- Fun��o geradora de matrizes (aloca��o dinamica na mem�ria heap) -----

cria_matriz:
	li 	$t0, 0					# $t0 = linha = 0
	li 	$t2, 1					# $t2 = valor = 1
	move 	$t3, $a0				# $t3 = MAX
	
	mul	$t5, $t3, $t3				# $t5 = MAX * MAX
	mul 	$t5, $t5, 4				# Multiplica pelo tamanho da word (4 bytes)
	
	# ----------- Aloca��o din�mica da matriz -----------
	
	li 	$v0, 9                   		# C�digo da syscall para criar espa�o de aloca��o na mem�ria heap (syscall 9)
    	move 	$a0, $t5                 		# Envia para o syscall quantos bytes ser�o alocados
    	syscall				 		# Endere�o alocado est� salvo em $v0 (que � o retorno da pr�pria fun��o cria_matriz)
	
	# ----------- Preenchimento da matriz --------------
	loop_i:
		li 	$t1, 0				# $t1 = coluna = 0
		
		loop_j:
			# --- Calculo da dist�ncia do endere�o base ao dado atual = (linha * MAX + coluna) * tam_word ---
			
			mul 	$t4, $t0, $t3		# offset => $t4 = linha * MAX
			add 	$t4, $t4, $t1		# offset += coluna
			mul 	$t4, $t4, 4		# offset *= 4 (pois 1 word = 4 bytes)
			add 	$t4, $v0, $t4		# endere�o = end_base + offset
			
			sw 	$t2, 0($t4)		# armazena valor na posi��o da matriz
			addi	$t2, $t2, 1		# valor++
			addi 	$t1, $t1, 1		# coluna++
			bne 	$t1, $t3, loop_j	# Se (coluna < MAX), repete o loop de colunas
			
			addi 	$t0, $t0, 1		# linha++ 
			bne  	$t0, $t3, loop_i  	# Se linha != MAX, repete o loop de linhas
	
	jr 	$ra