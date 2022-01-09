library ieee;
use ieee.std_logic_1164.all;

entity contUnit is
port(rst: in std_logic;
	clk: in std_logic;
	opcode: in std_logic_vector(4 downto 0);
	--wb
	wb: out std_logic_vector(1 downto 0); --ORed and to register file as wb
	--ex
	regDes: out std_logic_vector(1 downto 0);
	jmp: out std_logic_vector(2 downto 0);
	outPort,AluSrc: out std_logic;
	aluOp: out std_logic_vector(4 downto 0);--not sure yet...
	--mem
	memWrite,memRead,pop,push,ret,int,instSize,call,RTI: out std_logic
	);
end entity;

architecture contUnit of contUnit is
begin
process(clk,rst)
begin
if rst = '1' then
	wb <= (others=>'0');
	jmp <= "000";
	outPort <= '0';
	aluSrc <= '0';
	regDes <= (others=>'0');
	aluOp <= (others=>'0');
	memWrite <= '0';
	memRead <= '0';
	pop <= '0';
	push <= '0';
	ret <= '0';
	int <= '0';
	instSize <= '0';
elsif rising_edge(clk) then
	aluOp <= opcode;
	if(opcode="10001" or opcode ="10011") then  --memory
		wb <= "01";
	elsif(opcode = "00110" ) then --in port
		wb <= "11";
	elsif((opcode(4 downto 3)="01" and opcode(2 downto 0)<="100") or opcode= "00011" or opcode="00100" or opcode= "10010" or opcode<"00101") then --alu
		wb <= "10";
	else
		wb <= "00"; --no wb (or them into regfile)
	end if;
	if(opcode(4 downto 3)="11" and opcode(2 downto 0)="011") then -- unconditional jump     -- or 011 if call is not jmp
		jmp <= "001";
	elsif(opcode(4 downto 3)="11" and opcode(2 downto 0)="010") then  -- carry flag
		jmp <= "010";
	elsif(opcode(4 downto 3)="11" and opcode(2 downto 0)="001") then  -- negative flag
		jmp <= "011";
	elsif(opcode(4 downto 3)="11" and opcode(2 downto 0)="000") then  -- zero flag
		jmp <= "100";
	else
		jmp <= "000";
	end if;
	if(opcode="00101") then
		outPort <= '1';
	else
		outPort <= '0';
	end if;
	if((opcode(4 downto 3)="10" and opcode(2 downto 0)>= "010") or opcode ="01100") then 
		aluSrc <= '1'; --imm
	else
		aluSrc <= '0'; --reg
	end if;
	if(opcode(4 downto 3)="01" and opcode(2 downto 0)>"000" and opcode(2 downto 0)<"100") then
		regDes <= "10"; --3rd operand
	elsif((opcode(4 downto 3)="10" and opcode(2 downto 0)>"010") or opcode="01000" or opcode="01100")then
		regDes <= "01"; --2nd operand
	else
		regDes <= "00"; --1st operand
	end if;
	if(opcode="10000" or opcode="10100" or opcode="11100" or opcode="11110" or opcode="10110") then       --should int and call have memWrite?
		memWrite<='1';
	else
		memWrite<='0';
	end if;
	if(opcode="10011" or opcode="11101" or opcode="11111"              or opcode="10001" or opcode="11101" or opcode="11111") then --should the pop be included? if so should the ret and similar ones be icluded?
		memRead <= '1';
	else
		memRead <= '0';
	end if;
	if(opcode="10001" or opcode="11101" or opcode="11111") then --should this be only pop or even ret is included
		pop <= '1';
	else
		pop <= '0';
	end if;
	if(opcode="11110" or opcode="11100" or opcode="10000") then
		push <= '1';
	else
		push <= '0';
	end if;
	if(opcode="11101") then
		ret <='1';
	else
		ret <='0';
	end if;
	if(opcode ="11110") then
		int <= '1';
	else
		int <= '0';
	end if;
	if(opcode="01100" or (opcode(4 downto 3)="10" and opcode(2 downto 0)>"001")) then 
		instSize <= '1'; --32 bit
	else
		instSize <= '0';
	end if;
	if(opcode = "11111") then
		RTI <= '1';
	else
		RTI <= '0';
	end if;
	if(opcode = "11100") then
		call <= '1';
	else
		call <= '0';
	end if;
end if;
end process;
end architecture;