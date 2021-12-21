
Library ieee;
Use ieee.std_logic_1164.all;


ENTITY nBitAdder IS
GENERIC (n : integer := 32);
PORT (a, b : IN std_logic_vector (n-1 DOWNTO 0) ;
      cin  : IN std_logic;
      s    : OUT std_logic_vector (n-1 DOWNTO 0);
      cout : OUT std_logic);
END nBitAdder;


ARCHITECTURE nBitArch OF nBitAdder IS
COMPONENT oneBitAdder IS
PORT( a,b,cin : IN std_logic; 
      s,cout  : OUT std_logic);
END COMPONENT;
SIGNAL temp : std_logic_vector(n DOWNTO 0);
BEGIN
	temp(0) <= cin;
	loop1: FOR i IN 0 TO n-1 GENERATE
	fx: oneBitAdder PORT MAP(a(i),b(i),temp(i),s(i),temp(i+1));
	END GENERATE;
	Cout <= temp(n);
END nBitArch;