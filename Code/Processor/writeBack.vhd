library ieee;
use ieee.std_logic_1164.all;

entity writeBack is
port(wb: in std_logic_vector(1 downto 0);
	mem: in  std_logic_vector(15 downto 0);
	alu: in std_logic_vector(15 downto 0);
	inport: in std_logic_vector(15 downto 0);
	regdes: in std_logic_vector(2 downto 0);
	output: out std_logic_vector(15 downto 0);
	WR: out std_logic_vector(2 downto 0)
);
end entity;

architecture writeback of writeback is
begin
output <= mem when wb= "01" 
	else alu when wb= "10"
	else inport;
wr <= regdes;
end architecture;