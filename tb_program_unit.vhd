LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY tb_program_unit IS
	GENERIC(N : integer := 5);
END tb_program_unit;

ARCHITECTURE test OF tb_program_unit IS

SIGNAL clockSig, resetSig, hard_resetSig, setSig, enableSig, Nsig, Dsig, Qsig, doneSig, wenSig: STD_LOGIC:='Z';
SIGNAL productSig, addr_outSig : STD_LOGIC_VECTOR(1 DOWNTO 0):="ZZ";
SIGNAL data_memSig : STD_LOGIC_VECTOR(5 DOWNTO 0):="ZZZZZZ";


COMPONENT program_unit IS
	PORT (clock, reset, hard_reset, set, enable, N, D, Q: IN STD_LOGIC;
			product : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			data_mem : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
			addr_out : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			done, wen : OUT STD_LOGIC); 
END COMPONENT; 

BEGIN

	DUT: program_unit
		PORT MAP(clock => clockSig, reset => resetSig, hard_reset => hard_resetSig, set => setSig, 
					enable => enableSig, product => productSig, N => Nsig, D => Dsig, Q => Qsig,
					done => doneSig, wen => wenSig, addr_out => addr_outSig, data_mem => data_memSig);
	
	PROCESS IS
	BEGIN
	
	-- CHECK FOR ALL CASES OF SOFT RESET (reset only affects Accumulator)
	
	for i in 0 to 30 loop
		
		if i < 8 then 
			enableSig <= '1'; 
			if i = 0 then 
				Nsig <='1'; Dsig <= '0'; Qsig <= '0'; 
				
			elsif i = 2 then 
				Nsig <='0'; Dsig <= '0'; Qsig <= '0'; 
			
			elsif i = 3 then 
				resetsig <= '1'; 
				
			elsif i >3 and i < 8 then 
				productSig <= "00"; 
				resetsig <= '0';
				if i = 4 then 
					Nsig <='1'; Dsig <= '1'; Qsig <= '1'; 
					
				elsif i = 5 then 
					Nsig <='0'; Dsig <= '0'; Qsig <= '0'; 
					
				elsif i = 6 then 
					Nsig <='1'; Dsig <= '1'; Qsig <= '1'; 
					
				elsif i = 7 then 
					Nsig <='0'; Dsig <= '0'; Qsig <= '0'; 
					setsig <= '1';
				end if; 

			end if; 
			
		elsif i = 8 then 
			productSig <="00"; 
			setsig <= '0'; 
			
		elsif i > 8 and i < 13 then
				productSig <= "ZZ"; 
				if i = 9 then 
					Nsig <='1'; Dsig <= '1'; Qsig <= '1'; 
					
				elsif i = 10 then 
					Nsig <='0'; Dsig <= '0'; Qsig <= '0'; 
					
				elsif i = 11 then 
					Nsig <='1'; Dsig <= '1'; Qsig <= '1';
					
					
				 --DISABLES ENABLE, accum should reset	
				elsif i = 12 then
					enablesig <= '0'; 
					Nsig <='0'; Dsig <= '0'; Qsig <= '0'; 
				end if;
				
				--tests when coins are over the value 110011, should automatically save 
			--at max value 51
		elsif i > 12 and i < 27 then 
			productsig <= "01"; 
			enablesig <= '1'; 
			if i = 13 then 
				Nsig <='1'; Dsig <= '1'; Qsig <= '1'; 
				
			elsif i = 14 then 
				Nsig <='0'; Dsig <= '0'; Qsig <= '0'; 
				
			elsif i = 15 then 
				Nsig <='1'; Dsig <= '1'; Qsig <= '1'; 
				
			elsif i = 16 then 
				Nsig <='0'; Dsig <= '0'; Qsig <= '0'; 
				
			elsif i = 17 then 
				Nsig <='1'; Dsig <= '1'; Qsig <= '1'; 
				
			elsif i = 18 then 
				Nsig <='0'; Dsig <= '0'; Qsig <= '0'; 
				
			elsif i = 19 then 
				Nsig <='1'; Dsig <= '1'; Qsig <= '1'; 
				
			elsif i = 20 then 
				Nsig <='0'; Dsig <= '0'; Qsig <= '0';
				
			elsif i = 21 then 
				Nsig <='1'; Dsig <= '1'; Qsig <= '1'; 
				
			elsif i = 22 then 
				Nsig <='0'; Dsig <= '0'; Qsig <= '0';
				
			end if; 
				
		elsif i = 27 then 
			hard_resetSig <= '1'; 
			
		else 
			hard_resetSig <= '0'; 
		
		end if; 
		
		
		clocksig <= '1'; 
		wait for 5 ns; 
		clocksig <= '0'; 
		wait for 5 ns; 
	
	end loop; 

	END PROCESS;	
END test;