library ieee;
use ieee.std_logic_1164.all;

entity regFile is
port(	WB: in std_logic;
	clk: in std_logic;
	RR1,RR2,WR: in std_logic_vector(2 downto 0);
	WD: in std_logic_vector(15 downto 0);
	RD1,RD2: out std_logic_vector(15 downto 0));
end regFile;

architecture regFile of regFile is
component reg is 
port(clk,en: in std_logic;
	d: in std_logic_vector(15 downto 0);
	q: out std_logic_vector(15 downto 0));
end component;
component Decoder8 is
port(	WB: in std_logic;
	WR: in std_logic_vector(2 downto 0);
	output: out std_logic_vector(7 downto 0));
end component;
signal q0,q1,q2,q3,q4,q5,q6,q7: std_logic_vector(15 downto 0);
signal en: std_logic_vector(7 downto 0);
begin
des: Decoder8 port map (wb,wr,en);
R0: reg PORT MAP(clk,en(0),WD,q0);
R1: reg PORT MAP(clk,en(1),WD,q1);
R2: reg PORT MAP(clk,en(2),WD,q2);
R3: reg PORT MAP(clk,en(3),WD,q3);
R4: reg PORT MAP(clk,en(4),WD,q4);
R5: reg PORT MAP(clk,en(5),WD,q5);
R6: reg PORT MAP(clk,en(6),WD,q6);
R7: reg PORT MAP(clk,en(7),WD,q7);
RD1<= 	     q0 when RR1="000"
	else q1 when RR1="001"
	else q2 when rr1="010"
	else q3 when rr1="011"
	else q4 when rr1="100"
	else q5 when rr1="101"
	else q6 when rr1="110"
	else q7 when rr1="111";
RD2<= 	     q0 when RR2="000"
	else q1 when RR2="001"
	else q2 when rr2="010"
	else q3 when rr2="011"
	else q4 when rr2="100"
	else q5 when rr2="101"
	else q6 when rr2="110"
	else q7 when rr2="111";

end regFile;