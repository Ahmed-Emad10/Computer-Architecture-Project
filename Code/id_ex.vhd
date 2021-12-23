library ieee;
use ieee.std_logic_1164.all;

entity id_ex is
port(stall: in std_logic; 			--for stalling
	clk: in std_logic;

	wb_in: in std_logic_vector(1 downto 0); 
	regDes_in: in std_logic_vector(1 downto 0);
	jmp_in,outPort_in,AluSrc_in: in std_logic;
	aluOp_in: in std_logic_vector(4 downto 0);
	memWrite_in,memRead_in,pop_in,push_in,ret_In,int_in,instSize_in: in std_logic;
	imm_in: in std_logic_vector(15 downto 0);
	index_in: in std_logic_vector(1 downto 0); 
	operand1_in,operand2_in,operand3_in: in std_logic_vector(2 downto 0);
	pcout_in: in std_logic_vector(15 downto 0);
	RD1_in,RD2_in: in std_logic_vector(15 downto 0);

	wb: out std_logic_vector(1 downto 0); 
	regDes: out std_logic_vector(1 downto 0);
	jmp,outPort,AluSrc: out std_logic;
	aluOp: out std_logic_vector(4 downto 0);
	memWrite,memRead,pop,push,ret,int,instSize: out std_logic;
	imm: out std_logic_vector(15 downto 0);
	index: out std_logic_vector(1 downto 0); 
	operand1,operand2,operand3: out std_logic_vector(2 downto 0);
	pcout: out std_logic_vector(15 downto 0);
	RD1,RD2: out std_logic_vector(15 downto 0));
end entity;

architecture id_ex of id_ex is
component reg16 is
port(clk,en: in std_logic;
	d: in std_logic_vector(15 downto 0);
	q: out std_logic_vector(15 downto 0));
end component;
component reg5 is
port(clk,en: in std_logic;
	d: in std_logic_vector(4 downto 0);
	q: out std_logic_vector(4 downto 0));
end component;
component reg3 is
port(clk,en: in std_logic;
	d: in std_logic_vector(2 downto 0);
	q: out std_logic_vector(2 downto 0));
end component;
component reg2 is
port(clk,en: in std_logic;
	d: in std_logic_vector(1 downto 0);
	q: out std_logic_vector(1 downto 0));
end component;
component reg is
port(clk,en: in std_logic;
	d: in std_logic;
	q: out std_logic);
end component;
signal en: std_logic;
begin
en <= not stall;
u0: reg2 port map(clk,en,wb_in,wb);
u1: reg2 port map(clk,en,regdes_in,regdes);
u2: reg port map(clk,en,jmp_in,jmp);
u3: reg port map(clk,en,outPort_in,outPort);
u4: reg port map(clk,en,alusrc_in,aluSrc);
u5: reg5 port map(clk,en,aluOp_in,aluOp);
u6: reg port map(clk,en,memWrite_in,memWrite);
u7: reg port map(clk,en,memRead_in,memread);
u8: reg port map(clk,en,pop_in,pop);
u9: reg port map(clk,en,push_in,push);
u10: reg port map(clk,en,ret_in,ret);
u11: reg port map(clk,en,int_in,int);
u12: reg port map(clk,en,instSize_in,instSize);
u13: reg16 port map(clk,en,imm_in,imm);
u14: reg2 port map(clk,en,index_in,index);
u15: reg3 port map(clk,en,operand1_in,operand1);
u16: reg3 port map(clk,en,operand2_in,operand2);
u17: reg3 port map(clk,en,operand3_in,operand3);
u18: reg16 port map(clk,en,pcout_in,pcout);
u19: reg16 port map(clk,en,RD1_in,RD1);
u20: reg16 port map(clk,en,rd2_in,RD2);
end architecture;