library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity g69_lab1 is 
 Port (code : in std_logic_vector(3 downto 0);
   segments : out std_logic_vector(6 downto 0));
end g69_lab1;
architecture a0 of g69_lab1 is
begin
 segments <= "0000001" when code = "0000" else
     "1001111" when code = "0001" else
     "0010010" when code = "0010" else
     "0000110" when code = "0011" else
     "1001100" when code = "0100" else
     "0100100" when code = "0101" else
     "0100000" when code = "0110" else
     "0001111" when code = "0111" else
     "0000000" when code = "1000" else
     "0000100" when code = "1001" else
     "0001000" when code = "1010" else
     "1100000" when code = "1011" else
     "0110001" when code = "1100" else
     "1000010" when code = "1101" else
     "0110000" when code = "1110" else
	  "0111000" when code = "1111";
	  end a0;