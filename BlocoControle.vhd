library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity BlocoControle is
	port(	clock, reset: in std_logic;
			-- controle externo
			iniciar: in std_logic;
			pronto: out std_logic;
			-- controle interno
			sttNlt2, sttIleqN : in std_logic;
			cmdI3, cmdPrim1, cmdSeg1, cmdSomaPrimPlusSeg, 
			cmdPrimSeg, cmdSegSoma, cmdIinc: out std_logic   
	);

end entity;


architecture comportamental of BlocoControle is 
	type State is (L01, L02, L03, L04, L05, L06, L07, L08, L09, L10, L11, L12, L13) 
	signal currentState, nextState: State;
begin
	-- lógica do próximo estado
	process(currentState, iniciar, sttNlt2, sttIleqN) is
	begin
		nextState <= currentState;
		case currentState is
			when L01 =>
				nextState <=  ;
			when L02 =>
				nextState <=  ;
			when L03 =>
				nextState <=  ;
			when L04 =>
				nextState <=  ;
			when L05 =>
				nextState <=  ;
			when L06 =>
				nextState <=  ;
			when L07 =>
				nextState <=  ;
			when L08 =>
				nextState <=  ;
			when L09 =>
				nextState <=  ;
			when L10 =>
				nextState <=  ;
			when L11 =>
				nextState <=  ;
			when L12 =>
				nextState <=  ;
			when L13 =>
				nextState <=  ;
				
		end case;
		nextState <= ...;
	end process;
	-- registrador D (elemento de memoria ou estado interno)
	process(clock, reset) is
	begin
		if reset = '1'
			currentState <= L01;
		elsif rising_edge(clock) then
			currentState <= nextState;
		end if;
	end process;
	
	-- lógica saída
	cmdI3 <= '1' when currentState = L04 else '0';
	cmdIinc <= '1' when currentState = L12 else '0';
 	cmdPrim1 <= '1' when currentState = L05 else '0';
	cmdPrimSeg <= '1' when currentState = L10 else '0';
	cmdSeg1 <= '1' when currentState = L06 else '0';
	cmdSegSoma <= '1' when currentState = L11 else '0';
	cmdSomaPrimPlusSeg <= '1' when currentState = L09 else '0';
	pronto <= '1' when currentState = L01 else '0';

end architecture;
