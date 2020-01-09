library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity g69_lab3_clock_divider is
        Generic(
				  T : natural := 500000
        );  
        Port (
                enable  : in std_logic;
                reset   : in std_logic;
                clk     : in std_logic;
                en_out  : out std_logic
        );  
end g69_lab3_clock_divider;
 
 
 
architecture a of g69_lab3_clock_divider is

	signal counter_down : natural range 0 to  T - 1 := T - 1;

begin

 
    process(clk, reset)

 
    
    begin
    
        if(reset = '0') then
            counter_down <= T-1;
        elsif (Rising_edge(clk)) then
		  
		  if(enable = '1') then
		  
				if(counter_down = 0) then 
					counter_down <= T - 1;
				else 
					counter_down <= counter_down - 1;
				end if;
			
			end if;
        end if; 
        
        if (counter_down = 0) then 
            en_out <= '1';
        else
            en_out <= '0';
        end if;
            
    end process;
 
 
end a;