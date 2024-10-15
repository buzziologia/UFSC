.data
# Declaração de variáveis
Base: .word 0
Expoente: .word 0
Resultado: .word 0

.text
.globl main

main:
    # Ler Base
    li $v0, 5          # Código de serviço para leitura de inteiro
    syscall            # Chama o serviço do sistema para ler o valor do usuário
    sw $v0, Base       # Armazena o valor em 'Base'

    # Ler Expoente
    li $v0, 5          # Código de serviço para leitura de inteiro
    syscall            # Chama o serviço do sistema para ler o valor do usuário
    sw $v0, Expoente   # Armazena o valor em 'Expoente'

    # Carregar valores de Base e Expoente nos registradores
    lw $a0, Base       # Carregar valor de 'Base' em $a0
    lw $a1, Expoente   # Carregar valor de 'Expoente' em $a1

    # Chamar a função pow
    jal pow

    # Armazenar o valor retornado em 'Resultado'
    sw $v0, Resultado

    # Mostrar o resultado na tela
    lw $a0, Resultado  # Carregar o valor de 'Resultado' em $a0
    li $v0, 1          # Código de serviço para impressão de inteiro
    syscall            # Chama o serviço do sistema para mostrar o valor

    # Encerrar o programa
    li $v0, 10         # Código de serviço para encerrar o programa
    syscall            # Chama o serviço do sistema para encerrar

# Função pow
pow:
    # Inicializar res = 1
    li $t0, 1          # $t0 = res = 1

    # Inicializar contador i = 0
    li $t1, 0          # $t1 = i = 0

loop:
    # Verificar se i < Expoente
    bge $t1, $a1, end_pow # Se $t1 >= $a1 (Expoente), sair do loop

    # res *= Base
    mul $t0, $t0, $a0  # $t0 = res * Base

    # i++
    addi $t1, $t1, 1   # Incrementar i

    # Voltar ao início do loop
    j loop

end_pow:
    # Armazenar o resultado em $v0
    move $v0, $t0      # $v0 = res

    # Retornar para o chamador
    jr $ra             # Retornar para o endereço de retorno
