# Atividade de Conversão de C para Assembly MIPS

Este repositório contém a implementação de programas em Assembly MIPS a partir de instruções em C. A seguir, a descrição das tarefas propostas e suas respectivas implementações.

## Tarefas

### 1. Conversão de Instruções de C para Assembly MIPS
- **Descrição**: Converter linhas de instruções escritas em linguagem C para instruções em Assembly do MIPS.
- **Condições**:
  - As variáveis `A = 10`, `B = 15`, `C = 20`, `D = 25`, `E = 30` e `F = 35` foram armazenadas previamente na memória de dados.
  - Os vetores `G` e `H` possuem quatro posições cada e inicializam com zeros. Use os registradores `$s0` até `$s5` para manipular os dados e `$s6` e `$s7` para manipular as posições dos vetores.

### 2. Cálculo de Soma
- **Descrição**: Fazer um programa que calcule a soma: ∑i=15i.
  
### 3. Carregamento de Vetor na Memória
- **Descrição**: Carregar o vetor `v = [1, 3, 2, 1, 4, 5]` para a memória. O registrador `$s0` contém o endereço de início do vetor como sendo `0x10010020`.

### 4. Carregamento de Vetor Indexado
- **Descrição**: Modificar o programa anterior fazendo o acesso à memória de forma indexada. O registrador `$s0` contém o valor `0x10010020`.

### 5. Programas com Estruturas de Controle
- **Descrição**: Implementar pequenos programas em Assembly MIPS para cada expressão em C fornecida.

1. a) if (a > b) a = a + 1;
2. b) if (a ≥ b) b = b + 1;
3. c) if (a ≤ b) a = a + 1;
4. d) if (a == b) b = a;
5. e) if (a < b) a = a + 1; else b = b + 1;
6. f) a = 0; b = 0; c = 5; while (a < c) {a = a + 1; b = b + 2;}
7. g) a = 1; b = 2; for (i = 0; i < 5; i++) {a = b + 1; b = b + 3;}
8. h) switch(a) { case 1: b = c + 1; break; case 2: b = c + 2; break; default: b = c; break; }

## Estrutura do Repositório
- `README.md`: Este arquivo, contendo a descrição das tarefas.
- `assembly_programs.asm`: Arquivo contendo todas as implementações em Assembly MIPS.

## Como Executar
1. Clone o repositório.
2. Compile e execute os programas utilizando um simulador MIPS, como o MARS ou o SPIM.

## Licença
Este projeto está licenciado sob a licença MIT. Consulte o arquivo LICENSE para mais detalhes.

