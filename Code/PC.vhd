
library ieee;
use ieee.std_logic_1164.all;
entity PC is

port(
     en,clk,rst:in std_logic;
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
begin
reg1: reg  port map(en , clk , rst , d, q);
end architecture;

--**************************************************************************************************************************--
-- en signal enables us to change the output to the new input , we need one more signal to freeze the pc (pc doesn't change)||  
--**************************************************************************************************************************--