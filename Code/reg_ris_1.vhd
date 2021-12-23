library ieee;
use ieee.std_logic_1164.all;

entity reg is
port(clk,en: in std_logic;
	d: in std_logic;
	q: out std_logic);
end reg;

architecture reg of reg is
begin
process(clk)
begin
if rising_edge(clk) then
	if(en = '1') then
		q <= d;
	end if;
end if;
end process;
end reg;
