.data
    negativo_um:      .double -1
    um:               .double 1
    prompt:           .asciiz "Digite um número para calcular o seno (em radianos): "
    resultado_msg:    .asciiz "O valor aproximado do seno é: "

.text

    j   main

# ===== FUNÇÃO: FATORIAL =====
# Calcula n!
# Parâmetro: n ($a0)
# Saída: n! ($f4)

fatorial:
    addi    $sp, $sp, -8          # Aloca espaço na pilha para o endereço de retorno e variável
    sw      $ra, 0($sp)           # Armazena o endereço de retorno
    sw      $s0, 4($sp)           # Armazena o valor atual de n

    l.d     $f4, um                # Inicializa o resultado em 1
    beq     $a0, $zero, terminar   # Se n é 0, finaliza a função

    move    $s0, $a0               # Copia n para $s0
    addi    $a0, $a0, -1            # Decrementa n
    jal     fatorial                # Chamada recursiva

    mtc1    $s0, $f14              # Move n para o registrador de ponto flutuante para multiplicação
    cvt.d.w $f14, $f14              # Converte inteiro para double

    mul.d   $f4, $f14, $f4          # Calcula n! = n * (n-1)!

terminar:    
    lw      $ra, 0($sp)            # Restaura o endereço de retorno
    lw      $s0, 4($sp)            # Restaura n
    addi    $sp, $sp, 8             # Desaloca espaço na pilha
    jr      $ra                      # Retorna

# ===== FUNÇÃO: POTÊNCIA =====
# Calcula x elevado a n
# Parâmetros: x ($f2) e n ($a0)
# Saída: x^n ($f8)

potencia:
    l.d     $f8, um                # Inicializa o resultado em 1

    beq     $a0, 0, sair_potencia  # Se n = 0, retorna 1

    li      $t0, 0                  # Contador do loop

loop_potencia:
    mul.d   $f8, $f8, $f2           # Multiplica resultado por x
    addi    $t0, $t0, 1             # Incrementa contador
    bne     $t0, $a0, loop_potencia # Continua até n ser alcançado

sair_potencia:
    jr      $ra                     # Retorna

# ===== FUNÇÃO: SENO =====
# Calcula seno usando a série (((-1)^n) / (2*n + 1)! ) *  x^(2*n + 1) para n em [0, 20]
# Parâmetro: x ($f0)
# Saída: valor do seno ($f12)

seno:
    move    $s1, $ra                # Salva o endereço de retorno em $s1

    li      $t0, 0                   # Inicializa seno em 0
    mtc1    $t0, $f12
    cvt.d.w $f12, $f12               # Converte inteiro para double

    li      $t1, 0                   # Inicializa n para a somatória

loop_soma:
    l.d     $f2, negativo_um         # Carrega -1
    move    $a0, $t1                 # Define o parâmetro n

    jal     potencia                  # Calcula (-1)^n

    add     $t2, $t1, $t1            # Calcula 2*n
    addi    $t2, $t2, 1              # Calcula 2*n + 1

    move    $a0, $t2                 # Define o parâmetro para fatorial
    jal     fatorial                  # Calcula (2*n + 1)!

    div.d   $f4, $f8, $f4            # Calcula fator = (-1)^n / (2*n + 1)!

    mov.d   $f2, $f0                 # Move x para $f2
    move    $a0, $t2                 # Define o parâmetro para potência
    jal     potencia                  # Calcula x^(2*n + 1)

    mul.d   $f6, $f4, $f8            # Calcula fator * x^(2*n + 1)
    add.d   $f12, $f12, $f6          # Atualiza a soma do seno

    addi    $t1, $t1, 1              # Incrementa n
    bne     $t1, 20, loop_soma       # Continua o loop se n < 20

    move    $ra, $s1                 # Restaura o endereço de retorno
    jr      $ra                       # Retorna

# ======== FUNÇÃO PRINCIPAL ===========

main:
    # ----- Prompt de Entrada -----
    la      $a0, prompt              # Carrega mensagem do prompt
    li      $v0, 4                    # Syscall para imprimir string
    syscall

    # ----- Lê Entrada -----
    li      $v0, 7                    # Syscall para ler double
    syscall                             # O valor de entrada está agora em $f0

    # ----- Chama Função Seno -----
    jal     seno

    # ----- Saída do Resultado -----
    la      $a0, resultado_msg        # Carrega mensagem do resultado
    li      $v0, 4                    # Syscall para imprimir string
    syscall

    li      $v0, 3                    # Syscall para imprimir double
    syscall                             # Saída do valor do seno em $f12

    # ----- Fim do Programa -----
    li      $v0, 10                   # Syscall de saída
    syscall
