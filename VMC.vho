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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "07/28/2020 18:36:11"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	convert2bcd IS
    PORT (
	binary : IN std_logic_vector(7 DOWNTO 0);
	bcd : OUT std_logic_vector(11 DOWNTO 0)
	);
END convert2bcd;

-- Design Ports Information
-- bcd[0]	=>  Location: PIN_AD25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd[1]	=>  Location: PIN_AH8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd[2]	=>  Location: PIN_AF8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd[3]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd[4]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd[5]	=>  Location: PIN_AH7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd[6]	=>  Location: PIN_AE8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd[7]	=>  Location: PIN_AG8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd[8]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd[9]	=>  Location: PIN_AE14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd[10]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd[11]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- binary[0]	=>  Location: PIN_AE24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- binary[2]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- binary[6]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- binary[7]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- binary[5]	=>  Location: PIN_AG7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- binary[4]	=>  Location: PIN_AC8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- binary[3]	=>  Location: PIN_AF7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- binary[1]	=>  Location: PIN_AE7,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF convert2bcd IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_binary : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_bcd : std_logic_vector(11 DOWNTO 0);
SIGNAL \bcd[0]~output_o\ : std_logic;
SIGNAL \bcd[1]~output_o\ : std_logic;
SIGNAL \bcd[2]~output_o\ : std_logic;
SIGNAL \bcd[3]~output_o\ : std_logic;
SIGNAL \bcd[4]~output_o\ : std_logic;
SIGNAL \bcd[5]~output_o\ : std_logic;
SIGNAL \bcd[6]~output_o\ : std_logic;
SIGNAL \bcd[7]~output_o\ : std_logic;
SIGNAL \bcd[8]~output_o\ : std_logic;
SIGNAL \bcd[9]~output_o\ : std_logic;
SIGNAL \bcd[10]~output_o\ : std_logic;
SIGNAL \bcd[11]~output_o\ : std_logic;
SIGNAL \binary[0]~input_o\ : std_logic;
SIGNAL \binary[1]~input_o\ : std_logic;
SIGNAL \binary[4]~input_o\ : std_logic;
SIGNAL \binary[7]~input_o\ : std_logic;
SIGNAL \binary[5]~input_o\ : std_logic;
SIGNAL \binary[6]~input_o\ : std_logic;
SIGNAL \secondadd|S[2]~1_combout\ : std_logic;
SIGNAL \secondadd|S[3]~0_combout\ : std_logic;
SIGNAL \binary[2]~input_o\ : std_logic;
SIGNAL \binary[3]~input_o\ : std_logic;
SIGNAL \fifthadd|S[2]~0_combout\ : std_logic;
SIGNAL \thirdadd|S[2]~0_combout\ : std_logic;
SIGNAL \fifthadd|S[2]~1_combout\ : std_logic;
SIGNAL \thirdadd|S[0]~1_combout\ : std_logic;
SIGNAL \seventhadd|S[0]~0_combout\ : std_logic;
SIGNAL \fifthadd|S[0]~2_combout\ : std_logic;
SIGNAL \seventhadd|S[2]~1_combout\ : std_logic;
SIGNAL \seventhadd|S[2]~2_combout\ : std_logic;
SIGNAL \seventhadd|S[3]~3_combout\ : std_logic;
SIGNAL \sixthadd|S~0_combout\ : std_logic;
SIGNAL \sixthadd|S~1_combout\ : std_logic;
SIGNAL \sixthadd|S[3]~2_combout\ : std_logic;
SIGNAL \fifthadd|S\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \secondadd|S\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \thirdadd|S\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \seventhadd|S\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sixthadd|ALT_INV_S~0_combout\ : std_logic;
SIGNAL \thirdadd|ALT_INV_S\ : std_logic_vector(1 DOWNTO 1);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_binary <= binary;
bcd <= ww_bcd;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\sixthadd|ALT_INV_S~0_combout\ <= NOT \sixthadd|S~0_combout\;
\thirdadd|ALT_INV_S\(1) <= NOT \thirdadd|S\(1);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X100_Y0_N23
\bcd[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \binary[0]~input_o\,
	devoe => ww_devoe,
	o => \bcd[0]~output_o\);

