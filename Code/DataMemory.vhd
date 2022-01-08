LIBRARY IEEE;
USE ieee.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.all;
ENTITY DataMemory IS
PORT (clk     : IN std_logic;
      memRead,memWrite,Pop,Push,ThTwSixTeen  : IN std_logic;    -- Read for load(get data from memory) , Write for store(insert data in memory)
                                                                -- ThirtyTwo/Sixteen signal to decide how many locations in the memory should the data take
                                                                -- 0 means 16-bit 1 means 32-bit 
      SPstatus : out std_logic_vector (1 downto 0);  -- '00' empty, '01' one location occupied , '10' two , '11' more than two  
      address : IN std_logic_vector(15 DOWNTO 0);
      writeData  : IN std_logic_vector(31 DOWNTO 0);   --inserted data
      readData : OUT std_logic_vector(31 DOWNTO 0) );   -- retrieved data
END ENTITY;

ARCHITECTURE myDataMemory OF DataMemory IS 
  TYPE ram_type IS ARRAY(0 TO 1048575) of std_logic_vector(15 DOWNTO 0);
  SIGNAL ram : ram_type ;
  Signal PC : std_logic_vector (31 downto 0);
BEGIN

PROCESS(clk) IS 
  Variable SP : std_logic_vector(31 downto 0) :="00000000000011111111111111111111";  
  BEGIN
  IF falling_edge(clk) THEN 
    IF memWrite = '1' and ThTwSixTeen = '0' and Push = '0'  THEN 
       ram(to_integer(unsigned((address)))) <= writeData(15 downto 0);  
    END IF;
    IF memWrite = '1' and ThTwSixTeen = '1' and Push = '0' THEN 
      ram(to_integer(unsigned((address)))) <= writeData(15 downto 0); 
      ram(to_integer(unsigned((address)))+1) <= writeData(31 downto 16);  
    END IF;
    IF ThTwSixTeen = '0' and Push = '1'  THEN 
      ram(to_integer(unsigned((SP)))) <= writeData(15 downto 0); 
      SP:= std_logic_vector(to_unsigned((to_integer(unsigned(SP))-1),32)); 
    END IF;
    IF ThTwSixTeen = '1' and Push = '1' THEN 
      ram(to_integer(unsigned((SP)))) <= writeData(31 downto 16); 
      ram(to_integer(unsigned(SP))-1) <= writeData(15 downto 0);  
      SP:= std_logic_vector(to_unsigned((to_integer(unsigned(SP))-1),32));
    END IF;
    IF ThTwSixTeen = '0' and Pop= '1' THEN 
      readData <= (others=>'0');
      readData(15 downto 0) <= ram(to_integer(unsigned((SP)))) ;
      SP:= std_logic_vector(to_unsigned((to_integer(unsigned(SP))+1),32)); 
    END IF;
    IF ThTwSixTeen = '1' and Pop= '1' THEN 
      readData(15 downto 0) <= ram(to_integer(unsigned((SP)))) ;
      readData(31 downto 16) <= ram(to_integer(unsigned(SP))+1) ;
      SP:= std_logic_vector(to_unsigned((to_integer(unsigned(SP))+1),32));
    END IF;
    IF SP = "00000000000011111111111111111111" THEN 
      SPstatus <= "00";
    END IF;
    IF SP = "00000000000011111111111111111110" THEN 
      SPstatus <= "01";
    END IF;
    IF SP = "00000000000011111111111111111101" THEN 
      SPstatus <= "10";
    END IF;
    IF SP < "00000000000011111111111111111101" THEN 
      SPstatus <= "11";
    END IF;
	
  END IF;
  END PROCESS;
  --readData <= (others=>'0');
  PC(31 downto 16) <= ram(to_integer(unsigned((address)))+1);
  PC(15 downto 0) <= ram(to_integer(unsigned((address))));
  readData <= "0000000000000000"&ram(to_integer(unsigned((address)))) When memRead = '1' and ThTwSixTeen = '0' and Pop='0'
         else ram(to_integer(unsigned((address)))+1)&ram(to_integer(unsigned((address)))) When memRead = '1' and ThTwSixTeen = '1' and Pop='0';

END architecture;
