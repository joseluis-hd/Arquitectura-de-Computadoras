library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity compuertas is
	port(A,B : in std_logic;
		 Y   : OUT std_logic_vector(0 to 7));            --NOT, AND, NAND,OR, NOR, XOR, XNOR
end compuertas;
architecture hola of compuertas is
	begin
		Y(0) <= not(A);
		Y(1) <= not(B);
		Y(2) <= A and B;
		Y(3) <= not(A and B);
		Y(4) <= A or B;
		Y(5) <= not(A or B);
		Y(6) <= A xor B;
		Y(7) <= not(A xor B);
end hola;
