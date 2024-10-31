.data
    prompt:     .asciiz "Digite um número para calcular seu fatorial: "
    out:        .asciiz "O resultado é: "
.text
main:
        # ----- Prompt de Entrada -----
        la      $a0, prompt                  # Carrega mensagem do prompt
        li      $v0, 4                        # Syscall para imprimir string
        syscall

        # ----- Lê Entrada -----
        li      $v0, 5                       # Syscall para ler um inteiro
        syscall                                 # O valor de entrada está agora em $v0
    move    $s0, $v0                        # Armazena o valor de entrada em $s0

    # ----- Cálculo do Fatorial -----
    li      $t0, 1                          # Inicializa acumulador do fatorial em $t0

    iteracao_fatorial:
        beq     $s0, 1, fim_fatorial        # Se $s0 == 1, vai para fim_fatorial
        mul     $t0, $t0, $s0                # $t0 *= $s0
        addi    $s0, $s0, -1                 # $s0--
        j       iteracao_fatorial            # Repete o loop

    fim_fatorial:
        # ----- Saída do Resultado -----
        li      $v0, 4                       # Código da syscall para imprimir string
        la      $a0, out                     # Carrega a mensagem de saída
        syscall

        move    $a0, $t0                     # Move o resultado do fatorial para $a0
        li      $v0, 1                       # Syscall para imprimir o inteiro
        syscall

        li      $v0, 10                      # Syscall para encerrar o programa
        syscall
