library ieee;
use ieee.std_logic_1164.all;
entity decoder is
     port(
      en:in std_logic;
      s:in std_logic_vector (1 downto 0);
      a:out std_logic_vector (3 downto 0)
     );
end decoder;
architecture decoder of decoder is
begin
a<=(others=>'0') when en='0'
else "0001" when s="00"
else "0010" when s="01"
else "0100" when s="10"
else "1000" when s="11";
end architecture;
