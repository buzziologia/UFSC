.data
matriz: .space 1024
newline: .asciiz "\n"

.text
main:
	# --- Inicialização ---
    	la $s0, matriz        # Carrega o endereço da matriz
    	li $t4, 4             # Tamanho de uma word 
    	li $t3, 0             # Inicializa o número a ser armazenado (num)

    	# --- Loop de Linhas ---
    	li $t1, 0	      # Inicializa J (coluna) com 0
    	j loop_coluna
    	
loop_coluna:
	li $t0, 0
	bge $t1, 16, printar_matriz
	j loop_linha
	
loop_linha:
    	bge $t0, 16, fim_coluna
    	mul $t2, $t0, 16   # Calcula o offset da linha (16 * 4 bytes = 64 bytes por linha)
    	
    	add $t2, $t2, $t1  # Adiciona o deslocamento da coluna
    	mul $t2, $t2, 4    # Cada valor ocupa 4 bytes (word)
    	add $t2, $s0, $t2  # Calcula o endereço final da matriz
    	sw $t3, 0($t2)     # Armazena o valor na matriz
    	addi $t0, $t0, 1   # Incrementa coluna
    	addi $t3, $t3, 1   # Incrementa o valor a ser armazenado
    	j loop_linha

fim_coluna:
	addi $t1, $t1, 1
	j loop_coluna

printar_matriz:
    	la $s0, matriz         # Reinicia o endereço da matriz
    	li $t0, 0              # Inicializa I (linha) com 0
    	j printar_linha

printar_linha:
    	li $t1, 0              # Inicializa J (coluna) com 0
    	bge $t0, 16, encerrar_programa # Se I >= 16, termina o programa
    	j printar_coluna

printar_coluna:
    	bge $t1, 16, nova_linha # Se J >= 16, vai para nova_linha
    	lw $a0, 0($s0)         # Carrega o valor da matriz para $a0
    	li $v0, 1              # Código para imprimir inteiro
    	syscall                # Imprime o valor
    	addi $s0, $s0, 4       # Avança para o próximo endereço na matriz
    	addi $t1, $t1, 1       # Incrementa J (coluna)
    	j printar_coluna

nova_linha:
    	la $a0, newline        # Carrega a nova linha
    	li $v0, 4              # Código para imprimir string
    	syscall                # Imprime a nova linha
    	addi $t0, $t0, 1       # Incrementa I (linha)
    	j printar_linha

encerrar_programa:
    	li $v0, 10             # Código para encerrar o programa
    	syscall                # Executa a syscall para sair	
