# Laboratório 01 - Organização de Computadores

Este laboratório contém a implementação de dois programas em Assembly MIPS, baseados em problemas descritos em linguagem natural, que devem ser executados no simulador MARS. Os programas realizam operações aritméticas simples e interagem com o usuário para entrada e saída de dados.

## Questão 1
O primeiro programa realiza as seguintes operações:
- Soma de uma variável armazenada em memória com o valor 35 e atribuição do resultado a outra variável;
- Atribuição direta entre variáveis armazenadas na memória;
- Cálculo de uma subtração envolvendo uma variável temporária e uma armazenada na memória.

### Premissas:
- As variáveis `b`, `d`, e `e` estão armazenadas na memória de dados.
- O resultado final será armazenado na variável `c` também na memória de dados.
- Os valores dessas variáveis são definidos dentro do código.

## Questão 2
O segundo programa adapta a primeira implementação para permitir que o usuário insira os valores das variáveis `b`, `d`, e `e` através do teclado. Além disso:
- O resultado final será exibido no console e também armazenado na variável `c` na memória de dados.
- O programa utiliza chamadas de sistema (syscall) para entrada e saída de dados no MARS.

### Instruções:
1. Carregue o arquivo `.asm` no simulador MARS.
2. Para o programa da Questão 1, execute o código diretamente. O resultado estará armazenado na memória.
3. Para o programa da Questão 2, insira os valores para as variáveis quando solicitado e visualize o resultado final no console.
