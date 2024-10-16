.data
prompt: .asciiz "Informe um número para descobrir sua raiz: "
out: .asciiz "A raiz eh: "
n: .word 20
x: .double 0.0
e: .double 1.0
raiz: .double 0.0
dois: .double 2.0

.text
.globl main

main:
    # Imprimir mensagem para o usuário
    li $v0, 4
    la $a0, prompt
    syscall

    # Ler número inteiro do usuário
    li $v0, 5
    syscall

    # Converter inteiro para ponto flutuante duplo
    mtc1 $v0, $f0
    cvt.d.w $f0, $f0
    s.d $f0, x

    # Carregar número de iterações da memória
    lw $t0, n
    jal raiz_quadrada

    # Imprimir mensagem de saída
    li $v0, 4
    la $a0, out
    syscall

    # Imprimir valor da raiz calculada
    l.d $f12, raiz
    li $v0, 3
    syscall

    # Terminar o programa
    li $v0, 10
    syscall

raiz_quadrada:
    l.d $f0, x           # Carrega x em $f0
    l.d $f2, e           # Carrega e (estimativa inicial) em $f2
    l.d $f4, dois        # Carrega o valor 2.0 em $f4

iteracao:
    beqz $t0, fim        # Se $t0 (n) == 0, fim das iterações

    # Calcular nova estimativa
    div.d $f6, $f0, $f2  # $f6 = (x / e)
    add.d $f6, $f6, $f2  # $f6 = (x / e) + e
    div.d $f2, $f6, $f4  # e = ((x / e) + e) / 2

    addi $t0, $t0, -1    # Decrementar o valor de n
    j iteracao           # Repetir a iteração

fim:
    s.d $f2, raiz        # Armazenar o resultado final em raiz
    jr $ra               # Retornar para o chamador
