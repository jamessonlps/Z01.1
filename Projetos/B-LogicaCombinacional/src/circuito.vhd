library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity circuito is
	port (
    A,B,C : in  STD_LOGIC; -- entradas de 1 bit
    x     : out STD_LOGIC);-- saída de 1 bit
end entity;

architecture arch of circuito is

begin

    -- depois de simplificar o circuito
    -- AB (B_barra + C_barra)
    x <= (A and B and ((not B) or (not C)));

end architecture;
