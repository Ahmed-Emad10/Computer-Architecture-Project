
library ieee;
use ieee.std_logic_1164.all;
entity FetchBuffer is

port(
     en,clk,rst:in std_logic;
     Instruction,PC:in std_logic_vector (31 downto 0);
     InstOut,PCOut: out std_logic_vector (31 downto 0)
     );
end entity;

architecture myFetchBuffer of FetchBuffer is
component reg is
generic(n:integer :=32);
port(
     en,clk,rst:in std_logic;
     d:in std_logic_vector (n-1 downto 0);
     q: out std_logic_vector (n-1 downto 0)
     );
end component;
begin
PCBuffer: reg  port map(en , clk , rst , PC, PCOut);
InstructionBufffer: reg  port map(en , clk , rst , Instruction, InstOut);
end architecture;

