library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.constants.all; 

entity FF is 
	port(
		Rst  	: in std_logic; 
		clk  	: in std_logic; 
		enable	: in std_logic;
		Din  	: in std_logic; 
		Dout 	: out std_logic
		);
end FF;

architecture beh of FF is 
begin

FF_P: process (Clk, Rst)
begin  -- process IR_P
	if Rst = '0' then                   -- asynchronous reset (active low)
		Dout <= '0';
	elsif Clk'event and Clk = '1' then  -- rising clock edge
		if (enable = '1') then
			Dout <= Din;
		end if;
	end if;
end process FF_P;

end architecture; 