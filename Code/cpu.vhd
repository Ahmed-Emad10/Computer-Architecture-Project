library ieee;
use ieee.std_logic_1164.all;
entity cpu is
   port(
     en  :in std_logic_vector(2 downto 0);         
     clk,Reset,start :in std_logic;
     rst :in std_logic_vector(2 downto 0); 
     startAdd,inport:in std_logic_vector(15 downto 0);
     Address:in std_logic_vector (31 downto 0); 
     instMemData,memPC:in std_logic_vector (31 downto 0);
     outport:out std_logic_vector(15 downto 0)
     );
end entity;
architecture cpu of cpu is
component exStage is
     port(
    clk,rst:in std_logic;
    outportFlag,aluSrc,popin,pushin,callin,intin,retin,rtiin:in std_logic;
    op:in std_logic_vector(4 downto 0);
    imm,sr1,sr2,aluo,memout,inport:in std_logic_vector(15 downto 0);
    pc:in std_logic_vector(31 downto 0);
    op1,op2,op3:in std_logic_vector(2 downto 0);
    in1,in2,regDst,wb:in std_logic_vector(1 downto 0);
    memWrite,memRead:in std_logic;
    ccr:inout std_logic_vector(2 downto 0);
    epc:out std_logic_vector(31 downto 0);
    alures:out std_logic_vector(15 downto 0);
    pushRsrc,inportout:out std_logic_vector(15 downto 0);
    rdst:out std_logic_vector(2 downto 0);
    WBout:out std_logic_vector(1 downto 0);
    memWriteout,memReadout,popout,pushout,callout,intout,retout,rtiout:out std_logic;
    e:out std_logic
     );
end component;
component FetchStage is
port(
    en  : in std_logic_vector(2 downto 0);        		-- en(2)-->for pc, en(1)-->for instruction memory, en(0)-->for fetch buffer
    clk,IF_IDWrite,PCWrite,isJMP : in std_logic;        -- new signals IF_IDWrite for stall also PCWrite , isJMP indicates if there is jmp
    JMPLocation : in std_logic_vector (15 downto 0);    -- new signals represents the jmp location
    MemOut : in std_logic_vector (31 downto 0);         -- new signals represent the pc of the int or the exceptions
    Reset,PopEx,MemRet,MemInt,MemRti : in std_logic;    -- new signals to choosde the pc in case of we want the pc from the data Mem
    JMP_Flush,INT_Flush,RET_Flush,Reset_Flush,Pop_Flush,PC_Flush : in std_logic;  -- new signals to flush the Fetch Buffer
    rst : in std_logic_vector(2 downto 0); 						-- rst(2)-->for pc, rst(1)-->for instruction memory, rst(0)-->for fetch buffer
    Address : in std_logic_vector (31 downto 0); 				-- to choose the location to store the instruction in the instruction memory
    instMemData : in std_logic_vector (31 downto 0);  			-- data in for instruction memory which represents the instruction itself 
																--      (all instructions are 32-bit until i decide which one is 16 only) 
    PCOut,InstrucionOut : out std_logic_vector (31 downto 0)
    );
