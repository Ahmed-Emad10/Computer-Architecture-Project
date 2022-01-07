
library ieee;
use ieee.std_logic_1164.all;
entity PC is

port(
     en,clk,rst,PCWrite:in std_logic;
     d:in std_logic_vector (31 downto 0);
     q: out std_logic_vector (31 downto 0)
     );
end entity;

architecture myPC of PC is
component reg is
generic(n:integer :=32);
port(
     en,clk,rst:in std_logic;
     d:in std_logic_vector (n-1 downto 0);
     q: out std_logic_vector (n-1 downto 0) 
     );
end component;
Signal isEN : std_logic;
begin
	isEN <= '0' when PCWrite = '1'
	else '1' when en = '1'
	else '0' when en = '0';

	reg1: reg  port map(isEN , clk , rst , d, q);
end architecture;

