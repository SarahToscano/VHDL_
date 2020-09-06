library ieee;
use ieee.std_logic_1164.all;

entity FSM is
port (In1: in std_logic;
   RST: in std_logic; 
   CLK: in std_logic;
   Out1 : inout std_logic);
end FSM;
architecture myfsm of FSM is
type state_type is (A,B,C);
signal PS, NS: state_type;
begin 
sync_process: process(RST, CLK, NS)
begin
if (RST='1') then
PS <= A;
elsif(rising_edge(CLK)) then
PS<= NS;
end if;
end process sync_process;

comb_process: process(In1, PS)
begin
Out1<='0';
case  PS is 
when A=>
	Out1<='0';
	if (In1='1') then NS<= B;
	else NS<=A;
	end if;
when B=>
	if (In1='0') then NS<= C; Out1<= '1';
	else NS<=B; Out1<='0';
	end if;
when C=>
	if(In1='0') then NS<=C ; Out1<='1';
	else Ns<= A; Out1<= '0';
	end if;
	
end case;
end process comb_process;
end myfsm;