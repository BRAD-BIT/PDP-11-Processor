LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY Decoder IS
	PORT(
	      output  : OUT std_logic_vector(15 DOWNTO 0);
	      input :IN std_logic_vector(3  DOWNTO 0)
	);
END Decoder;



ARCHITECTURE a_Decoder OF Decoder IS
	BEGIN
		PROCESS(input)
		BEGIN
			IF(input = "0000"     ) THEN
				output <= "0000000000000001" ;
			ELSIF (input = "0001" ) THEN
				output <= "0000000000000010" ;
			ELSIF (input = "0010" ) THEN
				output <= "0000000000000100" ;
			ELSIF  (input = "0011" ) THEN
				output <= "0000000000001000" ;
			ELSIF  (input = "0100" ) THEN
				output <= "0000000000010000" ;
			ELSIF  (input = "0101" ) THEN
				output <= "0000000000100000" ;
			ELSIF  (input = "0110" ) THEN
				output <= "0000000001000000" ;
			ELSIF  (input = "0111" ) THEN
				output <= "0000000010000000" ;
			ELSIF  (input = "1000" ) THEN
				output <= "0000000100000000" ;
			ELSIF (input = "1001" ) THEN
				output <= "0000001000000000" ;
			ELSIF (input = "1010" ) THEN
				output <= "0000010000000000" ;
			ELSIF  (input = "1011" ) THEN
				output <= "0000100000000000" ;
			ELSIF  (input = "1100" ) THEN
				output <= "0001000000000000" ;
			ELSIF  (input = "1101" ) THEN
				output <= "0010000000000000" ;
			ELSIF  (input = "1110" ) THEN
				output <= "0100000000000000" ;
			ELSIF  (input = "1111" ) THEN
				output <= "1000000000000000" ;
			
			END IF;
		END PROCESS;
END a_Decoder;
