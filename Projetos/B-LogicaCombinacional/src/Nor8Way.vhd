library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nor8Way is
	port ( 
		a:   in  STD_LOGIC; -- entrada de 1 bit
		b:   in  STD_LOGIC; -- entrada de 1 bit
		c:   in  STD_LOGIC; -- entrada de 1 bit
		d:   in  STD_LOGIC; -- entrada de 1 bit
		e:   in  STD_LOGIC; -- entrada de 1 bit
		f:   in  STD_LOGIC; -- entrada de 1 bit
		g:   in  STD_LOGIC; -- entrada de 1 bit
		h:   in  STD_LOGIC; -- entrada de 1 bit
		q:   out STD_LOGIC
	);
end entity;

architecture arch of Nor8Way is
begin

	-- Nor = not + or
	q <= not (a or b or c or d or e or f or g or h);

end architecture;
