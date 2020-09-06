-- Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity AAC2M2P1 is port (                 	
   CP: 	in std_logic; 	-- clock
   SR:   in std_logic;  -- Active low, synchronous reset
   P:    in std_logic_vector(3 downto 0);  -- Parallel input
   PE:   in std_logic;  -- Parallel Enable (Load)
   CEP:  in std_logic;  -- Count enable parallel input
   CET:  in std_logic; -- Count enable trickle input
   Q:    out std_logic_vector(3 downto 0);            			
   TC:   out std_logic  -- Terminal Count
);            		
end entity AAC2M2P1;

architecture AAC2M2P1_arch of AAC2M2P1 is 
	signal cnt :  std_logic_vector(3 downto 0);
	signal cout:  std_logic;	
	begin
		count_proc : process (CP, SR, P, CEP, PE, CET) begin
			if (SR='0') then cnt <="0000"; cout<='0';
			elsif (rising_edge(CP)) then
				if PE = ('0') then cnt <= P;
				elsif (CET = '1' and CEP = '1') then
					if(cnt="1111") then cout<='1'; cnt<="0000";
					else cnt<=cnt+1; cout<='0';
					end if;
				end if;
			end if;
	end process count_proc;
	Q<=cnt;
	TC<=cout;
end architecture AAC2M2P1_arch;