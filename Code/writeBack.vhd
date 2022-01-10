library ieee;
use ieee.std_logic_1164.all;

entity writeBack is
port(
clk:in std_logic;
wb: in std_logic_vector(1 downto 0);
	mem: in  std_logic_vector(15 downto 0);
	alu: in std_logic_vector(15 downto 0);
	inport: in std_logic_vector(15 downto 0);
	regdes: in std_logic_vector(2 downto 0);
	aluout: out std_logic_vector(15 downto 0);
	WR: out std_logic_vector(2 downto 0);
	WB1 : out std_logic_vector(1 downto 0)
);
end entity;

architecture writeback of writeback is

begin
  process(clk)
    begin

    if(rising_edge(clk)) then
    case (wb) is
	when "01"=>aluout <= mem;
 	when "10"=>aluout <= alu;
	when others=>aluout <= inport;

    end case;
	WR <= regdes;
	WB1 <= wb;
    end if;
  end process;
end architecture;
