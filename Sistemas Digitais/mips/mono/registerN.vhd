library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registerN is
	generic(width: natural;
				resetValue: integer := 0);
	port(	-- control
			clock, reset, load: in std_logic;
			-- data
			input: in std_logic_vector(width-1 downto 0);
			output: out std_logic_vector(width-1 downto 0));
end entity;

architecture behav0 of registerN is
begin

process(clock, reset, load)
	begin
		if reset='1' then
			output <= (others => '0');
		elsif rising_edge(clock) and load = '1' then
			output <= input;
		end if;
	end process;
end architecture;