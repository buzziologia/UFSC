LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY sad_operativo IS
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
END sad_operativo;

ARCHITECTURE rtl OF sad_operativo IS
    
    component registrador is
        GENERIC (N : INTEGER := 4);
        PORT(	
            clk, carga : IN STD_LOGIC;
            D : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
            Q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
        );
    end component;
    
    component somador is
        GENERIC (N : INTEGER := 8);
        PORT (
        	add1 : IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
        	add2 : IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
        	sum : OUT STD_LOGIC_VECTOR(N DOWNTO 0)
        );
    end component;
    
    component subtrator is
        GENERIC (N : INTEGER := 8);
        PORT (
        	sub1 : IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
        	sub2 : IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
        	saida : OUT signed(N - 1 DOWNTO 0)
        );
    end component;
    
    component mux2para1 is
        GENERIC (N : INTEGER);
        PORT (
            sel : IN STD_LOGIC;
            a, b : IN STD_LOGIC_VECTOR (N - 1 DOWNTO 0);
            y : OUT STD_LOGIC_VECTOR (N - 1 DOWNTO 0)
        );
    end component;
    
    component absolute is
        GENERIC (N : INTEGER := 8);
        PORT (
        	num: IN signed(N - 1 downto 0);
        	saida : OUT STD_LOGIC_VECTOR(N - 1 downto 0)
        );
    end component;
    
    signal a_mux_i, out_mux_i, i: STD_LOGIC_VECTOR(6 DOWNTO 0);
    signal pA, pB: STD_LOGIC_VECTOR(B-1 DOWNTO 0);
	 signal diff_abs: STD_LOGIC_VECTOR(B DOWNTO 0);
    signal diff: signed(B DOWNTO 0);
    signal soma, diff_abs_resized, out_mux_soma: STD_LOGIC_VECTOR(5+B downto 0);
	 signal a_mux_soma: STD_LOGIC_VECTOR(6+B DOWNTO 0);

BEGIN

    -- INCREMENTADOR
    mux_i: mux2para1
        generic map(N => 7)
        port map(zi, a_mux_i, "0000000", out_mux_i);
        
    reg_i: registrador
        generic map(N => 7)
        port map(clk, ci, out_mux_i, i);
    
    menor <= not(i(6));
    endereco <= i(5 downto 0);
        
    sum_i: somador
        generic map(N => 6)
        port map(i(5 downto 0), "000001", a_mux_i);
        
    -- OPERAÇÃO
    reg_pA: registrador
        generic map(N => B)
        port map(clk, cpA, Mem_A, pA);
        
    reg_pB: registrador
        generic map(N => B)
        port map(clk, cpB, Mem_B, pB);
        
    sub: subtrator
        generic map(N => B+1)
        port map('0'&pA, '0'&pB, diff);
        
    absol: absolute
        generic map(N => B+1)
        port map(diff, diff_abs);
        
    diff_abs_resized <= "00000"&diff_abs;
        
    sum_sad: somador
        generic map (N => 6+B)
        port map(soma, diff_abs_resized, a_mux_soma);
        
    mux_soma: mux2para1
        generic map(N => 6+B)
        port map(zsoma, a_mux_soma(13 downto 0), "00000000000000", out_mux_soma);
        
    reg_soma: registrador
        generic map(N => 6+B)
        port map(clk, csoma, out_mux_soma, soma);
        
    reg_sad: registrador
        generic map(N => 6+B)
        port map(clk, csad_reg, soma, sad);
	
END rtl;