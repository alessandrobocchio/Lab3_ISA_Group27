library ieee;
use ieee.std_logic_1164.all;

package CONSTANTS is 
	constant IRAM_SIZE      	: integer := 64;
	constant DataMem_SIZE  		: integer := 48;
	--constant Stack_size			: integer := 128;
	constant IRAM_LENGTH		   : integer := 8;
	constant DataMem_LENGTH 	: integer := 8;
	constant PC_SIZE        	: integer := 32; 
	constant add_size        	: integer := 5;	
	constant data_size       	: integer := 64; 	 
	constant IR_size           : integer := 32;
	--constant R0			    	   : std_logic_vector(add_size-1 downto 0) := (others => '0');
	--constant R31		   		: std_logic_vector(add_size-1 downto 0) := (others => '1');
	
 	-- Control unit input sizes
--	constant OP_CODE_SIZE	  	 : integer := 6;		-- OPCODE field size
--	constant FUNC_SIZE          : integer := 11;	-- FUNC field size
	--constant MICROCODE_MEM_SIZE : integer := 62;	-- LUT Size
	constant ALU_OPC_SIZE       : integer := 5;		-- ALU Op Code Word Size   
	--constant CW_SIZE            : integer := 43;	-- aluop separately
 
	--NOP instruction ----- da aggiustare assolutamenteeeeeeeeeeee
	constant NOP 				: std_logic_vector(IR_SIZE-1 downto 0) := "11001000000000000000000000000000";

	-- windowing
	--constant globals     		: integer := 8;		-- number of globals registers
	--constant IN_OUT_LOC  		: integer := 8;		-- number of in/out/loc registers
	--constant windows     		: integer := 8;		-- number of windows
	--constant add_size_phy 		: integer := 8;		-- log(3*N +M), number of bits for external address
	--constant log_windows 		: integer := 3;
	--constant log_IN_OUT_LOC		: integer := 3;  

	-- alu constants: 
	constant aluControl_size	: integer := 12;
	--constant log2datasize 		: integer := 5; 	-- riducibile cambiando con add?
	--constant carry_width 		: integer := 4;
end CONSTANTS;