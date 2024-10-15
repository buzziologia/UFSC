.data
	# declarar as variaveis
	TC: .word 0
	TF: .word 0
	
	MSG1: .asciiz "Digite a temperatura em Fahrenheidt: "
	MSG2: .asciiz "A temperatura em Celsius é: "
	
.text
.globl main
main:
	# Ler TF
	la, $a0, MSG1	# carregar o endereço da mensagem
	li $v0, 4	# código do serviço para impressão da string
	syscall 	# imprimir MSG1
	
	li $v0, 5	# serviço de leitura de inteiro
	syscall		# chamada do serviço
	sw $v0, TF	# armazena F
	
	# Carregar o valor de TF no registrador $a0
	lw $a0, TF
	
	# chamar a função de conversão da temperatura
	jal converter
	
	# Armazenar o valor retornado em 'TC'
	sw $v0, TC
	
	# Mostrar o resultado
	la $a0, MSG2
	li $v0, 4
	syscall
	
	lw $a0, TC
	li $v0,, 1
	syscall
	
	# Encerrar programa
	li $v0, 10
	syscall
converter:
	# lógica da conversão
	# TC= (F - 32)*5/9
	lw $t0, TF
	li $t1, 32
	sub $t2, $t0, $t1
	
	li $t3, 5
	mul $t4, $t2, $t3
	
	li $t5, 9
	div $t4, $t5
	mflo $v0
	
	jr $ra # retorna para o chamador
