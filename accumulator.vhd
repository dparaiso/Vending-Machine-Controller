library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity accumulator is 
	port (clock, reset, en, N, D, Q: in std_logic; 
			accum_out: out std_logic_vector(5 downto 0)); 
end accumulator; 

architecture behaviour of accumulator is 

signal count: unsigned(5 downto 0):="000000"; 
signal aout: std_logic_vector(5 downto 0):="000000"; 
signal coins: unsigned(2 downto 0):="000"; 


--Ncount can count up to 51 nickels	=> 6 bits 

Begin 
	
	--this process statement changes output of accumulator sequentially
	process (clock)
	begin 
			
		if rising_edge(clock) then 
			aout <= std_logic_vector(count); 

		else 
			aout <= aout; 
		end if; 
		
	end process; 
	
	--concatenate coin input as one signal 
	coins <= Q & D & N;
	
	
	--count does not incremement sequentially, 
	process(reset, en, coins)
	begin
	
	if reset = '1' then 
		count <= "000000";
		
	elsif count > "110011" then --when count reaches 51 it sets back to zero and adds the remaining count leftover
		count <= "000000" + (count - "110011");
	
	elsif en = '1' then 
		case coins is     
			when "000" => count <= count;
			when "001" => count <= count + 1; 
			when "010" => count <= count + 2; 
			when "011" => count <= count + 3; 
			when "100" => count <= count + 5; 
			when "101" => count <= count + 6; 
			when "110" => count <= count + 7; 
			when "111" => count <= count + 8; 
			when others => count <= count; 
		end case; 
	
	else 
		count <= "000000"; 
	end if; 
	
	end process; 

	--maps the signal to the output
	accum_out <= aout; 

end behaviour; 
