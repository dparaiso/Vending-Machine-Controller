LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY VMC IS
	PORT
		( 
			clock, reset, hard_reset, set, start, N, D, Q: IN STD_LOGIC; --NDQ
			prod, funct : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			finished : OUT STD_LOGIC;
			runTotal0, runTotal1, runTotal2: OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
			Total0, Total1, Total2: OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
			change0, change1, change2: OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
END VMC;

ARCHITECTURE behaviour OF VMC IS

	COMPONENT program_unit IS
		PORT 
			(
				clock, reset, hard_reset, set, enable, N, D, Q: IN STD_LOGIC; 
				product: IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
				data_mem: OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
				addr_out: OUT STD_LOGIC_VECTOR(1 DOWNTO 0); 
				done, wen: OUT STD_LOGIC
			); 
	END COMPONENT;

	COMPONENT SRAM IS
		PORT
			(
				address	: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
				clock		: IN STD_LOGIC  := '1';
				data		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
				rden		: IN STD_LOGIC  := '1';
				wren		: IN STD_LOGIC;
				q			: OUT STD_LOGIC_VECTOR (5 DOWNTO 0)
			);
	END COMPONENT;

	COMPONENT vend_unit IS
		PORT 
			(
				clock, reset, enable, N, D ,Q: IN STD_LOGIC;
				price_in: IN STD_LOGIC_VECTOR(5 DOWNTO 0); 
				change: OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
				insert_out: OUT STD_LOGIC_VECTOR(5 DOWNTO 0); 
				done: OUT STD_LOGIC
			); 
	END COMPONENT;
	
	COMPONENT convert2bcd IS
		PORT
			(
				binary : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
				bcd: OUt STD_LOGIC_VECTOR(11 DOWNTO 0)
			);  
	END COMPONENT;

TYPE STATE_TYPE IS (idle, program, display, vending, free, hardReset);
	SIGNAL nextState, currentState: STATE_TYPE;
	SIGNAL writesig, rensig, wrensig, enVend, enProg, hard_resetSig: STD_LOGIC; 
	SIGNAL addrSig, addr, prodSig, prodSig2: STD_LOGIC_VECTOR(1 DOWNTO 0):= "00";
	SIGNAL SRAMout, priceSig, dataIn, dataSig, accum_Sig, changeSig: STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL q_in, binary_in, convert_change, convert_insert : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL runTotalSig, TotalSig, convert_change_out, convert_insert_out: STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL newProd: UNSIGNED (1 DOWNTO 0):="00";
	SIGNAL vendExit, programExit : STD_LOGIC;

BEGIN

MEMORY: SRAM 
	PORT MAP ( clock => clock, address => addr, data => dataIn, wren => wrensig, rden => rensig, q => SRAMout );
	
STATE_PROGRAM: program_unit
	PORT MAP(clock => clock, reset => reset, hard_reset => hard_resetSig, set => set, enable => enProg, N => N, D => D, Q => Q, 
				product => prodSig, data_mem => dataSig, addr_out => addrSig, done => programExit, wen => writeSig); 

vending3: vend_unit
	PORT MAP(clock => clock, reset => reset, enable => enVend, N => N, D => D, Q => Q,
				price_in => priceSig , change => changeSig, insert_out => accum_sig, done => vendExit);
				
convert : convert2bcd
	PORT MAP(binary => binary_in, bcd => runTotalSig);
	
convert1 : convert2bcd
	PORT MAP(binary => q_in, bcd => TotalSig);	

convertchange: convert2bcd 
	PORT MAP(binary => convert_change, bcd => convert_change_out);

convertinsert: convert2bcd 
	PORT MAP(binary => convert_insert, bcd => convert_insert_out);
	
	runTotal0 <= runTotalSig(11 DOWNTO 8) WHEN (currentState = program) OR (currentState = vending) ELSE (OTHERS => 'Z') WHEN (currentState = free) ELSE (OTHERS => '0');
	runTotal1 <= runTotalSig(7 DOWNTO 4) WHEN (currentState = program) OR (currentState = vending) ELSE (OTHERS => 'Z') WHEN (currentState = free) ELSE (OTHERS => '0');
	runTotal2 <= runTotalSig(3 DOWNTO 0) WHEN (currentState = program) OR (currentState = vending) ELSE (OTHERS => 'Z') WHEN (currentState = free) ELSE  (OTHERS => '0');
		
	total0 <= (OTHERS => '0') WHEN (currentState = idle) OR (currentState = program) ELSE (OTHERS => 'Z') WHEN (currentState = free) ELSE totalSig(11 DOWNTO 8);
	total1 <= (OTHERS => '0') WHEN (currentState = idle) OR (currentState = program) ELSE (OTHERS => 'Z') WHEN (currentState = free) ELSE totalSig(7 DOWNTO 4);
	total2 <= (OTHERS => '0') WHEN (currentState = idle) OR (currentState = program) ELSE (OTHERS => 'Z') WHEN (currentState = free) ELSE totalSig(3 DOWNTO 0);
	
	change0 <= convert_change_out(11 DOWNTO 8) WHEN (currentState = vending) ELSE (OTHERS => 'Z') WHEN (currentState = free) ELSE  (OTHERS => '0');
	change1 <= convert_change_out(7 DOWNTO 4) WHEN (currentState = vending) ELSE (OTHERS => 'Z') WHEN (currentState = free) ELSE  (OTHERS => '0');
	change2 <= convert_change_out(3 DOWNTO 0) WHEN (currentState = vending) ELSE (OTHERS => 'Z') WHEN (currentState = free) ELSE  (OTHERS => '0');
	
	finished <= vendExit WHEN (currentState = vending) ELSE '0';
	
	PROCESS(currentState, prod, funct, vendExit, programExit, set, prodSig, addrSig, priceSig, dataSig, SRAMout, wrensig, writesig, dataIn, rensig) --addrsig,
	BEGIN
		
	--Idle state: Depends on funct to switch to a different state
		CASE currentState IS
			WHEN idle =>
				enProg <= '0';
				enVend <= '0';	
				wrensig <= '0';
				rensig <= '0';
				addr <= "UU";
--				change0 <= (OTHERS => '0');
--				runTotal0 <= (OTHERS => '0');
--				total0 <= (OTHERS => '0');	
			
--				change1 <= (OTHERS => '0');
--				runTotal1 <= (OTHERS => '0');
--				total1 <= (OTHERS => '0');	
				
--				change2 <= (OTHERS => '0');
--				runTotal2 <= (OTHERS => '0');
--				total2 <= (OTHERS => '0');	
				
				IF (funct = "00") THEN
					nextState <= program;
					 							
				ELSIF (funct = "01") THEN
					nextState <= display;
					
				ELSIF (funct = "10") THEN
					nextState <= vending;
					
				ELSIF (funct = "11") THEN
					nextState <= free;
					
				ELSIF (N = '1' OR Q = '1' OR D = '1') THEN
					nextState <= vending;
					
				END IF;
	
	--Program state
			WHEN program =>
				prodSig <= prod;
				enProg <= '1'; 
				wrensig <= writeSig; 
				renSig <= '0'; 
--				total0 <= (OTHERS => '0');	
--				total1 <= (OTHERS => '0');	
--				total2 <= (OTHERS => '0');	
				
				IF (set = '1') THEN
					addr <= addrSig;
					dataIn <= dataSig;
					binary_in <= STD_LOGIC_VECTOR(resize((UNSIGNED("00" & dataSig) * 5),8));
--					runTotal0 <= runTotalSig(11 DOWNTO 8);
--					runTotal1 <= runTotalSig(7 DOWNTO 4);
--					runTotal2 <= runTotalSig(3 DOWNTO 0);
				END IF;
				
				IF ( programExit = '1' ) THEN -- checks if SRAM has saved value successfully
					
					nextState <= idle ;
					 									
				END IF;
	
	--Display state	

	
			WHEN display =>
				renSig <= '1';
				addr <= prod;
				IF (addr = "01" OR addr = "01" or addr = "10" OR addr = "11") THEN 
					nextState <= display;
					q_in <= STD_LOGIC_VECTOR(resize((UNSIGNED("00" & SRAMout) * 5),8)) AFTER 30 ns;

				ELSIF (N = '1' OR D = '1' OR Q = '1') THEN
					nextState <= vending;
					
				ELSE 
					nextState <= display;

				END IF;
				
	--Vending  STATE
			WHEN vending => 
--			 						ONCE NDQ INCREASES IN display/idle MODE -> NEXT CLOCK CYCLE = VENDING. STAYS IN VENDING UNTIL "FINISHED". 
--									IF RESET, RETURNS CHANGE AND THEN idle.
				
				enVend <= '1';
				renSig <= '1';
				priceSig <= SRAMout;
				q_in <= STD_LOGIC_VECTOR(resize((UNSIGNED("00" & priceSig) * 5),8));
--				total0 <= totalSig(11 DOWNTO 8);
--				total1 <= totalSig(7 DOWNTO 4);
--				total2 <= totalSig(3 DOWNTO 0);
				

				
				IF (reset = '1') THEN
					IF (changeSig = "000000") THEN
						nextState <= idle;
					
					END IF;
					
				ELSIF (vendExit = '1') THEN
					nextState <= idle;	
					
					
				ELSE 
					nextState <= vending;
					convert_change <= STD_LOGIC_VECTOR(resize((UNSIGNED("00" & changeSig) * 5),8));
--					convert_insert <=  STD_LOGIC_VECTOR(resize((UNSIGNED("00" & accum_sig) * 5),8));
					binary_in <= STD_LOGIC_VECTOR(resize((UNSIGNED("00" & accum_Sig) * 5),8));
--					runTotal0 <= runtotalSig(11 DOWNTO 8);
--					runTotal1 <= runtotalSig(7 DOWNTO 4);
--					runTotal2 <= runtotalSig(3 DOWNTO 0);
					
				END IF;
				
	--Free state 
			WHEN free => 
--									HAVE TO MAKE SURE TO RETURN ALL CHANGE!

				IF (funct = "11") THEN
					nextState <= free;
					enVend <= '1';
--					change0 <= (OTHERS => 'Z');
--					runTotal0 <= (OTHERS => 'Z');
--					total0 <= (OTHERS => 'Z');	
				
--					change1 <= (OTHERS => 'Z');
--					runTotal1 <= (OTHERS => 'Z');
--					total1 <= (OTHERS => 'Z');	
					
--					change2 <= (OTHERS => 'Z');
--					runTotal2 <= (OTHERS => 'Z');
--					total2 <= (OTHERS => 'Z');	
					
					priceSig <= (OTHERS => 'Z');
					
				
				ELSIF (vendExit = '1') THEN
					nextState <= idle;
					
				END IF;
			
	--Hard Reset state 
	
	
			WHEN hardReset => 
				
			prodsig <= STD_LOGIC_VECTOR(newprod); 
			prodsig2 <= STD_LOGIC_VECTOR(newprod); 
			wrensig <= writeSig;
			hard_resetSig <= '1';
			
			IF prodsig2 = "00" THEN 
				newprod <= newprod + 1; 
				nextState <= hardReset;
				
			ELSIF prodsig2 = "01" THEN 
				newprod <= newprod + 1; 
				nextState <= hardReset; 
				
			ELSIF prodsig2 = "10" THEN 
				newprod <= newprod + 1; 
				nextState <= hardReset; 
				
			ELSIF prodsig2 = "11" THEN 
				newprod <= newprod + 1; 
				nextState <= idle; 
			END IF;
					
		
		END CASE;
	END PROCESS;
	
	PROCESS(clock, start, reset, hard_reset)
	BEGIN
		
		IF (start = '1') THEN
			IF hard_reset = '1' THEN
				currentState <= hardReset;
			
			ELSIF (reset = '1') THEN
				currentState <= idle;
				
			ELSIF (rising_edge(clock)) THEN
				currentState <= nextState;
				
			END IF;
		
		ELSE
			currentState <= idle;
			
		END IF;
	END PROCESS;

END behaviour;

