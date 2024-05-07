library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador5 is
	port(
		cin: in std_logic;
		x, y : in std_logic_vector(4 downto 0); --Entradas de los operandos
		s : out std_logic_vector(4 downto 0); -- Salida
		cout : out std_logic
	);
end sumador5;

architecture hola of sumador5 is
	signal c: std_logic_vector(0 to 5);
begin

	c(0) <=cin;

	s(0) <= c(0) xor x(0) xor y(0);
	c(1) <= (x(0) and y(0)) or (c(0) and (x(0) xor y(0)));

	s(1) <= c(1) xor x(1) xor y(1);
	c(2) <= (x(1) and y(1)) or (c(1) and (x(1) xor y(1)));

	s(2) <= c(2) xor x(2) xor y(2);
	c(3) <= (x(2) and y(2)) or (c(2) and (x(2) xor y(2)));

	s(3) <= c(3) xor x(3) xor y(3);
	c(4) <= (x(3) and y(3)) or (c(3) and (x(3) xor y(3)));

	s(4) <= c(4) xor x(4) xor y(4);
	c(5) <= (x(4) and y(4)) or (c(4) and (x(4) xor y(4)));

	cout <= c(5);
end hola;
