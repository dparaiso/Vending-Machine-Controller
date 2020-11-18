LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY tb_program_mode is
END tb_program_mode;

ARCHITECTURE test OF tb_program_mode IS

COMPONENT program_mode IS
	PORT( clock, reset, hard_reset, set, start, N, D, Q: IN STD_LOGIC; --NDQ
			prod, funct : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			runTotal, total: OUT  STD_LOGIC_VECTOR(5 DOWNTO 0);
			change: OUT STD_LOGIC_VECTOR(5 DOWNTO 0));
END COMPONENT; 

SIGNAL clockSig, resetSig, hard_resetSig, setSig, startSig, Nsig, Dsig, Qsig, finishedSig: STD_LOGIC; 
SIGNAL prodsig, functsig: STD_LOGIC_VECTOR(1 DOWNTO 0); 
SIGNAL runSig, totalSig: STD_LOGIC_VECTOR(5 DOWNTO 0); 
SIGNAL changeSig: STD_LOGIC_VECTOR(5 DOWNTO 0); 


BEGIN 

DUT: program_mode
PORT MAP(clock => clockSig, reset => resetSig, hard_reset => hard_resetSig, set => setSig, 
			start => startSig, N=> Nsig, D => Dsig, Q => Qsig,
			prod => prodsig, funct =>functSig, runTotal => runSig, total => totalSig);

PROCESS IS 
BEGIN 
--	clockSig <=''; 
--	resetSig <=''; 
--	hard_resetSig <='0'; 
--	setSig <=''; 
--	startSig <=''; 
--	Nsig <=''; 
--	Dsig <=''; 
--	Qsig <=''; 
--	prodSig <= "00";
--	functSig <= "00";

	--**you need to assert start signal for the states to change**

	--regular clock cycle and product = 00
	clockSig <='0'; 
	resetSig <='0'; 
	hard_resetSig <='0'; 
	setSig <='0'; 
	startSig <='1'; 
	Nsig <='0'; 
	Dsig <='0'; 
	Qsig <='0'; 
	prodSig <= "00";
	functSig <= "00";
	wait for 10 ns; 

	clockSig <='1'; 
	resetSig <='0'; 
	hard_resetSig <='0'; 
	setSig <='0'; 
	startSig <='1'; 
	Nsig <='0'; 
	Dsig <='0'; 
	Qsig <='0'; 
	prodSig <= "00";
	functSig <= "00";
	wait for 10 ns; 
	
	--N = 1, D = 0, Q = 0 
	clockSig <='0'; 
	resetSig <='0'; 
	hard_resetSig <='0'; 
	setSig <='0'; 
	startSig <='1'; 
	Nsig <='1'; 
	Dsig <='0'; 
	Qsig <='0'; 
	prodSig <= "00";
	functSig <= "00";
	wait for 10 ns; 

	clockSig <='1'; 
	resetSig <='0'; 
	hard_resetSig <='0'; 
	setSig <='0'; 
	startSig <='1'; 
	Nsig <='0'; 
	Dsig <='0'; 
	Qsig <='0'; 
	prodSig <= "00";
	functSig <= "00";
	wait for 10 ns; 
	
	--N = 1, D = 1, Q = 0 
	clockSig <='0'; 
	resetSig <='0'; 
	hard_resetSig <='0'; 
	setSig <='0'; 
	startSig <='1'; 
	Nsig <='1'; 
	Dsig <='1'; 
	Qsig <='0'; 
	prodSig <= "00";
	functSig <= "00";
	wait for 10 ns; 

	clockSig <='1'; 
	resetSig <='0'; 
	hard_resetSig <='0'; 
	setSig <='0'; 
	startSig <='1'; 
	Nsig <='0'; 
	Dsig <='0'; 
	Qsig <='0'; 
	prodSig <= "00";
	functSig <= "00";
	wait for 10 ns; 
	
	--N = 0, D = 0, Q = 1 
	clockSig <='0'; 
	resetSig <='0'; 
	hard_resetSig <='0'; 
	setSig <='0'; 
	startSig <='1'; 
	Nsig <='0'; 
	Dsig <='0'; 
	Qsig <='1'; 
	prodSig <= "00";
	functSig <= "00";
	wait for 10 ns; 

	clockSig <='1'; 
	resetSig <='0'; 
	hard_resetSig <='0'; 
	setSig <='0'; 
	startSig <='1'; 
	Nsig <='0'; 
	Dsig <='0'; 
	Qsig <='0'; 
	prodSig <= "00";
	functSig <= "00";
	wait for 10 ns;
		
	--assert set ='1' to save price into memory unit 00
	clockSig <='0'; 
	resetSig <='0'; 
	hard_resetSig <='0'; 
	setSig <='1'; 
	startSig <='1'; 
	Nsig <='0'; 
	Dsig <='0'; 
	Qsig <='0'; 
	prodSig <= "00";
	functSig <= "00";
	wait for 10 ns; 

	clockSig <='1'; 
	resetSig <='0'; 
	hard_resetSig <='0'; 
	setSig <='1'; 
	startSig <='1'; 
	Nsig <='0'; 
	Dsig <='0'; 
	Qsig <='0'; 
	prodSig <= "00";
	functSig <= "00";
	wait for 10 ns; 
	
	--normal clock cycle
	clockSig <='0'; 
	resetSig <='0'; 
	hard_resetSig <='0'; 
	setSig <='0'; 
	startSig <='1'; 
	Nsig <='0'; 
	Dsig <='0'; 
	Qsig <='0'; 
	prodSig <= "ZZ";
	functSig <= "00";
	wait for 10 ns; 

	clockSig <='1'; 
	resetSig <='0'; 
	hard_resetSig <='0'; 
	setSig <='0'; 
	startSig <='1'; 
	Nsig <='0'; 
	Dsig <='0'; 
	Qsig <='0'; 
	prodSig <= "ZZ";
	functSig <= "00";
	wait for 10 ns; 

	
	--reset = 1 should enter idle state
	clockSig <='0'; 
	resetSig <='1'; 
	hard_resetSig <='0'; 
	setSig <='0'; 
	startSig <='1'; 
	Nsig <='0'; 
	Dsig <='0'; 
	Qsig <='0'; 
	prodSig <= "ZZ";
	functSig <= "00";
	wait for 10 ns; 

	clockSig <='1'; 
	resetSig <='0'; 
	hard_resetSig <='0'; 
	setSig <='0'; 
	startSig <='1'; 
	Nsig <='0'; 
	Dsig <='0'; 
	Qsig <='0'; 
	prodSig <= "ZZ";
	functSig <= "00";
	wait for 10 ns; 
	
	--run to read the value stored in product "00"
	
	END PROCESS; 
	

END TEST; 