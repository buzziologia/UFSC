library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity operacaoULA is
	port(
		ULAOp: in std_logic_vector(1 downto 0);
		Funct: in std_logic_vector(5 downto 0);
		op: out std_logic_vector(2 downto 0)
	);
end entity;

architecture Behavioral of operacaoULA is
begin
	op <= "010" when ULAOp="00" else -- sum
					"110" when ULAOp="01" else -- sub
					"111" when Funct(3)='1' else -- slt
					"001" when Funct(0)='1' else -- or
					"000" when Funct(2)='1' else -- and
					"010" when Funct(1)='0' else -- sum
					"110"; -- sub
end architecture;