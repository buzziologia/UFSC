library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bancoRegistradores is
	generic(
		numBitsDefineReg: positive;
		larguraRegistrador: positive
	);
	port(
		RegASerLido1, RegASerLido2, RegASerEscrito: in std_logic_vector(numBitsDefineReg-1 downto 0);
		DadoDeEscrita: in std_logic_vector(larguraRegistrador-1 downto 0);
		Clock, EscReg: in std_logic;
		DadoLido1, DadoLido2: out std_logic_vector(larguraRegistrador-1 downto 0)
	);
end entity;

architecture comportamento of bancoRegistradores is
	type typeVetorReg is array(0 to 2**numBitsDefineReg-1) of std_logic_vector(larguraRegistrador-1 downto 0);
	signal reg: typeVetorReg;
begin
	leitura:process(RegASerLido1, RegASerLido2) is
	begin
		DadoLido1 <= reg(to_integer(unsigned(RegASerLido1)));
		DadoLido2 <= reg(to_integer(unsigned(RegASerLido2)));
	end process;

	escrita:process(Clock) is
	begin
		if falling_edge(Clock) then
			if EscReg='1' then
				reg(to_integer(unsigned(RegASerEscrito))) <= DadoDeEscrita;
			end if;
		end if;
	end process;	
end architecture;