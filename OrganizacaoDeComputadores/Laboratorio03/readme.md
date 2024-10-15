# Laboratório de Métodos Numéricos - Newton e Seno

Este laboratório envolve a implementação de dois programas em Assembly MIPS, que devem ser executados no simulador MARS.

## Questão 1: Método Iterativo de Newton para Raiz Quadrada

### Descrição
O método iterativo de Newton pode ser usado para encontrar, de forma aproximada, a raiz quadrada de um número \(x\). Seja a estimativa inicial 1. Então, cada nova estimativa pode ser calculada da seguinte forma:
\[ \text{Estimativa} = \frac{(x / \text{Estimativa}) + \text{Estimativa}}{2} \]

Escreva um procedimento chamado `raiz_quadrada` que receba um parâmetro \(x\) de precisão dupla, calcule e retorne o valor aproximado da raiz quadrada de \(x\). Escreva um loop que se repita \(n\) vezes e calcule \(n\) valores de estimativa e, em seguida, retorne a estimativa final após \(n\) iterações. O valor de \(n\) deve ser informado pelo usuário.

### Premissas
- O número a ser calculado deve ser fornecido pelo teclado.
- O programa principal deverá chamar o procedimento `raiz_quadrada` para realizar o cálculo da raiz.
- Todos os cálculos devem ser feitos usando instruções e registradores de ponto flutuante de precisão dupla.
- Compare o resultado da instrução `sqrt.d` com o resultado do seu procedimento `raiz_quadrada`. Qual é o erro no valor absoluto? Considere loops variando entre 5 e 20 para avaliar o valor do erro absoluto do seu procedimento.

### Instruções:
1. Carregue o arquivo `.asm` no MARS.
2. Abra a ferramenta **Digital Lab Sim** e conecte-a ao MARS.
3. Execute o programa para visualizar os resultados.

## Questão 2: Cálculo da Função Seno

### Descrição
A função seno pode ser aproximada pela seguinte série:
\[ \sin(x) = x - \frac{x^3}{3!} + \frac{x^5}{5!} - \frac{x^7}{7!} + \ldots \]

Escreva um procedimento que calcule o seno de um parâmetro \(x\). Todos os cálculos devem ser feitos usando instruções e registradores de ponto flutuante de precisão dupla.

### Premissas
- Limite seu cálculo aos primeiros 20 termos da série.
- Mostre que o resultado obtido com o seu procedimento está convergindo para o resultado.

### Instruções:
1. Carregue o arquivo `.asm` no MARS.
2. Execute o programa no MARS utilizando a execução passo a passo para observar o comportamento em tempo real.
3. Certifique-se de que os resultados estejam convergindo corretamente.

### Informações Adicionais:
- Os algoritmos de cálculo de raízes e de seno serão futuramente transformados em procedimentos (funções) e utilizados em trabalhos futuros da disciplina.

## Ferramentas Utilizadas:
- **MARS Simulator**: Simulador MIPS utilizado para executar programas Assembly.

## Como Executar:
1. Carregue o arquivo `.asm` no MARS.
2. Execute o programa para visualizar os resultados no console.

