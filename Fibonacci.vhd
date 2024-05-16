-- PASSO 0
-- Descrição do comportamento por algoritmo
-- L01: int Fibonacci (int n);
-- L02: 	if n(<=2);
-- L03: 		return 1;
-- L04: 	int i = 3; 
-- L05: 	int primeiro = 1; 
-- L06: 	int segundo = 1;
-- l07: 	int soma;
-- L08: 	while (i<=n) ;
-- l09: 		soma = primeiro + segundo;
-- L10: 		primeiro = segundo;
-- L11: 		segundo = soma;
-- L12: 		i++;
-- L13: return soma;
--
-- PASS0 1:
--	Identificação das entradas e saidas
-- Entradas: int n;
-- Saidas: int nElemento
-- 
-- Passo 2:
-- Identificação das operações, status e comandos, components
-- Operações: 									STATUS/COMANDOS:             	COMPONENTS:
-- L02:	n<=2; 								==> sttNlt2							comparador
-- L04: 	i = 3; 								==> cmdI3							registrador
-- L05:	primeiro = 1;						==> cmdPrim1						registrador
-- L06: 	segundo = 1;						==> cmdSeg1
-- L08:	i<=n;									==> sttIleqN
-- L09:	soma = primeiro + segundo;		==> cmdSomaPrimPlusSeg			comparador e somador
-- l10:	primeiro = segundo;				==> cmdPrimSeg						comparador
-- L11:	segundo = soma;					==> cmdSegSoma						comparador
-- L12:	i++									==> cmdIinc                  	registrador, somador


library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity SistemaDigitalFibonacci is

end;


architecture estrutural of SistemaDigitalFibonacci is 

component BlocoControle is
	port(	clock, reset: in std_logic;
			-- controle externo
			iniciar: in std_logic;
			pronto: out std_logic;
			-- controle interno
			sttNlt2, sttIleqN : in std_logic;
			cmdI3, cmdPrim1, cmdSeg1, cmdSomaPrimPlusSeg, 
			cmdPrimSeg, cmdSegSoma, cmdIinc: out std_logic   
	);
end component;

component BlocoOperativo is
	port(	clock, reset: in std_logic;
			-- controle externo
			iniciar: in std_logic;
			pronto: out std_logic;
			-- controle interno
			sttNlt2, sttIleqN : in std_logic;
			cmdI3, cmdPrim1, cmdSeg1, cmdSomaPrimPlusSeg, 
			cmdPrimSeg, cmdSegSoma, cmdIinc: out std_logic   
	);
end component;	
	
begin
end;
