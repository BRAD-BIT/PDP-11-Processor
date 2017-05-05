LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY PartD IS 
	PORT (  a          : IN std_logic_vector (15 DOWNTO 0) ;
	        s0,s1 ,cin : IN  std_logic;
			cout       : OUT  std_logic;
			f          : OUT std_logic_vector (15 DOWNTO 0) 
	);

END ENTITY PartD;



ARCHITECTURE behav OF PartD IS
BEGIN -- use cout
	PROCESS (a(15 DOWNTO 0),s0,s1,cin)
	BEGIN
		IF s0 = '0' AND s1 = '0' THEN --logic shift Left
			f(15 DOWNTO 0) <=  a(14 DOWNTO 0) & '0';
			cout <= a(15) ;
			
		ELSIF s0 = '1' AND s1 = '0' THEN -- rotate left
			f(15 DOWNTO 0) <= a(14 DOWNTO 0) & a(15)  ;
			cout <= '0' ;
			
		ELSIF s0 = '0' AND s1 = '1' THEN -- rotate left with carry
			f(15 DOWNTO 0) <= a(14 DOWNTO 0) & cin ;
			cout <= a(15) ;
			
		ELSE -- zero
			f(15 DOWNTO 0) <=(OTHERS =>'0');
			cout <= '0' ;

		END IF;

	END PROCESS;
END behav;

