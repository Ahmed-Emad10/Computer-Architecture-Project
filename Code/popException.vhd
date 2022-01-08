

--- hey shouldn't we make (popExcep, flushEX-MEM, flushID-EX, flushIF-ID) only one signal going to differet places ????----

library ieee;
use ieee.std_logic_1164.all;

entity popException is
port(SPstatus: in std_logic; -- 0 if there is something in stack  &&&  1 if stack is empty ??
	pop: in std_logic;   -- 1 if pop instruction
	flushEX_MEM: out std_logic;  -- 1 to flush
	flushID_EX: out std_logic;   -- 1 to flush
	flushIF_ID: out std_logic;   -- 1 to flush
	popExcep: out std_logic;   -- 1 if there is exception and 0 if not  -- it's pop and SPstatus
	exceptAddress: out std_logic_vector(15 downto 0) -- always 2 ??
	);
end entity;

architecture popException of popException is
begin
popExcep <= pop and SPstatus;
flushEX_MEM <= pop and SPstatus;
flushID_EX <= pop and SPstatus;
flushIF_ID <= pop and SPstatus;
exceptAddress <= "0000000000000010";
end architecture;