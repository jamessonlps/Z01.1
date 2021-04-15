-- Elementos de Sistemas
-- by Luciano Soares
-- Inc16.vhd

-- Incrementador de 16 bits
-- adiciona 1 ao valore de entrada (adição aritmética)

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Inc16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Inc16 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

  component Add16 is
    port(
      a   :  in STD_LOGIC_VECTOR(15 downto 0); -- entrada de 16 bits
      b   :  in STD_LOGIC_VECTOR(15 downto 0); -- entrada de 16 bits
      q   : out STD_LOGIC_VECTOR(15 downto 0)
    );
  end component;

begin
  -- Implementação vem aqui!

  in0: Inc16
  port map (
    a => "0000000000000001",
    b => a,
    q => q
  );

end architecture;
