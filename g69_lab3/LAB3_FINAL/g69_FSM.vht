-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "04/11/2019 08:22:22"
                                                            
-- Vhdl Test Bench template for design  :  g69_FSM
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g69_FSM_vhd_tst IS
END g69_FSM_vhd_tst;
ARCHITECTURE g69_FSM_arch OF g69_FSM_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL count : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL direction : STD_LOGIC;
SIGNAL enable : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
COMPONENT g69_FSM
	PORT (
	clk : IN STD_LOGIC;
	count : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	direction : IN STD_LOGIC;
	enable : IN STD_LOGIC;
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : g69_FSM
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	count => count,
	direction => direction,
	enable => enable,
	reset => reset
	);
clock_process: PROCESS 
begin

	clk <='0';
	wait for 10 ns;
	clk<='1';
	wait for 10 ns;
end process clock_process;

stim_process: PROCESS
begin
	enable <= '1';
	direction<='1';
	reset<='0';
	wait for 20 ns;
	reset<='1';
	wait;
end process stim_process;                                      
END g69_FSM_arch;
