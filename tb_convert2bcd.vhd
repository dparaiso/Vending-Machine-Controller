LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY tb_convert2bcd is 
END tb_convert2bcd; 


ARCHITECTURE test of tb_convert2bcd is 	

COMPONENT convert2bcd is
	PORT(binary : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
			bcd: OUt STD_LOGIC_VECTOR(11 DOWNTO 0)); 
END COMPONENT; 

SIGNAL binsig: STD_LOGIC_VECTOR(7 DOWNTO 0); 
SIGNAL Soutsig: STD_LOGIC_VECTOR(11 DOWNTO 0); 

BEGIN 

DUT: convert2bcd
PORT MAP (binary => binsig, bcd => Soutsig); 

PROCESS IS 
BEGIN 

binsig <= "00000000";
wait for 10 ns; 

binsig <= "00000001";
wait for 10 ns; 

binsig <= "00000010";
wait for 10 ns; 

binsig <= "01011000";
wait for 10 ns; 

binsig <= "11111111";
wait for 10 ns; 



wait; 
END PROCESS; 

END test; 