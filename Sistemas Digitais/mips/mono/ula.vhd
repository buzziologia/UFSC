library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA is
	generic(width: positive := 16);
	port(
		op: in std_logic_vector(2 downto 0);  --000:AND , 001:OR , 010:ADD, 110:SUB, 111:SLT
		a, b: in std_logic_vector(width-1 downto 0);
		zero: out std_logic;
		res: out std_logic_vector(width-1 downto 0)
	);
end entity;

architecture Behavioral of ULA is
	signal iRes, iSLT: std_logic_vector(width-1 downto 0);
	constant cteOne: std_logic_vector(width-1 downto 0) := (0=>'1', others=>'0');
	constant cteZero: std_logic_vector(width-1 downto 0) := (others=>'0');
begin
	with op select
		iRes <=	a and b when "000",
					a or b  when "001",
					std_logic_vector(signed(a) + signed(b)) when "010",
					std_logic_vector(signed(a) - signed(b)) when "110",
					iSLT when others;					
	iSLT <=	cteOne when signed(a)<signed(b) else cteZero;
	zero <=	'1' when iRes=cteZero else '0';
	res <= iRes;
end architecture;