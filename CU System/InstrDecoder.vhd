LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY InstrDecoder IS
	PORT( output  : OUT std_logic_vector(63 DOWNTO 0);
	      selection :IN std_logic_vector(5 DOWNTO 0)
	);
END InstrDecoder;



ARCHITECTURE a_Decoder OF InstrDecoder IS
	BEGIN
		PROCESS(selection)
		BEGIN
			IF(    selection = "000000") THEN
				output <= (0 => '1', others => '0');	
			ELSIF (selection = "000001" ) THEN
				output <= (1 => '1', others =>  '0');
			ELSIF (selection = "000010" ) THEN
				output <= (2 => '1', others =>  '0');
			ELSIF (selection = "000011" ) THEN
				output <= (3 => '1', others =>  '0');
			ELSIF (selection = "000100" ) THEN
				output <= (4 => '1', others =>  '0');
			ELSIF (selection = "000101" ) THEN
				output <= (5 => '1', others =>  '0');
			ELSIF (selection = "000110" ) THEN
				output <= (6 => '1', others =>  '0');
			ELSIF (selection = "000111" ) THEN
				output <= (7 => '1', others =>  '0');
			ELSIF (selection = "001000" ) THEN
				output <= (8 => '1', others =>  '0');
			ELSIF (selection = "001001" ) THEN
				output <= (9 => '1', others =>  '0');
					
			-- 2 operands instr
			
			ELSIF (selection = "010000" ) THEN
				output <= (10 => '1', others =>  '0');
			ELSIF (selection = "010001" ) THEN
				output <= (11 => '1', others =>  '0');
			ELSIF (selection = "010010" ) THEN
				output <= (12 => '1', others =>  '0');
			ELSIF (selection = "010011" ) THEN
				output <= (13 => '1', others =>  '0');
			ELSIF (selection = "010100" ) THEN
				output <= (14 => '1', others =>  '0');
			ELSIF (selection = "010101" ) THEN
				output <= (15 => '1', others =>  '0');
			ELSIF (selection = "010110" ) THEN
				output <= (16 => '1', others =>  '0');
			ELSIF (selection = "010111" ) THEN
				output <= (17 => '1', others =>  '0');
			ELSIF (selection = "011000" ) THEN
				output <= (18 => '1', others =>  '0');
			ELSIF (selection = "011001" ) THEN
				output <= (19 => '1', others =>  '0');
			ELSIF (selection = "011010" ) THEN
				output <= (20 => '1', others =>  '0');
				
			-- 1 operands instr
			
			ELSIF (selection = "110000" ) THEN
				output <= (21 => '1', others =>  '0');
			ELSIF (selection = "110001" ) THEN
				output <= (22 => '1', others =>  '0');
			ELSIF (selection = "110010" ) THEN
				output <= (23 => '1', others =>  '0');
			ELSIF (selection = "110011" ) THEN
				output <= (24 => '1', others =>  '0');
			ELSIF (selection = "110100" ) THEN
				output <= (25 => '1', others =>  '0');
			ELSIF (selection = "110101" ) THEN
				output <= (26 => '1', others =>  '0');
			ELSIF (selection = "110110" ) THEN
				output <= (27 => '1', others =>  '0');
			-- others 
			
			ELSIF (selection = "111000" ) THEN
				output <= (28 => '1', others =>  '0');
			ELSIF (selection = "111001" ) THEN
				output <= (29 => '1', others =>  '0');
			ELSIF (selection = "111010" ) THEN
				output <= (30 => '1', others =>  '0');
			ELSIF (selection = "111011" ) THEN
				output <= (31 => '1', others =>  '0');
		
			
			
			
			END IF;
		END PROCESS;
END a_Decoder;
