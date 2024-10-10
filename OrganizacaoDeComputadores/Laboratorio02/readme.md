# Laboratório 02 - Organização de Computadores

Este laboratório envolve a implementação de dois programas em Assembly MIPS, que devem ser executados no simulador MARS e interagem com a ferramenta Digital Lab Sim para trabalhar com displays de sete segmentos e teclados alfanuméricos.

## Questão 1

Implemente um programa em Assembly para o MARS que exiba, sequencialmente, os números de 0 a 9 em um dos displays de sete segmentos disponíveis na ferramenta **Digital Lab Sim**.

### Instruções:
1. No MARS, vá ao menu `Tools → Digital Lab Sim` para abrir a ferramenta **Digital Lab Sim**.
2. Clique no botão `Connect to MIPS` para que a ferramenta se registre como um “observador” da memória MIPS e responda durante a execução do seu programa.
3. Consulte o menu `Help` do MARS para mais informações sobre como programar interfaces com o display.
4. Execute o programa para visualizar a sequência dos números no display de sete segmentos.

## Questão 2

Utilizando a ferramenta **Digital Lab Sim**, implemente um programa em Assembly para o MARS que leia o teclado alfanumérico e exiba, em um dos displays de sete segmentos, o valor da tecla pressionada (de 0 até f).

### Instruções:
1. Use um loop no seu código para manter a leitura contínua do teclado e exibição do valor pressionado no display.
2. Execute o programa no MARS utilizando a execução passo a passo para observar o comportamento em tempo real.
3. Certifique-se de que o display de sete segmentos mostre corretamente o valor da tecla pressionada.

### Informações Adicionais:
- Os algoritmos de escrita no display de sete segmentos e de leitura do teclado alfanumérico serão futuramente transformados em procedimentos (funções) e utilizados no trabalho final da disciplina.

## Ferramentas Utilizadas:
- **MARS Simulator**: Simulador MIPS utilizado para executar programas Assembly.
- **Digital Lab Sim**: Ferramenta para simulação de displays de sete segmentos e teclado alfanumérico no MARS.

## Como Executar:
1. Carregue o arquivo `.asm` no MARS.
2. Abra a ferramenta **Digital Lab Sim** e conecte-a ao MARS.
3. Execute o programa para visualizar os resultados no display de sete segmentos.
4. Para a segunda questão, insira valores pelo teclado alfanumérico e observe a exibição no display.


