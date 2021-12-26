library ieee;
use ieee.std_logic_1164.all;

entity decode is
port(clk,rst: in std_logic;
	pcIn: in std_logic_vector(31 downto 0);
	inst: in std_logic_vector(31 downto 0);
	wr: in std_logic_vector(2 downto 0);
	wd: in std_logic_vector(15 downto 0);
	wb: out std_logic_vector(1 downto 0); 
	regDes: out std_logic_vector(1 downto 0);
	jmp,outPort,AluSrc: out std_logic;
	aluOp: out std_logic_vector(4 downto 0);
	memWrite,memRead,pop,push,ret,int,instSize: out std_logic;
	imm: out std_logic_vector(15 downto 0);
	index: out std_logic_vector(1 downto 0); --why is it 2 bits not just 1?
	operand1,operand2,operand3: out std_logic_vector(2 downto 0);
	pcout: out std_logic_vector(31 downto 0);
	RD1,RD2: out std_logic_vector(15 downto 0)
);
end entity;

architecture decode of decode is
component contUnit is
port(rst: in std_logic;
	clk: in std_logic;
	opcode: in std_logic_vector(4 downto 0);
	wb: out std_logic_vector(1 downto 0); 
	regDes: out std_logic_vector(1 downto 0);
	jmp,outPort,AluSrc: out std_logic;
	aluOp: out std_logic_vector(4 downto 0);
	memWrite,memRead,pop,push,ret,int,instSize: out std_logic
	);
end component;
component regFile is
port(	WB: in std_logic;
	clk,rst: in std_logic;
	RR1,RR2,WR: in std_logic_vector(2 downto 0);
	WD: in std_logic_vector(15 downto 0);
	RD1,RD2: out std_logic_vector(15 downto 0));
end component;
signal wbReg: std_logic;
signal temp: std_logic_vector(1 downto 0);
begin
pcout <= pcin;
cu1: contUnit port map(rst,clk,inst(31 downto 27),temp,regDes,jmp,outPort,alusrc,aluop,memwrite,memread,pop,push,ret,int,instsize);
wbreg <= temp(0) or temp(1);
wb<=temp;
rf1: regFile port map(wbreg,clk,rst,inst(26 downto 24),inst(23 downto 21),wr,wd,rd1,rd2);
index<=inst(26 downto 25);
operand1<=inst(26 downto 24);
operand2<=inst(23 downto 21);
operand3<=inst(20 downto 18);
imm<=inst(15 downto 0);
end decode;