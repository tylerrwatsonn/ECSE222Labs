library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL; 
entity g69_counter_lab2 is 
Port (enable : in std_logic ;
	reset : in std_logic ; 
	clk : in std_logic ; 
	count : out std_logic_vector (3 downto 0)); 
end g69_counter_lab2;
 
 architecture a of g69_counter_lab2 is 
 signal counting: unsigned (3 downto 0);
 begin
	process(clk,reset)
		begin
			if(reset = '0') then 
				counting <= "0000";
			elsif(rising_edge(clk)) then 
				if(enable = '1') then
					counting <= counting + 1;
				else
					counting <= counting;
				end if;
			end if;
			count <= std_logic_vector(counting);
	end process;
	

end a;