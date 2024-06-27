library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MIPS_monociclo is
	port(
		clock, clock_ram, reset: in std_logic;
		-- externalizando sinais de controle (PARA TESTES)
		RegDst, DvCeq, DvCne, DvI, LerMem, MemParaReg, EscMem, ULAFonte, EscReg: out std_logic;
		ULAOp: out std_logic_vector(1 downto 0);
		-- externalizando saídas das memorias, do banco de registradores e da ULA (PARA TESTES)
		InstrucaoLida, DadoLido, RegLido1, RegLido2, ULAResultado: out std_logic_vector(31 downto 0)
	);
end entity;

architecture structure of MIPS_monociclo is
component datapath is
	port(
	    -- control inputs
	    clock, clock_ram, reset: in std_logic;
		RegDst, DvCeq, DvCne, DvI, LerMem, MemParaReg, EscMem, ULAFonte, EscReg: in std_logic;
		ULAOp: in std_logic_vector(1 downto 0);
        -- control outputs
		Opcode: out std_logic_vector(5 downto 0);
		-- externalizando saídas das memorias, do banco de registradores e da ULA (PARA TESTES)
		InstrucaoLida, DadoLido, RegLido1, RegLido2, ULAResultado: out std_logic_vector(31 downto 0)
	);
end component;
component Controle is
	port(
	    -- control inputs (status)
		Opcode: in std_logic_vector(5 downto 0);
		-- control outputs (commands)
		RegDst, DvCeq, DvCne, DvI, LerMem, MemParaReg, EscMem, ULAFonte, EscReg: out std_logic;
		ULAOp: out std_logic_vector(1 downto 0)
	);
end component;
    -- COMPLETE COM SINAIS INTERNOS
    signal iLida, dLido, rLido1, rLido2, ULAres: std_logic_vector(31 downto 0);
    signal op: std_logic_vector(5 downto 0);
	 signal uop: std_logic_vector(1 downto 0);
    signal regD, dvcEqual, dvcNotEqual, dvii, lerMemoria, memoriaParaReg, escMemoria, ULAF, escRegistrador: std_logic;
begin
    -- COMPLETE
    dp: datapath port map(clock => clock, clock_ram => clock_ram, reset => reset,
        RegDst => regD, DvCeq => dvcEqual, DvCne => dvcNotEqual, DvI => dvii, LerMem => lerMemoria, MemParaReg => memoriaParaReg,
        EscMem => escMemoria, ULAFonte => ULAF, EscReg => escRegistrador, ULAOp => uop, Opcode => op, InstrucaoLida => iLida,
        DadoLido => dLido, RegLido1 => rLido1, RegLido2 => rLido2, ULAResultado => ULAres);
        
    bo: Controle port map(Opcode => op, RegDst => regD, DvCeq => dvcEqual, DvCne => dvcNotEqual, 
        DvI => dvii, LerMem => lerMemoria, MemParaReg => memoriaParaReg, EscMem => escMemoria, ULAFonte => ULAF, 
        EscReg => escRegistrador, ULAOp => uop);
        
        
    RegDst <= regD;
    DvCeq <= dvcEqual;
    DvCne <= dvcNotEqual;
    DvI <= dvii;
    LerMem <= lerMemoria;
    MemParaReg <= memoriaParaReg;
    EscMem <= escMemoria;
    ULAFonte <= ULAF;
    EscReg <= escRegistrador;
    ULAOp <= uop;
    InstrucaoLida <= iLida;
    DadoLido <= dLido;
    RegLido1 <= rLido1;
    RegLido2 <= rLido2;
    ULAResultado <= ULAres;

end architecture;