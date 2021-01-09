library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use WORK.constants.all;
--use WORK.myTypes.all;

entity ALU is
	generic(
		N 			: integer := data_size;
		OP			: integer := alu_Opc_size;
		M			: integer := aluControl_size
		);
	port( 
        DATA1, DATA2 : IN std_logic_vector(N-1 downto 0);
		  aluOpcode 	: IN std_logic_vector(OP-1 downto 0);
        OUTALU		   : OUT std_logic_vector(N-1 downto 0));
end ALU;

architecture str of ALU is 

begin 
end architecture;