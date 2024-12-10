.data
msg:    .asciiz "Valor flutuante: "
pi:     .float 5.00           # Definindo o valor flutuante
str:    .space 20             # Espaço para armazenar a string
nome_arquivo: .asciiz "C:\\Users\\vinir\\gitbuzzi\\UFSC\\OrganizacaoDEComputadores\\TrabalhoFinal\\eu.txt"  # Caminho para o arquivo
erro_str: .asciiz "Erro ao abrir arquivo\n"
cem: .float 10

nome_arquivo: .asciiz "C:\\Users\\vinir\\gitbuzzi\\UFSC\\OrganizacaoDEComputadores\\TrabalhoFinal\\eu.txt"
puro_str: .asciiz "Cafe Puro\n"
leite_str: .asciiz "Cafe com Leite\n"
mocaccino_str: .asciiz "Mocaccino\n"
pequeno_str: .asciiz "Pequeno\n"
grande_str: .asciiz "Grande\n"
acucar_str: .asciiz "Com Acucar\n"
sem_acucar_str: .asciiz "Sem Acucar\n"
erro_str: .asciiz "Erro ao abrir arquivo\n"
preco_str: .asciiz "Preco: $"
preco_inicial: .float 0.0
preco_cafe_puro: .float 5.0
preco_cafe_com_leite: .float 6.0
preco_mocaccino: .float 7.0
preco_adicional_grande: .float 2.0
preco_total_str: .space 20



.text
.globl main
main:
# Registradores
    # $s4 - bebida selecionada 
    # $s5 - tamanho (1 para pequeno ou 2 para grande)
    # $s6 - acucar (0 para sem ou 1 para com açúcar)
    li $s4, 1
    li $s5, 1
    li $s6, 1
        # Carregar o valor flutuante no registrador $f0
        la      $t0, pi         # Carrega o endereço de pi em $t0
        lwc1    $f0, 0($t0)     # Carrega o valor flutuante de pi no registrador $f0
        
        # Converter o valor flutuante para inteiro (parte inteira)
        trunc.w.s $f2, $f0      # Trunca a parte decimal de $f0 e coloca em $f2
        mfc1    $t1, $f2        # Move a parte inteira para o registrador $t1

        # Converter parte inteira para string
        la      $t2, str         # Carrega o endereço do buffer de string
        li      $t3, 10          # Número base (decimal)
int_to_str:
        divu    $t1, $t1, $t3    # Divide a parte inteira por 10
        mfhi    $t4              # Remainder (dígito atual)
        addi    $t4, $t4, 48     # Converte para ASCII (0-9)
        sb      $t4, 0($t2)      # Armazena o dígito no buffer
        addi    $t2, $t2, 1      # Avança para o próximo caractere
        mflo    $t1              # Atualiza $t1 com o quociente
        bnez    $t1, int_to_str  # Repete se ainda houver mais dígitos

        # Adicionar ponto decimal
        li $t4, 46               # Carrega o valor ASCII do ponto (.)
        sb $t4, 0($t2)           # Armazena o ponto no buffer
        addi $t2, $t2, 1         # Avança para o próximo caractere

        # Converter parte decimal para string (multiplica por 10 e trunca)
        la $t0, cem
        lwc1 $f1, 0($t0)
        mul.s $f3, $f0, $f1      # Multiplica o valor flutuante por 10
        trunc.w.s $f3, $f3
        mfc1    $t5, $f3         # Move a parte inteira da multiplicação para $t5

        # Converter parte decimal para string
        li      $t6, 10          # Base decimal para a parte decimal
dec_to_str:
        divu    $t5, $t5, $t6    # Divide a parte decimal por 10
        mfhi    $t7              # Remainder (dígito atual)
        addi    $t7, $t7, 48     # Converte para ASCII
        sb      $t7, 0($t2)      # Armazena o dígito no buffer
        addi    $t2, $t2, 1      # Avança para o próximo caractere
        mflo    $t5              # Atualiza $t5 com o quociente
        bnez    $t5, dec_to_str  # Repete se ainda houver mais dígitos

        # Terminar a string
        sb      $zero, 0($t2)    # Adiciona o terminador de string

        # Imprimir a mensagem
        li      $v0, 4           # Serviço de syscall para imprimir string
        la      $a0, msg         # Carrega o endereço da string "Valor flutuante"
        syscall

        # Imprimir o valor flutuante convertido para string
        li      $v0, 4           # Serviço de syscall para imprimir string
        la      $a0, str         # Carrega o endereço da string convertida
        syscall

        # Passo 1: Abrir/criar o arquivo
        li $v0, 13               # Syscall para abrir/criar arquivo
        la $a0, nome_arquivo     # Nome do arquivo
        li $a1, 1                # Modo de acesso: 1 = Escrita
        li $a2, 511              # Permissões (decimal equivalente a 777 em octal)
        syscall
        move $t8, $v0            # Salva o descritor do arquivo no $t8

        # Verifica se o arquivo foi aberto com sucesso
        bltz $v0, erro_abrir_arquivo  # Se $v0 < 0, ocorreu erro

        # Escrever o valor flutuante convertido no arquivo
        li $v0, 15               # Syscall para escrever no arquivo
        move $a0, $t8            # Descritor do arquivo
        la $a1, str              # Ponteiro para a string convertida
        li $a2, 20               # Número de bytes a serem escritos
        syscall

        # Passo 3: Fechar o arquivo
        li $v0, 16               # Syscall para fechar arquivo
        move $a0, $t8            # Descritor do arquivo
        syscall

        # Finalizar o programa
        li      $v0, 10          # Serviço de syscall para sair
        syscall

erro_abrir_arquivo:
        li      $v0, 4           # Serviço de syscall para imprimir string
        la      $a0, erro_str    # Ponteiro para a string de erro
        syscall
        j main                   # Retorna ao início
