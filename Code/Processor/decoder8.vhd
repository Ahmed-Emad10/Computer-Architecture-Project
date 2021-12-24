library ieee;
use ieee.std_logic_1164.all;

entity Decoder8 is
port(	WB: in std_logic;
	WR: in std_logic_vector(2 downto 0);
	output: out std_logic_vector(7 downto 0));
end Decoder8;

architecture DD of Decoder8 is
begin
output <= "00000000" when WB='0'
	else "00000001" when wr="000"
	else "00000010" when wr="001"
	else "00000100" when wr="010"
	else "00001000" when WR="011"
	else "00010000" when WR="100"
	else "00100000" when WR="101"
	else "01000000" when WR="110"
	else "10000000";
end dd;
