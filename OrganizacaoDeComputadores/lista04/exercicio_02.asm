.data
# Variáveis globais
a: .word 4
b: .word 10
val: .word 0

.text
.globl main

main:
    # Carregar valores de 'a' e 'b' nos registradores
    lw $a0, a           # Carregar valor de 'a' em $a0
    lw $a1, b           # Carregar valor de 'b' em $a1

    # Chamar a função CalculaAreaQuadrado
    jal CalculaAreaQuadrado

    # Armazenar o valor retornado em 'val'
    sw $v0, val

    # Encerrar o programa
    li $v0, 10          # Código de serviço para encerrar o programa
    syscall             # Chama o serviço do sistema para encerrar

# Função CalculaAreaQuadrado
CalculaAreaQuadrado:
    # Calcular area = h * w
    mul $t0, $a0, $a1   # $t0 = h * w

    # Retornar o valor da área
    move $v0, $t0       # $v0 = area
    jr $ra              # Retornar para o endereço de retorno
