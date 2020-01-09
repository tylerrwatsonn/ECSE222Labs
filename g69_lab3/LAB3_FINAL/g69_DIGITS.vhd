library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity g69_DIGITS is
	PORT (count_out			: in std_logic_vector(3 downto 0);
			LEFT_DIGIT			: out std_logic_vector(3 downto 0);
			RIGHT_DIGIT			: out std_logic_vector(3 downto 0));
end g69_DIGITS;

architecture a of g69_DIGITS is
begin
process(count_out)
begin
case count_out is
		when   "0001"=>
			LEFT_DIGIT<= "0000";
			RIGHT_DIGIT <= "0001";
		when   "0010"=>
			LEFT_DIGIT<= "0000";
			RIGHT_DIGIT <= "0010";
		when   "0100"=>
			LEFT_DIGIT<= "0000";
			RIGHT_DIGIT <= "0100";
		when  "1000"=>
			LEFT_DIGIT<= "0000";
			RIGHT_DIGIT <= "1000";
		when  "0011"=>
			LEFT_DIGIT<= "0000";
			RIGHT_DIGIT <= "0011";
		when  "0110"=>
			LEFT_DIGIT<= "0000";
			RIGHT_DIGIT <= "0110";
		when  "1100"=>
			LEFT_DIGIT<= "0001";
			RIGHT_DIGIT <= "0010";
		when  "1011"=>
			LEFT_DIGIT<= "0001";
			RIGHT_DIGIT <= "0001";
		when  "0101"=>
			LEFT_DIGIT<= "0000";
			RIGHT_DIGIT <= "0101";
		when  "1010"=>
			LEFT_DIGIT<= "0001";
			RIGHT_DIGIT <= "0000";
		when  "0111"=>
			LEFT_DIGIT<= "0000";
			RIGHT_DIGIT <= "0111";
		when  "1110"=>
			LEFT_DIGIT<= "0001";
			RIGHT_DIGIT <= "0100";
		when  "1111"=>
			LEFT_DIGIT<= "0001";
			RIGHT_DIGIT <= "0101";
		when  "1101"=>
			LEFT_DIGIT<= "0001";
			RIGHT_DIGIT <= "0011";
		when  "1001"=>
			LEFT_DIGIT<= "0000";
			RIGHT_DIGIT <= "1001";
		when others =>
			LEFT_DIGIT<= "0000";
			RIGHT_DIGIT <= "0000";
		end case;
	end process;
end a;