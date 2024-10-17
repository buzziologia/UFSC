# Projetos MARS - Manipulação de Matrizes 16x16

Este repositório contém dois programas implementados no MARS (MIPS Assembler and Runtime Simulator) para manipulação de matrizes de 16 por 16 elementos. O objetivo é preencher essas matrizes com valores de 0 a 255, utilizando dois métodos diferentes: linha a linha e coluna a coluna.

## Atividades

### 1. Preenchimento de Matriz Linha a Linha

Neste programa, a matriz de 16x16 é percorrida linha a linha. Os elementos da matriz são preenchidos com valores de 0 a 255 na ordem.

#### Algoritmo
1. Inicializar um contador em 0.
2. Para cada linha da matriz (de 0 a 15):
   - Para cada coluna da matriz (de 0 a 15):
     - Atribuir o valor do contador à posição atual da matriz.
     - Incrementar o contador.
3. Finalizar o programa.

### 2. Preenchimento de Matriz Coluna a Coluna

Neste programa, a matriz de 16x16 é percorrida coluna a coluna, preenchendo os elementos com valores de 0 a 255 na ordem.

#### Algoritmo
1. Inicializar um contador em 0.
2. Para cada coluna da matriz (de 0 a 15):
   - Para cada linha da matriz (de 0 a 15):
     - Atribuir o valor do contador à posição atual da matriz.
     - Incrementar o contador.
3. Finalizar o programa.

## Ferramentas Utilizadas:
- **MARS Simulator**: Simulador MIPS utilizado para executar programas Assembly.

## Como Executar:
1. Carregue o arquivo `.asm` no MARS.
2. Execute o programa para visualizar os resultados no console.
