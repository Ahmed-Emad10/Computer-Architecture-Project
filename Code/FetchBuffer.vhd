
library ieee;
use ieee.std_logic_1164.all;
entity FetchBuffer is

port(
     en,clk,rst,flush,stall:in std_logic;
     Instruction,PC:in std_logic_vector (31 downto 0);   --into the buffer
     InstOut,PCOut: out std_logic_vector (31 downto 0)   -- out from the buffer
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
Signal isFlush,isEN : std_logic ;
begin

	isFlush <= '1' when rst = '1' or flush = '1'      --we will reset if there is rst signal or flush signal or both
	else '0' when rst = '0'                           --this condition and the following condition to avoid anding with U
	else '0' when flush = '0';

	isEN <= '0' when stall = '1'                      --when stalling make the enable = 0
	else '1' when en = '1'    
	else '0' when en = '0';
	
	PCBuffer: reg  port map(isEN , clk , isFlush , PC, PCOut);
	InstructionBufffer: reg  port map(isEN , clk , isFlush , Instruction, InstOut); 
end architecture;

