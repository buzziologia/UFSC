.data
	# declaração das variaveis
	A: .word 10	# A=10
	B: .word 15
	C: .word 20
	D: .word 25
	E: .word 30
	F: .word 35
	G. 
	# declaração das funções levando em conta o espaço para armazenamento
	G: .space 16 		# 4 words(4*4 = 16 bytes0)
	H: .space 16 

.text
main:	# função principal
	# carregar valores das variáveis
	lw $s0, A		# Carregar A em $s0
	lw $s1, B
	lw $s2, C
	lw $s3, D
	lw $s4, E
	lw $s5, F
	
	# Carregar endereço base das funções
	la $s6, G		# Carregar o endereço base de G em $s6
	la $s7, H	   
	
	# G[0] = (A – (B + C) + F);
   	add $t0, $s1, $s2    # t0 = B + C
    	sub $t1, $s0, $t0    # t1 = A - (B + C)
    	add $t2, $t1, $s5    # t2 = A - (B + C) + F
    	sw $t2, 0($s6)       # G[0] = t2

    	# G[1] = E – (A – B) * (B – C);
    	sub $t3, $s0, $s1    # t3 = A - B
    	sub $t4, $s1, $s2    # t4 = B - C
    	mul $t5, $t3, $t4    # t5 = (A - B) * (B - C)
    	sub $t6, $s4, $t5    # t6 = E - (A - B) * (B - C)
    	sw $t6, 4($s6)       # G[1] = t6

    	# G[2] = G[1] – C;
    	lw $t7, 4($s6)       # t7 = G[1]
    	sub $t8, $t7, $s2    # t8 = G[1] - C
    	sw $t8, 8($s6)       # G[2] = t8

    	# G[3] = G[2] + G[0];
    	lw $t9, 8($s6)       # t9 = G[2]
    	lw $t2, 0($s6)       # reuse t2 = G[0]
    	add $t10, $t9, $t2   # t10 = G[2] + G[0]
    	sw $t10, 12($s6)     # G[3] = t10

    	# H[0] = B – C;
    	sub $t11, $s1, $s2   # t11 = B - C
    	sw $t11, 0($s7)      # H[0] = t11

    	# H[1] = A + C;
    	add $t12, $s0, $s2   # t12 = A + C
    	sw $t12, 4($s7)      # H[1] = t12

    	# H[2] = B – C + G[3];
    	sub $t13, $s1, $s2   # t13 = B - C
    	lw $t10, 12($s6)     # reuse t10 = G[3]
    	add $t14, $t13, $t10 # t14 = B - C + G[3]
    	sw $t14, 8($s7)      # H[2] = t14

    	# H[3] = B – G[0] + D;
    	lw $t2, 0($s6)       # reuse t2 = G[0]
    	sub $t15, $s1, $t2   # t15 = B - G[0]
    	add $t16, $t15, $s3  # t16 = B - G[0] + D
    	sw $t16, 12($s7)     # H[3] = t16

    	# Encerrar o programa
    	li $v0, 10
    	syscall
    	
