library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_signed.all;
entity alu is
  GENERIC(n : integer :=16);
     port(
    op:in std_logic_vector(4 downto 0);
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
signal zero,f4,f5,f6,f7,f8,f9,f10:std_logic_vector(n-1 DOWNTO 0); 
signal c3,z4,n4,z5,n5,z8,n8,z9,n9,z10,n10:std_logic;
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
f7<=r1;
f8<=r1+r2;
n8<='1' when f8<zero
else '0';
z8<='1' when f8=zero
else '0';
f9<=r1-r2;
n9<='1' when f9<zero
else '0';
z9<='1' when f9=zero
else '0';
f10<=r1 and r2;
n10<='1' when f10<zero
else '0';
z10<='1' when f10=zero
else '0';
res<=zero when op="00001"
else f4 when op="000100"
else f5 when op="000101"
else f6 when op="000110"
else f7 when op="01000"
else f8 when op="01001" or op="010100"
else f9 when op="01010"
else f10 when op="01011"
else zero;
----------Must Updtae Carry----->>>In Phase 2<<<-------
ccr(0)<=z4 when op="00100"
else z5 when op="00101"
else z8 when op="01001" or op="010100"
else z9 when op="01010"
else z10 when op="01011"
else '0';
ccr(1)<=n4 when op="00100"
else n5 when op="00101"
else n8 when op="01001" or op="010100"
else n9 when op="01010"
else n10 when op="01011"
else '0';
ccr(2)<=c3 when op="00011"
else '0';
end architecture;