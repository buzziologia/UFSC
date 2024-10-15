.data
	v: .space 24  # Espaço para 6 palavras (24 bytes)

.text
main:
    	la $s0, 0x10010020  # Carregar o endereço de início do vetor em $s0
    
    	li $t0, 1           # Carrega o valor 1 em $t0
    	sw $t0, 0($s0)      # Armazena $t0 na primeira posição do vetor (v[0])
    
    	li $t0, 3           # Carrega o valor 3 em $t0
    	sw $t0, 4($s0)      # Armazena $t0 na segunda posição do vetor (v[1])
    
    	li $t0, 2           # Carrega o valor 2 em $t0
    	sw $t0, 8($s0)      # Armazena $t0 na terceira posição do vetor (v[2])
    
    	li $t0, 1           # Carrega o valor 1 em $t0
    	sw $t0, 12($s0)     # Armazena $t0 na quarta posição do vetor (v[3])
    
    	li $t0, 4           # Carrega o valor 4 em $t0
    	sw $t0, 16($s0)     # Armazena $t0 na quinta posição do vetor (v[4])
    
    	li $t0, 5           # Carrega o valor 5 em $t0
    	sw $t0, 20($s0)     # Armazena $t0 na sexta posição do vetor (v[5])
    
    	# Encerrar o programa
    	li $v0, 10
    	syscall
