# Desenvolver um programa em Assembly no processador MIPS (usando o simulador MARS)
# para realizar o controle de uma máquina de Café para uso em ambientes comerciais/empresariais. A
# Figura abaixo ilustra um desenho básico desta máquina apenas como referência.
# A máquina oferece três tipos de café (café puro, com leite e Mochaccino) em dois tamanhos
# de copos (pequeno e grande). Além disso, o usuário pode optar por colocar automaticamente açúcar
# no preparo da bebida, se desejar. Operação básica da máquina:
# 	• A escolha da bebida será realizada pelo teclado: 1 – Café puro; 2 – Café com Leite; 3 –
# 	Mochaccino.
# 	• Solicitar ao usuário o tamanho da bebida: g – copo grande; p – copo pequeno.
#	• Verificar se o usuário quer açúcar: s – sim; n – não.
#	• Preparar a bebida (uso de timer).
#	• Gerar cupom fiscal (na forma de arquivo .txt) descrevendo a bebida solicitada e o preço
# 	cobrado.

.data
	BEM_VINDO: .asciiz "Bem Vindo"
	SELECIONA: .asciiz "Escolha sua bebida \n 1 - Café puro \n 2 - Café com leite \n 3 - Mocacchino"
	ACUCAR: .asciiz
	# Setando as quantidades inicias de ingredientes
	cafe: .word 20
	leite: .word 20
	chocolate: .word 20
	acucar: .word 20
	
	# Tamanho dos copos
	pequeno: .word 1
	grande: .word 2
.text
main:	
	lw $s0 cafe
	lw $s1 leite
	lw $2 chocolate
	lw $s3 acucar
	lw $s4 pequeno
	lw $s5 grande
	
	
maquina_cafe:
	# chamadas dos procedimentos
	escolhe_bebida
	escolhe_tamanho
	escolhe_acucar
	disponibilidade
		repositor j maquina_cafe
		
	prepara_bebida
	entrega
	
	j inicia
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
inicia:
	lw $t7 bem_vindo
	# procedimento printar mensagem
	# Mensagem de Boas Vindas
	
	j seleciona
	
seleciona:
	# pedir selecao do cafe
		# salvar os ingredientes usados no cafe
	# pedir tamanho do copo
		# decrementar conforme tamanho do copo
	j verificar
	
verifica:
prepara:
entrega:
espera:
reposita:

# Ideia, gerar relatório de quantidade de cafes vendidos e saldo do dia:
# Informar qual a maior quantidade selecionada
