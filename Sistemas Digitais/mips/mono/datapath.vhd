library ieee;
use ieee.std_logic_1164.all;

entity datapath is
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
end entity;

architecture estrutura of datapath is
  component addersubtractor is
	generic(N: positive;
			isAdder: boolean;
			isSubtractor: boolean);
	port(op: in std_logic;
		a, b: in std_logic_vector(N-1 downto 0);
		result: out std_logic_vector(N-1 downto 0);
		ovf, cout: out std_logic);
	end component;
	
	component registerN is
		generic(width: natural;
				resetValue: integer := 0);
		port(	-- control
				clock, reset, load: in std_logic;
				-- data
				input: in std_logic_vector(width-1 downto 0);
				output: out std_logic_vector(width-1 downto 0));
	end component;
	
	component ram is
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
	end component;
	
    component multiplexador2x1 is 
    generic(width: positive);
	port(input0, input1: in std_logic_vector(width-1 downto 0);
			sel: in std_logic;
			output: out std_logic_vector(width-1 downto 0) 
	);
	end component;
	
	component extensaoSinal is
	generic(larguraSaida:  integer;
			larguraEntrada: integer);
	port(
		entrada: in std_logic_vector(larguraEntrada-1 downto 0);
		saida: out std_logic_vector(larguraSaida-1 downto 0)
	);
	end component;

    component deslocador is
	generic(
		larguraDados: positive;
		numBitsDeslocar: integer;
		deslocaParaDireita: boolean;
		deslocaParaEsquerda: boolean
	);
	port(
		Entrada: in std_logic_vector(larguraDados-1 downto 0);
		direcao: in std_logic; --0: deslocaParaDireita, 1: deslocaParaEsquerda
		Saida: out std_logic_vector(larguraDados-1 downto 0)
	);
	end component;

    component ULA is
	generic(width: positive := 16);
	port(
		op: in std_logic_vector(2 downto 0);  --000:AND , 001:OR , 010:ADD, 110:SUB, 111:SLT
		a, b: in std_logic_vector(width-1 downto 0);
		zero: out std_logic;
		res: out std_logic_vector(width-1 downto 0)
	);
	end component;

    component operacaoULA is
	port(
		ULAOp: in std_logic_vector(1 downto 0);
		Funct: in std_logic_vector(5 downto 0);
		op: out std_logic_vector(2 downto 0)
	);
	end component;

	component bancoRegistradores is
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
	end component;

	constant quatro: std_logic_vector(31 downto 0) := (3 => '1', others => '0');
    signal eData, sPC, sRegInstr, sRegDados, sMux2, sMux3, sMux4, sMux5, eMux5, sSomador1, sSomador2, 
        ABancoReg, BBancoReg, sExtensaoSinal, saidaULA, d2: std_logic_vector(31 downto 0);
    signal d1: std_logic_vector(27 downto 0);
    signal sMux1: std_logic_vector(4 downto 0);
    signal ctrlULA : std_logic_vector(2 downto 0);
    signal zeroULA, fontePCmux4: std_logic;

begin
     pc: registerN 
         generic map(32, 0)
 			port map(clock=>clock, reset=>reset, load=>'1', input=>sMux5, output=>sPC);

 	somador1: addersubtractor 
 			generic map(32, true, false)
 			port map(op=>'0', a=>sPC, b=>quatro, result=>sSomador1, ovf=>open, cout=>open);

 	eData <= (others=>'0');
 	memInstr: ram
 		generic map(32, 6)
 		port map (ck=>clock_ram, reset=>'0', readd=>'1', writee=>'0', 
 		    datain=>eData, address=>sPC(5 downto 0), dataout=>sRegInstr);

	Opcode <= sRegInstr(31 downto 26);

 	somador2: addersubtractor 
 			generic map(32, true, false)
 			port map(op=>'0', a=>sSomador1, b=>d2, result=>sSomador2, ovf=>open, cout=>open);

     mux1: multiplexador2x1 
             generic map(5) 
             port map (input0=>sRegInstr(20 downto 16), input1=>sRegInstr(15 downto 11), 
                 sel=>RegDst, output=>sMux1);

     bancoReg: bancoRegistradores 
             generic map (5, 32)
             port map(RegASerLido1=>sRegInstr(25 downto 21), RegASerLido2=>sRegInstr(20 downto 16), 
                 RegASerEscrito=>sMux1, DadoDeEscrita=>sMux3, Clock=>clock, EscReg=>EscReg, 
                 DadoLido1=>ABancoReg, DadoLido2=>BBancoReg);

     extensorDeSinal: extensaoSinal 
             generic map (32, 16) 
             port map (entrada=>sRegInstr(15 downto 0), saida=>sExtensaoSinal);

     mux2: multiplexador2x1 
             generic map(32) 
             port map (input0=>BBancoReg, input1=>sExtensaoSinal, sel=>ULAFonte, output=>sMux2);

     opULA: operacaoULA 
             port map(ULAOp=>ULAOp, Funct=>sRegInstr(5 downto 0), op=>ctrlULA);

     UnLogArit: ULA 
             generic map (32) 
             port map (op=>ctrlULA, a=>ABancoReg, b=>sMux2, zero=>zeroULA, res=>saidaULA);

     deslocador1: Deslocador 
             generic map (32, 2, false, true) 
             port map (Entrada=>sExtensaoSinal, direcao=>'1', Saida=>d2);

     fontePCmux4 <= zeroULA and DvCeq;

     memDados: ram
 	         generic map(32, 6)
             port map (ck=>clock_ram, reset=>'0', readd=>'0', writee=>'1', 
                datain=>BBancoReg, address=>saidaULA(5 downto 0), dataout=>sRegDados);

     mux3: multiplexador2x1 
             generic map(32) 
             port map (input0=>sRegDados, input1=>saidaULA, sel=>MemParaReg, output=>sMux3);

     mux4: multiplexador2x1 
             generic map(32) 
             port map (input0=>sSomador1, input1=>sSomador2, sel=>fontePCmux4, output=>sMux4);

     eMux5(31 downto 28) <= sSomador1(31 downto 28);
	  eMux5(27 downto 2) <= sRegInstr(25 downto 0);
	  eMux5(1 downto 0) <= (others=>'0');
 
	  mux5: multiplexador2x1 
             generic map(32) 
             port map (input0=>eMux5, input1=>sMux4, sel=>DvI, output=>sMux5);

	 InstrucaoLida <= sRegInstr;
	 DadoLido <= sRegDados;
	 RegLido1 <= ABancoReg;
	 RegLido2 <= BBancoReg;
	 ULAResultado <= saidaULA;

end architecture;
