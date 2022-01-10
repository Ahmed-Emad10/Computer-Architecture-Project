
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
entity MemStage is
port(
     regDest,Flags  :in std_logic_vector(2 downto 0);   --destination of the register
     clk,memRead,memWrite,en,rst,Push,Pop,ThTwSixTeen,INT,call :in std_logic;   --en for the buffer also the rst signal
     WB_CS :in std_logic_vector(1 downto 0); 
     PC , memPC : in std_logic_vector (31 downto 0);    -- PC to store in the mem in case of call and INT, memPC is the address of the Reset ,Exc and INT in the instruction memory
     Address,inPort,PopExcAdd,PCExcAdd,startAdd,writeData :in std_logic_vector (15 downto 0);  -- Address and alu out in the same time, startadd the address of reset ,Exc and INT in data mem not in InstructionMem
     PopExc,PCExc,Start,Reset : in std_logic;               -- signals to decide if there is exception , start to start initializing the data mem with the address of Reset,Exceptions and interrupts
     regDestOut  :out std_logic_vector(2 downto 0); 
     WB_CSOut,SPstatus :out std_logic_vector(1 downto 0); 
     inPortOut,MemOut,ALUOut:out std_logic_vector (15 downto 0);  --output from memory and output from alu
     PCfMEM : out std_logic_vector(31 downto 0)          -- PC from Memory
     );
end entity;

architecture myMemStage of MemStage is

component DataMemory is
PORT (clk     : IN std_logic;
      memRead1,memWrite1,Pop,Push,ThTwSixTeen  : IN std_logic;    -- Read for load(get data from memory) , Write for store(insert data in memory)
                                                                -- ThirtyTwo/Sixteen signal to decide how many locations in the memory should the data take
                                                                -- 0 means 16-bit 1 means 32-bit 
      address : IN std_logic_vector(15 DOWNTO 0);
      writeData  : IN std_logic_vector(31 DOWNTO 0);   --inserted data
      SPstatus : out std_logic_vector (1 downto 0);  -- '00' empty, '01' one location occupied , '10' two , '11' more than two  
      readData : OUT std_logic_vector(31 DOWNTO 0) ); 
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
 component mux2x1 IS 
	Generic ( n : Integer:=32);
	PORT (  in0,in1 : IN std_logic_vector (n-1 DOWNTO 0);
		sel     : IN  std_logic;
		out1    : OUT std_logic_vector (n-1 DOWNTO 0));
END component;
SIGNAl ReadData,PCandFlags,New_PC : std_logic_vector(31 downto 0);
Signal CallorINT,ThTwSixTeen1,mem_read,mem_write : std_logic ;
Signal firstBits,Mux1_Out,Mux2_Out,Mux3_Out,Mux4_Out : std_logic_vector (15 downto 0);  -- these muxes to choose the right address
Signal Mux5_Out,Mux6_Out,WD : std_logic_vector (31 downto 0);

begin
	Mux1: mux2x1 generic map (16) port map(Address,PopExcAdd,PopExc,Mux1_Out);
	Mux2: mux2x1 generic map (16)  port map(Mux1_Out,PCExcAdd,PopExc,Mux2_Out);
	Mux3: mux2x1 generic map (16) port map(Mux2_Out,"0000000000000000",Reset,Mux3_Out);
	Mux4: mux2x1 generic map (16)  port map(Mux3_Out,startAdd,Start,Mux4_Out);
	
	New_PC <= std_logic_vector(to_unsigned((to_integer(unsigned(PC))+1),32));
	PCandFlags(28 downto 0) <= New_PC(28 downto 0);
	PCandFlags(31 downto 29) <= Flags;
	
	CallorINT <= '1' when call ='1'
	else '1' when INT ='1'
	else '0';
	WD(31 downto 16) <= (others=>'0');
	WD(15 downto 0) <= writeData;
	Mux5: mux2x1 port map(WD,PCandFlags,CallorINT,Mux5_Out);
	Mux6: mux2x1 port map(Mux5_Out,memPC,Start,Mux6_Out);
	
	
	ThTwSixTeen1 <= '1' when Start='1'
	else ThTwSixTeen;
	mem_read <= '1' when memRead='1' or PopExc='1' or PCExc='1'
	else '0';
	mem_write <= '1' when memWrite='1' or start='1'
	else '0';
	DM: DataMemory port map(clk,mem_read,mem_write,pop,push,ThTwSixTeen1,Mux4_Out,Mux6_Out,SPstatus,ReadData);
        PCfMEM <= ReadData;
	firstBits <= ReadData(15 downto 0);
	mBuffer: MemBuffer port map(en,clk,rst,firstBits,Address,inPort,WB_CS,regDest,MemOut,ALUOut,inPortOut,WB_CSOut,regDestOut);

end architecture;