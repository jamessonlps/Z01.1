library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux16 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0); -- entrada de 16 bits
			b:   in  STD_LOGIC_VECTOR(15 downto 0); -- entrada de 16 bits
			sel: in  STD_LOGIC; -- seletor de 1 bit
			q:   out STD_LOGIC_VECTOR(15 downto 0));-- saída de 16 bits
end entity;

architecture arch of Mux16 is
begin

	-- seletor escolhe qual entrada 'q' recebe
	q <= a when sel = '0' else b;

end architecture;
