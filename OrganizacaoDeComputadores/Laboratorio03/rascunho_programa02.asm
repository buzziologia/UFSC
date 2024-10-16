.data
# Declaração de variáveis
x: .double 0.0
resultado: .double 0.0
msg1: .asciiz "Digite o valor de x: "
msg2: .asciiz "O valor aproximado do seno de x e: "
msg3: .asciiz "\n"
zero_point_zero: .double 0.0
one_point_zero: .double 1.0

.text
main:
    # Ler o valor de x
    la $a0, msg1        # Carregar endereço da mensagem
    li $v0, 4           
    syscall             # Imprimir a mensagem

    li $v0, 7           # Código de serviço para leitura de ponto flutuante
    syscall             # Ler o valor do usuário
    s.d $f0, x          # Armazenar o valor em 'x'

    # Carregar o valor de x no registrador de ponto flutuante $f12
    l.d $f12, x

    # Chamar a função seno
    jal seno

    # Armazenar o valor retornado em 'resultado'
    s.d $f0, resultado

    # Mostrar o resultado na tela
    la $a0, msg2        # Carregar endereço da mensagem de resultado
    li $v0, 4           
    syscall             # Imprimir a mensagem

    l.d $f12, resultado # Carregar o valor de 'resultado' em $f12
    li $v0, 3           
    syscall             # Mostrar o valor na tela

    # Imprimir nova linha
    la $a0, msg3
    li $v0, 4
    syscall

    # Encerrar o programa
    li $v0, 10          
    syscall             # Chamar o serviço do sistema para encerrar

# Função seno
seno:
    # Inicializar variáveis de ponto flutuante com instruções de carregamento
    l.d $f0, zero_point_zero  # $f0 = resultado (soma dos termos) inicializa como 0.0
    l.d $f2, one_point_zero   # $f2 = numerador (inicialmente x^1)
    l.d $f4, one_point_zero   # $f4 = denominador (inicialmente 1.0)
    l.d $f6, one_point_zero   # $f6 = fator de sinal (inicialmente 1.0)
    li $t0, 0                 # $t0 = contador de termos

calculo_seno:
    # Calcular o termo da série: (sinal * numerador / denominador)
    div.d $f8, $f2, $f4   # $f8 = numerador / denominador
    mul.d $f8, $f8, $f6   # $f8 = (sinal * numerador / denominador)

    # Adicionar ou subtrair o termo do resultado
    add.d $f0, $f0, $f8   # $f0 = $f0 + $f8

    # Atualizar o numerador (x^(2*i+1))
    mul.d $f2, $f2, $f12  # $f2 = $f2 * x
    mul.d $f2, $f2, $f12  # $f2 = $f2 * x

    # Atualizar o denominador ((2*i+1)!)
    addi $t0, $t0, 2      # Incrementar o denominador por 2 (considerando i+1 no loop)
    mul.d $f4, $f4, $f2   # $f4 = $f4 * (2*i+1)

    # Alternar o sinal
    neg.d $f6, $f6        # Alternar o sinal

    # Verificar se o limite de termos foi atingido
    li $t2, 20
    bge $t0, $t2, end_seno

    j calculo_seno

end_seno:
    jr $ra                # Retornar para o chamador

