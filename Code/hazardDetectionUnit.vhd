library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity hazardDetection is
 port(
 r1,r2,rd:in std_logic_vector(2 downto 0);
 memread:in std_logic;
 sig:out std_logic
 );
end entity;
architecture hazardDetection of hazardDetection is
begin
sig<='1' when memread='1' and (r1=rd or r2=rd)
else '0';
end architecture;


