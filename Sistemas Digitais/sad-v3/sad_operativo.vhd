LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY sad_operativo IS
	generic(
		B: POSITIVE := 8
	);
    PORT (
        clk, zi, ci, cpA, cpB, zsoma, csoma, csad_reg: IN STD_LOGIC;
        Mem_A, Mem_B: IN STD_LOGIC_VECTOR((B*4)-1 DOWNTO 0);
        menor: OUT STD_LOGIC;
        endereco: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        sad: OUT STD_LOGIC_VECTOR(B+5 DOWNTO 0)
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
    
    signal a_mux_i, out_mux_i, i: STD_LOGIC_VECTOR(4 DOWNTO 0);
    signal pA0, pA1, pA2, pA3, pB0, pB1, pB2, pB3: STD_LOGIC_VECTOR(B-1 DOWNTO 0);
	 signal diff_abs_0, diff_abs_1, diff_abs_2, diff_abs_3: STD_LOGIC_VECTOR(B DOWNTO 0);
    signal diff0, diff1, diff2, diff3: signed(B DOWNTO 0);
    signal soma, soma_sad_0123_resized, out_mux_soma: STD_LOGIC_VECTOR(B+5 downto 0);
    signal soma_sad_01, soma_sad_23: STD_LOGIC_VECTOR(B+1 DOWNTO 0);
    signal soma_sad_0123: STD_LOGIC_VECTOR(B+2 DOWNTO 0);
	 signal a_mux_soma: STD_LOGIC_VECTOR(B+6 DOWNTO 0);

BEGIN

    -- INCREMENTADOR
    mux_i: mux2para1
        generic map(N => 5)
        port map(zi, a_mux_i, "00000", out_mux_i);
        
    reg_i: registrador
        generic map(N => 5)
        port map(clk, ci, out_mux_i, i);
    
    menor <= not(i(4));
    endereco <= i(3 downto 0);
        
    sum_i: somador
        generic map(N => 4)
        port map(i(3 downto 0), "0001", a_mux_i);
        
    -- OPERAÇÃO
    reg_pA0: registrador
        generic map(N => B)
        port map(clk, cpA, Mem_A(B-1 downto 0), pA0);
        
    reg_pA1: registrador
        generic map(N => B)
        port map(clk, cpA, Mem_A((B*2)-1 downto 8), pA1);
        
    reg_pA2: registrador
        generic map(N => B)
        port map(clk, cpA, Mem_A((B*3)-1 downto 16), pA2);
        
    reg_pA3: registrador
        generic map(N => B)
        port map(clk, cpA, Mem_A((B*4)-1 downto 24), pA3);
        
    reg_pB0: registrador
        generic map(N => B)
        port map(clk, cpB, Mem_B(B-1 downto 0), pB0);
        
    reg_pB1: registrador
        generic map(N => B)
        port map(clk, cpB, Mem_B((B*2)-1 downto 8), pB1);
        
    reg_pB2: registrador
        generic map(N => B)
        port map(clk, cpB, Mem_B((B*3)-1 downto 16), pB2);
    
    reg_pB3: registrador
        generic map(N => B)
        port map(clk, cpB, Mem_B((B*4)-1 downto 24), pB3);
        
    sub_0: subtrator
        generic map(N => B+1)
        port map('0'&pA0, '0'&pB0, diff0);
        
    sub_1: subtrator
        generic map(N => B+1)
        port map('0'&pA1, '0'&pB1, diff1);
        
    sub_2: subtrator
        generic map(N => B+1)
        port map('0'&pA2, '0'&pB2, diff2);
        
    sub_3: subtrator
        generic map(N => B+1)
        port map('0'&pA3, '0'&pB3, diff3);
        
    absol0: absolute
        generic map(N => B+1)
        port map(diff0, diff_abs_0);
    
    absol01: absolute
        generic map(N => B+1)
        port map(diff1, diff_abs_1);
    
    absol2: absolute
        generic map(N => B+1)
        port map(diff2, diff_abs_2);
        
    absol3: absolute
        generic map(N => B+1)
        port map(diff3, diff_abs_3);
        
    sum_sad_01: somador
        generic map (N => B+1)
        port map(diff_abs_1, diff_abs_0, soma_sad_01);
        
    sum_sad_23: somador
        generic map (N => B+1)
        port map(diff_abs_2, diff_abs_3, soma_sad_23);
        
    sum_sad_0123: somador
        generic map(N => B+2)
        port map(soma_sad_01, soma_sad_23, soma_sad_0123);
        
    soma_sad_0123_resized <= "000"&soma_sad_0123;
        
    sumd_sad_acumulador: somador
        generic map(N => B+6)
        port map(soma, soma_sad_0123_resized, a_mux_soma);
        
    mux_soma: mux2para1
        generic map(N => B+6)
        port map(zsoma, a_mux_soma(B+5 downto 0), "00000000000000", out_mux_soma);
        
    reg_soma: registrador
        generic map(N => B+6)
        port map(clk, csoma, out_mux_soma, soma);
        
    reg_sad: registrador
        generic map(N => B+6)
        port map(clk, csad_reg, soma, sad);
	
END rtl;