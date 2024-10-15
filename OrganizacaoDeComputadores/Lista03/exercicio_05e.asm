.data
# Declaração de variáveis
A: .word 0
B: .word 0

.text
.globl main

main:
    	# Loop principal

    	# Ler A
    	li $v0, 5            # Código de serviço para leitura de inteiro
    	syscall              # Chama o serviço do sistema para ler o valor do usuário
    	sw $v0, A            # Armazena o valor em 'A'

    	# Ler B
    	li $v0, 5            # Código de serviço para leitura de inteiro
    	syscall              # Chama o serviço do sistema para ler o valor do usuário
    	sw $v0, B            # Armazena o valor em 'B'

    	# Carregar valores A e B nos registradores
    	lw $t0, A            # Carregar valor de 'A' em $t0
    	lw $t1, B            # Carregar valor de 'B' em $t1

    	# if (A < B)
    	bge $t0, $t1, else_ # Se $t0 >= $t1, pular para 'else_part'

    	# A = A + 1
    	addi $t0, $t0, 1     # Incrementar $t0 (A)
    	sw $t0, A            # Armazenar novo valor de 'A' na memória
    	j end_if             # Pular para 'end_if'

else_:
    	# B = B + 1
    	addi $t1, $t1, 1     # Incrementar $t1 (B)
    	sw $t1, B            # Armazenar novo valor de 'B' na memória

end_if:
    	# Encerrar programa
    	li $v0, 10           # Código de serviço para encerrar o programa
    	syscall              # Chama o serviço do sistema para encerrar
