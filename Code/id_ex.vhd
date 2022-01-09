library ieee;
use ieee.std_logic_1164.all;

entity id_ex is
port(flush: in std_logic; 			--for stalling
	clk: in std_logic;

	wb_in: in std_logic_vector(1 downto 0); 
	regDes_in: in std_logic_vector(1 downto 0);
	jmp_in: in std_logic_vector(2 downto 0);
	outPort_in,AluSrc_in: in std_logic;
	aluOp_in: in std_logic_vector(4 downto 0);
	memWrite_in,memRead_in,pop_in,push_in,ret_In,int_in,instSize_in,call_in,RTI_in: in std_logic;
	imm_in: in std_logic_vector(15 downto 0);
	index_in: in std_logic_vector(1 downto 0); 
	operand1_in,operand2_in,operand3_in: in std_logic_vector(2 downto 0);
	pcout_in: in std_logic_vector(31 downto 0);
	RD1_in,RD2_in: in std_logic_vector(15 downto 0);

	wb: out std_logic_vector(1 downto 0); 
	regDes: out std_logic_vector(1 downto 0);
	jmp: out std_logic_vector(2 downto 0);
	outPort,AluSrc: out std_logic;
	aluOp: out std_logic_vector(4 downto 0);
	memWrite,memRead,pop,push,ret,int,instSize,call,RTI: out std_logic;
	imm: out std_logic_vector(15 downto 0);
	index: out std_logic_vector(1 downto 0); 
	operand1,operand2,operand3: out std_logic_vector(2 downto 0);
	pcout: out std_logic_vector(31 downto 0);
	RD1,RD2: out std_logic_vector(15 downto 0));
end entity;

architecture id_ex of id_ex is
component reg1bit is
     port(
     en,clk,rst:in std_logic;
     d:in std_logic;
     q: out std_logic
     );
end component;
component reg_ris is
generic(n: integer:=16);
port(clk,en,rst: in std_logic;
	d: in std_logic_vector(n-1 downto 0);
	q: out std_logic_vector(n-1 downto 0));
end component;
signal en,rst: std_logic;
begin
en <= '1';
rst<= '1' when flush ='1'
else '0';
u0: reg_ris generic map(n=>2) port map(clk,en,rst,wb_in,wb);
u1: reg_ris generic map(n=>2) port map(clk,en,rst,regdes_in,regdes);
u2: reg_ris generic map(n=>3) port map(clk,en,rst,jmp_in,jmp);
u3: reg1bit port map(clk,en,rst,outPort_in,outPort);
u4: reg1bit port map(clk,en,rst,alusrc_in,aluSrc);
u5: reg_ris generic map(n=>5) port map(clk,en,rst,aluOp_in,aluOp);
u6: reg1bit port map(clk,en,rst,memWrite_in,memWrite);
u7: reg1bit port map(clk,en,rst,memRead_in,memread);
u8: reg1bit port map(clk,en,rst,pop_in,pop);
u9: reg1bit port map(clk,en,rst,push_in,push);
u10: reg1bit port map(clk,en,rst,ret_in,ret);
u11: reg1bit port map(clk,en,rst,int_in,int);
u12: reg1bit port map(clk,en,rst,instSize_in,instSize);
u13: reg_ris generic map(n=>16) port map(clk,en,rst,imm_in,imm);
u14: reg_ris generic map(n=>2) port map(clk,en,rst,index_in,index);
u15: reg_ris generic map(n=>3) port map(clk,en,rst,operand1_in,operand1);
u16: reg_ris generic map(n=>3) port map(clk,en,rst,operand2_in,operand2);
u17: reg_ris generic map(n=>3) port map(clk,en,rst,operand3_in,operand3);
u18: reg_ris generic map(n=>32) port map(clk,en,rst,pcout_in,pcout);
u19: reg_ris generic map(n=>16) port map(clk,en,rst,RD1_in,RD1);
u20: reg_ris generic map(n=>16) port map(clk,en,rst,rd2_in,RD2);
u21: reg1bit port map(clk,en,rst,call_in,call);
u22: reg1bit port map(clk,en,rst,RTI_in,RTI);
end architecture;