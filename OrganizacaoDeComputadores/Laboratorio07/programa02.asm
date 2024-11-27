.data
	prompt_tm: .asciiz "Digite a ordem da matriz: "
	prompt_bs: .asciiz "Digite o tamanho do bloco: "
.text
main:
	li 	$v0, 4              	# Código da syscall para imprimir uma string (syscall 4)
	la 	$a0, prompt_tm         	# Carrega o endereço da mensagem
	syscall                		# Executa a syscall para exibir a mensagem
    
	li 	$v0, 5              	# Código da syscall para ler um número inteiro (syscall 5)
	syscall                		# Executa a syscall para ler o número
	move 	$s0, $v0		# $s0 = MAX
	
	li 	$v0, 4              	# Código da syscall para imprimir uma string (syscall 4)
	la 	$a0, prompt_bs         	# Carrega o endereço da mensagem
	syscall                		# Executa a syscall para exibir a mensagem
    
	li 	$v0, 5              	# Código da syscall para ler um número inteiro (syscall 5)
	syscall                		# Executa a syscall para ler o número
	move 	$s3, $v0		# $s3 = block_size

	# ------------------ Criação das matrizes --------------------
			
	move 	$a0, $s0		# Parâmetro da função (MAX)		
	jal 	cria_matriz
	move 	$s1, $v0		# Salva o endereço de A em $s1
	
	move 	$a0, $s0		# Parâmetro da função (MAX)		
	jal 	cria_matriz
	move 	$s2, $v0		# Salva o endereço de B em $s2
	
	# ------------- Soma de A com a transposta de B --------------

	li	$t0, 0			# $t0 = i = 0
for_i:
	bge 	$t0, $s0, encerrar 	# se (i >= MAX): fim
	li 	$t1, 0 			# $t1 = j = 0
	
for_j:
	bge 	$t1, $s0, fim_for_j 	# se (j >= MAX): proxima iteração do for i
	move 	$t2, $t0		# $t2 = ii = i

for_ii:
	add	$t4, $t0, $s3		# $t4 = i + block_size
	bge 	$t2, $t4, fim_for_ii 	# se (ii >= i + block_size): proxima iteração do for j
	move	$t3, $t1		# $t3 = jj = j
	
for_jj:	
	add	$t5, $t1, $s3		# $t5 = j + block_size
	bge 	$t3, $t5, fim_for_jj 	# se (jj >= j + block_size): proxima iteração do for ii
	
	# ------ Calcula endereço de A[ii][jj] --------
	
	mul	$t6, $t2, $s0		# $t2 = ii * MAX
	add 	$t6, $t6, $t3		# $t2 = ii * MAX + jj
	mul 	$t6, $t6, 4		# $t2 = (ii * MAX + jj) * 4 => offset
	add 	$t6, $t6, $s1		# endereço de A[ii][jj] = A.end_base + offset
	
	lw 	$t7, 0($t6)
	
	# ------ Calcula endereço de B[ii][jj] -------- 
	
	mul	$t8, $t3, $s0		# $t2 = jj * MAX
	add 	$t8, $t8, $t2		# $t2 = jj * MAX + ii
	mul 	$t8, $t8, 4		# $t2 = (jj * MAX + ii) * 4 => offset
	add 	$t8, $t8, $s2		# endereço de B[jj][ii] = B.end_base + offset
	
	lw 	$t9, 0($t8)
	
	# ----------- A[ii][jj] + B[ii][jj] ------------- 
	
	add 	$s4, $t7, $t9
    	sw 	$s4, 0($t6)		# Armazena o resultado em A[ii][jj]
    	
# -------------------------------------------------------
    	
    	addi	$t3, $t3, 1		# jj++
    	j 	for_jj			
	
fim_for_jj:
	addi	$t2, $t2, 1		# ii++
	j	for_ii			
	
fim_for_ii:
	add	$t1, $t1, $s3		# j += block_size
	j	for_j	

fim_for_j:
	add	$t0, $t0, $s3		# i += block_size
	j	for_i	
	
encerrar:
    	li 	$v0, 10             	# Código para encerrar o programa
    	syscall                		# Executa a syscall para sair
    	
# ----- Função geradora de matrizes (alocação dinamica na memória heap) -----

cria_matriz:
	li 	$t0, 0					# $t0 = linha = 0
	li 	$t2, 1					# $t2 = valor = 1
	move 	$t3, $a0				# $t3 = MAX
	
	mul	$t5, $t3, $t3				# $t5 = MAX * MAX
	mul 	$t5, $t5, 4				# Multiplica pelo tamanho da word (4 bytes)
	
	# ----------- Alocação dinâmica da matriz -----------
	
	li 	$v0, 9                   		# Código da syscall para criar espaço de alocação na memória heap (syscall 9)
    	move 	$a0, $t5                 		# Envia para o syscall quantos bytes serão alocados
    	syscall				 		# Endereço alocado está salvo em $v0 (que é o retorno da própria função cria_matriz)
	
	# ----------- Preenchimento da matriz --------------
	loop_i:
		li 	$t1, 0				# $t1 = coluna = 0
		
		loop_j:
			# --- Calculo da distância do endereço base ao dado atual = (linha * MAX + coluna) * tam_word ---
			
			mul 	$t4, $t0, $t3		# offset => $t4 = linha * MAX
			add 	$t4, $t4, $t1		# offset += coluna
			mul 	$t4, $t4, 4		# offset *= 4 (pois 1 word = 4 bytes)
			add 	$t4, $v0, $t4		# endereço = end_base + offset
			
			sw 	$t2, 0($t4)		# armazena valor na posição da matriz
			addi	$t2, $t2, 1		# valor++
			addi 	$t1, $t1, 1		# coluna++
			bne 	$t1, $t3, loop_j	# Se (coluna < MAX), repete o loop de colunas
			
			addi 	$t0, $t0, 1		# linha++ 
			bne  	$t0, $t3, loop_i  	# Se linha != MAX, repete o loop de linhas
	
	jr 	$ra