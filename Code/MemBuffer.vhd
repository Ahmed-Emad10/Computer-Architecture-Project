
library ieee;
use ieee.std_logic_1164.all;
entity MemBuffer is
port(
     en,clk,rst : in std_logic;
     memOut,aluResult,inport : in std_logic_vector (15 downto 0);
     WB_CS : in std_logic_vector(1 downto 0 );  --WB Control Signal
     RegDest : in std_logic_vector (2 downto 0);  -- register destination
     memBuffOut,aluResultOut,inportBuffOut : out std_logic_vector (15 downto 0);  --out from the buffer
     WB_CSOut : out std_logic_vector(1 downto 0 );  --WB Control Signal out from the buffer
     RegDestOut : out std_logic_vector (2 downto 0)  -- register destination out from the buffer
     );
end entity;

architecture myMemBuffer of MemBuffer is
component reg is
generic(n:integer :=16);
port(
     en,clk,rst:in std_logic;
     d:in std_logic_vector (n-1 downto 0);
     q: out std_logic_vector (n-1 downto 0) 
     );
end component;
begin
	memOut1: reg  port map(en , clk , rst , memOut, memBuffOut);
	ALUresult1: reg  port map(en , clk , rst , aluResult, aluResultOut);
	InPort1: reg  port map(en , clk , rst , inport, inportBuffOut);

	WB1: reg generic map(2) port map(en , clk , rst , WB_CS, WB_CSOut);

	Dest1: reg generic map(3) port map(en , clk , rst , RegDest, RegDestOut);
end architecture;
