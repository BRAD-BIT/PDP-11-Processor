LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use ieee.numeric_std.all ;

ENTITY MPC IS
	GENERIC ( n : integer := 16);
	PORT( Clk,Rst,en : IN std_logic;
		  d : IN  std_logic_vector(n-1 DOWNTO 0);
		  q : OUT std_logic_vector(n-1 DOWNTO 0));
END MPC;

ARCHITECTURE a_my_nDFF OF MPC IS
	signal t_cnt : unsigned(15 downto 0);
	BEGIN
		PROCESS (Clk,Rst)
			BEGIN
				
				if (rising_edge(CLK)) then
					if (RST = '1') then
					t_cnt <= (others => '0'); -- clear
				
					
					elsif (en = '1') then t_cnt <= unsigned(d); -- load
					else	
						t_cnt <= t_cnt + 1; 
					end if;
					
				end if;
		END PROCESS;
		q <= std_logic_vector(t_cnt);
END a_my_nDFF;




