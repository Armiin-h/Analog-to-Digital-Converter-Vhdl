
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity controllunit_tb is
end entity controllunit_tb;


architecture tb of controllunit_tb is 

signal start : std_logic :='1';
signal clk : std_logic := '1';
signal GT : std_logic :='1';
signal load : std_logic;
signal done : std_logic;
signal Dout : std_logic_vector(8-1 downto 0);


begin
	
	thecontrollunit : entity work.controllunit(action) generic map( n => 8) port map( start => start,clk    => clk, GT    => GT, load    => load, done  => done, Dout  => Dout);
	
  clk_process: process is
	begin
	clk <= not clk;
	wait for 5 ns;
	if(now >= 200 ns) then wait;
	end if;
  end process;
  GT_process: process is
  begin
	GT <= not GT;
	wait for 8 ns;
	if(now >= 200 ns) then wait;
	end if;
  end process;
 start_process: process is 
  begin
	start <= not start;
	wait for 15 ns;
	if(now >= 200 ns) then wait;
	end if;
  end process;
end architecture tb;



