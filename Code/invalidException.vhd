
library ieee;
use ieee.std_logic_1164.all;

entity invalidAddress is
port(invalidAdd: in std_logic;   --1 if invalid address
	PC: in std_logic_vector(31 downto 0);
	EPC: inout std_logic_vector(31 downto 0);
	flushEX_MEM: out std_logic;  -- 1 to flush
	flushID_EX: out std_logic;   -- 1 to flush
	flushIF_ID: out std_logic;   -- 1 to flush
	exceptAddress: out std_logic_vector(15 downto 0); -- always 4 ??
	invalidSig: out std_logic   --1 also 1 if invalid ???
);
end entity;

architecture invalidAddress of invalidAddress is
begin
exceptAddress <= "0000000000000100";
invalidSig <= invalidAdd;
flushEX_MEM <= invalidAdd;
flushID_EX <= invalidAdd;
flushIF_ID <= invalidAdd;
EPC <= PC;
end architecture;