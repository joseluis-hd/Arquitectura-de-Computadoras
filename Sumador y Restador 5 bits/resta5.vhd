library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity resta5 is
port( 
	w : in std_logic;
	x,y : in std_logic_vector(4 downto 0);
 	s : out std_logic_vector(4 downto 0);
 	cout : out std_logic);
end resta5;

architecture hola of resta5 is
	component sumador5 is
 		port( cin : in std_logic;
 		x,y : in std_logic_vector(4 downto 0);
 		s : out std_logic_vector(4 downto 0);
 		cout : out std_logic);
 	end component;

signal xx : std_logic_vector(4 downto 0);
begin 
	xx(0) <= w xor x(0);
	xx(1) <= w xor x(1);
 	xx(2) <= w xor x(2);
 	xx(3) <= w xor x(3);
 	xx(4) <= w xor x(4);
 	U0: sumador5 port map(w,xx,y,s,cout);
end hola;


