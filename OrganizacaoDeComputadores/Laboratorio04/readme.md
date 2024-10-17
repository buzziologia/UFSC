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

## Como Executar

1. Certifique-se de ter o MARS instalado em seu sistema.
2. Abra o MARS e carregue o código desejado.
3. Clique em "Assemble" para compilar o código.
4. Execute o programa clicando em "Run".

## Considerações Finais

Estes programas demonstram a manipulação de matrizes em MIPS, explorando o uso de loops aninhados e a atribuição de valores em um espaço de memória. Experimente modificar o código para entender melhor o funcionamento das operações.

## Licença

Este projeto está licenciado sob a MIT License - veja o arquivo [LICENSE](LICENSE) para mais detalhes.
