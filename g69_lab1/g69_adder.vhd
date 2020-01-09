library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity g69_adder is
	Port(	A, B				: in std_logic_vector(4 downto 0);
			decoded_A		: out std_logic_vector(13 downto 0);
			decoded_B		: out std_logic_vector(13 downto 0);
			decoded_AplusB	: out std_logic_vector(13 downto 0)
			);
	end g69_adder;
	
architecture a1 of g69_adder is
	component full_add is
		Port(x,y,cin:	in std_logic;
			  s, cout:	out std_logic
			  );
	end component full_add;
	
	signal ci: std_logic_vector(4 downto 0);
	signal LSB: std_logic_vector(3 downto 0);
	signal MSB: std_logic_vector(3 downto 0);
	signal decode_A_temp : std_logic_vector(3 downto 0) := (0=> A(4), others => '0');
	signal decode_B_temp : std_logic_vector(3 downto 0) := (0=> B(4), others => '0');
	
	component g69_lab1_final is
		Port (code : in std_logic_vector(3 downto 0);
				segments : out std_logic_vector(6 downto 0));
	end  component g69_lab1_final;
	
begin
	MSB(1) <= ci(4);
	MSB(2) <= '0';
	MSB(3) <= '0';
	
	x_fulladd0: full_add port map(A(0), B(0), '0', LSB(0), ci(0));
	x_fulladd1: full_add port map(A(1), B(1), ci(0), LSB(1), ci(1));
	x_fulladd2: full_add port map(A(2), B(2), ci(1), LSB(2), ci(2));
	x_fulladd3: full_add port map(A(3), B(3), ci(2), LSB(3), ci(3));
	x_fulladd4: full_add port map(A(4), B(4), ci(3), MSB(0), ci(4));
	
	decode_A: g69_lab1_final port map(A(3 downto 0), decoded_A(6 downto 0));
	decode_A_MSB: g69_lab1_final port map(decode_A_temp(3 downto 0), decoded_A(13 downto 7)); 
	
	decode_B: g69_lab1_final port map(B(3 downto 0), decoded_B(6 downto 0));
	decode_B_MSB: g69_lab1_final port map(decode_B_temp(3 downto 0), decoded_B(13 downto 7));
	
	answer_LSB: g69_lab1_final port map(LSB, decoded_AplusB(6 downto 0)); 
	answer_MSB: g69_lab1_final port map(MSB, decoded_AplusB(13 downto 7));
	
	end a1;
	
	