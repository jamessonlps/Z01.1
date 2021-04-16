-- Elementos de Sistemas
-- by Luciano Soares
-- ALU.vhd

-- Unidade Lógica Aritmética (ULA)
-- Recebe dois valores de 16bits e
-- calcula uma das seguintes funções:
-- X+y, x-y, y-x, 0, 1, -1, x, y, -x, -y,
-- X+1, y+1, x-1, y-1, x&y, x|y
-- De acordo com os 6 bits de entrada denotados:
-- zx, nx, zy, ny, f, no.
-- Também calcula duas saídas de 1 bit:
-- Se a saída == 0, zr é definida como 1, senão 0;
-- Se a saída <0, ng é definida como 1, senão 0.
-- a ULA opera sobre os valores, da seguinte forma:
-- se (zx == 1) então x = 0
-- se (nx == 1) então x =! X
-- se (zy == 1) então y = 0
-- se (ny == 1) então y =! Y
-- se (f == 1) então saída = x + y
-- se (f == 0) então saída = x & y
-- se (no == 1) então saída = !saída
-- se (out == 0) então zr = 1
-- se (out <0) então ng = 1

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
	port (
		x,y:   in STD_LOGIC_VECTOR(15 downto 0); -- entradas de dados da ALU
		zx:    in STD_LOGIC;                     -- zera a entrada x
		nx:    in STD_LOGIC;                     -- inverte a entrada x
		zy:    in STD_LOGIC;                     -- zera a entrada y
		ny:    in STD_LOGIC;                     -- inverte a entrada y
		f:     in STD_LOGIC;                     -- se 0 calcula x & y, senão x + y
		no:    in STD_LOGIC;                     -- inverte o valor da saída
		zr:    out STD_LOGIC;                    -- setado se saída igual a zero
		ng:    out STD_LOGIC;                    -- setado se saída é negativa
		saida: out STD_LOGIC_VECTOR(15 downto 0) -- saída de dados da ALU
	);
end entity;

architecture  rtl OF alu is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

	component zerador16 IS
		port(z   : in STD_LOGIC;
			 a   : in STD_LOGIC_VECTOR(15 downto 0);
			 y   : out STD_LOGIC_VECTOR(15 downto 0)
			);
	end component;

	component inversor16 is
		port(z   : in STD_LOGIC;
			 a   : in STD_LOGIC_VECTOR(15 downto 0);
			 y   : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component Add16 is
		port(
			a   :  in STD_LOGIC_VECTOR(15 downto 0);
			b   :  in STD_LOGIC_VECTOR(15 downto 0);
			q   : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component And16 is
		port (
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component comparador16 is
		port(
			a   : in STD_LOGIC_VECTOR(15 downto 0);
			zr   : out STD_LOGIC;
			ng   : out STD_LOGIC
    	);
	end component;

	component Mux16 is
		port (
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

   SIGNAL zxout,zyout,nxout,nyout,andout,adderout,muxout,precomp: std_logic_vector(15 downto 0);

begin
  -- Implementação vem aqui!
  zeraX: zerador16
  port map (
	z => zx,    -- zerador
	a => x,     -- vetor de entrada
	y => zxout  -- resultado (saída)
  );

  zeraY: zerador16
  port map (
	z => zy,
	a => y,
	y => zyout
  );

  inverteX: inversor16
  port map (
	a => zxout, -- conecta entrada do inversor à saida do zerador
	z => nx,    -- negador
	y => nxout  -- resultado (saída)
  );

  inverteY: inversor16
  port map (
	a => zyout,
	z => ny,
	y => nyout
  );

  and16Ula: And16
  port map (
	a => nxout, -- conecta com saída de nX
	b => nyout, -- conecta com saída de nY
	q => andout -- resultado
  );

  add16Ula: Add16
  port map (
	a => nyout,
	b => nxout,
	q => adderout
  );

  muxUla: mux16
  port map (
	a => andout   -- conecta com saída da and
	b => adderout -- conecta com saída do adder
	sel => f      -- conecta com o seletor
	q => muxout   -- resultado (saída)
  );

  inverteUla: inversor16
  port map (
	z => no,     -- seletor
	a => muxout  -- conecta entrada do inversor com saída do mux
	y => precomp -- conecta com entrada do comparador
  );

  compUla: comparador16
  port map (
	a => precomp -- conecta com saída do inversor anterior
	zr => zr     -- conecta controles zr
	ng => ng     -- conecta controles ng
  );

  saida <= precomp; -- conecta saída da ula com o resultado final

end architecture;
