LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY tb_vend_unit IS 
END tb_vend_unit; 

ARCHITECTURE test of tb_vend_unit is 	

COMPONENT vend_unit IS 
	PORT (clock, reset, enable, N, D ,Q: IN STD_LOGIC;
			price_in: IN STD_LOGIC_VECTOR(5 DOWNTO 0); 
			change: OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
			insert_out: OUT STD_LOGIC_VECTOR(5 DOWNTO 0); 
			done: OUT STD_LOGIC); 
END COMPONENT; 

SIGNAL clksig, rstsig, enblsig, Nsig, Dsig, Qsig: STD_LOGIC; 
SIGNAL price: STD_LOGIC_VECTOR(5 DOWNTO 0); 
SIGNAL change1, insert: STD_LOGIC_VECTOR (5 DOWNTO 0); 
SIGNAL donesig: STD_LOGIC; 


BEGIN

DUT: vend_unit
PORT MAP(clock => clksig, reset => rstsig, enable => enblsig, N => Nsig, D => Dsig, price_in => price, Q => Qsig, change => change1, insert_out => insert, done => donesig); 

PROCESS IS 
BEGIN 

--clksig <= ''; 
--rstsig <= ''; 
--enblsig <= '';
--Nsig <= '';
--Dsig <= '';
--Qsig <= ''; 
--price <= ""; 


--normal clock cycle 
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '0';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "ZZZZZZ"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '0';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "ZZZZZZ"; 
wait for 10 ns; 

--price is set to $1.25
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '0';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "011001"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '0';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "011001"; 
wait for 10 ns; 

--starts adding up price N = 1, D = 1, Q =1
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "011001"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '1';
Dsig <= '1';
Qsig <= '1'; 
price <= "011001";
wait for 10 ns;  

-- adding up price D = 1, Q =1
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "011001"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '1';
Qsig <= '1'; 
price <= "011001"; 
wait for 10 ns; 

-- adding up price Q =1
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "011001";
wait for 10 ns;  

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '1'; 
price <= "011001"; 
wait for 10 ns; 

-- adding extra to the price to test the change Q =1
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "011001"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '1'; 
price <= "011001"; 
wait for 10 ns; 

-- adding extra Q =1
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "011001"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '1'; 
price <= "011001"; 
wait for 10 ns; 

--should be 50 cents extra
--zero input clock cycle to stop adding and move to next state 
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "011001"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "011001"; 
wait for 10 ns; 

--extra clock cycle 
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '0';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "ZZZZZZ"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '0';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "ZZZZZZ"; 
wait for 10 ns; 

--new product: price: $0.50
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '0';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "001010"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "001010"; 
wait for 10 ns; 

--adding coins D= 1, N = 1, Q = 1
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "001010"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '1';
Dsig <= '1';
Qsig <= '1'; 
price <= "001010"; 
wait for 10 ns; 

--adding coins D= 1
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "001010"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '1';
Qsig <= '0'; 
price <= "001010"; 
wait for 10 ns; 

--2 regular clock cycle no inputs
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "001010"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "001010"; 
wait for 10 ns;

clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "001010"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "001010"; 
wait for 10 ns;

--clockcyle with no price input 
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '0';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "ZZZZZZ"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '0';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "ZZZZZZ"; 
wait for 10 ns;

--new product: price: $2.55
--the purpose of this test is to add coins then stop for a second before the 
--price has been reached and then continue to assert more coins until the price
--has been reached

clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "110011"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "110011"; 
wait for 10 ns;

--adding Q = 1, D = 1, N = 1 = 0.40
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "110011"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '1';
Dsig <= '1';
Qsig <= '1'; 
price <= "110011"; 
wait for 10 ns;

--adding Q = 1, D = 1, N = 1 = 0.80
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "110011"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '1';
Dsig <= '1';
Qsig <= '1'; 
price <= "110011"; 
wait for 10 ns;

--adding Q = 1, D = 1, N = 1 = 1.20
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "110011"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '1';
Dsig <= '1';
Qsig <= '1'; 
price <= "110011"; 
wait for 10 ns;

--adding Q = 1, D = 1, N = 1 = 1.60
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "110011"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '1';
Dsig <= '1';
Qsig <= '1'; 
price <= "110011"; 
wait for 10 ns;

--adding Q = 1, D = 1, N = 1 = 2.00
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "110011"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '1';
Dsig <= '1';
Qsig <= '1'; 
price <= "110011"; 
wait for 10 ns;

--adding Q = 1, D = 1, N = 1 = 2.40
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "110011"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '1';
Dsig <= '1';
Qsig <= '1'; 
price <= "110011"; 
wait for 10 ns;

--NO INPUT CLOCK CYCLE
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "110011"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "110011"; 
wait for 10 ns;

--adding  D = 1, N = 1 = 2.55
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "110011"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '1';
Dsig <= '1';
Qsig <= '0'; 
price <= "110011"; 
wait for 10 ns;

-- 2 regular clock cycle 
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "110011"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "110011"; 
wait for 10 ns;

clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "110011"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "110011"; 
wait for 10 ns;

--new product: price : $2.10
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '0';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "ZZZZZZ"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '0';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "ZZZZZZ"; 
wait for 10 ns;
 

clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '0';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "101010"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '0';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "101010"; 
wait for 10 ns;

--enable = 1, and start inputing N = 1, D = 1
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "101010"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '1';
Dsig <= '1';
Qsig <= '0'; 
price <= "101010"; 
wait for 10 ns;

-- N = 1, Q = 1 
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "101010"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '1';
Dsig <= '0';
Qsig <= '1'; 
price <= "101010"; 
wait for 10 ns;

--clock cycle 

clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "101010"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "101010"; 
wait for 10 ns;

--reset is asserted 
clksig <= '0'; 
rstsig <= '1'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "101010"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '1'; 
enblsig <= '1';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "101010"; 
wait for 10 ns;

--normal clock cycle 
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '0';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "ZZZZZZ"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '0';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "ZZZZZZ"; 
wait for 10 ns;
 
clksig <= '0'; 
rstsig <= '0'; 
enblsig <= '0';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "ZZZZZZ"; 
wait for 10 ns; 

clksig <= '1'; 
rstsig <= '0'; 
enblsig <= '0';
Nsig <= '0';
Dsig <= '0';
Qsig <= '0'; 
price <= "ZZZZZZ"; 
wait for 10 ns;
 

WAIT;
END PROCESS; 

END test; 