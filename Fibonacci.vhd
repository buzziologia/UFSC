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
-- Entradas: int n;
-- Saidas: int nElemento
-- 
-- Operações: 
-- L02:	n<=2; 								      ==> sttNlt2
-- L04: 	i = 3; 								    ==> cmdI3
-- L05:	primeiro = 1;						    ==> cmdPrim1
-- L06: 	segundo = 1;						  ==> cmdSeg1
-- L08:	i<=n;									      ==> sttIleqN
-- L09:	soma = primeiro + segundo;	==> cmdSomaPrimPlusSeg	
-- l10:	primeiro = segundo;				  ==> cmdPrimSeg
-- L11:	segundo = soma;					    ==> cmdSegSoma
-- L12:	i++									        ==> cmdIinc


library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity SistemaDigitalFibonacci is

end;


architecture estrutural of SistemaDigitalFibonacci is 
begin
end;
