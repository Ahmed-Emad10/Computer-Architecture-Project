library ieee;
use ieee.std_logic_1164.all;

entity id_ex is
port(stall: in std_logic; 			--for stalling
	clk: in std_logic;

	wb_in: in std_logic_vector(1 downto 0); 
	regDes_in: in std_logic_vector(1 downto 0);
	jmp_in,outPort_in,AluSrc_in: in std_logic_vector(0 downto 0);
	aluOp_in: in std_logic_vector(4 downto 0);
	memWrite_in,memRead_in,pop_in,push_in,ret_In,int_in,instSize_in: in std_logic_vector(0 downto 0);
	imm_in: in std_logic_vector(15 downto 0);
	index_in: in std_logic_vector(1 downto 0); 
	operand1_in,operand2_in,operand3_in: in std_logic_vector(2 downto 0);
	pcout_in: in std_logic_vector(31 downto 0);
	RD1_in,RD2_in: in std_logic_vector(15 downto 0);

	wb: out std_logic_vector(1 downto 0); 
	regDes: out std_logic_vector(1 downto 0);
	jmp,outPort,AluSrc: out std_logic_vector(0 downto 0);
	aluOp: out std_logic_vector(4 downto 0);
	memWrite,memRead,pop,push,ret,int,instSize: out std_logic_vector(0 downto 0); 
	imm: out std_logic_vector(15 downto 0);
	index: out std_logic_vector(1 downto 0); 
	operand1,operand2,operand3: out std_logic_vector(2 downto 0);
	pcout: out std_logic_vector(31 downto 0);
	RD1,RD2: out std_logic_vector(15 downto 0));
end entity;

architecture id_ex of id_ex is
component reg_ris is
generic(n: integer:=16);
port(clk,en: in std_logic;
	d: in std_logic_vector(n-1 downto 0);
	q: out std_logic_vector(n-1 downto 0));
end component;
signal en: std_logic;
begin
en <= not stall;
u0: reg_ris generic map(n=>2) port map(clk,en,wb_in,wb);
u1: reg_ris generic map(n=>2) port map(clk,en,regdes_in,regdes);
u2: reg_ris generic map(n=>1) port map(clk,en,jmp_in,jmp);
u3: reg_ris generic map(n=>1) port map(clk,en,outPort_in,outPort);
u4: reg_ris generic map(n=>1) port map(clk,en,alusrc_in,aluSrc);
u5: reg_ris generic map(n=>5) port map(clk,en,aluOp_in,aluOp);
u6: reg_ris generic map(n=>1) port map(clk,en,memWrite_in,memWrite);
u7: reg_ris generic map(n=>1) port map(clk,en,memRead_in,memread);
u8: reg_ris generic map(n=>1) port map(clk,en,pop_in,pop);
u9: reg_ris generic map(n=>1) port map(clk,en,push_in,push);
u10: reg_ris generic map(n=>1) port map(clk,en,ret_in,ret);
u11: reg_ris generic map(n=>1) port map(clk,en,int_in,int);
u12: reg_ris generic map(n=>1) port map(clk,en,instSize_in,instSize);
u13: reg_ris generic map(n=>16) port map(clk,en,imm_in,imm);
u14: reg_ris generic map(n=>2) port map(clk,en,index_in,index);
u15: reg_ris generic map(n=>3) port map(clk,en,operand1_in,operand1);
u16: reg_ris generic map(n=>3) port map(clk,en,operand2_in,operand2);
u17: reg_ris generic map(n=>3) port map(clk,en,operand3_in,operand3);
u18: reg_ris generic map(n=>32) port map(clk,en,pcout_in,pcout);
u19: reg_ris generic map(n=>16) port map(clk,en,RD1_in,RD1);
u20: reg_ris generic map(n=>16) port map(clk,en,rd2_in,RD2);
end architecture;