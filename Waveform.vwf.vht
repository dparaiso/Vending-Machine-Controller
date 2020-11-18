-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "07/28/2020 18:36:09"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          convert2bcd
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY convert2bcd_vhd_vec_tst IS
END convert2bcd_vhd_vec_tst;
ARCHITECTURE convert2bcd_arch OF convert2bcd_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL bcd : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL binary : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT convert2bcd
	PORT (
	bcd : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
	binary : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : convert2bcd
	PORT MAP (
-- list connections between master ports and signals
	bcd => bcd,
	binary => binary
	);
-- binary[7]
t_prcs_binary_7: PROCESS
BEGIN
	binary(7) <= '0';
WAIT;
END PROCESS t_prcs_binary_7;
-- binary[6]
t_prcs_binary_6: PROCESS
BEGIN
	binary(6) <= '0';
WAIT;
END PROCESS t_prcs_binary_6;
-- binary[5]
t_prcs_binary_5: PROCESS
BEGIN
	binary(5) <= '0';
WAIT;
END PROCESS t_prcs_binary_5;
-- binary[4]
t_prcs_binary_4: PROCESS
BEGIN
	binary(4) <= '0';
WAIT;
END PROCESS t_prcs_binary_4;
-- binary[3]
t_prcs_binary_3: PROCESS
BEGIN
	binary(3) <= '0';
WAIT;
END PROCESS t_prcs_binary_3;
-- binary[2]
t_prcs_binary_2: PROCESS
BEGIN
	binary(2) <= '0';
WAIT;
END PROCESS t_prcs_binary_2;
-- binary[1]
t_prcs_binary_1: PROCESS
BEGIN
	binary(1) <= '0';
WAIT;
END PROCESS t_prcs_binary_1;
-- binary[0]
t_prcs_binary_0: PROCESS
BEGIN
	binary(0) <= '0';
WAIT;
END PROCESS t_prcs_binary_0;
END convert2bcd_arch;
