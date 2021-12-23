library ieee;
use ieee.std_logic_1164.all;

entity reg2 is
port(clk,en: in std_logic;
	d: in std_logic_vector(1 downto 0);
	q: out std_logic_vector(1 downto 0));
end reg2;

architecture reg2 of reg2 is
begin
process(clk)
begin
if rising_edge(clk) then
	if(en = '1') then
		q <= d;
	end if;
end if;
end process;
end reg2;
