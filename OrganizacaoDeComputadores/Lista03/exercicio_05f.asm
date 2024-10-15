.data
# Declaração de variáveis
A: .word 0
B: .word 0
C: .word 5

.text
.globl main

main:
    	# Inicialização das variáveis
    	li $t0, 0           # A = 0
    	sw $t0, A
    	li $t1, 0           # B = 0
    	sw $t1, B
    	li $t2, 5           # C = 5
    	sw $t2, C

    	# Carregar variáveis nos registradores
    	lw $t0, A           # Carregar valor de 'A' em $t0
    	lw $t1, B           # Carregar valor de 'B' em $t1
    	lw $t2, C           # Carregar valor de 'C' em $t2

loop:
    	# while (A < C)
    	bge $t0, $t2, end_loop  # Se A >= C, sair do loop

    	# A = A + 1
    	addi $t0, $t0, 1        # Incrementar $t0 (A)

    	# B = B + 2
    	addi $t1, $t1, 2        # Incrementar $t1 (B)

    	# Armazenar os novos valores de A e B na memória
    	sw $t0, A
    	sw $t1, B

    	j loop                  # Voltar para o início do loop

end_loop:
    	# Encerrar programa
    	li $v0, 10              # Código de serviço para encerrar o programa
    	syscall                 # Chama o serviço do sistema para encerrar
