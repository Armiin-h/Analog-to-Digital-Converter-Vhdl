
library IEEE;
use IEEE.std_logic_1164.all;

entity theComprationTB is
end entity theComprationTB;


architecture tb of theComprationTB is 

signal Spos : real:=0.0;
signal Sneg : real:=0.1;
signal GT : std_logic;


begin
	
	compration : entity work.theCompration(action) port map(Spos, Sneg, GT );

  process is
	begin
	
	if(now < 100 ns ) then
		Spos <= Spos + 0.3;
		Sneg <= Sneg + 0.4;
	else 
		Spos <= Spos + 1.0;
		Sneg <= Sneg + 0.6;
	end if;
	
	wait for 10ns;
	
	if(now >= 300 ns) then wait;
	end if;
	
  end process;
end architecture tb;
