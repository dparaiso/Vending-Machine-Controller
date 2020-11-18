LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY program_mode IS
	PORT( clock, reset, hard_reset, set, start, N, D, Q: IN STD_LOGIC; --NDQ
			prod, funct : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			finished : OUT STD_LOGIC;
			runTotal, total : OUT  STD_LOGIC_VECTOR(5 DOWNTO 0)
			);
END program_mode;

ARCHITECTURE behaviour OF program_mode IS

	COMPONENT program_unit IS
	PORT (clock, reset, hard_reset, set, enable, N, D, Q: IN STD_LOGIC; 
			product: IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
			data_mem: OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
			addr_out: OUT STD_LOGIC_VECTOR(1 DOWNTO 0); 
			done, wen: OUT STD_LOGIC); 
	END COMPONENT;

	COMPONENT SRAM IS
		PORT
		(
			address		: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
			rden		: IN STD_LOGIC  := '1';
			wren		: IN STD_LOGIC ;
			q		: OUT STD_LOGIC_VECTOR (5 DOWNTO 0)
		);
	END COMPONENT;

TYPE STATE_TYPE IS (idle, program);
SIGNAL nextState, currentState: STATE_TYPE;
SIGNAL count: unsigned(5 DOWNTO 0):="000000"; 
SIGNAL aout: std_logic_vector(5 downto 0):="000000"; 
SIGNAL coins: unsigned(2 DOWNTO 0):="000"; 
SIGNAL writesig, rensig, wrensig, ensig: STD_LOGIC; 
SIGNAL priceSig, dataSig: STD_LOGIC_VECTOR(5 DOWNTO 0); 
SIGNAL addrSig, addr: STD_LOGIC_VECTOR(1 DOWNTO 0); 
SIGNAL stateFinished: STD_LOGIC;


BEGIN

MEMORY: SRAM 
	PORT MAP (clock => clock, address => addrSig, data => dataSig, wren => wrensig, rden => rensig, q => priceSig );

STATE_PROGRAM: program_unit
	PORT MAP(clock => clock, reset => reset, hard_reset => hard_reset, set => set, enable => ensig, N => N, D => D, Q => Q, 
				product => prod, data_mem => dataSig, addr_out => addr , done => stateFinished, wen => writeSig); 

	finished <= stateFinished; 
	
	PROCESS(currentState, funct, stateFinished, addrsig, priceSig, dataSig)
	BEGIN
		
	--Idle state: Depends on funct to switch to a different state
		CASE currentState IS
			WHEN idle =>
				renSig <= '1';
				ensig <= '0'; 
				wrensig <= '0'; 
				IF (funct = "00") THEN
					nextState <= program;
				-- SRAM reads in Idle mode				
				END IF;
	
	--Program state
			WHEN program =>
				ensig <= '1'; 
				wrensig <= writeSig; 
				addrSig <= prod;
				addr <= addrsig; 
				runTotal <= dataSig;
				total <= priceSig;
				renSig <= '0'; 
				
				IF (stateFinished = '1') THEN
					nextState <= idle;
									-- SRAM writing in program mode
					
				ELSIF (funct = "00") THEN
					nextState <= program;
					
				END IF;
		END CASE;
	END PROCESS;
	
	PROCESS(clock, start, reset)
	BEGIN
		IF (start = '1') THEN
			IF (reset = '1') THEN
				currentState <= idle;
				
			ELSIF (rising_edge(clock)) THEN
				currentState <= nextState;
				
			END IF;
		END IF;
	END PROCESS;
		
END behaviour;