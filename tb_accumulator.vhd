library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity tb_accumulator is 
end tb_accumulator; 

architecture test of tb_accumulator is 

component accumulator is 
	port (clock, reset, en, N, D, Q: in std_logic; 
			accum_out: out std_logic_vector(5 downto 0)); 
end component; 

signal clk, rst, enable, nsig, dsig, qsig: std_logic; 
signal accumsig: std_logic_vector(5 downto 0); 

begin 
DUT: accumulator 
port map( clock => clk, reset => rst, en => enable, N=>nsig, D=>dsig, Q =>qsig, accum_out => accumsig); 

process is 
begin 

clk <='0';
enable <= '1'; 
rst <= '0'; 
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--"000" input
clk <='1'; 
enable <= '1'; 
rst <= '0';
Qsig <= '1'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

clk <='0'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--"001" input
clk <='1'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '1'; 
wait for 5 ns;

clk <='0'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--"010" input
clk <='1'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '1'; 
Nsig <= '0'; 
wait for 5 ns;

clk <='0'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;


--"011" input
clk <='1'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '1'; 
Nsig <= '1'; 
wait for 5 ns;

clk <='0'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--"100" input
clk <='1'; 
enable <= '1'; 
rst <= '0';
Qsig <= '1'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

clk <='0'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--"101" input
clk <='1'; 
enable <= '1'; 
rst <= '0';
Qsig <= '1'; 
Dsig <= '0'; 
Nsig <= '1'; 
wait for 5 ns;

clk <='0'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--"110" input
clk <='1'; 
enable <= '1'; 
rst <= '0';
Qsig <= '1'; 
Dsig <= '1'; 
Nsig <= '0'; 
wait for 5 ns;

clk <='0'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--"111" input
clk <='1'; 
enable <= '1'; 
rst <= '0';
Qsig <= '1'; 
Dsig <= '1'; 
Nsig <= '1'; 
wait for 5 ns;

clk <='0'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;


clk <='1'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--resets
clk <='0'; 
enable <= '1'; 
rst <= '1';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

clk <='1'; 
enable <= '1'; 
rst <= '1';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--normal clock cycle
clk <='0'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

clk <='1'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

clk <='0'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--following increments until count reaches 51 to test the counter will reset automatically 

--"111" input
clk <='1'; 
enable <= '1'; 
rst <= '0';
Qsig <= '1'; 
Dsig <= '1'; 
Nsig <= '1'; 
wait for 5 ns;

clk <='0'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--"111" input
clk <='1'; 
enable <= '1'; 
rst <= '0';
Qsig <= '1'; 
Dsig <= '1'; 
Nsig <= '1'; 
wait for 5 ns;

clk <='0'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--"111" input
clk <='1'; 
enable <= '1'; 
rst <= '0';
Qsig <= '1'; 
Dsig <= '1'; 
Nsig <= '1'; 
wait for 5 ns;

clk <='0'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--"111" input
clk <='1'; 
enable <= '1'; 
rst <= '0';
Qsig <= '1'; 
Dsig <= '1'; 
Nsig <= '1'; 
wait for 5 ns;

clk <='0'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--"111" input
clk <='1'; 
enable <= '1'; 
rst <= '0';
Qsig <= '1'; 
Dsig <= '1'; 
Nsig <= '1'; 
wait for 5 ns;

clk <='0'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--"111" input
clk <='1'; 
enable <= '1'; 
rst <= '0';
Qsig <= '1'; 
Dsig <= '1'; 
Nsig <= '1'; 
wait for 5 ns;

clk <='0'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--"111" input
clk <='1'; 
enable <= '1'; 
rst <= '0';
Qsig <= '1'; 
Dsig <= '1'; 
Nsig <= '1'; 
wait for 5 ns;

clk <='0'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--regular clock signal, count should have been reset to zero 
clk <='1'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

clk <='0'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--add Q = 1

clk <='1'; 
enable <= '1'; 
rst <= '0';
Qsig <= '1'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

clk <='0'; 
enable <= '1'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--enable = 0 
clk <='1'; 
enable <= '0'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

clk <='0'; 
enable <= '0'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

--extra clock signal 
clk <='1'; 
enable <= '0'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

clk <='0'; 
enable <= '0'; 
rst <= '0';
Qsig <= '0'; 
Dsig <= '0'; 
Nsig <= '0'; 
wait for 5 ns;

wait; 
end process; 

end test; 
