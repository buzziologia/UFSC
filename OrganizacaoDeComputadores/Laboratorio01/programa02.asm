.data 
    msg_b: .asciiz "Entre com um número para b: "  # Mensagem para pedir o valor de b
    msg_d: .asciiz "Entre com um número para d: "  # Mensagem para pedir o valor de d
    msg_e: .asciiz "Entre com um número para e: "  # Mensagem para pedir o valor de e
    c: .word 0             # Variável c, que será usada para armazenar o resultado

.text
main:
    # Solicitar e ler o valor de b do usuário
    la $a0, msg_b          # Carregar o endereço da string "msg_b" em $a0
    li $v0, 4              # Código da syscall para imprimir uma string (syscall 4)
    syscall                # Executa a syscall para exibir a mensagem "Entre com um número para b: "
    
    li $v0, 5              # Código da syscall para ler um número inteiro (syscall 5)
    syscall                # Executa a syscall para ler o número
    add $s0, $zero, $v0    # Armazena o número lido no registrador $s0 (b)

    # Solicitar e ler o valor de d do usuário
    la $a0, msg_d          # Carregar o endereço da string "msg_d" em $a0
    li $v0, 4              # Código da syscall para imprimir uma string (syscall 4)
    syscall                # Executa a syscall para exibir a mensagem "Entre com um número para d: "
    
    li $v0, 5              # Código da syscall para ler um número inteiro (syscall 5)
    syscall                # Executa a syscall para ler o número
    add $s1, $zero, $v0    # Armazena o número lido no registrador $s1 (d)

    # Solicitar e ler o valor de e do usuário
    la $a0, msg_e          # Carregar o endereço da string "msg_e" em $a0
    li $v0, 4              # Código da syscall para imprimir uma string (syscall 4)
    syscall                # Executa a syscall para exibir a mensagem "Entre com um número para e: "
    
    li $v0, 5              # Código da syscall para ler um número inteiro (syscall 5)
    syscall                # Executa a syscall para ler o número
    add $s2, $zero, $v0    # Armazena o número lido no registrador $s2 (e)

    # Operação matemática: b + 35 + e
    addi $t0, $s0, 35      # Adiciona 35 ao valor de b ($s0), e armazena o resultado em $t0
    add $t1, $t0, $s2      # Soma o valor de $t0 com o valor de e ($s2), armazenando o resultado em $t1

    # Operação matemática: calcular d^3
    mul $t2, $s1, $s1      # Multiplica d ($s1) por ele mesmo, armazenando o resultado em $t2 (d^2)
    mul $t2, $s1, $t2      # Multiplica o resultado anterior ($t2) por d novamente, obtendo d^3 em $t2

    # Subtração: d^3 - (b + 35 + e)
    sub $t3, $t2, $t1      # Subtrai o valor de $t1 (b + 35 + e) de d^3 ($t2), armazenando o resultado em $t3
    
    # Armazenar o resultado em c
    sw $t3, c              # Armazena o valor final de $t3 na variável "c" na memória

    # Exibir o resultado final (valor de c)
    add $a0, $zero, $t3    # Passa o valor de $t3 para $a0 para impressão
    li $v0, 1              # Código da syscall para imprimir um número inteiro (syscall 1)
    syscall                # Executa a syscall para imprimir o valor armazenado em $a0 (o resultado final)

    # Finalizar o programa
    li $v0, 10             # Código da syscall para terminar o programa (syscall 10)
    syscall                # Executa a syscall para sair do programa
