library ieee;
use ieee.std_logic_1164.all;
entity reg is
  GENERIC(n : integer :=16);
     port(
     en,clk,rst:in std_logic;
     d:in std_logic_vector (n-1 downto 0);
     q: out std_logic_vector (n-1 downto 0)
     );
end reg;
architecture reg of reg is
begin
process(clk,rst)
begin
if rst = '1' then
		q <= (others=>'0');
elsif falling_edge(clk) then 
   if en = '1' then
		q <= d;
end if;
end if;
end process;
end architecture;