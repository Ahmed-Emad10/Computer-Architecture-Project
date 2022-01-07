library ieee;
use ieee.std_logic_1164.all;

entity writeBack is
port(
clk:in std_logic;
wb: in std_logic_vector(1 downto 0);
	mem: in  std_logic_vector(15 downto 0);
	alu: in std_logic_vector(15 downto 0);
	inport: in std_logic_vector(15 downto 0);
	regdes: in std_logic_vector(2 downto 0);
	aluout: out std_logic_vector(15 downto 0);
	WR: out std_logic_vector(2 downto 0)
);
end entity;

architecture writeback of writeback is
  signal m,a,inp:std_logic_vector(15 downto 0); 
  signal w:std_logic_vector(1 downto 0);
  signal rd:std_logic_vector(2 downto 0);
begin
  process(clk)
    begin
        if(rising_edge(clk)) then
  m<=mem;
  a<=alu;
  inp<=inport;
  w<=wb;
  rd<=regdes;
end if;
    if(falling_edge(clk)) then
    --case (w) is
-- when "01"=>aluout <= m;
-- when "10"=>aluout <= a;
-- when others=>aluout <= inp;
aluout<=a;
 -- end case;
wr <= rd;
end if;
end process;
end architecture;