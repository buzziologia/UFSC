LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY subtrator IS
GENERIC (N : INTEGER := 8);
PORT (
	sub1 : IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
	sub2 : IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
	saida : OUT signed(N-1 DOWNTO 0));
END subtrator;

ARCHITECTURE rtl OF subtrator IS
BEGIN
	saida <= signed(sub1) - signed(sub2);
END rtl;