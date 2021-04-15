library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux4Way is
	port ( 
			a:   in  STD_LOGIC; -- entrada
			sel: in  STD_LOGIC_VECTOR(1 downto 0); -- seletor de 2 bits
			q0:  out STD_LOGIC; -- saída de 1 bit
			q1:  out STD_LOGIC; -- saída de 1 bit
			q2:  out STD_LOGIC; -- saída de 1 bit
			q3:  out STD_LOGIC); -- saída de 1 bit
end entity;

architecture rtl of DMux4Way is
begin

	-- o seletor escolhe que saída recebe 'a'
	-- as demais recebem 0
	q0 <= a when sel = "00" else '0';
	q1 <= a when sel = "01" else '0';
	q2 <= a when sel = "10" else '0';
	q3 <= a when sel = "11" else '0';

end architecture;

