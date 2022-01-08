
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

	  else "00" when opcode="00111"        -- start of two operands  add two
	  else "00" when opcode="01000"
	  else "00" when opcode="01001"
	  else "00" when opcode="01010"
	  else "01" when opcode="01011"        -- end of two operands   ADDI Rdst,Rsrc,Imm

	  else "00" when opcode="01100"        -- start of MEM operations
	  else "00" when opcode="01101"
	  else "01" when opcode="01110"        	   -- ldm rdst,imm
	  else "01" when opcode="01111"
	  else "01" when opcode="10000"        -- end of MEM operations

	  else "00" when opcode="10001"        -- start of Branch operations
	  else "00" when opcode="10010"
	  else "00" when opcode="10011"
	  else "00" when opcode="10100"
	  else "00" when opcode="10101"
	  else "00" when opcode="10110"
	  else "00" when opcode="10111"
	  else "00" when opcode="11000";      -- end of Branch operations

END instructionsize1;