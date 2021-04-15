library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux2Way is
	port ( 
		a:   in  STD_LOGIC; -- entrada
		sel: in  STD_LOGIC; -- porta seletora
		q0:  out STD_LOGIC; -- saída 1
		q1:  out STD_LOGIC  -- saída 2
		);
end entity;

architecture rtl of DMux2Way is
begin

	-- sel escolhe a saída que vai receber 'a'
	-- a porta que não é escolhida recebe 0
	q0 <= a when sel = '0' else '0';
	q1 <= a when sel = '1' else '0';

end architecture;