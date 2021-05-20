-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: ControlUnit.vhd
-- date: 4/4/2017
-- Modificação:
--   - Rafael Corsi : nova versão: adicionado reg S
--
-- Unidade que controla os componentes da CPU

library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
    port(
		instruction                 : in STD_LOGIC_VECTOR(17 downto 0);  -- instrução para executar
		zr,ng                       : in STD_LOGIC;                      -- valores zr(se zero) e
                                                                     -- ng (se negativo) da ALU
		muxALUI_A                   : out STD_LOGIC;                     -- mux que seleciona entre
                                                                     -- instrução  e ALU para reg. A
		muxAM                       : out STD_LOGIC;                     -- mux que seleciona entre
                                                                     -- reg. A e Mem. RAM para ALU
                                                                     -- A  e Mem. RAM para ALU
		zx, nx, zy, ny, f, no       : out STD_LOGIC;                     -- sinais de controle da ALU
		loadA, loadD, loadM, loadPC : out STD_LOGIC               -- sinais de load do reg. A,
                                                                     -- reg. D, Mem. RAM e Program Counter
    );
end entity;

architecture arch of ControlUnit is

begin
  loadD <= instruction(17) and instruction(4); -- carrega registrador D
  loadM <= instruction(17) and instruction(5); -- controla escrita na RAM (onde A aponta)
  loadA <= (not instruction(17)) or (instruction(17) and instruction(3)); -- A carrega info se bit17 = 0, ou permite mover para A se bit17 = bit3 = 1

  muxALUI_A <= (not instruction(17)) or instruction(3); -- depende do bit17 e do bit que determina A como destino
  muxAM <= instruction(17) and instruction(13); -- define o que entra em Y p/ operação na ULA

  zx <= instruction(17) and instruction(12); -- só executa se bit17 = 1
  nx <= instruction(17) and instruction(11);
  zy <= instruction(17) and instruction(10);
  ny <= instruction(17) and instruction(9);
  f <=  instruction(17) and instruction(8);
  no <= instruction(17) and instruction(7);

  loadPC <= '1' when instruction(17) = '1' and instruction(2 downto 0) = "001" and (zr = '0' and ng = '0') else -- JG para salto > 0 (não pode zerar ou negar)
            '1' when instruction(17) = '1' and instruction(2 downto 0) = "010" and (zr = '1' and ng = '0') else -- JE para salto = 0 (zera e não negativo)
            '1' when instruction(17) = '1' and instruction(2 downto 0) = "011" and (ng = '0') else -- JGE para >= 0 (pode zerar ou não)
            '1' when instruction(17) = '1' and instruction(2 downto 0) = "100" and (zr = '0' and ng = '1') else -- JL para salto < 0 (não zera e pega negativo)
            '1' when instruction(17) = '1' and instruction(2 downto 0) = "101" and (zr = '0') else -- JNE para salto != 0 (não pode ser zero)
            '1' when instruction(17) = '1' and instruction(2 downto 0) = "110" and (ng = '1') else -- JLE para salto <= 0 (pode zerar ou não dentre os negativos)
            '1' when instruction(17) = '1' and instruction(2 downto 0) = "111" else
            '0';

end architecture;
