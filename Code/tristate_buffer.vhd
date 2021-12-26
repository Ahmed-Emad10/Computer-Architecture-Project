library ieee;
use ieee.std_logic_1164.all;
entity tsb is
generic(n:integer:=32);
port(
en:in std_logic;
inp:in std_logic_vector(n-1 downto 0);
outp:out std_logic_vector(n-1 downto 0)
);
end entity;
architecture tsb of tsb is
begin
outp<=inp when en='1'
else (others=>'Z');


end architecture;
