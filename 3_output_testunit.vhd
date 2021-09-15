library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity output_tb is
end entity output_tb;


architecture tb of output_tb is 

signal clk : std_logic := '1';
signal load : std_logic:='1';
signal Din : std_logic_vector(7 downto 0):="00100001";
signal Dout : std_logic_vector(7 downto 0);

begin
	
	outputunit : entity work.output(action) 
	generic map (8) port map(clk,load,Din,Dout);
	
  process is
	begin
	clk <= not clk;
	wait for 5 ns;
	if(now >= 300 ns) then wait;
	end if;
  end process;




  process is
	begin
	
	wait for 10 ns;
	load <= not load;
	Din <= std_logic_vector(unsigned(Din) + 1);

	if(now >= 300 ns) then wait;
	end if;
  end process;
  
  
end architecture tb;


