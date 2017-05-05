LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY PartC IS 
	PORT (	a         : IN std_logic_vector (15 DOWNTO 0) ;
			s0,s1 ,cin: IN  std_logic;
			cout      : OUT  std_logic;
			f         : OUT std_logic_vector (15 DOWNTO 0) 
	);

END ENTITY PartC;



ARCHITECTURE behav OF PartC IS
BEGIN
	PROCESS (a(15 DOWNTO 0),s0,s1,cin)
	BEGIN
		IF s0 = '0' AND s1 = '0' THEN --logic shift right
			f(15 DOWNTO 0) <= '0' & a(15 DOWNTO 1);
			cout <= a(0) ;
			
		ELSIF s0 = '1' AND s1 = '0' THEN -- rotate right
			f(15 DOWNTO 0) <= a(0) & a(15 DOWNTO 1)  ;
			cout <= '0' ;
		
		ELSIF s0 = '0' AND s1 = '1' THEN -- rotate right with carry
			f(15 DOWNTO 0) <= cin & a(15 DOWNTO 1) ;
			cout <= a(0) ;
		
		ELSE -- arth shift right
			f(15 DOWNTO 0) <= a(15) & a(15 DOWNTO 1) ;
			cout <= a(0) ;
			
		END IF;
	END PROCESS;
END behav;
