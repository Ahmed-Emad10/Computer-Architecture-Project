
library ieee;
use ieee.std_logic_1164.all;
entity jmpDetection is

port(
    jmp                   : in std_logic_vector (2 downto 0);    -- to know if there is jmp or no jmp   
    ZF,CF,NF              : in std_logic;                        
    Rdst                  : in std_logic_vector (15 downto 0);   -- this register holds the location of the jmp
    F_Flush,D_Flush,isJMP : out std_logic;                       -- signals to flush fetch buffer and decode buffer , 
                                                                 --         isJMP to change the pc to the jmp location
    jmpLocation           : out std_logic_vector (15 downto 0)   
    );
end entity;

architecture myjmpDetection of jmpDetection is
Signal isFlush,isEN : std_logic ;
begin

    jmpLocation <= Rdst;

    isJMP <= '1' when jmp = "100" and ZF = '1'
        else '1' when jmp = "010" and CF = '1'
        else '1' when jmp = "011" and NF = '1'
        else '1' when jmp = "001"
        else '0';
        
    F_Flush <= '1' when jmp = "100" and ZF = '1'
        else '1'   when jmp = "010" and CF = '1'
        else '1'   when jmp = "011" and NF = '1'
        else '1'   when jmp = "001"
        else '0';

    D_Flush <= '1' when jmp = "100" and ZF = '1'
        else '1'   when jmp = "010" and CF = '1'
        else '1'   when jmp = "011" and NF = '1'
        else '1'   when jmp = "001"
        else '0';

end architecture;