end component;
component MemStage is
port(
     regDest,Flags  :in std_logic_vector(2 downto 0);   --destination of the register
     clk,memRead,memWrite,en,rst,Push,Pop,ThTwSixTeen,INT,call :in std_logic;   --en for the buffer also the rst signal
     WB_CS :in std_logic_vector(1 downto 0); 
     PC , memPC : in std_logic_vector (31 downto 0);    -- PC to store in the mem in case of call and INT, memPC is the address of the Reset ,Exc and INT in the instruction memory
     Address,inPort,PopExcAdd,PCExcAdd,startAdd,writeData :in std_logic_vector (15 downto 0);  -- Address and alu out in the same time, startadd the address of reset ,Exc and INT in data mem not in InstructionMem
     PopExc,PCExc,Start,Reset : in std_logic;               -- signals to decide if there is exception , start to start initializing the data mem with the address of Reset,Exceptions and interrupts
     regDestOut  :out std_logic_vector(2 downto 0); 
     WB_CSOut,SPstatus :out std_logic_vector(1 downto 0); 
     inPortOut,MemOut,ALUOut:out std_logic_vector (15 downto 0);  --output from memory and output from alu 
     PCfMEM : out std_logic_vector(31 downto 0)
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
	jmp: out std_logic_vector(2 downto 0);
	outPort,AluSrc: out std_logic;
	aluOp: out std_logic_vector(4 downto 0);
	memWrite,memRead,pop,push,ret,int,instSize,call,RTI: out std_logic;
	imm: out std_logic_vector(15 downto 0);
	index: out std_logic_vector(1 downto 0); --why is it 2 bits not just 1?
	operand1,operand2,operand3: out std_logic_vector(2 downto 0);
	pcout: out std_logic_vector(31 downto 0);
	RD1,RD2: out std_logic_vector(15 downto 0)
);
end component;
component forwardUnit is
  port(
 r1,r2,rgdst1,rgdst2:in std_logic_vector(2 downto 0);
 op:in std_logic_vector(4 downto 0);
 wb1,wb2:in std_logic_vector(1 downto 0);
 rg1,rg2:out std_logic_vector(1 downto 0)
 );
end component;
component hazardDetection is
 port(
 r1,r2,rd:in std_logic_vector(2 downto 0);
 memread:in std_logic;
 sig:out std_logic
 );
end component;
component popException is
port(SPstatus: in std_logic_vector(1 downto 0); --00 empty , 01 last position , 10& 11 okay 
	pop: in std_logic;   -- 1 if pop instruction
	flush: out std_logic;  -- 1 to flush
	popExcep: out std_logic;   -- 1 if there is exception and 0 if not  -- it's pop and SPstatus
	exceptAddress: out std_logic_vector(15 downto 0); -- always 2 ??
	PC: in std_logic_vector(31 downto 0);
	ThTwSixTeen  : IN std_logic; -- 1 32    0 16
	EPC: inout std_logic_vector(31 downto 0)
	);
end component;
component invalidAddress is
port(invalidAdd: inout std_logic;   --1 if invalid address
	flush: out std_logic;  -- 1 to flush
	PC: in std_logic_vector(31 downto 0);
	EPC: inout std_logic_vector(31 downto 0);
	exceptAddress: out std_logic_vector(15 downto 0) -- always 4 ??
);
end component;
component jmpDetection is
port(
    jmp                   : in std_logic_vector (2 downto 0);    -- to know if there is jmp or no jmp   
    ZF,CF,NF              : in std_logic;                        
    Rdst                  : in std_logic_vector (15 downto 0);   -- this register holds the location of the jmp
    F_Flush,D_Flush,isJMP : out std_logic;                       -- signals to flush fetch buffer and decode buffer , 
                                                                 --         isJMP to change the pc to the jmp location
    jmpLocation           : out std_logic_vector (15 downto 0)   
    );
end component;

component id_ex is
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
end component;

signal outPortflag_out,outPortflag,AluSrc,AluSrc_out,memWrite,memWrite_out,memRead,memRead_out,pop,pop_out,push_out,push,ret,ret_out,int,int_out,instSize_out,instSize,en1,rst1,rstm,rstex,sig,isJMP,memReadOut,memWriteout,callout,intout,flushPOP,flushInvalid,call,RTI: std_logic;
signal POP_flushEX_MEM,POP_flushID_EX,POP_flushIF_ID,INVALID_flushEX_MEM,INVALID_flushID_EX,INVALID_flushIF_ID,popExcept,JMPF_Flush,JMPD_Flush,invalidSig,popout,pushout,retout,rtiout,rti_out,call_out,e: std_logic;
signal wb,wb_out,inportSignal,regDest,index,index_out,WB_CS,WB_CSout,reg1,reg2,SPstatus,regDes_out: std_logic_vector(1 downto 0); 
signal wr,op1,op2,op3,op1_out,op2_out,op3_out,ccr ,rdst, jmp,jmp_out,regDestOut, regDest_out : std_logic_vector(2 downto 0);
signal aluOp,aluOp_out: std_logic_vector(4 downto 0);
signal imm,imm_out,r1,r2,r1_out,r2_out,result,alures,memout,aluout,inportout,PopExcAdd,PCExcAdd,jmpLocation,inportoutEX,pushRsrc:std_logic_vector(15 downto 0);
signal pc,pcout,pcout_out,inst,epc,InstrucionOut,PCfMEM: std_logic_vector (31 downto 0);

