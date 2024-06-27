library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram is
	generic(
		datawidth: positive := 32; -- deixe sempre em 32 para o projeto do MIPS
		addresswidth: positive := 6
	);
	port(
		-- control in
		ck, reset, readd, writee: in std_logic;
		-- data in
		datain: in std_logic_vector(datawidth-1 downto 0);
		address: in std_logic_vector(addresswidth-1 downto 0);
		-- controll out
		dataout: out std_logic_vector(datawidth-1 downto 0)
	);
end entity;

-- projeto de uma RAM utilizando celulas logicas, sem usar os blocos BRAM da FPGA, para ser simulavel no GHDL
-- Voce precisa apenas preencher os primeiros enderecos da RAM com um programa de teste
-- Nessa implementacao sao usados os bits (addresswidth-1 downto 2) do endereço, ou seja, os dois bits menos significativos sao decartados
--    Isso significa que os enderecos sao divididos por 4. Isso nao traz qualquer impacto ao projeto do MIPS, mas significa que ram[1] refere-se aos 4 bytes armazenados nos enderecos 4, 5, 6 e 7. 
architecture BadImplementationUsingLogic of ram  is  
    type Estado is array(0 to 2**(addresswidth-2)-1) of std_logic_vector(datawidth-1 downto 0);
    signal estadoAtual, proximoEstado: Estado;
begin
	-- LPE
	nextSt: for i in estadoAtual'range generate
		proximoEstado(i) <= datain when writee='1' and i=to_integer(unsigned(address(addresswidth-1 downto 2))) else estadoAtual(i);
	end generate;
    
	-- EM
	process(ck, reset) is
	begin
		if reset='1' then
			resState: for i in estadoatual'range loop
				estadoAtual(i) <= (others=>'0');
			end loop;
            -- altera os primeiros endereços da RAM com um software de teste
		    estadoAtual(0) <= "00000000000000000000000000000000"; -- coloque aqui o codigo de uma instrucao a ser executada
		    estadoAtual(1) <= "00000000000000000000000000000000"; -- coloque aqui o codigo de uma instrucao a ser executada
		    estadoAtual(2) <= "00000000000000000000000000000000"; -- coloque aqui o codigo de uma instrucao a ser executada
		    estadoAtual(3) <= "00000000000000000000000000000000"; -- coloque aqui o codigo de uma instrucao a ser executada
		    estadoAtual(4) <= "00000000000000000000000000000000"; -- coloque aqui o codigo de uma instrucao a ser executada
		    estadoAtual(5) <= "00000000000000000000000000000000"; -- coloque aqui o codigo de uma instrucao a ser executada
		    -- continue escrevendo seu software com quantas instrucoes quiser
		elsif rising_edge(ck) then
			estadoAtual <= proximoEstado;
		end if;
	end process;
	
	--LS
	dataout <= estadoAtual(to_integer(unsigned(address(addresswidth-1 downto 2)))) when readd='1' else (others=>'Z');
end architecture;