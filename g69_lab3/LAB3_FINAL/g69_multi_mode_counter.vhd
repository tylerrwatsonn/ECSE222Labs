library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity g69_multi_mode_counter is
	PORT (start			: in std_logic;
			stop			: in std_logic;
			direction	: in std_logic;
			reset			: in std_logic;
			clk			: in std_logic;
			HEX0			: out std_logic_vector(6 downto 0);
			HEX1			: out std_logic_vector(6 downto 0));
end g69_multi_mode_counter;

architecture a of g69_multi_mode_counter is

component g69_FSM is
	PORT (enable		: in std_logic;
			direction	: in std_logic;
			reset			: in std_logic;
			clk			: in std_logic;
			count			: out std_logic_vector(3 downto 0));
end component g69_FSM;

component g69_7_segment_decoder is 
	Port(	 code 	: in std_logic_vector(3 downto 0);
			 segments : out std_logic_vector(6 downto 0)
			 );
end component g69_7_segment_decoder;

component g69_lab3_clock_divider is
   Port (
                enable  : in std_logic;
                reset   : in std_logic;
                clk     : in std_logic;
                en_out  : out std_logic
        );      
end component g69_lab3_clock_divider;
 
component g69_DIGITS is
	PORT (count_out			: in std_logic_vector(3 downto 0);
			LEFT_DIGIT			: out std_logic_vector(3 downto 0);
			RIGHT_DIGIT			: out std_logic_vector(3 downto 0));
end component g69_DIGITS;
	 
	 signal LEFT_DIGIT : std_logic_vector(3 downto 0);
	 signal RIGHT_DIGIT : std_logic_vector(3 downto 0);
	 
	 signal count_out: std_logic_vector(3 downto 0);
	 signal counter_state: std_logic;
	 signal start_state: std_logic;
	 signal enable_0: std_logic;

	 
	 begin
	 
	 		
	 Clock_Divider_0: g69_lab3_clock_divider PORT MAP(enable => start, reset => reset, clk => clk, en_out => enable_0);
	 
	 FSM_1: g69_FSM PORT MAP(enable => start_state, direction => direction, reset => reset, clk => clk, count => count_out);

	 
	 digits: g69_DIGITS PORT MAP(count_out=> count_out, LEFT_DIGIT=> LEFT_DIGIT(3 downto 0), RIGHT_DIGIT => RIGHT_DIGIT(3 downto 0));
	 decoder_0: g69_7_segment_decoder PORT MAP(code => RIGHT_DIGIT(3 downto 0), segments => HEX0(6 downto 0));
    decoder_1: g69_7_segment_decoder PORT MAP(code => LEFT_DIGIT(3 downto 0), segments => HEX1(6 downto 0));	

	 process(start,stop,reset,clk)
	 begin
		if(start = '0' and stop='1') then
				counter_state <= '1';
				end if;
				
			if((stop ='0' or reset='0') and start='1') then
				counter_state <= '0';
			end if;
			
			
			if(enable_0 ='0' and counter_state='1') then 
				start_state <= '1';
			else 
				start_state <= '0';
			end if;
			
			
		
	 
	end process;
	 


		
	 
	 
end a;
	