-- Location: IOOBUF_X20_Y0_N23
\bcd[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seventhadd|S[0]~0_combout\,
	devoe => ww_devoe,
	o => \bcd[1]~output_o\);

-- Location: IOOBUF_X23_Y0_N16
\bcd[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seventhadd|S\(1),
	devoe => ww_devoe,
	o => \bcd[2]~output_o\);

-- Location: IOOBUF_X16_Y0_N2
\bcd[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seventhadd|S[2]~2_combout\,
	devoe => ww_devoe,
	o => \bcd[3]~output_o\);

-- Location: IOOBUF_X13_Y0_N23
\bcd[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seventhadd|S[3]~3_combout\,
	devoe => ww_devoe,
	o => \bcd[4]~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\bcd[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sixthadd|ALT_INV_S~0_combout\,
	devoe => ww_devoe,
	o => \bcd[5]~output_o\);

-- Location: IOOBUF_X23_Y0_N23
\bcd[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \thirdadd|ALT_INV_S\(1),
	devoe => ww_devoe,
	o => \bcd[6]~output_o\);

-- Location: IOOBUF_X18_Y0_N2
\bcd[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sixthadd|S~1_combout\,
	devoe => ww_devoe,
	o => \bcd[7]~output_o\);

-- Location: IOOBUF_X18_Y0_N9
\bcd[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sixthadd|S[3]~2_combout\,
	devoe => ww_devoe,
	o => \bcd[8]~output_o\);

-- Location: IOOBUF_X49_Y0_N23
\bcd[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \bcd[9]~output_o\);

-- Location: IOOBUF_X115_Y25_N23
\bcd[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \bcd[10]~output_o\);

-- Location: IOOBUF_X0_Y24_N9
\bcd[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \bcd[11]~output_o\);

-- Location: IOIBUF_X100_Y0_N15
\binary[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_binary(0),
	o => \binary[0]~input_o\);

-- Location: IOIBUF_X20_Y0_N15
\binary[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_binary(1),
	o => \binary[1]~input_o\);

-- Location: IOIBUF_X18_Y0_N22
\binary[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_binary(4),
	o => \binary[4]~input_o\);

-- Location: IOIBUF_X18_Y0_N15
\binary[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_binary(7),
	o => \binary[7]~input_o\);

-- Location: IOIBUF_X16_Y0_N22
\binary[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_binary(5),
	o => \binary[5]~input_o\);

-- Location: IOIBUF_X27_Y0_N8
\binary[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_binary(6),
	o => \binary[6]~input_o\);

-- Location: LCCOMB_X19_Y1_N12
\secondadd|S[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \secondadd|S[2]~1_combout\ = (\binary[7]~input_o\ & (\binary[4]~input_o\ $ (((!\binary[5]~input_o\ & !\binary[6]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \binary[4]~input_o\,
	datab => \binary[7]~input_o\,
	datac => \binary[5]~input_o\,
	datad => \binary[6]~input_o\,
	combout => \secondadd|S[2]~1_combout\);

-- Location: LCCOMB_X19_Y1_N18
\secondadd|S[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \secondadd|S[3]~0_combout\ = (\binary[7]~input_o\ & ((\binary[4]~input_o\) # ((\binary[5]~input_o\) # (\binary[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \binary[4]~input_o\,
	datab => \binary[7]~input_o\,
	datac => \binary[5]~input_o\,
	datad => \binary[6]~input_o\,
	combout => \secondadd|S[3]~0_combout\);

-- Location: IOIBUF_X20_Y0_N1
\binary[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_binary(2),
	o => \binary[2]~input_o\);

-- Location: IOIBUF_X20_Y0_N8
\binary[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_binary(3),
	o => \binary[3]~input_o\);

-- Location: LCCOMB_X20_Y1_N10
\fifthadd|S[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fifthadd|S[2]~0_combout\ = (!\binary[2]~input_o\ & ((\binary[3]~input_o\) # ((\secondadd|S[2]~1_combout\ & !\secondadd|S[3]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \secondadd|S[2]~1_combout\,
	datab => \secondadd|S[3]~0_combout\,
	datac => \binary[2]~input_o\,
	datad => \binary[3]~input_o\,
	combout => \fifthadd|S[2]~0_combout\);

-- Location: LCCOMB_X19_Y1_N8
\secondadd|S[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \secondadd|S\(1) = (\binary[6]~input_o\) # ((!\binary[4]~input_o\ & (\binary[7]~input_o\ & \binary[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \binary[4]~input_o\,
	datab => \binary[7]~input_o\,
	datac => \binary[5]~input_o\,
	datad => \binary[6]~input_o\,
	combout => \secondadd|S\(1));

-- Location: LCCOMB_X20_Y1_N20
\thirdadd|S[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \thirdadd|S[2]~0_combout\ = (\binary[3]~input_o\ & (((\secondadd|S[3]~0_combout\)))) # (!\binary[3]~input_o\ & (!\secondadd|S\(1) & ((\secondadd|S[2]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \secondadd|S\(1),
	datab => \secondadd|S[3]~0_combout\,
	datac => \secondadd|S[2]~1_combout\,
	datad => \binary[3]~input_o\,
	combout => \thirdadd|S[2]~0_combout\);

-- Location: LCCOMB_X20_Y1_N0
\thirdadd|S[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \thirdadd|S\(1) = (\secondadd|S\(1)) # ((\secondadd|S[3]~0_combout\ & !\binary[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \secondadd|S\(1),
	datab => \secondadd|S[3]~0_combout\,
	datad => \binary[3]~input_o\,
	combout => \thirdadd|S\(1));

-- Location: LCCOMB_X20_Y1_N22
\fifthadd|S[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \fifthadd|S[2]~1_combout\ = (\fifthadd|S[2]~0_combout\ & ((\thirdadd|S\(1)) # ((\thirdadd|S[2]~0_combout\ & \binary[2]~input_o\)))) # (!\fifthadd|S[2]~0_combout\ & (\thirdadd|S[2]~0_combout\ & (\binary[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifthadd|S[2]~0_combout\,
	datab => \thirdadd|S[2]~0_combout\,
	datac => \binary[2]~input_o\,
	datad => \thirdadd|S\(1),
	combout => \fifthadd|S[2]~1_combout\);

-- Location: LCCOMB_X19_Y1_N14
\thirdadd|S[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \thirdadd|S[0]~1_combout\ = (\binary[4]~input_o\) # (((\binary[5]~input_o\) # (\binary[6]~input_o\)) # (!\binary[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \binary[4]~input_o\,
	datab => \binary[7]~input_o\,
	datac => \binary[5]~input_o\,
	datad => \binary[6]~input_o\,
	combout => \thirdadd|S[0]~1_combout\);

-- Location: LCCOMB_X20_Y1_N24
\fifthadd|S[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \fifthadd|S\(1) = (\thirdadd|S[0]~1_combout\ & (((!\binary[2]~input_o\ & \thirdadd|S[2]~0_combout\)) # (!\binary[3]~input_o\))) # (!\thirdadd|S[0]~1_combout\ & (((!\binary[2]~input_o\ & \thirdadd|S[2]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \thirdadd|S[0]~1_combout\,
	datab => \binary[3]~input_o\,
	datac => \binary[2]~input_o\,
	datad => \thirdadd|S[2]~0_combout\,
	combout => \fifthadd|S\(1));

-- Location: LCCOMB_X20_Y1_N18
\seventhadd|S[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \seventhadd|S[0]~0_combout\ = (!\binary[1]~input_o\ & ((\fifthadd|S[2]~1_combout\) # (!\fifthadd|S\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \binary[1]~input_o\,
	datac => \fifthadd|S[2]~1_combout\,
	datad => \fifthadd|S\(1),
	combout => \seventhadd|S[0]~0_combout\);

-- Location: LCCOMB_X20_Y1_N28
\fifthadd|S[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \fifthadd|S[0]~2_combout\ = (!\binary[2]~input_o\ & ((\thirdadd|S[2]~0_combout\) # (!\thirdadd|S\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \thirdadd|S[2]~0_combout\,
	datac => \binary[2]~input_o\,
	datad => \thirdadd|S\(1),
	combout => \fifthadd|S[0]~2_combout\);

-- Location: LCCOMB_X20_Y1_N6
\seventhadd|S[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \seventhadd|S\(1) = (\fifthadd|S[0]~2_combout\) # ((!\binary[1]~input_o\ & \fifthadd|S[2]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \binary[1]~input_o\,
	datac => \fifthadd|S[2]~1_combout\,
	datad => \fifthadd|S[0]~2_combout\,
	combout => \seventhadd|S\(1));

-- Location: LCCOMB_X20_Y1_N8
\seventhadd|S[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \seventhadd|S[2]~1_combout\ = (!\binary[1]~input_o\ & ((\binary[2]~input_o\) # ((!\thirdadd|S[2]~0_combout\ & \thirdadd|S\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \binary[1]~input_o\,
	datab => \thirdadd|S[2]~0_combout\,
	datac => \binary[2]~input_o\,
	datad => \thirdadd|S\(1),
	combout => \seventhadd|S[2]~1_combout\);

-- Location: LCCOMB_X20_Y1_N2
\seventhadd|S[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \seventhadd|S[2]~2_combout\ = (\binary[1]~input_o\ & ((\fifthadd|S[2]~1_combout\) # ((\seventhadd|S[2]~1_combout\ & \fifthadd|S\(1))))) # (!\binary[1]~input_o\ & (\seventhadd|S[2]~1_combout\ & ((\fifthadd|S\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \binary[1]~input_o\,
	datab => \seventhadd|S[2]~1_combout\,
	datac => \fifthadd|S[2]~1_combout\,
	datad => \fifthadd|S\(1),
	combout => \seventhadd|S[2]~2_combout\);

-- Location: LCCOMB_X20_Y1_N4
\seventhadd|S[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \seventhadd|S[3]~3_combout\ = (\fifthadd|S[2]~1_combout\) # ((!\seventhadd|S[2]~1_combout\ & \fifthadd|S\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \seventhadd|S[2]~1_combout\,
	datac => \fifthadd|S[2]~1_combout\,
	datad => \fifthadd|S\(1),
	combout => \seventhadd|S[3]~3_combout\);

-- Location: LCCOMB_X20_Y1_N30
\sixthadd|S~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sixthadd|S~0_combout\ = (\thirdadd|S[2]~0_combout\) # ((\secondadd|S\(1)) # ((!\fifthadd|S[2]~0_combout\ & \thirdadd|S\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifthadd|S[2]~0_combout\,
	datab => \thirdadd|S\(1),
	datac => \thirdadd|S[2]~0_combout\,
	datad => \secondadd|S\(1),
	combout => \sixthadd|S~0_combout\);

-- Location: LCCOMB_X20_Y1_N16
\sixthadd|S~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sixthadd|S~1_combout\ = (!\thirdadd|S[2]~0_combout\ & (\secondadd|S\(1) & ((\fifthadd|S[2]~0_combout\) # (!\thirdadd|S\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifthadd|S[2]~0_combout\,
	datab => \thirdadd|S\(1),
	datac => \thirdadd|S[2]~0_combout\,
	datad => \secondadd|S\(1),
	combout => \sixthadd|S~1_combout\);

-- Location: LCCOMB_X20_Y1_N26
\sixthadd|S[3]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \sixthadd|S[3]~2_combout\ = (\secondadd|S\(1) & ((\thirdadd|S[2]~0_combout\) # ((!\fifthadd|S[2]~0_combout\ & \thirdadd|S\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifthadd|S[2]~0_combout\,
	datab => \thirdadd|S\(1),
	datac => \thirdadd|S[2]~0_combout\,
	datad => \secondadd|S\(1),
	combout => \sixthadd|S[3]~2_combout\);

ww_bcd(0) <= \bcd[0]~output_o\;

ww_bcd(1) <= \bcd[1]~output_o\;

ww_bcd(2) <= \bcd[2]~output_o\;

ww_bcd(3) <= \bcd[3]~output_o\;

ww_bcd(4) <= \bcd[4]~output_o\;

ww_bcd(5) <= \bcd[5]~output_o\;

ww_bcd(6) <= \bcd[6]~output_o\;

ww_bcd(7) <= \bcd[7]~output_o\;

ww_bcd(8) <= \bcd[8]~output_o\;

ww_bcd(9) <= \bcd[9]~output_o\;

ww_bcd(10) <= \bcd[10]~output_o\;

ww_bcd(11) <= \bcd[11]~output_o\;
END structure;


