library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2Way is
	port ( 
			a:   in  STD_LOGIC; -- entrada de 1 bit
			b:   in  STD_LOGIC; -- entrada de 1 bit 
			sel: in  STD_LOGIC; -- seletor de 1 bit
			q:   out STD_LOGIC);-- saída de 1 bit
end entity;

architecture arch of Mux2Way is
begin

	-- seletor escolhe que entrada a saída recebe
	q <= a when sel = '0' else b;

end architecture;
