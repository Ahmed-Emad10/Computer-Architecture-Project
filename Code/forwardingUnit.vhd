library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity forwardUnit is
 port(
 r1,r2,rgdst1,rgdst2:in std_logic_vector(2 downto 0);
 op:in std_logic_vector(4 downto 0);
 wb1,wb2:in std_logic_vector(1 downto 0);
 rg1,rg2:out std_logic_vector(1 downto 0)
 );
end entity;
architecture forwardunit of forwardUnit is
begin
rg1<="01" when rgdst1=r1 and (wb1="10" or wb1="11")
else "10" when rgdst2=r1 and (wb2="01" or wb2="10" or wb2="11")
else "00";
rg2<="01" when rgdst1=r2 and (wb1="10" or wb1="11")
else "10" when rgdst2=r2 and (wb2="01" or wb2="10" or wb2="11")
else "00";
end architecture;
