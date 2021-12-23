
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY mux2x1 IS 
	Generic ( n : Integer:=32);
	PORT (  in0,in1 : IN std_logic_vector (n-1 DOWNTO 0);
		sel     : IN  std_logic;
		out1    : OUT std_logic_vector (n-1 DOWNTO 0));
END mux2x1;


ARCHITECTURE mymux2x1 OF mux2x1 is
	BEGIN
		
with Sel select
	out1 <= in0 when '0',
		in1 when others;
END mymux2x1;