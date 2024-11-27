# Laboratório 07 - Organização de Computadores

Este repositório contém dois programas implementados no **MARS (MIPS Assembler and Runtime Simulator)** para manipulação de matrizes. O objetivo é realizar a soma de uma matriz com outra transposta, utilizando dois métodos diferentes: sem cache blocking e com cache blocking.

## Atividades

### 1. Soma de Matrizes Sem Cache Blocking

Neste programa, a soma de uma matriz com sua transposta é realizada diretamente, sem utilizar a técnica de cache blocking. O tamanho das matrizes (MAX) é parametrizável.

#### Algoritmo
1. Carregar as matrizes da memória.
2. Realizar a soma de cada elemento da matriz original com o correspondente elemento da matriz transposta.
3. Armazenar o resultado na matriz de saída.
4. Finalizar o programa.

### 2. Soma de Matrizes com Cache Blocking

Neste programa, a soma de uma matriz com sua transposta é realizada utilizando a técnica de cache blocking. O tamanho das matrizes (MAX) e dos blocos (block_size) são parametrizáveis.

#### Algoritmo
1. Carregar blocos menores de elementos da matriz para a cache.
2. Realizar a soma de cada elemento da matriz original com o correspondente elemento do bloco transposto.
3. Armazenar o resultado na matriz de saída em blocos.
4. Finalizar o programa.

## Ferramentas Utilizadas:
- **MARS Simulator**: Simulador MIPS utilizado para executar programas Assembly.
- **Data Cache Simulator**: Ferramenta disponível no Mars Simulator para simulação de cache.

## Como Executar:
1. Carregue o arquivo `.asm` no MARS.
2. Execute o programa para visualizar os resultados no console.

## Procedimento de Simulação

O procedimento de simulação para ambos os programas foi realizado seguindo os passos descritos no relatório da atividade, utilize os mesmo parametros da cache simulator para obter os mesmos resultados.

