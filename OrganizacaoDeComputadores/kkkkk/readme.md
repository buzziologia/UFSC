# Laboratório 05 - Organização de Computadores

## Descrição

Este laboratório envolve a implementação de três exercícios em Assembly MIPS, que devem ser executados no simulador MARS. O objetivo é calcular o fatorial de um número, tanto de forma iterativa quanto recursiva, e analisar o desempenho dos programas utilizando a ferramenta Branch History Table (BHT) disponível no MARS.

## Exercício 01

### Objetivo
Escrever um programa em linguagem Assembly do MIPS para calcular o fatorial de um número recebido via teclado, sem o uso de procedimentos.

### Instruções
1. Carregue o programa no simulador MARS.
2. Execute o programa.
3. Digite o valor do número para o qual o fatorial deve ser calculado.
4. O programa calculará o fatorial e mostrará o resultado na tela.

## Exercício 02

### Objetivo
Escrever um programa em linguagem Assembly do MIPS para calcular o fatorial de um número recebido via teclado, utilizando uma função recursiva.

### Instruções
1. Carregue o programa no simulador MARS.
2. Execute o programa.
3. Digite o valor do número para o qual o fatorial deve ser calculado.
4. O programa chamará a função `fatorial` para calcular recursivamente o fatorial e mostrará o resultado na tela.

## Exercício 03

### Objetivo
Executar o simulador de BHT (Branch History Table) para analisar o desempenho dos programas implementados nos exercícios 1 e 2.

### Instruções
1. Abra o simulador MARS.
2. Carregue e execute os programas dos exercícios 1 e 2.
3. No menu, vá até `Tools → BHT Simulator`.
4. Execute diversas simulações variando os seguintes parâmetros:
    - Quantidade de entradas (BHT entries).
    - Tamanho da BHT (1 e 2 bits).
    - Valor inicial.

### Conclusões
Após executar as simulações, analise os seguintes pontos:
- Desempenho relativo dos dois programas.
- Impacto da quantidade de entradas na BHT.
- Impacto do tamanho da BHT (1 e 2 bits).
- Como o valor inicial da BHT influencia o desempenho.

### Avaliação de Desempenho
- **Programa 1 (Fatorial sem procedimentos)**: Normalmente possui desempenho constante, pois não envolve chamadas de funções recursivas.
- **Programa 2 (Fatorial recursivo)**: Pode ter maior overhead devido a chamadas recursivas, porém, com uma BHT bem configurada, pode apresentar melhor predição de ramificações.

**Conclusões Finais**:
- **Desempenho Superior**: Depende da configuração da BHT. Se a BHT estiver bem ajustada, o programa recursivo pode ter desempenho similar ou superior devido à predição eficiente de ramificações.
- **Condições**: O tamanho da BHT e a quantidade de entradas devem ser ajustados com base no comportamento típico do código recursivo.

## Ferramentas Utilizadas
- **MARS Simulator**: Simulador MIPS utilizado para executar programas Assembly.
- **Branch History Table Simulator**: Ferramenta para simulação e análise de predições de
