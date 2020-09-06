-- Library
library ieee;
use IEEE.numeric_std.all;
use ieee.std_logic_1164.all;

-- Entity
entity reg_file is  
	generic (Dwidth : integer :=8;
				Awidth : integer :=2 );
	port (
		clk, wren      : in std_logic;
		wdata   		   : in std_logic_vector  (Dwidth-1 downto 0);
		waddr, raddr   : in std_logic_vector  (Awidth-1 downto 0);
		rdata          : out std_logic_vector (Dwidth-1 downto 0)
	);
end entity reg_file;

--Architecture
architecture reg_file_arch of reg_file is 
	type array_type (0 to 2**Awidth-1) of std_logic_vector (Dwidth-1 downto 0);
	signal array_reg : array_type;
	begin 
		rf_proc process (clk, wren, wdata, waddr, raddr)
			begin
			if (rising_edge (clk)) then
				if (wren='1') then
					array_reg(to_integer(unsigned(waddr))) <=wdata;
				end if;
				rdata<= array_reg (to_integer(unsigned(raddr)));
			end if;
		end process rf_proc;
end architecture reg_file_arch;

