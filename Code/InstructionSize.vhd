
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;
ENTITY instructionsize IS
PORT ( opcode : in std_logic_vector(4 downto 0);
       size   : out std_logic_vector(1 downto  0) );
END ENTITY instructionsize;

ARCHITECTURE instructionsize1 OF instructionsize IS 

BEGIN

	size<= "00" when opcode="00000"        -- start of one operand Zero means add one
	  else "10" when opcode="00001"        -- HLT (Hold until reset)
	  else "00" when opcode="00010"
	  else "00" when opcode="00011"
	  else "00" when opcode="00100"
	  else "00" when opcode="00101"
	  else "00" when opcode="00110"        -- end of one operand

	  else "00" when opcode="01000"        -- start of two operands  add two
	  else "00" when opcode="01001"
	  else "00" when opcode="01010"
	  else "00" when opcode="01011"
	  else "01" when opcode="01100"        -- end of two operands   ADDI Rdst,Rsrc,Imm

	  else "00" when opcode="10000"        -- start of MEM operations
	  else "00" when opcode="10001"
	  else "01" when opcode="10010"        	   -- ldm rdst,imm
	  else "01" when opcode="10011"
	  else "01" when opcode="10100"        -- end of MEM operations

	  else "00" when opcode="11000"        -- start of Branch operations
	  else "00" when opcode="11001"
	  else "00" when opcode="11010"
	  else "00" when opcode="11011"
	  else "00" when opcode="11100"
	  else "00" when opcode="11101"
	  else "00" when opcode="11110"
	  else "00" when opcode="11111";      -- end of Branch operations

END instructionsize1;