# MIPS Assembly Programs

Este repositório contém implementações em Assembly do MIPS para diferentes programas descritos em linguagem C. O objetivo é demonstrar a conversão de instruções de alto nível para código assembly e abordar operações com variáveis, vetores e estruturas de controle. As implementações foram testadas no simulador MARS.

## Tarefa 1: Converter Instruções em C para MIPS Assembly

### Descrição:
- As variáveis `A = 10`, `B = 15`, `C = 20`, `D = 25`, `E = 30` e `F = 35` foram previamente armazenadas na memória de dados. Os registradores `$s0` até `$s5` são usados para manipular essas variáveis.
- Os vetores `G[4]` e `H[4]` são inicializados com zeros em todas as suas posições (words). Os registradores `$s6` e `$s7` são utilizados para manipular essas posições.
  
### Instruções:
1. `G[0] = (A – (B + C) + F);`
2. `G[1] = E – (A – B) * (B – C);`
3. `G[2] = G[1] – C;`
4. `G[3] = G[2] + G[0];`
5. `H[0] = B – C;`
6. `H[1] = A + C;`
7. `H[2] = B – C + G[3];`
8. `H[3] = B – G[0] + D;`

O arquivo correspondente a essa tarefa está no código `task1.asm`.

## Tarefa 2: Somatório de uma Sequência

### Descrição:
Escreva um programa que calcule o somatório de `∑ i = 1 até 5`.

O arquivo correspondente a essa tarefa está no código `task2.asm`.

## Tarefa 3: Carregar Vetor na Memória

### Descrição:
Escreva um programa que carregue o vetor `v = [1, 3, 2, 1, 4, 5]` na memória. O endereço inicial do vetor é assumido como `0x10010020` e o registrador `$s0` contém este endereço.

### Instruções:
```c
v[0] = 1;
v[1] = 3;
v[2] = 2;
v[3] = 1;
v[4] = 4;
v[5] = 5;
