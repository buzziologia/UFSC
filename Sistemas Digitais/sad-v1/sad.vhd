library ieee;
use ieee.std_logic_1164.all;

entity sad is
GENERIC(
	B : POSITIVE := 8 -- número de bits por amostra
);
port(
    clk, rst, iniciar: in STD_LOGIC;
	Mem_A, Mem_B: IN STD_LOGIC_VECTOR(B-1 DOWNTO 0);
	pronto, read_mem: OUT STD_LOGIC;
	endereco: OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	sad_out: OUT STD_LOGIC_VECTOR(13 DOWNTO 0)
	);
end sad;

architecture rtl of sad is

component sad_operativo
	GENERIC(
		B : POSITIVE := 8
	);
    PORT (
        clk, zi, ci, cpA, cpB, zsoma, csoma, csad_reg: IN STD_LOGIC;
        Mem_A, Mem_B: IN STD_LOGIC_VECTOR(B-1 DOWNTO 0);
        menor: OUT STD_LOGIC;
        endereco: OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
        sad: OUT STD_LOGIC_VECTOR(13 DOWNTO 0)
    );
end component;

component sad_controle
    PORT (
        clk, iniciar, rst, menor: in STD_LOGIC;
        pronto, read_mem, zi, ci, zsoma, csoma, cpA, cpB, csad_reg: OUT STD_LOGIC
    );
end component;

signal zi, ci, cpA, cpB, zsoma, csoma, csad_reg, menor: STD_LOGIC;

begin
    bo: sad_operativo
		  generic map(B)
        port map(clk, zi, ci, cpA, cpB, zsoma, csoma, csad_reg, Mem_A, Mem_B, menor, endereco, sad_out);
        
    bc: sad_controle
        port map(clk, iniciar, rst, menor, pronto, read_mem, zi, ci, zsoma, csoma, cpA, cpB, csad_reg);
        

end rtl;
