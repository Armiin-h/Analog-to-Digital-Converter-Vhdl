
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity AnalogtoDigitalconvertor_tb is
end entity AnalogtoDigitalconvertor_tb;


architecture tb of AnalogtoDigitalconvertor_tb is 

signal Vin : real:=0.1;
signal clk : std_logic := '1';
signal start : std_logic:='0';
signal done : std_logic;
signal Dout : std_logic_vector(7 downto 0);


begin
	
	AtoDconvertor : entity work.AnalogtoDigitalconvertor(action) generic map (n   => 8,vref  => 5.0)  port map(Vin => Vin, clk  => clk,start => start, done  => done,Dout  => Dout);
	
  process is
	begin
	clk <= not clk;
	wait for 5ns;
	if(now = 300 ns) then wait;
	end if;
  end process;

  process is
	begin
	
	Vin <= Vin + 0.3;
	start <= not start after 15 ns;
	wait for 5ns;
	if(now = 300 ns) then wait;
	end if;
	
  end process;
end architecture tb;



