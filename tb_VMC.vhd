LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY tb_VMC is
END tb_VMC;

ARCHITECTURE test OF tb_VMC IS

	COMPONENT VMC IS
		PORT	
			(
				clock, reset, hard_reset, set, start, N, D, Q: IN STD_LOGIC; --NDQ
				prod, funct : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
				finished : OUT STD_LOGIC;
				runTotal0, runTotal1, runTotal2: OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
				Total0, Total1, Total2: OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
				change0, change1, change2: OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
			);
	END COMPONENT;

	SIGNAL clock, reset, hard_reset, set, start, N, D, Q, finished: STD_LOGIC; 
	SIGNAL prodsig, functsig: STD_LOGIC_VECTOR(1 DOWNTO 0); 
	SIGNAL run0Sig, run1Sig, run2Sig, total0Sig, total1Sig, total2Sig: STD_LOGIC_VECTOR(3 DOWNTO 0); 
	SIGNAL change0Sig, change1Sig, change2Sig: STD_LOGIC_VECTOR(3 DOWNTO 0); 

BEGIN

DUT : VMC
	PORT MAP(clock => clock, reset => reset, hard_reset => hard_reset, set => set, start => start, N => N, D => D, Q => Q, 
				finished => finished, prod => prodsig, funct => functsig, runTotal0 => run0Sig, runTotal1 => run1Sig, runTotal2 => run2Sig, 
				Total0 => total0Sig, Total1 => total1Sig, Total2 => total2Sig, change0 => change0Sig,change1 => change1Sig, change2 => change2Sig);

	PROCESS IS
	BEGIN
		
		start <= '1';
		
--		THIS NEEDS TO CHANGE
		hard_reset <= '0';
--		^^^^^
		
		FOR z IN 0 TO 75 LOOP			
			
			IF z < 3 THEN
				reset <= '1';
				set <= '0';
				functsig <= "ZZ";
				prodsig <= "ZZ"; 
				N <= '0'; D <= '0' ; Q <= '0';
			
											-- setting up 
			ELSIF (z >= 3 AND z <= 4) THEN
				reset <= '0';
				functsig <= "00";
				prodsig <= "11";
											
			ELSIF z = 5 THEN
				functsig <= "ZZ";
				prodsig <= "ZZ";
				N <= '1'; D <= '0' ; Q <= '1'; 
				
			ELSIF z = 6 THEN 
				N <= '0'; D <= '1' ; Q <= '0';
				
			ELSIF z = 7 THEN 
				N <= '1'; D <= '0' ; Q <= '1'; 
								
			ELSIF z = 8 THEN 
				N <= '0'; D <= '1' ; Q <= '0';	
			
			ELSIF z = 9 THEN 
				N <= '1'; D <= '0' ; Q <= '1';
				
			ELSIF z = 10 THEN 
				N <= '0'; D <= '1' ; Q <= '0';	-- should output $0.90 in total.
	
			ELSIF (z > 10 AND z <= 12) THEN
				set <= '1'; 
				N <= '0'; D <= '0' ; Q <= '0'; 
			
			ELSIF (z > 12 AND z <= 15) THEN
				set <= '0'; 
			
			-- programmed product 1 to be ) $0.90 ^^
			
			ELSIF (z >= 20 AND z <= 21) THEN
				functsig <= "00";
				prodsig <= "01"; 
				N <= '0'; D <= '0' ; Q <= '0'; 
								
			ELSIF z = 22 THEN
				functsig <= "ZZ";
				prodsig <= "ZZ";
				
			ELSIF z = 23 THEN 
				N <= '1'; D <= '0' ; Q <= '0';
								
			ELSIF z = 24 THEN 
				N <= '0'; D <= '1' ; Q <= '1';
				
--			ELSIF z = 18 THEN 
--				N <= '1'; D <= '0' ; Q <= '0'; 
--								
--			ELSIF z = 19 THEN 
--				N <= '0'; D <= '1' ; Q <= '1';
				
			ELSIF z = 25 THEN 
				N <= '1'; D <= '0' ; Q <= '0';
								
			ELSIF z = 26 THEN 
				N <= '0'; D <= '1' ; Q <= '1';	-- should output $1.40 in total.
				
			ELSIF (z > 26	 AND z <= 28) THEN
				set <= '1';
				N <= '0'; D <= '0' ; Q <= '0'; 
			
			ELSIF (z > 28 AND z <= 29) THEN
				set <= '0';
			
		-- programmed 	product 2 to be $1.40 ^^
			
			-- TESTING DISPLAY:-
			
			ELSIF z = 35 THEN -- reset
				reset <= '1';
				functsig <= "01";
				prodsig <= "11";
				
			ELSIF z = 36 THEN -- reset
				reset <= '0';
				functsig <= "01";
				prodsig <= "11";
				
			ELSIF (z >= 37 AND z <= 40) THEN -- reset
				reset <= '0';
				functsig <= "ZZ";
				prodsig <= "ZZ"; 
				
			ELSIF z = 41 THEN
				reset <= '1';
				functsig <= "ZZ";
				prodsig <= "ZZ";
			
			ELSIF z = 42 THEN -- read Product 1.
				reset <= '0';
				functsig <= "01";
				prodsig <= "01"; 
				
			ELSIF (z > 42 AND z <= 44) THEN -- reset
				reset <= '0';
				functsig <= "ZZ";
				prodsig <= "ZZ"; 
				
			ELSIF z = 45 THEN
				reset <= '1';
				functsig <= "ZZ";
				prodsig <= "ZZ";


			ELSIF z = 55 THEN
				hard_reset <= '1';
					
			
			ELSIF (z > 55 AND z <= 70) THEN 		
				hard_reset <= '0';
			
			END IF;
			
			clock <= '1'; 
			WAIT FOR 5 ns;
					
			clock <= '0';
			WAIT FOR 5 ns;
		
		END LOOP;
		
	END PROCESS;			
END TEST;









