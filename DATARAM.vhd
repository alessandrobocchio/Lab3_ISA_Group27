library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use work.constants.all; 

entity DataRam is 
 generic (
		   datamem_size   : integer := datamem_size;     
		   A     		   : integer := data_size;
         D     		   : integer := data_size;
		   DataMem_Length : integer := DataMem_Length
         );
 port ( 
		  CLK     : IN  std_logic;
        RESET   : IN  std_logic;
	     WR      : IN  std_logic;
		  RD      : IN  std_logic;
		  --st_byte : IN  std_logic;
		  --sel     : IN  std_logic_vector(1 downto 0);
	     ADD     : IN  std_logic_vector(A-1 downto 0);
	     DATAIN  : IN  std_logic_vector(D-1 downto 0);
        OUT1    : OUT std_logic_vector(D-1 downto 0)
	  );
end entity; 


architecture str of DataRam is

	type DataMemtype is array (0 to datamem_size - 1) of std_logic_vector(DataMem_Length - 1 downto 0);
	signal Data_mem : DataMemtype; 
	
	signal mask_add : std_logic_vector(A-1 downto 0);
	--mask_add1
  
begin
	
	mask_add <= add(A-1 downto 2) & "00";    -- aligned word
	--mask_add1<= add(A-1 downto 2) & "10";
	
	Mem: process (reset, clk, wr, add, mask_add, datain, rd, Data_mem)
	begin

		if reset = '0' then -- reset
			Data_Mem <= (others=>(others =>'0'));
		else	
			if rd = '1' then				-- reading
--			case sel is
--				when "00" =>  -- lb
--				   out1(7 downto 0)   <= Data_mem(to_integer(unsigned(add)));
--					out1(D-1 downto 8) <= (others => Data_Mem(to_integer(unsigned(add)))(7));
--				when "01" =>  -- lbu
--					out1(7 downto 0)   <= Data_mem(to_integer(unsigned(add)));
--					out1(D-1 downto 8) <= (others => '0');
--				when "10" => -- lhu
--					if add(1 downto 0) = "01" then 
--						out1(15 downto   8) <= Data_mem(to_integer(unsigned(mask_add)));
--						out1(7  downto   0) <= Data_mem(to_integer(unsigned(mask_add)) + 1);
--						out1(D-1 downto 16) <= (others => '0');
--					elsif add(1 downto 0) = "11" then 
--						out1(15 downto   8) <= Data_mem(to_integer(unsigned(mask_add1)));
--						out1(7  downto   0) <= Data_mem(to_integer(unsigned(mask_add1)) + 1);
--						out1(D-1 downto 16) <= (others => '0');					
--					else 
--						out1(15 downto   8) <= Data_mem(to_integer(unsigned(add)));
--						out1(7  downto   0) <= Data_mem(to_integer(unsigned(add)) + 1);
--						out1(D-1 downto 16) <= (others => '0');
--					end if; 
--				when others => -- lw
						out1(D-1 downto 32)  <= (others => (Data_mem(to_integer(unsigned(mask_add)))(7) ));
						out1(32-1 downto 24) <= Data_mem(to_integer(unsigned(mask_add)));
						out1(23 downto  16) <= Data_mem(to_integer(unsigned(mask_add)) + 1);
						out1(15 downto   8) <= Data_mem(to_integer(unsigned(mask_add)) + 2);
						out1(7  downto   0) <= Data_mem(to_integer(unsigned(mask_add)) + 3);
--				end case;
			end if;
				
		    if clk'event and clk = '1' then 
				if wr = '1' then -- writing
--					if st_byte = '1' then      -- store only a byte, sb
--							Data_mem(to_integer(unsigned(add)))			<= datain(7 downto 0);
--					else                       -- store entire word, sw
							Data_mem(to_integer(unsigned(mask_add)))    <= datain(32-1 downto 24);
							Data_mem(to_integer(unsigned(mask_add))+ 1) <= datain(23 downto 16);
							Data_mem(to_integer(unsigned(mask_add))+ 2) <= datain(15 downto 8); 
							Data_mem(to_integer(unsigned(mask_add))+ 3) <= datain(7 downto 0);
--					end if;
				end if;
			end if;	
		end if;
	end process;
	
end architecture;




