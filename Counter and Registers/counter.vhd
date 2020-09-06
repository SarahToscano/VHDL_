-- Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Entity
entity Counter is port (
clk, rst, shift, load, en : in std_logic;
d						  : in std_logic_vector (3 downto 0);
q						  : out std_logic_vector (3 downto 0));
end entity Counter;


--Architecture
architecture Counter_Arch of Counter is 
	signal cnt      :  std_logic_vector(3 downto 0); begin
	count_proc : process (clk, rst, load, en) begin
		if (rst ='1') then cnt <="0000";
		elsif (rising_edge(clk)) then
				if(load = '1') then cnt<=d;
				elsif (en='1') then cnt <= cnt +1; 
				end if;
		end if;
	end process count_proc;
	q<=cnt;
end architecture Counter_Arch;