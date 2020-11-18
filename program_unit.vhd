LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY program_unit IS
	PORT (clock, reset, hard_reset, set, enable, N, D, Q: IN STD_LOGIC; 
			product: IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
			data_mem: OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
			addr_out: OUT STD_LOGIC_VECTOR(1 DOWNTO 0); 
			done, wen: OUT STD_LOGIC); 
END program_unit; 

ARCHITECTURE behaviour OF  program_unit IS

COMPONENT accumulator 
	PORT (clock, reset, en, N, D, Q: IN STD_LOGIC; 
			accum_out: OUT STD_LOGIC_VECTOR(5 DOWNTO 0)); 
END COMPONENT;

TYPE STATE_TYPE IS (idle, adding, mem_writing, hardReset);
SIGNAL currentState, nextState: STATE_TYPE;
SIGNAL accumSig: STD_LOGIC_VECTOR(5 DOWNTO 0); 
SIGNAL enableAccum: STD_LOGIC;

BEGIN

accumulate: accumulator 
	PORT MAP(clock => clock, reset => reset, en => enableAccum, N => N, D => D, Q => Q, accum_out => accumSig); 

	data_mem <= accumSig WHEN NOT(currentState = hardReset) ELSE "000000";
	enableAccum <= '1' WHEN currentState = adding ELSE '0';
	
	PROCESS(currentState, enable, set, N, D, Q, product)
	BEGIN
		
		CASE currentState IS
			WHEN idle =>
				done <= '0'; 
				wen <= '0';
				IF (enable = '1') THEN
					nextState <= adding;
					addr_out <= product;
				
				ELSE
					nextState <= idle;
				
				END IF;
			
			WHEN adding => 
--				IF (enable = '1') THEN  -- must be one to remain on. Accumulator requires enable to be 1
				done <= '0'; 
				wen <= '0';
				
				IF ((Q = '0') AND (D = '0') AND (N = '0')) or (accumsig > "110011") THEN
					IF (set = '1') THEN 
						nextState <= mem_writing ;
						wen <= '1'; 
												
					ELSE 
							nextState <= adding;
							done <= '0'; 
							wen <= '0';
					END IF;
				END IF; 
	
				
			WHEN mem_writing => 
				done <= '1' ; 
				NextState <= idle;
															-- make sure the memory cells are already a thing before moving to idle state.
			WHEN hardReset =>
				nextState <= mem_writing;
				done <= '0'; 
				wen <= '1';
				
			END CASE;
	END PROCESS;
	
	PROCESS(clock, hard_reset)
	BEGIN
	
		IF (hard_reset = '1') THEN
			currentState <= hardReset;
--			EVERYTHING GOES TO 0. must reconfigure products in programming mode
	
		ELSIF (rising_edge(clock)) THEN	
			currentState <= nextState;
				
		END IF;
	END PROCESS;
	

END behaviour; 





