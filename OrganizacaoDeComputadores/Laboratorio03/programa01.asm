.data
prompt: .asciiz "Informe um número para descobrir sua raiz: "
iteracoes_prompt: .asciiz "Informe o número de iterações: "
out: .asciiz "A raiz do número informado é: "
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
    
    # Solicitar o número de iterações
    li $v0, 4
    la $a0, iteracoes_prompt
    syscall
    
    # Ler número inteiro do usuário (iterações)
    li $v0, 5
    syscall
    
    # Armazenar número de iterações em $t0
    move $t0, $v0
    
    # Chamar a função raiz_quadrada
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
    
    # Decrementar o valor de n
    addi $t0, $t0, -1
    
    # Repetir a iteração
    j iteracao           

fim:
    s.d $f2, raiz        # Armazenar o resultado final em raiz
    jr $ra               # Retornar para o chamador
