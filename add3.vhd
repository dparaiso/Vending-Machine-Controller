LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY add3 is 
	PORT( A : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
			S : OUt STD_LOGIC_VECTOR(3 DOWNTO 0)); 
END add3; 


ARCHITECTURE behaviour of add3 is
BEGIN

	 S(3) <= A(3) OR (A(2)AND A(0)) OR (A(2) AND A(1)); 
	 S(2) <= (A(3) AND A(0)) OR (A(2) AND NOT A(1) AND NOT A(0)); 
	 S(1) <= (A(3) AND NOT A(0)) OR (NOT A(2) AND A(1)) OR (A(1) AND A(0)); 
	 S(0) <= (A(3) AND NOT A(0)) OR (NOT A(3) AND NOT A(2) AND A(0)) OR (A(2) AND A(1) AND NOT A(0));

end behaviour; 