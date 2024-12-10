.data
nome_arquivo: .asciiz "C:\\Users\\vinir\\gitbuzzi\\UFSC\\OrganizacaoDEComputadores\\TrabalhoFinal\\OIE.txt"  # Caminho para o arquivo
puro_str: .asciiz "Cafe Puro\n"
leite_str: .asciiz "Cafe com Leite\n"
mocaccino_str: .asciiz "Mocaccino\n"
pequeno_str: .asciiz "Pequeno\n"
grande_str: .asciiz "Grande\n"
acucar_str: .asciiz "Com Acucar\n"
sem_acucar_str: .asciiz "Sem Acucar\n"
erro_str: .asciiz "Erro ao abrir arquivo\n"
valor_pago_str: .asciiz "Valor Pago: R$ "
preco_puro_pequeno_str: .asciiz "3,00\n"
preco_puro_grande_str: .asciiz "5,00\n"
preco_leite_pequeno_str: .asciiz "4,50\n"
preco_leite_grande_str: .asciiz "6,50\n"
preco_mocaccino_pequeno_str: .asciiz "5,00\n"
preco_mocaccino_grande_str: .asciiz "7,00\n"
empresa_info: .asciiz "CoffeeBreak - Seu Cafe Perfeito\nEndereco: Rua dos Aromas, 123 - Centro - CafeLandia\nTelefone: (48) 1234-5678\nCNPJ: 12.345.678/0001-90\nObrigado por escolher CoffeeBreak!\n\n"
seu_pedido: .asciiz "Seu pedido foi:\n"
.text


main:
    li $s4, 1                # Bebida selecionada (1: Cafe Puro, 2: Cafe com Leite, 3: Mocaccino)
    li $s5, 1                # Tamanho (1: Pequeno, 2: Grande)
    li $s6, 1                # Açúcar (1: Sem Açúcar, 2: Com Açúcar)

    # Chama o procedimento GERAR_TXT
    jal GERAR_TXT

    # Finaliza o programa
    li $v0, 10               # Syscall para encerrar o programa
    syscall
GERAR_TXT:
    # Passo 1: Abrir/criar o arquivo
    li $v0, 13               # Syscall para abrir/criar arquivo
    la $a0, nome_arquivo     # Nome do arquivo
    li $a1, 1                # Modo de acesso: 1 = Escrita
    li $a2, 511              # Permissões (decimal equivalente a 777 em octal)
    syscall
    move $t0, $v0            # Salva o descritor do arquivo no $t0

    # Verifica se o arquivo foi aberto com sucesso
    bltz $v0, erro_abrir_arquivo  # Se $v0 < 0, ocorreu erro

    # Passo 2: Escrever no arquivo
    # Escreve a bebida selecionada
    li $v0, 15               # Syscall para escrever no arquivo
    move $a0, $t0            # Descritor do arquivo
    
    la $a1, empresa_info
    li $a2, 170
    syscall
    li $v0, 15               # Syscall para escrever no arquivo
    move $a0, $t0            # Descritor do arquivo
    
    la $a1, seu_pedido
    li $a2, 16
    syscall
    li $v0, 15               # Syscall para escrever no arquivo
    move $a0, $t0            # Descritor do arquivo
    
    
    
    
    beq $s4, 1, escreve_cafe_puro
    beq $s4, 2, escreve_cafe_com_leite
    beq $s4, 3, escreve_mocaccino
    j verifica_tamanho

escreve_cafe_puro:
    la $a1, puro_str         # Ponteiro para a string "Cafe Puro"
    li $a2, 10               # Número de bytes a serem escritos
    syscall
    j verifica_tamanho

escreve_cafe_com_leite:
    la $a1, leite_str        # Ponteiro para a string "Cafe com Leite"
    li $a2, 15               # Número de bytes a serem escritos
    syscall
    j verifica_tamanho

escreve_mocaccino:
    la $a1, mocaccino_str    # Ponteiro para a string "Mocaccino"
    li $a2, 10               # Número de bytes a serem escritos
    syscall
    j verifica_tamanho

