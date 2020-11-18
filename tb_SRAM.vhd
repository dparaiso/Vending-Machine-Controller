LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY tb_SRAM is
END tb_SRAM;

ARCHITECTURE test OF tb_SRAM IS

	COMPONENT SRAM IS
	PORT
	(
		address	: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		rden		: IN STD_LOGIC  := '1';
		wren		: IN STD_LOGIC ;
		q			: OUT STD_LOGIC_VECTOR (5 DOWNTO 0)
	);
END COMPONENT;

	SIGNAL clock, rdenSig, wrenSig: STD_LOGIC; 
	SIGNAL addressSig: STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL dataSig, qSig: STD_LOGIC_VECTOR(5 DOWNTO 0):="ZZZZZZ"; 

BEGIN

DUT : SRAM
	PORT MAP(clock => clock, rden => rdenSig, wren => wrenSig, address => addressSig, data => dataSig, q => qSig);

	
--	00 - $0.50 is 001010
--	01 - $1.25 is 011001
--	10 - $2.10 is 101010
--	11 - $2.55 is 110011

	PROCESS IS
	BEGIN

		FOR z IN 0 TO 16 LOOP
			--this if statement from 0 up to 8 writes and stores values in SRAM 
			IF z < 8 THEN
				wrenSig <= 'Z';
				rdenSig <= 'Z';
				dataSig <= "ZZZZZZ";
				addressSig <= "ZZ";
				
				IF z > 0 and z < 2 THEN  
					wrensig <= '1'; 
					datasig  <= "001010";
					addressSig <= "00"; 
					
				ELSIF z > 2 and z < 4 THEN 
					wrensig <= '1'; 
					datasig  <= "011001";
					addressSig <= "01"; 
					
				ELSIF z > 4 and z < 6 THEN 
					wrensig <= '1';  
					datasig  <= "101010";
					addressSig <= "10"; 
					
				ELSIF z > 6 and z < 8 THEN 
					wrensig <= '1'; 
					datasig  <= "110011";
					addressSig <= "11";
					
				END IF; 
				
			--"ELSE" reads the values stored in the previous clock cycles 	
			ELSE  
				wrenSig <= 'Z';
				rdenSig <= '0';
				dataSig <= "ZZZZZZ";
				addressSig <= "ZZ";
				
				IF z > 8  and z < 10 THEN  
					rdensig <= '1'; 
					addressSig <= "00"; 
					
				ELSIF z > 10  and z < 12 THEN  
					rdensig <= '1'; 
					addressSig <= "01"; 
					
				ELSIF z > 12  and z < 14 THEN  
					rdensig <= '1'; 
					addressSig <= "10"; 
				
				ELSIF z > 14  and z < 16 THEN  
					rdensig <= '1'; 
					addressSig <= "11"; 
					
				END IF; 
			

			END IF;
			
			clock <= '1';
			WAIT FOR 5 ns;
			
			clock <= '0';
			WAIT FOR 5 ns;
		
		END LOOP;
	
	END PROCESS;
END test;