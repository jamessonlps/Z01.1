-- Elementos de Sistemas
-- by Luciano Soares
-- Add16.vhd

-- Soma dois valores de 16 bits
-- ignorando o carry mais significativo

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Add16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0); -- vetor de entrada de 16 bits
		b   :  in STD_LOGIC_VECTOR(15 downto 0); -- vetor de entrada de 16 bits
		q   : out STD_LOGIC_VECTOR(15 downto 0)  -- saída de 16 bits
	);
end entity;

architecture rtl of Add16 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

  -- Precisamos criar um sinal que receba de cada fulladder
  -- o carry out para que possa repassá-lo para o próximo
  -- componente

  signal carry : STD_LOGIC_VECTOR(14 downto 0); -- não tem carry mais significativo

  component FullAdder is
    port(
      a,b,c:      in STD_LOGIC;   -- entradas
      soma,vaium: out STD_LOGIC   -- sum e carry
    );
  end component;

begin
  -- Implementação vem aqui!
  fulladd0: FullAdder
  port map (
    a => a(0),
    b => b(0),
    c => '0',
    soma => q(0),
    vaium => carry(0)
  );
  
  fulladd1: FullAdder
  port map (
    a => a(1),
    b => b(1),
    c => carry(0), -- esse recebe o 'vaium' do anterior
    soma => q(1),
    vaium => carry(1)
  );

  fulladd2: FullAdder
  port map (
    a => a(2),
    b => b(2),
    c => carry(1),
    soma => q(2),
    vaium => carry(2)
  );

  fulladd3: FullAdder
  port map (
    a => a(3),
    b => b(3),
    c => carry(2),
    soma => q(3),
    vaium => carry(3)
  );

  fulladd4: FullAdder
  port map (
    a => a(4),
    b => b(4),
    c => carry(3),
    soma => q(4),
    vaium => carry(4)
  );

  fulladd5: FullAdder
  port map (
    a => a(5),
    b => b(5),
    c => carry(4),
    soma => q(5),
    vaium => carry(5)
  );

  fulladd6: FullAdder
  port map (
    a => a(6),
    b => b(6),
    c => carry(5),
    soma => q(6),
    vaium => carry(6)
  );

  fulladd7: FullAdder
  port map (
    a => a(7),
    b => b(7),
    c => carry(6),
    soma => q(7),
    vaium => carry(7)
  );

  fulladd8: FullAdder
  port map (
    a => a(8),
    b => b(8),
    c => carry(7),
    soma => q(8),
    vaium => carry(8)
  );

  fulladd9: FullAdder
  port map (
    a => a(9),
    b => b(9),
    c => carry(8),
    soma => q(9),
    vaium => carry(9)
  );

  fulladd10: FullAdder
  port map (
    a => a(10),
    b => b(10),
    c => carry(9),
    soma => q(10),
    vaium => carry(10)
  );

  fulladd11: FullAdder
  port map (
    a => a(11),
    b => b(11),
    c => carry(10),
    soma => q(11),
    vaium => carry(11)
  );

  fulladd12: FullAdder
  port map (
    a => a(12),
    b => b(12),
    c => carry(11),
    soma => q(12),
    vaium => carry(12)
  );

  fulladd13: FullAdder
  port map (
    a => a(13),
    b => b(13),
    c => carry(12),
    soma => q(13),
    vaium => carry(13)
  );

  fulladd14: FullAdder
  port map (
    a => a(14),
    b => b(14),
    c => carry(13),
    soma => q(14),
    vaium => carry(14)
  );

  fulladd15: FullAdder
  port map (
    a => a(15),
    b => b(15),
    c => carry(14),
    soma => q(15)
  );

end architecture;
