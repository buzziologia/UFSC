LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY absolute IS
GENERIC (N : INTEGER := 8);
PORT (
	num: IN signed(N - 1 downto 0);
	saida : OUT STD_LOGIC_VECTOR(N - 1 downto 0)
);
END absolute;

ARCHITECTURE rtl OF absolute IS
BEGIN
	saida <= std_logic_vector(unsigned(abs(num)));
END rtl;