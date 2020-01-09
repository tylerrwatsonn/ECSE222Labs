library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity g69_7_segment_decoder is 
 Port (code : in std_logic_vector(3 downto 0);
   segments : out std_logic_vector(6 downto 0));
end g69_7_segment_decoder;
architecture a0 of g69_7_segment_decoder is
begin
 with code select segments <= 
	  "0000001" when "0000" ,
     "1001111" when "0001" ,
     "0010010" when "0010" ,
     "0000110" when "0011" ,
     "1001100" when "0100" ,
     "0100100" when "0101" ,
     "0100000" when "0110" ,
     "0001111" when "0111" ,
     "0000000" when "1000" ,
     "0000100" when "1001" ,
     "0001000" when "1010" ,
     "1100000" when "1011" ,
     "0110001" when "1100" ,
     "1000010" when "1101" ,
     "0110000" when "1110" ,
	  "0111000" when "1111",
	  "0000000" when OTHERS; --This code will never be reached using the adder but is necessary in order to cover all possibilities and compile
end a0;