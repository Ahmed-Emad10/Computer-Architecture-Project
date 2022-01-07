
library ieee;
use ieee.std_logic_1164.all;
entity FetchStage is
port(
    en  : in std_logic_vector(2 downto 0);        		-- en(2)-->for pc, en(1)-->for instruction memory, en(0)-->for fetch buffer
    clk,IF_IDWrite,PCWrite,isJMP : in std_logic;        -- new signals IF_IDWrite for stall also PCWrite , isJMP indicates if there is jmp
	JMPLocation : in std_logic_vector (15 downto 0);    -- new signals represents the jmp location
	MemOut : in std_logic_vector (31 downto 0);         -- new signals represent the pc of the int or the exceptions
	Reset,PopEx,MemRet,MemInt,MemRti : in std_logic;    -- new signals to choosde the pc in case of we want the pc from the data Mem
    IF_Flush,JMP_Flush,INT_Flush,RET_Flush,Reset_Flush,Pop_Flush : in std_logic;  -- new signals to flush the Fetch Buffer
    rst : in std_logic_vector(2 downto 0); 						-- rst(2)-->for pc, rst(1)-->for instruction memory, rst(0)-->for fetch buffer
    Address : in std_logic_vector (31 downto 0); 				-- to choose the location to store the instruction in the instruction memory
    instMemData : in std_logic_vector (31 downto 0);  			-- data in for instruction memory which represents the instruction itself 
																--      (all instructions are 32-bit until i decide which one is 16 only) 
    PCOut,InstrucionOut : out std_logic_vector (31 downto 0)
    );
end entity;

architecture myFetchStage of FetchStage is
component PC is
port(
     en,clk,rst,PCWrite:in std_logic;
     d:in std_logic_vector (31 downto 0);
     q: out std_logic_vector (31 downto 0)
     );
end component;

component InstructionMemory is
PORT ( clk     : IN std_logic;
       we      : IN std_logic;
       address : IN std_logic_vector(31 DOWNTO 0); 
       datain  : IN std_logic_vector(31 DOWNTO 0);
       dataout : OUT std_logic_vector(31 DOWNTO 0) );
end component;

component nBitAdder IS
GENERIC (n : integer := 32);
PORT (a, b : IN std_logic_vector (n-1 DOWNTO 0) ;
      cin  : IN std_logic;
      s    : OUT std_logic_vector (n-1 DOWNTO 0);
      cout : OUT std_logic);
END component;

component FetchBuffer is
port(
     en,clk,rst,isFlush,isStall:in std_logic;
     Instruction,PC:in std_logic_vector (31 downto 0);
     InstOut,PCOut: out std_logic_vector (31 downto 0) );
end component;

component instructionsize IS
PORT ( opcode : in std_logic_vector(4 downto 0);
       size   : out std_logic_vector(1 downto 0) );
END component;

component mux2x1 IS 
	Generic ( n : Integer:=32);
	PORT (  in0,in1 : IN std_logic_vector (n-1 DOWNTO 0);
		sel     : IN  std_logic;
		out1    : OUT std_logic_vector (n-1 DOWNTO 0));
END component;

component mux IS 
	Generic ( n : Integer:=32);
	PORT ( in0,in1,in2,in3 : IN std_logic_vector (n-1 DOWNTO 0);
			sel : IN  std_logic_vector (1 DOWNTO 0);
			out1 : OUT std_logic_vector (n-1 DOWNTO 0));
END component;

SIGNAL pc_out,inst_out,faddress,sum1,sum2,add1,add2 : std_logic_vector(31 downto 0);  --address signal the chosen address between PC(pc_out) and Address(to store instructions in instruction memory)
SIGNAL RdstExtended : std_logic_vector (31 downto 0);    -- to extend the jmp location from 16-bit to 32-bit so we can use it as PC
SIGNAL PC1,PC2,new_pc : std_logic_vector (31 downto 0);  -- PC1 output of first mux , PC2 output of the second mux ,new_pc output of the third mux
SIGNAL cout1,cout2,isFlush,isMemPc : std_logic;
SIGNAL inst_size : std_logic_vector(1 downto 0); 
begin

	PC_comp: PC port map(en(2),clk,rst(2),PCWrite,new_pc,pc_out);

	IM: InstructionMemory port map(clk,en(1),faddress,instMemData,inst_out);
	add1<= "00000000000000000000000000000001";
	Adder1: nBitAdder port map(pc_out,add1,'0',sum1,cout1);
	add2<= "00000000000000000000000000000010";
	Adder2: nBitAdder port map(pc_out,add2,'0',sum2,cout2);

	IS1: instructionsize port map(inst_out(31 downto 27),inst_size); 

	Mux1: mux2x1 port map(pc_out,Address,en(1),faddress);   -- to choose which address for filling the instruction memory or 
															-- choosing  which instruction to be executed (if en(1) is equal to zero we take PC as address)
	
	Mux2: mux port map(sum1,sum2,pc_out,(Others => '0'),inst_size,PC1);       --to choose what to add to the PC 1 or 2 or same pc in case of hlt
	RdstExtended <= (others => '0');
	RdstExtended(15 downto 0) <= JMPLocation;
	Mux3: mux2x1 port map(PC1,RdstExtended,isJMP,PC2);
	isMemPc <= '1' when Reset  = '1'
		else   '1' when PopEx  = '1'
		else   '1' when MemRet = '1' 
		else   '1' when MemInt = '1'
		else   '1' when MemRti = '1'
		else   '0';
	Mux4: mux2x1 port map(PC2,MemOut,isMemPc,new_pc);

	isFlush	<= '1' when IF_Flush = '1'
	else '1' when JMP_Flush = '1'
	else '1' when INT_Flush = '1'
	else '1' when RET_Flush = '1'
	else '1' when Reset_Flush = '1'
	else '1' when Pop_Flush = '1'
	else '0';
	fBuffer: FetchBuffer port map(en(0),clk,rst(0),isFlush,IF_IDWrite,inst_out,pc_out,InstrucionOut,PCOut);

end architecture;