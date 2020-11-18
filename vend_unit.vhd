LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;


ENTITY vend_unit IS
		PORT (clock, reset, enable, N, D ,Q: IN STD_LOGIC;
			price_in: IN STD_LOGIC_VECTOR(5 DOWNTO 0); 
			change: OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
			insert_out: OUT STD_LOGIC_VECTOR(5 DOWNTO 0); 
			done: OUT STD_LOGIC); 
END vend_unit; 

ARCHITECTURE behaviour of vend_unit is 

COMPONENT accumulator IS 
	PORT(clock, reset, en, N, D, Q: IN STD_LOGIC; 
			accum_out: OUT STD_LOGIC_VECTOR(5 DOWNTO 0)); 
END COMPONENT; 

--signals 
TYPE STATE_TYPE IS (idle, calculating, convert);
SIGNAL currentState, nextState: STATE_TYPE;
SIGNAL accumsig, changesig: STD_LOGIC_VECTOR (5 DOWNTO 0);

--port mapping parts

BEGIN 

accum: accumulator PORT MAP( clock => clock, reset => reset, N => N, D=> D, Q => Q, en => enable, accum_out => accumsig); 

PROCESS(price_in, accumsig, currentState, reset) 
BEGIN 


	CASE currentState IS 
		WHEN idle => 
			done <= '0'; 
			change <= "000000";	
			insert_out <= "000000";
			
			IF (enable = '1') THEN
				changesig <= "000000"; 
				nextState <= calculating;
				
			ELSE
				nextState <= idle;
				
			END IF; 
		WHEN calculating => 
			insert_out <= accumsig; 
			IF reset = '1' THEN 
				change <= accumsig; 
				nextState <= idle;
		
			ELSIF enable = '1' THEN 
				insert_out <= accumsig; 
				
				IF accumsig >= price_in THEN 
					changesig <= STD_LOGIC_VECTOR(UNSIGNED(accumsig) - UNSIGNED(price_in)); 
											
					IF (N = '0') AND (D = '0') AND (Q = '0') THEN  
						nextState <= convert; 
					ELSE 
					nextState <= calculating; 
					END IF; 	
					
				ELSIF accumsig > "110011" THEN 
					change <= accumsig; 
					
				ELSE 
					changesig <= "000000"; 
				END IF; 
					
				
			END IF; 
			
		WHEN convert =>
			change <= changesig; 
			nextState <= idle; 
			done <= '1';
			
	END CASE; 

END PROCESS; 

PROCESS(clock)
BEGIN 

	IF rising_edge(clock) THEN 
		currentState <= nextState; 
	ELSE 
		currentState <= currentState; 

	END IF; 

END PROCESS; 

END behaviour; 