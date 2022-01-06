
library ieee;
use ieee.std_logic_1164.all;
entity MemStage is
port(
     regDest  :in std_logic_vector(2 downto 0);   --destination of the register
     clk,memRead,memWrite,en,rst :in std_logic;   --en for the buffer also the rst signal
     WB_CS :std_logic_vector(1 downto 0); 
     Address,inPort,writeData:in std_logic_vector (15 downto 0);  --Address and alu out in the same time
     
     regDestOut  :out std_logic_vector(2 downto 0); 
     WB_CSOut :out std_logic_vector(1 downto 0); 
     inPortOut,MemOut,ALUOut:out std_logic_vector (15 downto 0)  --output from memory and output from alu 
     );
end entity;

architecture myMemStage of MemStage is

component DataMemory is
PORT ( clk     : IN std_logic;
       memRead,memWrite      : IN std_logic;    	--Read for load(get data ffrom memory) , Write for store(insert data in memory)
       address : IN std_logic_vector(15 DOWNTO 0);
       writeData  : IN std_logic_vector(15 DOWNTO 0);   
       readData : OUT std_logic_vector(15 DOWNTO 0) ); 
end component;

component MemBuffer is
port(
     en,clk,rst : in std_logic;
     memOut,aluResult,inport : in std_logic_vector (15 downto 0);
     WB_CS : in std_logic_vector(1 downto 0 );                                     --WB Control Signal
     RegDest : in std_logic_vector (2 downto 0);                                   -- register destination
     memBuffOut,aluResultOut,inportBuffOut : out std_logic_vector (15 downto 0);   --out from the buffer
     WB_CSOut : out std_logic_vector(1 downto 0 );             			   --WB Control Signal out from the buffer
     RegDestOut : out std_logic_vector (2 downto 0)  				   -- register destination out from the buffer
     );
end component;
 
SIGNAl ReadData : std_logic_vector(15 downto 0);

begin

	DM: DataMemory port map(clk,memRead,memWrite,Address,writeData,ReadData);
	
	mBuffer: MemBuffer port map(en,clk,rst,ReadData,Address,inPort,WB_CS,regDest,MemOut,ALUOut,inPortOut,WB_CSOut,regDestOut);

end architecture;