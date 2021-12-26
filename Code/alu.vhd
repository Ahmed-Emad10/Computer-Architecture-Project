library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_signed.all;
entity alu is
  GENERIC(n : integer :=16);
     port(
      clk:in std_logic;
      rst:in std_logic;
    op:in std_logic_vector(4 downto 0);
    r1:in std_logic_vector(n-1 downto 0);
    r2:in std_logic_vector(n-1 downto 0);
    res:out std_logic_vector(n-1 downto 0);
    ccr:out std_logic_vector(2 downto 0)
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
process(clk)
  begin
    if(rst='1')then
    res<=(others=>'0');
    ccr<=(others=>'0');
  end if;
    if(falling_edge(clk))then
zero<=(others=>'0');
c3<='1';
f4<=not(r1);
f5<=r1+1;
f6<=r1;
f7<=r1;
f8<=r1+r2;
f9<=r1-r2;
f10<=r1 and r2;
end if;
if(f4<zero) then
n4<='1';
else n4<='0';
end if;
if(f4=zero) then
z4<='1';
else z4<='0';
end if;

if(f5<zero) then
n5<='1';
else n5<='0';
end if;
if(f5=zero) then
z5<='1';
else z5<='0';
end if;

--n8<='1' when f8<zero
--else '0';
--z8<='1' when f8=zero
--else '0';
case(op) is
when "00000"=>res<=zero;
when "00011"=>res<= f4;
when "00100"=>res<=f5;
when "00101"=>res<=f6;
when others=>res<=zero;
end case;
--else f7 when op="01000"
--else f8 when op="01001" or op="010100"
--else f9 when op="01010"
--else f10 when op="01011"
--else zero;
----------Must Updtae Carry----->>>In Phase 2<<<-------
--ccr(0)<=z4 when op="00100"
--else z5 when op="00101"
--else z8 when op="01001" or op="010100"
--else z9 when op="01010"
--else z10 when op="01011"
--else '0';
--n10<='1' when f10<zero
--else '0';
--z10<='1' when f10=zero
--else '0';
--n9<='1' when f9<zero
--else '0';
--z9<='1' when f9=zero
--else '0';
--ccr(1)<=n4 when op="00100"
--else n5 when op="00101"
--else n8 when op="01001" or op="010100"
--se n9 when op="01010"
--se n10 when op="01011"
--else '0';
--ccr(2)<=c3 when op="00011"
--else '0';
  end process;
end architecture;