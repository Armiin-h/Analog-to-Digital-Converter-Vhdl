library IEEE;
use IEEE.std_logic_1164.all;

entity output is
	generic (
	n    :    integer
	);
	port(
	clk,load    :  in   std_logic;
	Din       :  in   std_logic_vector(n-1 downto 0);
	Dout      :  out  std_logic_vector(n-1 downto 0)
	);
end entity output;


architecture action of output is 
begin
    
    
  process is
  begin
      wait until clk='1';
      if (clk'event and clk='1') then
		   if (load = '1') then
			   Dout <= Din;
			end if;
		end if;	
  end process;
  
  
  
end architecture action;