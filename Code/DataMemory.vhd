LIBRARY IEEE;
USE ieee.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.all;
ENTITY DataMemory IS
PORT ( clk     : IN std_logic;
       memRead,memWrite      : IN std_logic;    --Read for load(get data ffrom memory) , Write for store(insert data in memory)
       address : IN std_logic_vector(15 DOWNTO 0);
       writeData  : IN std_logic_vector(15 DOWNTO 0);   --inserted data
       readData : OUT std_logic_vector(15 DOWNTO 0) );   -- retrieved data
END ENTITY;

ARCHITECTURE myDataMemory OF DataMemory IS 
 TYPE ram_type IS ARRAY(0 TO 1048575) of std_logic_vector(15 DOWNTO 0);
 SIGNAL ram : ram_type ;

BEGIN

PROCESS(clk) IS 
  BEGIN
 	IF falling_edge(clk) THEN 
 		IF memWrite = '1'  THEN 
			ram(to_integer(unsigned((address)))) <= writeData; 
 		END IF;
	END IF;
  END PROCESS;
	readData <= ram(to_integer(unsigned((address)))) When memRead='1';
END architecture;
