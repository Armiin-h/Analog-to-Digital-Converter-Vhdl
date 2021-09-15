library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity DigitaltoAnalogConvertorTB is
end entity DigitaltoAnalogConvertorTB;


architecture tb of DigitaltoAnalogConvertorTB is 

signal digital : std_logic_vector(7 downto 0):="00100100";
signal analog : real;

begin
	
	digitaltoanalog : entity work.DigitaltoAnalogConvertor(action) generic map (8, 5.0)
	port map( digital, analog);

  process is
	begin
	
	
	wait for 10 ns;
	digital <= std_logic_vector (unsigned(digital) + 1);
	if(now >= 200 ns) then wait;
	end if;

end process;
end architecture tb;