verifica_tamanho:
    # Escreve o tamanho
    li $v0, 15               # Syscall para escrever no arquivo
    move $a0, $t0            # Descritor do arquivo
    beq $s5, 1, escreve_pequeno
    beq $s5, 2, escreve_grande
    j verifica_acucar

escreve_pequeno:
    la $a1, pequeno_str      # Ponteiro para a string "Pequeno"
    li $a2, 8                # Número de bytes a serem escritos
    syscall
    j verifica_acucar

escreve_grande:
    la $a1, grande_str       # Ponteiro para a string "Grande"
    li $a2, 7                # Número de bytes a serem escritos
    syscall
    j verifica_acucar

verifica_acucar:
    # Escreve se tem açúcar ou não
    li $v0, 15               # Syscall para escrever no arquivo
    move $a0, $t0            # Descritor do arquivo
    beq $s6, 1, escreve_sem_acucar
    beq $s6, 2, escreve_com_acucar 
    j imprime_preco

escreve_sem_acucar:
    la $a1, sem_acucar_str   # Ponteiro para a string "Sem Acucar"
    li $a2, 11               # Número de bytes a serem escritos
    syscall
    j imprime_preco

escreve_com_acucar:
    la $a1, acucar_str       # Ponteiro para a string "Com Acucar"
    li $a2, 11               # Número de bytes a serem escritos
    syscall
    j imprime_preco

imprime_preco:
    # Imprime o preço
    li $v0, 15               # Syscall para escrever no arquivo
    move $a0, $t0            # Descritor do arquivo
    la $a1, valor_pago_str   # Ponteiro para a string "Valor Pago: R$ "
    li $a2, 14               # Número de bytes a serem escritos
    syscall

    beq $s4, 1, preco_cafe_puro
    beq $s4, 2, preco_cafe_com_leite
    beq $s4, 3, preco_mocaccino
    j fim

preco_cafe_puro:
    beq $s5, 1, preco_puro_pequeno
    la $a1, preco_puro_grande_str  # Ponteiro para a string "5,00"
    li $a2, 5                # Número de bytes a serem escritos
    j imprime_preco_final

preco_puro_pequeno:
    la $a1, preco_puro_pequeno_str  # Ponteiro para a string "3,00"
    li $a2, 5                # Número de bytes a serem escritos
    j imprime_preco_final

preco_cafe_com_leite:
    beq $s5, 1, preco_leite_pequeno
    la $a1, preco_leite_grande_str  # Ponteiro para a string "6,50"
    li $a2, 5                # Número de bytes a serem escritos
    j imprime_preco_final

preco_leite_pequeno:
    la $a1, preco_leite_pequeno_str  # Ponteiro para a string "4,50"
    li $a2, 5                # Número de bytes a serem escritos
    j imprime_preco_final

preco_mocaccino:
    beq $s5, 1, preco_mocaccino_pequeno
    la $a1, preco_mocaccino_grande_str  # Ponteiro para a string "7,00"
    li $a2, 5                # Número de bytes a serem escritos
    j imprime_preco_final

preco_mocaccino_pequeno:
    la $a1, preco_mocaccino_pequeno_str  # Ponteiro para a string "5,00"
    li $a2, 5                # Número de bytes a serem escritos
    j imprime_preco_final

imprime_preco_final:
    li $v0, 15               # Syscall para escrever no arquivo
    move $a0, $t0            # Descritor do arquivo
    syscall

fim:
    # Passo 3: Fechar o arquivo
    li $v0, 16               # Syscall para fechar o arquivo
    move $a0, $t0            # Descritor do arquivo
    syscall

    jr $ra                   # Retorna ao chamador

erro_abrir_arquivo:
    # Imprime mensagem de erro
    li $v0, 4
    la $a0, erro_str
    syscall

    # Finaliza o programa
    li $v0, 10               # Syscall para encerrar o programa
    syscall