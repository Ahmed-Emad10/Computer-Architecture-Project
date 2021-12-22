library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity ex is
   port(
    clk,jmpFlag,outportFlag,aluSrc,regDest,exInt:inout std_logic;
    aluOp:inout std_logic_vector(5 downto 0);
    epc:inout std_logic_vector(31 downto 0);
    imm,r1,r2,aluout,memout,inport:in std_logic_vector(15 downto 0);
    inportSignal:inout std_logic_vector(1 downto 0);
    alures:out std_logic_vector(15 downto 0);
    ccr:inout std_logic_vector(2 downto 0)
     );
end entity;
architecture ex of ex is
component alu is
   GENERIC(n : integer :=16);
     port(
    op:in std_logic_vector(5 downto 0);
    r1:in std_logic_vector(n-1 downto 0);
    r2:in std_logic_vector(n-1 downto 0);
    res:out std_logic_vector(n-1 downto 0);
    ccr:inout std_logic_vector(2 downto 0)
     );
end component;
component reg is
GENERIC(n : integer :=16);
     port(
     en,clk,rst:in std_logic;
     d:in std_logic_vector (n-1 downto 0);
     q: out std_logic_vector (n-1 downto 0)
     );
end component;
component mux is
  	Generic ( n : Integer:=16);
	PORT ( in0,in1,in2,in3 : IN std_logic_vector (n-1 DOWNTO 0);
			sel : IN  std_logic_vector (1 DOWNTO 0);
			out1 : OUT std_logic_vector (n-1 DOWNTO 0));
END component;
signal s,src1,s2,src2:std_logic_vector(15 downto 0);
signal flags:std_logic_vector(2 downto 0);
begin
m0:mux port map(r1,aluout,memout,inport,inportsignal,s);
src1<=s;-- when exint='0'
--else int;
m1:mux port map(r2,aluout,memout,inport,inportsignal,s2); 
src2<=s2 when alusrc='0'
else imm;
alu0:alu port map(aluop,src1,src2,alures,flags);  
end architecture;