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

    	# if (A == B)
    	bne  $t0, $t1, end_if # Se $t0 != $t1, pular para 'end_if'

    	# B = A
    	sw $t0, B            # Armazenar valor de 'A' em 'B'

end_if:
   	# Encerrar programa
    	li $v0, 10           # Código de serviço para encerrar o programa
    	syscall              # Chama o serviço do sistema para encerrar
