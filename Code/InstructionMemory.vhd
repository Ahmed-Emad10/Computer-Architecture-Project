LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;
ENTITY InstructionMemory IS
PORT ( clk     : IN std_logic;
       we      : IN std_logic;
       address : IN std_logic_vector(31 DOWNTO 0);
       datain  : IN std_logic_vector(31 DOWNTO 0);
       dataout : OUT std_logic_vector(31 DOWNTO 0) );
END ENTITY;

ARCHITECTURE myInstructionMemory OF InstructionMemory IS 
 TYPE ram_type IS ARRAY(0 TO 1048575) of std_logic_vector(15 DOWNTO 0);
 SIGNAL ram : ram_type ;

COMPONENT instructionsize IS                
PORT (	opcode : in std_logic_vector (4 downto 0);
	size   : out std_logic_vector(1 downto 0) );
END COMPONENT;

 signal size1: std_logic_vector(1 downto 0);
BEGIN
  IS1:instructionsize port map(datain(31 downto 27),size1); 

PROCESS(clk) IS 
--Variable  : std_logic_vector(31 downto 0) :="00000000000011111111111111111111"; 
  BEGIN
 	IF rising_edge(clk) THEN 
 		IF we = '1' and (size1="00" or size1="10") THEN 
			ram(to_integer(unsigned((address)))) <= datain(31 downto 16); 
			ram(to_integer(unsigned((address)))+1) <= (others=>'0');
		ELSIF we = '1' and size1="01" THEN 
			ram(to_integer(unsigned((address)))) <= datain(31 downto 16); 
			ram(to_integer(unsigned((address)))+1) <= datain(15 downto 0); 
 		END IF;
	END IF;
  END PROCESS;
  dataout(31 downto 16) <= ram(to_integer(unsigned((address))));
  dataout(15 downto 0) <= ram(to_integer(unsigned((address)))+1);
END architecture;