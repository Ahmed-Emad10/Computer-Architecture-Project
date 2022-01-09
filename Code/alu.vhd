library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity alu is
  GENERIC(n : integer :=16);
     port(
    rst:in std_logic;
    op:in std_logic_vector(4 downto 0);
    r1:in std_logic_vector(n-1 downto 0);
    r2:in std_logic_vector(n-1 downto 0);
    res:out std_logic_vector(n-1 downto 0);
    ccr:inout std_logic_vector(2 downto 0);
    e:out std_logic
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
component nBitAdder IS
GENERIC (n : integer := 32);
PORT (a, b : IN std_logic_vector (n-1 DOWNTO 0) ;
      cin  : IN std_logic;
      s    : OUT std_logic_vector (n-1 DOWNTO 0);
      cout : OUT std_logic);
END component;
signal zero,one,f4,f5,f6,f7,f8,f9,f10,nr2,result:std_logic_vector(n-1 DOWNTO 0); 
signal c3,c5,c8,c9,z4,n4,z5,n5,z8,n8,z9,n9,z10,n10:std_logic;
begin
zero<=(others=>'0');
one<=zero+1;
c3<='1';
f4<=not(r1);
inc:nbitAdder generic map(16) port map(r1,one,'0',f5,c5);
f6<=r1;
f7<=r1;
add8:nbitAdder generic map(16) port map(r1,r2,'0',f8,c8);
nr2<=-r2;
add9:nbitAdder generic map(16) port map(r1,nr2,'0',f9,c9);
f10<=r1 and r2;
result<=zero when op="00000"
else f4 when op="00011"
else f5 when op="00100"
else f6 when op="00101"
else f7 when op="00110"
else r1 when op="01000"
else f8 when op="01001" or op="01100" or op="10011" or op="10100"
else f9 when op="01010"
else f10 when op="01011"
else zero;
ccr(2)<=c3 when op="00010"
else c5 when op="00100"
else c8 when (op="01001" or op="01100")
else c9 when op="01010"
else '0' when  rst='1' 
else ccr(2);
res<=result;
ccr(0)<='1' when (result=zero and  rst='0' and op(4)='0' and not(op="00110") and not(op="00101"))
else '0' when (not(result=zero) and op(4)='0' and not(op="00110") and not(op="00101")) or (rst='1') 
else ccr(0);
ccr(1)<='1' when (result(15)='1' and  op(4)='0' and not(op="00110") and not(op="00101"))
else '0' when (not(result(15)='1') and  op(4)='0' and not(op="00110") and not(op="00101")) or (rst='1') 
else ccr(1);
e<='1' when (op="10011" or op="10100") and result>"1111111100000000" else '0';
end architecture;