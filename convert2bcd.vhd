LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY convert2bcd is 
	PORT(binary : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
			bcd: OUt STD_LOGIC_VECTOR(11 DOWNTO 0)); 
END convert2bcd; 

ARCHITECTURE structure of convert2bcd is

COMPONENT add3 is 
	PORT( A : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
			S : OUt STD_LOGIC_VECTOR(3 DOWNTO 0)); 
END COMPONENT; 

SIGNAL Sout1, Sout2, Sout3, Sout4, Sout5, Sout6, Sout7: STD_LOGIC_VECTOR(3 DOWNTO 0); 
SIGNAL Ain1, Ain2, Ain3, Ain4, Ain5, Ain6, Ain7: STD_LOGIC_VECTOR(3 DOWNTO 0); 
	
	BEGIN
	
	first: add3 PORT MAP (A => Ain1, S => Sout1);
	second: add3 PORT MAP (A => Ain2, S => Sout2); 
	third: add3 PORT MAP (A => Ain3, S => Sout3); 
	fourth: add3 PORT MAP (A => Ain4, S => Sout4); 
	fifth: add3 PORT MAP (A => Ain5, S => Sout5); 
	sixth: add3 PORT MAP (A => Ain6, S => Sout6);
	seventh: add3 PORT MAP (A=> Ain7, S => Sout7); 
	
	
	Ain1 <= '0' & binary(7 DOWNTO 5);
	Ain2 <= Sout1(2 DOWNTO 0) & binary(4);
	Ain3 <= Sout2(2 DOWNTO 0) & binary(3);
	Ain4 <= '0' & Sout1(3) & Sout2(3) & Sout3(3);
	Ain5 <= Sout3(2 DOWNTO 0) & binary(2);
	Ain6 <= Sout4(2 DOWNTO 0) & Sout5(3);
	Ain7 <= Sout5(2 DOWNTO 0) & binary(1);
	
	bcd <= "00" & Sout4(3) & Sout6 & Sout7 & binary(0); 
	
end structure; 