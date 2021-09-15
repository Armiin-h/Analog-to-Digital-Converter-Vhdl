
library IEEE;
use IEEE.std_logic_1164.all;

entity AnalogtoDigitalconvertor is
	generic (
	n    :    integer;
	vref :    real
	);
	port(
	Vin       :  in    real;
	clk       :  in    std_logic;
	start     :  in    std_logic;
	done      :  out   std_logic;
	Dout      :  out   std_logic_vector(n-1 downto 0)
	);
end entity AnalogtoDigitalconvertor;


architecture action of AnalogtoDigitalconvertor is 

signal Spos    : real;
signal GT      : std_logic;
signal digital : std_logic_vector(n-1 downto 0);
signal load      : std_logic;

begin
	
	compration : entity work.theCompration(action)
	port map(
	pos  => Spos,
	neg => Vin,
	GT    => GT
	);
	
	digitaltoanalog : entity work.DigitaltoAnalogConvertor(action)
	generic map (
	n    => n,
	vref => vref 
	)
	port map(
	digital => digital,
	analog  => Spos
	);
	
	outputunit : entity work.output(action) 
	generic map (
	n => n
	)
	port map(
	clk  => clk,
	load   => load,  
	Din  => digital,      
	Dout => Dout    
	);
	
	
	thecontrollunit : entity work.controllunit(action)
	generic map( 
	n => n
	)
	port map(
	start => start,
	clk    => clk, 	
	GT    => GT,   
	load  => load,  
	done  => done,    
	Dout  => digital    
	);
	
	
	

  
end architecture action;
