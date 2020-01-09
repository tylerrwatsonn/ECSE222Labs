library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity full_add is
	port (x, y, cin	: in std_logic;
			s, cout		: out std_logic
			);
end entity;

architecture a2 of full_add is 
begin
	s <= x xor y xor cin;
	cout <= (x and y) or (cin and x) or (cin and y);
end a2;