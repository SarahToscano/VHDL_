-- Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- Entity
entity Shift_Reg is port (
clk, rst, shift, d0 : in std_logic;
q						  : out std_logic_vector (3 downto 0));
end entity Shift_Reg;

--Architecture
architecture Shift_Reg_Arch of Shift_Reg is 
	signal data_buffer : std_logic_vector (3 downto 0);
	begin
	sreg_proc : process (clk, rst) begin
		if (rst ='1') 
			then q<="0000";
				  data_buffer <="0000";
		elsif (rising_edge(clk)) then
				if(shift = '1') then
				data_buffer(0) <= d0;
					q(0) <= d0;
					q(1) <= data_buffer(0);
					q(2) <= data_buffer(1);
					q(3) <= data_buffer(2);
				end if;
		end if;
	end process sreg_proc;
end architecture Shift_Reg_Arch;
					
					