begin
f   :forwardUnit          port map(op1,op2,rdst,regDestOut,aluOp,wb_cs,WB_CSOut,reg1,reg2);

hzrd:hazardDetection      port map(inst(23 downto 21),inst(26 downto 24),op2,memread,sig);

ftch:FetchStage           port map(en,clk,sig,sig,isJMP,jmpLocation ,PCfMEM,Reset,popExcept,retout,intout,rtiout,JMPF_Flush,intout,ret,Reset,flushPOP,flushInvalid, rst,Address,instMemData,PCOut,InstrucionOut);

jmp0:jmpDetection          port map(jmp,ccr(0),ccr(2),ccr(1),r1_out,JMPF_Flush,JMPD_Flush,isJMP,jmpLocation );

dec :decode               port map(clk,rstm,PCOut,InstrucionOut,wr,result,wb,regDest,jmp,outPortflag,AluSrc,aluOp,memWrite,memRead,pop,push,ret,int,instSize,call,RTI,imm,index,op1,op2,op3,pcout,r1,r2);
					   -- Changed the PC and Instruction to the output from the Fetch Stage


decodeBuffer: id_ex       port map(JMPD_Flush,clk,wb,regDest,jmp,outPortflag,AluSrc,aluOp,memWrite,memRead,pop,push,ret,int,instSize,call,RTI,imm,index,op1,op2,op3,pcout,r1,r2,wb_out, regDes_out,jmp_out,outPortflag_out,AluSrc_out,aluOp_out,memWrite_out,memRead_out,pop_out,push_out,ret_out,int_out,instSize_out,call_out,RTI_out,imm_out,index_out,op1_out,op2_out,op3_out,pcout_out,r1_out,r2_out);



ex  :exStage              port map(clk,reset,outportflag_out,aluSrc_out,pop_out,push_out,call_out,int_out,ret_out,rti_out,aluOp_out,imm_out,r1_out,r2_out,aluout,memout,inport,pcout_out,op1_out,op2_out,op3_out,reg1,reg2,regDes_out,wb,memWrite_out,memRead_out,ccr,epc,alures,pushRsrc,inportoutEX,rdst,WB_CS,memWriteout,memReadout,popout,pushout,callout,intout,retout,rtiout,e);					-- memReadOut ,memWriteOut , callout,intout
outport<=alures when outportflag='1';

mem :memStage             port map(rdst,ccr,clk,memReadout,memWriteout,en(0),rst(0),popout,pushout,instSize,callout,intout,WB_CS,epc,memPC,alures,inportoutEX,PopExcAdd,PCExcAdd,startAdd,pushRsrc,popExcept,flushInvalid,start,Reset,regDestOut,WB_CSOut,SPstatus,inPortout,MemOut,ALUOut,PCfMEM);

wrb :writeBack            port map(clk,WB_CSOut,MemOut,ALUOut,inPortout,regDestOut,result,WR);

pop0 :popException         port map(SPstatus,pop,flushPOP,popExcept,PopExcAdd,PC,instSize,EPC);

invalidAdd:invalidAddress port map(e,flushInvalid,PC,EPC,PCExcAdd);


end architecture;

