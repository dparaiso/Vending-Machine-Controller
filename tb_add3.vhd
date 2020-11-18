LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY tb_add3 IS 
END tb_add3; 

ARCHITECTURE test of tb_add3 is 	

COMPONENT add3 is 
	PORT( A : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
			S : OUt STD_LOGIC_VECTOR(3 DOWNTO 0)); 
END COMPONENT; 

SIGNAL asig, ssig: STD_LOGIC_VECTOR(3 DOWNTO 0); 

BEGIN 

DUT: add3
PORT MAP (A => asig, s => ssig); 

PROCESS IS 
BEGIN 

asig <= "0000"; 
wait for 10 ns; 

asig <= "0001"; 
wait for 10 ns; 

asig <= "0010"; 
wait for 10 ns; 

asig <= "0011"; 
wait for 10 ns; 

asig <= "0100"; 
wait for 10 ns; 

asig <= "0101"; 
wait for 10 ns; 

asig <= "0110"; 
wait for 10 ns; 

asig <= "0111"; 
wait for 10 ns; 

asig <= "1000"; 
wait for 10 ns; 

asig <= "1001"; 
wait for 10 ns; 

asig <= "1010"; 
wait for 10 ns; 

asig <= "1011"; 
wait for 10 ns; 

asig <= "1100"; 
wait for 10 ns; 

asig <= "1101"; 
wait for 10 ns; 

asig <= "1110"; 
wait for 10 ns; 

asig <= "1111"; 
wait for 10 ns; 

WAIT; 
END PROCESS; 

END test; 