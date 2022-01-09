
library ieee;
use ieee.std_logic_1164.all;

entity invalidAddress is
port(invalidAdd: inout std_logic;   --1 if invalid address
	flush: out std_logic;  -- 1 to flush
	PC: in std_logic_vector(31 downto 0);
	EPC: inout std_logic_vector(31 downto 0);
	exceptAddress: out std_logic_vector(15 downto 0) -- always 4 ??

);
end entity;

architecture invalidAddress of invalidAddress is
begin
exceptAddress <= "0000000000000100";
flush <= invalidAdd;
EPC <= PC;
end architecture;