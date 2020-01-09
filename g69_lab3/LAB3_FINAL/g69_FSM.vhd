library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity g69_FSM is
	PORT (enable		: in std_logic;
			direction	: in std_logic;
			reset			: in std_logic;
			clk			: in std_logic;
			count			: out std_logic_vector(3 downto 0));
end g69_FSM;

architecture a of g69_FSM is
		SIGNAL present_state: STD_LOGIC_VECTOR(3 downto 0);
		CONSTANT A: std_logic_vector(3 downto 0):= "0001";
		CONSTANT B: std_logic_vector(3 downto 0):= "0010";
		CONSTANT C: std_logic_vector(3 downto 0):= "0100";
		CONSTANT D: std_logic_vector(3 downto 0):= "1000";
		CONSTANT E: std_logic_vector(3 downto 0):= "0011";
		CONSTANT F: std_logic_vector(3 downto 0):= "0110";
		CONSTANT G: std_logic_vector(3 downto 0):= "1100";
		CONSTANT H: std_logic_vector(3 downto 0):= "1011";
		CONSTANT I: std_logic_vector(3 downto 0):= "0101";
		CONSTANT J: std_logic_vector(3 downto 0):= "1010";
		CONSTANT K: std_logic_vector(3 downto 0):= "0111";
		CONSTANT L: std_logic_vector(3 downto 0):= "1110";
		CONSTANT M: std_logic_vector(3 downto 0):= "1111";
		CONSTANT N: std_logic_vector(3 downto 0):= "1101";
		CONSTANT O: std_logic_vector(3 downto 0):= "1001";
		
		BEGIN
		PROCESS(direction, present_state, clk, reset)
		BEGIN
		
		IF enable = '1' THEN
			IF rising_edge(clk) THEN
				IF reset = '0' THEN
					IF direction = '1' THEN present_state <= A;
					ELSE present_state <= O;
					END IF;
				ELSE
				CASE present_state is
					WHEN A=>
						IF direction='1' THEN present_state <= B;
						ELSE present_state <= O;
						END IF;
					WHEN B=>
						IF direction='1' THEN present_state <= C;
						ELSE present_state <= A;
						END IF;
					WHEN C=>
						IF direction='1' THEN present_state <= D;
						ELSE present_state <= B;
						END IF;
					WHEN D=>
						IF direction='1' THEN present_state <= E;
						ELSE present_state <= C;
						END IF;
					WHEN E=>
						IF direction='1' THEN present_state <= F;
						ELSE present_state <= D;
						END IF;
					WHEN F=>
						IF direction='1' THEN present_state <= G;
						ELSE present_state <= E;
						END IF;
					WHEN G=>
						IF direction='1' THEN present_state <= H;
						ELSE present_state <= F;
						END IF;
					WHEN H=>
						IF direction='1' THEN present_state <= I;
						ELSE present_state <= G;
						END IF;
					WHEN I=>
						IF direction='1' THEN present_state <= J;
						ELSE present_state <= H;
						END IF;
					WHEN J=>
						IF direction='1' THEN present_state <= K;
						ELSE present_state <= I;
						END IF;
					WHEN K=>
						IF direction='1' THEN present_state <= L;
						ELSE present_state <= J;
						END IF;
					WHEN L=>
						IF direction='1' THEN present_state <= M;
						ELSE present_state <= K;
						END IF;
					WHEN M=>
						IF direction='1' THEN present_state <= N;
						ELSE present_state <= L;
						END IF;
					WHEN N=>
						IF direction='1' THEN present_state <= O;
						ELSE present_state <= M;
						END IF;
					WHEN O=>
						IF direction='1' THEN present_state <= A;
						ELSE present_state <= N;
						END IF;
					WHEN OTHERS=>
						present_state <=A;
				END CASE;
				END IF;
				
				
				
			END IF;
		END IF;
		count <= present_state; 
		END PROCESS;
END a;
		
		
	
		
			