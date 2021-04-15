library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenSeg is
	port (
			bcd : in  STD_LOGIC_VECTOR(3 downto 0); -- entrada de 4 bits (BCD)
			leds: out STD_LOGIC_VECTOR(6 downto 0));-- saída de 7 bits
end entity;

architecture arch of sevenSeg is
begin

	-- número 1
	leds <= "0000001" when bcd = "0000" else -- numero 0
		"1001111" when bcd = "0001" else     -- numero 1
		"0010010" when bcd = "0010" else     -- numero 2
		"0000110" when bcd = "0011" else     -- numero 3
		"1001101" when bcd = "0100" else     -- numero 4
		"0100100" when bcd = "0101" else     -- numero 5
		"0100000" when bcd = "0110" else
		"0001111" when bcd = "0111" else
		"0000000" when bcd = "1000" else
		"0000100" when bcd = "1001" else
		"1111111";

end architecture;
