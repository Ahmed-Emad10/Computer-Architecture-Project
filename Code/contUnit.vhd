library ieee;
use ieee.std_logic_1164.all;

entity contUnit is
port(opcode: in std_logic_vector(4 downto 0);
	--wb
	wb: out std_logic_vector(1 downto 0); --ORed and to register file as wb
	--ex
	regDes: out std_logic_vector(1 downto 0);
	jmp,outPort,AluSrc: out std_logic;
	aluOp: out std_logic_vector(4 downto 0);--not sure yet...
	--mem
	memWrite,memRead,pop,push,ret,int,instSize: out std_logic
	);
end entity;

architecture contUnit of contUnit is
begin
wb <= "01" when opcode="10001" or opcode ="10011"--(4 downto 3)="10" and (opcode(2 downto 0)<="011" and opcode(2 downto 0)>="001") --memory
	else "11" when opcode = "00110" --in port
	else "10" when (opcode(4 downto 3)="01" and opcode(2 downto 0)<="100") or opcode= "00011" or opcode="00100" or opcode= "10010" --alu
	else "00"; --no wb (or them into regfile)
jmp <= '1' when opcode(4 downto 3)="11" and opcode(2 downto 0)<="100" -- or 011 if call is not jmp
	else '0';
outPort <= '1' when opcode="00101"
	else '0';
aluSrc <= '1' when (opcode(4 downto 3)="10" and opcode(2 downto 0)>= "010") or opcode ="01100" --imm
	else '0'; --reg
regDes <= "10" when opcode(4 downto 3)="01" and opcode(2 downto 0)>"000" and opcode(2 downto 0)<"100" --3rd operand
	else "01" when (opcode(4 downto 3)="10" and opcode(2 downto 0)>"010") or opcode="01000" or opcode="01100" --2nd operand
	else "00"; --1st operand
aluOp <= opcode;
memWrite<='1' when opcode="10000" or opcode="10100" or opcode="11100" or opcode="11110" or opcode="10110"       --should int and call have memWrite?
	else '0';
memRead <= '1' when opcode="10011" or opcode="11101" or opcode="11111"              or opcode="10001" or opcode="11101" or opcode="11111"--should the pop be included? if so should the ret and similar ones be icluded?
	else '0';
pop <= '1' when opcode="10001" or opcode="11101" or opcode="11111" --should this be only pop or even ret is included
	else '0';
push <= '1' when opcode="11110" or opcode="11100" or opcode="10000"
	else '0';
ret <='1' when opcode="11101"
	else '0';
int <= '1' when opcode ="11110"
	else '0';
instSize <= '1' when opcode="01100" or (opcode(4 downto 3)="10" and opcode(2 downto 0)>"001") --32 bit
	else '0';
end architecture;