.data
	# declaração das variáveis
	resultado: .word 0

.text
main:
    	# função principal
    	li $t0, 1        # $t0 = 1 (Valor inicial de i)
    	li $t1, 5        # $t1 = 5 (Valor final de i)
   	li $t2, 0        # $t2 = 0 (acumulador para soma)
    	li $t3, 1        # $t3 = 1 (incremento)

soma_loop:
   	bgt $t0, $t1, fim_loop # se t0 > t1, fim do loop
 	add $t2, $t2, $t0      # $t2 = $t2 + $t0
   	add $t0, $t0, $t3      # $t0 = $t0 + $t3
  	j soma_loop            # volta para o início do loop
	
fim_loop:
    	sw $t2, resultado      # salva resultado em memória

    	# Encerrar o programa
    	li $v0, 10
    	syscall
