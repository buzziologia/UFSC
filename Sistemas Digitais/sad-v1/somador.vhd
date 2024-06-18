LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY somador IS
GENERIC (N : INTEGER := 8);
PORT (
	add1 : IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
	add2 : IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
	sum : OUT STD_LOGIC_VECTOR(N DOWNTO 0));
END somador;

ARCHITECTURE rtl OF somador IS
    signal temp_sum: unsigned(N downto 0);
BEGIN
	temp_sum <= resize(unsigned(add1), N + 1) + resize(unsigned(add2), N + 1);
	sum <= std_logic_vector(temp_sum);
END rtl;