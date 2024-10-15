# MIPS Assembly Programs

Este repositório contém implementações de programas em MIPS Assembly baseadas em instruções fornecidas em linguagem C. As tarefas envolvem manipulação de variáveis, vetores e estruturas de controle de fluxo, usando registradores no MIPS.

## Tarefa 1: Conversão de Instruções C para MIPS Assembly

### Descrição:
As variáveis `A = 10`, `B = 15`, `C = 20`, `D = 25`, `E = 30`, `F = 35` foram previamente armazenadas na memória. Use os registradores `$s0` a `$s5` para manipular essas variáveis, e `$s6` e `$s7` para manipular os vetores `G[4]` e `H[4]`, que são inicializados com zeros. O programa deve implementar as seguintes instruções:

1. `G[0] = (A – (B + C) + F);`
2. `G[1] = E – (A – B) * (B – C);`
3. `G[2] = G[1] – C;`
4. `G[3] = G[2] + G[0];`
5. `H[0] = B – C;`
6. `H[1] = A + C;`
7. `H[2] = B – C + G[3];`
8. `H[3] = B – G[0] + D;`

## Tarefa 2: Cálculo de Somatório

### Descrição:
Escreva um programa que calcule o somatório de `∑ i=1 até 5 i`, ou seja, a soma dos números inteiros de 1 a 5.

## Tarefa 3: Carregamento de Vetor na Memória

### Descrição:
Implemente um programa que carregue o vetor `v = [1, 3, 2, 1, 4, 5]` na memória. Assuma que o registrador `$s0` contém o endereço inicial `0x10010020`.

### Instruções a serem implementadas:
```c
v[0] = 1;
v[1] = 3;
v[2] = 2;
v[3] = 1;
v[4] = 4;
v[5] = 5;
