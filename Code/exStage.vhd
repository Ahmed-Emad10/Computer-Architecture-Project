library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity exStage is
   port(
    clk,rst:in std_logic;
    jmpFlag,outportFlag,aluSrc,exInt,popin,pushin,callin,intin:in std_logic;
    op:in std_logic_vector(4 downto 0);
    imm,sr1,sr2,aluo,memout,inport:in std_logic_vector(15 downto 0);
    pc:in std_logic_vector(31 downto 0);
    op1,op2,op3:in std_logic_vector(2 downto 0);
    in1,in2,regDst,wb:in std_logic_vector(1 downto 0);
    memWrite,memRead:in std_logic;
    ccr:inout std_logic_vector(2 downto 0);
    epc:out std_logic_vector(31 downto 0);
    alures:out std_logic_vector(15 downto 0);
    pushRsrc:out std_logic_vector(15 downto 0);
    rdst:out std_logic_vector(2 downto 0);
    WBout:out std_logic_vector(1 downto 0);
    memWriteout,memReadout,popout,pushout,callout,intout:out std_logic;
    e:out std_logic
     );
end entity;
architecture exStage of exStage is
component alu is
   GENERIC(n : integer :=16);
     port(
    op:in std_logic_vector(4 downto 0);
    r1:in std_logic_vector(n-1 downto 0);
    r2:in std_logic_vector(n-1 downto 0);
    res:out std_logic_vector(n-1 downto 0);
    ccr:inout std_logic_vector(2 downto 0);
    e:out std_logic
     );
end component;
component reg is
GENERIC(n : integer :=16);
     port(
     en,clk,rst:in std_logic;
     d:in std_logic_vector (n-1 downto 0);
     q: out std_logic_vector (n-1 downto 0)
     );
end component;
component mux is
  	Generic ( n : Integer:=16);
	PORT ( in0,in1,in2,in3 : IN std_logic_vector (n-1 DOWNTO 0);
			sel : IN  std_logic_vector (1 DOWNTO 0);
			out1 : OUT std_logic_vector (n-1 DOWNTO 0));
END component;
signal s,src1,s2,src2:std_logic_vector(15 downto 0);
signal aluOp: std_logic_vector(4 downto 0);
signal r1,r2,aluout: std_logic_vector(15 downto 0);
signal pc0: std_logic_vector(31 downto 0);
signal opr1,opr2,opr3: std_logic_vector(2 downto 0);
signal inportSignal,regDest,reg1,reg2: std_logic_vector(1 downto 0);
begin
  process(clk)
 begin
     if(rising_edge(clk))then
     r1<=sr1;
     r2<=sr2;
     aluop<=op;
     regdest<=regdst;
     opr1<=op1;
     opr2<=op2;
     opr3<=op3;
     reg1<=in1;
     reg2<=in2;
     aluout<=aluo;
     pc0<=pc;
     wbout<=wb;
     memwriteout<=memwrite;
     memreadout<=memread;
     popout<=popin;
     pushout<=pushin;
     callout<=callin;
     intout<=intin;
 end if;
 end process;
epc0: reg generic map(32)port map('1',clk,rst,pc0,epc);
m:mux generic map(3) port map(opr1,opr2,opr3,"000",RegDest,rdst);
m0:mux port map(r1,aluout,memout,inport,reg1,s);
src1<=s;
m1:mux port map(r2,aluout,memout,inport,reg2,s2); 
src2<=s2 when alusrc='0' else imm;
pushrSrc<=src1 when pushin='1' else src2;
alu0:alu port map(aluop,src1,src2,alures,ccr,e);
end architecture;