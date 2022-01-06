library ieee;
use ieee.std_logic_1164.all;
entity cpu is
   port(
     en  :in std_logic_vector(2 downto 0);         --en(2)-->for pc, en(1)-->for instruction memory, en(0)-->for fetch buffer
     clk :in std_logic;
     rst :std_logic_vector(2 downto 0); -- rst(2)-->for pc, rst(1)-->for instruction memory, rst(0)-->for fetch buffer
     Address:in std_logic_vector (31 downto 0); --to choose the location to store the instruction in the instruction memory
     instMemData:in std_logic_vector (31 downto 0)
     );
end entity;
architecture cpu of cpu is
component exStage is
    port(
    clk,rst:in std_logic;
    jmpFlag,outportFlag,aluSrc,exInt:in std_logic;
    op:in std_logic_vector(4 downto 0);
    epc:in std_logic_vector(31 downto 0);
    imm,sr1,sr2,aluo,memout,inport:in std_logic_vector(15 downto 0); 
    op1,op2,op3:in std_logic_vector(2 downto 0);
    inportSig,regDst:in std_logic_vector(1 downto 0);
    alures:out std_logic_vector(15 downto 0);
    ccr:out std_logic_vector(2 downto 0);
    rdst:out std_logic_vector(2 downto 0)
     );
end component;
component FetchStage is
port(
     en  :in std_logic_vector(2 downto 0);         --en(2)-->for pc, en(1)-->for instruction memory, en(0)-->for fetch buffer
     clk :in std_logic;
     rst :std_logic_vector(2 downto 0); -- rst(2)-->for pc, rst(1)-->for instruction memory, rst(0)-->for fetch buffer
     Address:in std_logic_vector (31 downto 0); --to choose the location to store the instruction in the instruction memory
     instMemData:in std_logic_vector (31 downto 0);  --data in for instruction memory which represents the instruction itself (all instructions are 32-bit until i decide which one is 16 only) 
     PCOut,InstrucionOut: out std_logic_vector (31 downto 0)
     );
end component;
component MemStage is
port(
     regDest  :in std_logic_vector(2 downto 0);   --destination of the register
     clk,memRead,memWrite,en,rst :in std_logic;   --en for the buffer also the rst signal
     WB_CS :std_logic_vector(1 downto 0); 
     Address,inPort,writeData:in std_logic_vector(15 downto 0);  --Address and alu out in the same time
     regDestOut  :out std_logic_vector(2 downto 0); 
     WB_CSOut :out std_logic_vector(1 downto 0); 
     inPortOut,MemOut,ALUOut:out std_logic_vector (15 downto 0)  --output from memory and output from alu 
     );
end component;

component writeBack is
port(
clk:in std_logic;
wb: in std_logic_vector(1 downto 0);
	mem: in  std_logic_vector(15 downto 0);
	alu: in std_logic_vector(15 downto 0);
	inport: in std_logic_vector(15 downto 0);
	regdes: in std_logic_vector(2 downto 0);
	aluout: out std_logic_vector(15 downto 0);
	WR: out std_logic_vector(2 downto 0)
);
end component;
component decode is
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
end component;
signal jmp,outPort,AluSrc,memWrite,memRead,pop,push,ret,int,instSize,exInt,en1,rst1,rstm,rstex: std_logic;
signal wb,inportSignal,regDest,index,WB_CS,WB_CSout: std_logic_vector(1 downto 0); 
signal wr,op1,op2,op3,ccr ,rdst, regDestOut : std_logic_vector(2 downto 0);
signal aluOp: std_logic_vector(4 downto 0);---<<<<---------Conflict
signal pc,pcout,inst,epc: std_logic_vector (31 downto 0);
signal imm,r1,r2,result,alures,memout,inport,aluout,inportout:std_logic_vector(15 downto 0);
begin
ftch:FetchStage port map(en,clk,rst,Address,instMemData,pc,inst);
dec :decode     port map(clk,rstm,pc,inst,wr,result,wb,regDest,jmp,outPort,AluSrc,aluOp,memWrite,memRead,pop,push,ret,int,instSize,imm,index,op1,op2,op3,pcout,r1,r2);
ex  :exStage    port map(clk,rstex,jmp,outport,aluSrc,exInt,aluOp,epc,imm,r1,r2,aluout,memout,inport,op1,op2,op3,inportSignal,regDest,alures,ccr,rdst);
mem :memStage   port map(rdst,clk,memRead,memWrite,en1,rst1,WB_CS ,alures,inPort,alures,regDestOut,WB_CSOut,inPortout,MemOut,ALUOut);
wrb :writeBack  port map(clk,wb,memout,alures,inport,rdst,result,WR);
end architecture;
