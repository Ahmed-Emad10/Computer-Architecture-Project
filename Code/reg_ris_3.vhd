library ieee;
use ieee.std_logic_1164.all;

entity reg3 is
port(clk,en: in std_logic;
	d: in std_logic_vector(2 downto 0);
	q: out std_logic_vector(2 downto 0));
end reg3;

architecture reg3 of reg3 is
begin
process(clk)
begin
if rising_edge(clk) then
	if(en = '1') then
		q <= d;
	end if;
end if;
end process;
end reg3;
