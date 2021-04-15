library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detectorDeMoedas is
	port (
    Q,D,N : in  STD_LOGIC; -- entradas de 1 bit
    cents     : out STD_LOGIC_VECTOR(4 downto 0)); -- saída de 5 bits
end entity;

architecture arch of detectorDeMoedas is

begin

    -- cents recebe binário correspondente ao valor da moeda
    cents <= "11001" when Q = '1' else
        "01010" when D = '1' else
        "00101" when N = '1' else
        "00000";

end architecture;
