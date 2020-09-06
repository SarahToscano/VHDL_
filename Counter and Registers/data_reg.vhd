-- Library
library ieee;
use ieee.std_logic_1164.all;

-- Entity
entity Data_Reg is port (
	clk, rst, load : in std_logic;
	d 					: in std_logic_vector (3 downto 0);
	q 					: out std_logic_vector (3 downto 0));
end entity Data_Reg;

-- Architecture
architecture Reg_Arch of Data_Reg is begin 
	dreg_process : process (clk, rst, load)
		begin
			if(rst='0')  
				then q <= "0000";
			elsif (rising_edge(clk)) then
				if (load='1')
					then q<=d;
				end if;
			end if;
		end process dreg_process;
end architecture Reg_Arch;
					