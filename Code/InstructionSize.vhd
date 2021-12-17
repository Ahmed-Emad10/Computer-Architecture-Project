
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;
ENTITY instructionsize IS
PORT ( opcode : in std_logic_vector(4 downto 0);
       size   : out std_logic );
END ENTITY instructionsize;

ARCHITECTURE instructionsize1 OF instructionsize IS 

BEGIN

	size<= '0' when opcode="00000"
	  else '0' when opcode="00001"
	  else '0' when opcode="00010"
	  else '0' when opcode="00011"
	  else '0' when opcode="00100"
	  else '0' when opcode="00101"
	  else '0' when opcode="00110"
	  else '0' when opcode="00111";

END instructionsize1;