LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY PartB IS 
	PORT ( a,b  : IN std_logic_vector (15 DOWNTO 0) ;
	      s0,s1 : IN  std_logic;
	      f     : OUT std_logic_vector (15 DOWNTO 0) 
	);

END ENTITY PartB;


ARCHITECTURE behav OF PartB IS
BEGIN
	PROCESS (s0,s1,a(15 DOWNTO 0),b(15 DOWNTO 0))
	BEGIN
		IF s0 = '0' AND s1 = '0' THEN
			f(15 DOWNTO 0) <= a(15 DOWNTO 0) and b(15 DOWNTO 0) ;
		ELSIF s0 = '1' AND s1 = '0' THEN
			f(15 DOWNTO 0) <= a(15 DOWNTO 0) or b(15 DOWNTO 0) ;
		ELSIF s0 = '0' AND s1 = '1' THEN
			f(15 DOWNTO 0) <= a(15 DOWNTO 0) xor b(15 DOWNTO 0) ;
		ELSE
			f(15 DOWNTO 0) <= not a(15 DOWNTO 0) ;
		END IF;
	END PROCESS;
END behav;
