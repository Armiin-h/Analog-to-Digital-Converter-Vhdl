library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity DigitaltoAnalogConvertor is
	generic (
	n    :    integer := 8;
	vref :    real 
	);
	port(
	digital :  in   std_logic_vector (n-1 downto 0);
	analog  :  out  real
	);
end entity DigitaltoAnalogConvertor;


architecture action of DigitaltoAnalogConvertor is 
begin
    
    
  analog <= real(to_integer(unsigned(digital)))*vref/real(2**n);


end architecture action;