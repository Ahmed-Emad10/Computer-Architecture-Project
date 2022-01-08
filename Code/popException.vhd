

--- hey shouldn't we make (popExcep, flushEX-MEM, flushID-EX, flushIF-ID) only one signal going to differet places ????----

library ieee;
use ieee.std_logic_1164.all;

entity popException is
port(SPstatus: in std_logic_vector(1 downto 0); --00 empty , 01 last position , 10& 11 okay 
	pop: in std_logic;   -- 1 if pop instruction
	flushEX_MEM: out std_logic;  -- 1 to flush
	flushID_EX: out std_logic;   -- 1 to flush
	flushIF_ID: out std_logic;   -- 1 to flush
	popExcep: out std_logic;   -- 1 if there is exception and 0 if not  -- it's pop and SPstatus
	exceptAddress: out std_logic_vector(15 downto 0); -- always 2 ??
	PC: in std_logic_vector(31 downto 0);
	ThTwSixTeen  : IN std_logic; -- 1 32    0 16
	EPC: inout std_logic_vector(31 downto 0)
	);
end entity;

architecture popException of popException is
begin
popExcep <= '1' when (pop='1' and SPstatus="00") or (pop='1' and SPstatus="01" and ThTwSixTeen='1')
	else '0';
flushEX_MEM <= '1' when (pop='1' and SPstatus="00") or (pop='1' and SPstatus="01" and ThTwSixTeen='1')
	else '0';
flushID_EX <= '1' when (pop='1' and SPstatus="00") or (pop='1' and SPstatus="01" and ThTwSixTeen='1')
	else '0';
flushIF_ID <= '1' when (pop='1' and SPstatus="00") or (pop='1' and SPstatus="01" and ThTwSixTeen='1')
	else '0';
exceptAddress <= "0000000000000010";
EPC <= PC;
end architecture;