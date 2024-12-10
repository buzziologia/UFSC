.data
filename: .asciiz "C:\\Users\\vinir\\gitbuzzi\\UFSC\\OrganizacaoDEComputadores\\TrabalhoFinal\\output.txt"  # Nome do arquivo
message:  .asciiz "Héllo, Assembly  @ oi '`orld!\n"  # Mensagem a ser escrita

.text
.globl main
main:
    # Passo 1: Abrir/criar o arquivo
    li $v0, 13               # Syscall para abrir/criar arquivo
    la $a0, filename         # Nome do arquivo
    li $a1, 1                # Modo de acesso: 1 = Escrita
    li $a2, 511              # Permissões (decimal equivalente a 777 em octal)
    syscall
    move $t0, $v0            # Salva o descritor do arquivo no $t0

    # Passo 2: Escrever no arquivo
    li $v0, 15               # Syscall para escrever em arquivo
    move $a0, $t0            # Descritor do arquivo
    la $a1, message          # Ponteiro para a mensagem
    li $a2, 23               # Número de bytes a serem escritos
    syscall

    # Passo 3: Fechar o arquivo
    li $v0, 16               # Syscall para fechar o arquivo
    move $a0, $t0            # Descritor do arquivo
    syscall

    # Finaliza o programa
    li $v0, 10               # Syscall para encerrar o programa
    syscall
