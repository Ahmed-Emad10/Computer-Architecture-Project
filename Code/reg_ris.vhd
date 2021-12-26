library ieee;
use ieee.std_logic_1164.all;

entity reg_ris is
generic(n: integer:=16);
port(clk,en,rst: in std_logic;
	d: in std_logic_vector(n-1 downto 0);
	q: out std_logic_vector(n-1 downto 0));
end reg_ris;

architecture reg_ris of reg_ris is
begin
process(clk,rst)
begin
if rst = '1' then
	q <= (others=>'0');
elsif rising_edge(clk) then
	if(en = '1') then
		q <= d;
	end if;
end if;
end process;
end reg_ris;
