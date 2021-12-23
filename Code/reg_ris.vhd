library ieee;
use ieee.std_logic_1164.all;

entity reg16 is
port(clk,en: in std_logic;
	d: in std_logic_vector(15 downto 0);
	q: out std_logic_vector(15 downto 0));
end reg16;

architecture reg16 of reg16 is
begin
process(clk)
begin
if rising_edge(clk) then
	if(en = '1') then
		q <= d;
	end if;
end if;
end process;
end reg16;
