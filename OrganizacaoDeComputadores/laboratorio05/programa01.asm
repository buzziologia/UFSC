data
    prompt:     .asciiz "Digite um número para calcular seu fatorial: "
    out:        .asciiz "O resultado é: "
.text
main:
        # ----- Mostrar a mensagem de prompt -----
        li      $v0, 4
    la      $a0, prompt
        syscall

        # ----- Ler o número do teclado -----
        li      $v0, 5
        syscall
        move    $a0, $v0                  # $a0 recebe o número para a função fatorial

        # ----- Chamar a função fatorial -----
        jal     fatorial

        # ----- Mostrar a mensagem do resultado -----
        move    $s7, $v0                  # Armazena o resultado do fatorial em $s7
        li      $v0, 4
        la      $a0, out
        syscall

        # ----- Mostrar o resultado do fatorial -----
        move    $a0, $s7
        li      $v0, 1
        syscall

        # ----- Terminar o programa -----
        li      $v0, 10
        syscall

fatorial:
        addi    $sp, $sp, -8              # Reservar espaço na pilha para variáveis locais
        sw      $ra, 4($sp)               # Salvar o endereço de retorno
        sw      $a0, 0($sp)               # Salvar o valor de $a0

        # ----- Caso base: se n <= 1, retornar 1 -----
        ble     $a0, 1, caso_base

        # ----- Passo recursivo -----
        addi    $a0, $a0, -1              # n - 1
        jal     fatorial                  # Chamar fatorial(n - 1)

        # ----- Recuperar o valor original de n -----
        lw      $a0, 0($sp)

        # ----- Multiplicar n pelo resultado de fatorial(n - 1) -----
        mul     $v0, $a0, $v0

        # ----- Restaurar o valor de $ra e a pilha -----
        lw      $ra, 4($sp)
        addi    $sp, $sp, 8
        jr      $ra

caso_base:
       # ----- Caso base: retornar 1 -----
        li      $v0, 1
        lw      $ra, 4($sp)
        addi    $sp, $sp, 8
        jr      $ra
´´´
a
a
a
a
a
aa
a
a
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
