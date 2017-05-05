LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY mux2 IS  
		PORT (
			s   : IN  std_logic;			
			a, b: IN std_logic_vector(15 downto 0);		      
			z   : OUT std_logic_vector(15 downto 0));    
END ENTITY mux2;


ARCHITECTURE Data_flow OF mux2 IS
BEGIN
     z <= a when s = '0' else b;
     
END Data_flow;
