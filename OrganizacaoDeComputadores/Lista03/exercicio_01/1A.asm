.data
	# declaração das variaveis
	A: .word 10	# A=10
	B: .word 15
	C: .word 20
	D: .word 25
	E: .word 30
	F: .word 35

	# declaração das funções levando em conta o espaço para armazenamento
	G: .space 16 # 4 words(4*4 = 16 bytes0)
	H: .space 16 

.text
main:	# função principal
	# carregar valores das variáveis
	lw $s0, A	# Carregar A em $s0
	lw $s1, B
	lw $s2, C
	lw $s3, D
	lw $s4, E
	lw $s5, F
	# Carregar endereço base das funções
	la $s6, G	# Carregar o endereço base de G em $s6
	la $s7, H	   
	
	
	# Estrutura da função G[0] = (A-(B+C) +F)
	# Boa prática é utilizar registradores temporários
	add $t0, $s1, $s2	# $t0 = B + C
	sub $t1, $s0, $t0	# $t = A - (B + C)
	add $t2, $t1, $s5	# $t2 = A - (B + C) + F
	sw $t2, 0($s6)		# G[0] = $t2
	
	# Encerrar o programa
	li $v0, 10	# Chamada de syscall para encerrar o programa
	syscall
    	
