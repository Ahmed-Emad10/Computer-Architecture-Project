
Library ieee;
Use ieee.std_logic_1164.all;


ENTITY oneBitAdder IS 
PORT( a,b,cin : IN std_logic;
      s,cout  : OUT std_logic); 
END oneBitAdder;

ARCHITECTURE oneBitArch OF oneBitAdder IS
BEGIN
	s <= a XOR b XOR cin;
	cout <= (a AND b) or (cin AND (a XOR b)); 
END oneBitArch; 