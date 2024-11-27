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

O procedimento de simulação para ambos os programas foi realizado seguindo os passos descritos abaixo, utilizando diferentes configurações de cache para analisar o desempenho de cada implementação.

1. **Configuração Inicial da Cache:**
    - Definir a configuração inicial da cache com tamanho do bloco de 4 palavras e 16 blocos, utilizando mapeamento direto.

2. **Ajuste da Velocidade de Execução:**
    - Ajustar o controle deslizante \textit{Run Speed} para 30 instruções por segundo, permitindo observar detalhadamente a animação do desempenho da cache.

3. **Execução dos Programas:**
    - Executar os programas e observar a animação do desempenho da cache conforme cada acesso à memória é realizado.

4. **Registro dos Resultados:**
    - Anotar a taxa final de acertos da cache para cada configuração testada.
    - Modificar o tamanho do bloco para 8 palavras e executar novamente os programas, registrando a nova taxa de acertos.
    - Modificar o tamanho do bloco para 2 palavras e executar novamente os programas, registrando a nova taxa de acertos.

5. **Configuração Adicional da Cache:**
    - Criar uma segunda instância do \textit{Data Cache Simulator} selecionando novamente \textit{Data Cache Simulator} no menu \textit{Tools}.
    - Na nova instância, ajustar o tamanho do bloco e o número de blocos conforme necessário.
    - Conectar a nova instância ao MIPS e executar novamente os programas.
    - Registrar o desempenho da cache para ambas as instâncias, comparando os resultados.
