LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY PartA IS 
	PORT ( a,b      : IN std_logic_vector (15 DOWNTO 0) ;
	      s0,s1,cin : IN  std_logic;
	  	  cout      : OUT  std_logic;
	      f         : OUT std_logic_vector (15 DOWNTO 0) 
	);

END ENTITY PartA;




ARCHITECTURE behav OF PartA IS

	signal  x : std_logic_vector (15 DOWNTO 0);

	Component my_nadder IS
		GENERIC (n : integer := 16);
		PORT(a,b  : IN std_logic_vector(n-1  DOWNTO 0);
		     cin  : IN std_logic;  
		     s    : OUT std_logic_vector(n-1 DOWNTO 0);    
		     cout : OUT std_logic);
	END Component;


	BEGIN
		PROCESS (s0,s1,a(15 DOWNTO 0),b(15 DOWNTO 0))
		BEGIN
			IF s0 = '0' AND s1 = '0'THEN   -- x=0 
				x(15 DOWNTO 0) <= "0000000000000000" ;
			ELSIF s0 = '1' AND s1 = '0' THEN -- x=b
				x(15 DOWNTO 0) <= b ;
			ELSIF s0 = '0' AND s1 = '1' THEN -- x=not b
				x(15 DOWNTO 0) <= NOT b ;
			ELSIF s0 = '1' AND s1 = '1' THEN -- F=ffff
				x(15 DOWNTO 0) <= "1111111111111111";

			END IF;
		

			
		END PROCESS;

		u0: my_nadder port map (a,x,cin,f,cout);

END behav;
