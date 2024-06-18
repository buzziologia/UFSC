LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY sad_controle IS
PORT (
    clk, iniciar, rst, menor: in STD_LOGIC;
    pronto, read, zi, ci, zsoma, csoma, cpA, cpB, csad_reg: OUT STD_LOGIC
);
END sad_controle;

ARCHITECTURE rtl OF sad_controle IS
    TYPE Tipo_estado IS (S0, S1, S2, S3, S4, S5);
    SIGNAL EstadoAtual, ProximoEstado : Tipo_estado;
BEGIN
    PROCESS (iniciar, EstadoAtual)
    BEGIN
        CASE EstadoAtual IS
            WHEN S0 =>
                IF iniciar = '0' THEN
                    ProximoEstado <= S0;
                ELSE
                    ProximoEstado <= S1;
                END IF;
            WHEN S1 =>
                ProximoEstado <= S2;
            WHEN S2 =>
                IF menor = '0' THEN
                    ProximoEstado <= S5;
                ELSE
                    ProximoEstado <= S3;
                END IF;
            WHEN S3 =>
                ProximoEstado <= S4;
            WHEN S4 =>
                ProximoEstado <= S2;
            WHEN S5 =>
                ProximoEstado <= S0;
        END CASE;
    END PROCESS;
    
    PROCESS (clk, rst)
        BEGIN
            IF rst = '1' THEN
                EstadoAtual <= S0;
            ELSIF (rising_edge(clk)) THEN
                EstadoAtual <= ProximoEstado;
            END IF;
    END PROCESS;

    pronto <= '1' WHEN EstadoAtual = S0 ELSE '0';
    read <= '1' WHEN EstadoAtual = S3 ELSE '0';
    zi <= '1' WHEN EstadoAtual = S1 ELSE '0';
    ci <= '1' WHEN EstadoAtual = S1 or EstadoAtual = S4 ELSE '0';
    zsoma <= '1' WHEN EstadoAtual = S1 ELSE '0';
    csoma <= '1' WHEN EstadoAtual = S1 or EstadoAtual = S4 ELSE '0';
    cpA <= '1' WHEN EstadoAtual = S3 ELSE '0';
    cpB <= '1' WHEN EstadoAtual = S3 ELSE '0';
    csad_reg <= '1' WHEN EstadoAtual = S5 ELSE '0';
	
END rtl;