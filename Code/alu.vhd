library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity alu is
  GENERIC(n : integer :=16);
     port(
    op:in std_logic_vector(5 downto 0);
    r1:in std_logic_vector(n-1 downto 0);
    r2:in std_logic_vector(n-1 downto 0);
    res:out std_logic_vector(n-1 downto 0);
    ccr:inout std_logic_vector(2 downto 0)
     );
end entity;
architecture alu of alu is
component reg is
GENERIC(n : integer :=16);
     port(
     en,clk,rst:in std_logic;
     d:in std_logic_vector (n-1 downto 0);
     q: out std_logic_vector (n-1 downto 0)
     );
end component;
--component decoder is
-- port(
--      en:in std_logic;
--      s:in std_logic_vector (1 downto 0);
--      a:out std_logic_vector (3 downto 0)
--     );
--end component;
signal zero,one,f4,f5,f6:std_logic_vector(n-1 DOWNTO 0); 
signal c3,z4,n4,z5,n5:std_logic;
begin
zero<=(others=>'0');
c3<='1';
f4<=not(r1);
n4<='1' when f4<zero
else '0';
z4<='1' when f4=zero
else '0';
f5<=r1+'1';
n5<='1' when f5<zero
else '0';
z5<='1' when f5=zero
else '0';
f6<=r1;


res<=f4 when op="000100"
else f5 when op="000101"
else f6 when op="000110"
else zero;

ccr(0)<=z4 when op="000100"
else z5 when op="000101"
else '0';
ccr(1)<=n4 when op="000100"
else n5 when op="000101"
else '0';
ccr(2)<=c3 when op="000011"
else '0';

end architecture;