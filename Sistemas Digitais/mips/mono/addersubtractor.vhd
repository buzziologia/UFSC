library ieee;
use ieee.std_logic_1164.all;

entity addersubtractor is
	generic(N: positive;
			isAdder: boolean;
			isSubtractor: boolean );
	port(op: in std_logic;
		a, b: in std_logic_vector(N-1 downto 0);
		result: out std_logic_vector(N-1 downto 0);
		ovf, cout: out std_logic );
end entity;

architecture arch1 of addersubtractor is
	component fulladder1bit is
		port(cin, a, b: in std_logic;
			sum: out std_logic;
			cout: out std_logic );
	end component;
	signal carry: std_logic_vector(N downto 0);
	signal operandB: std_logic_vector(N-1 downto 0);
begin
	assert (isAdder or isSubtractor) report "Pelo menos um dos parametros generic deve ser true" severity error;		
	gera: for i in result'range generate
		fa: fulladder1bit port map (carry(i), a(i), operandB(i), result(i), carry(i+1));
	end generate;
	generateAdder: if isAdder and not isSubtractor generate
		carry(0) <= '0';
		operandB <= b;
	end generate;
	generateSubtractor: if not isAdder and isSubtractor generate
		carry(0) <= '1';
		operandB <= not b;
	end generate;
	generateBoth: if isAdder and isSubtractor generate
		carry(0) <= op;
		operandB <= b when op='0' else not b;
	end generate;

	cout <= carry(N);
end architecture;
