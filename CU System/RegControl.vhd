LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY RegControl IS 
	PORT  (	SRCin:  IN  std_logic ;
            SRCout: IN  std_logic ;
			DSTin:  IN  std_logic ;
			DSTout: IN  std_logic ;
			IR : IN std_logic_vector (15 DOWNTO 0) ;
			R1in  : out std_logic ;
			R1out : out std_logic ; 
			R2in  : out std_logic ;
			R2out : out std_logic ;
			R3in  : out std_logic ;
			R3out : out std_logic ;
			R4in  : out std_logic ;
			R4out : out std_logic 
	);
END ENTITY RegControl;

ARCHITECTURE a OF RegControl IS
	
	signal Rsrc : std_logic_vector(3 downto 0) ;  -- output of src decoder
	
	signal Rdst : std_logic_vector(3 downto 0) ;  -- output of dst decoder
	
	
	BEGIN	
		PROCESS (SRCin,SRCout,DSTin,DSTout,IR)
			BEGIN
				-- SRC register 
				IF(IR(9 DOWNTO 8) = "00"     ) THEN
					Rsrc <= "0001" ;
				ELSIF (IR(9 DOWNTO 8) = "01" ) THEN
					Rsrc <= "0010" ;
				ELSIF (IR(9 DOWNTO 8) = "10" ) THEN
					Rsrc <= "0100" ;
				ELSIF  (IR(9 DOWNTO 8) = "11" ) THEN
					Rsrc <= "1000" ;
				END IF ;
				
				-- DST register 
				IF(IR(4 DOWNTO 3) = "00"     ) THEN
					Rdst <= "0001" ;
				ELSIF (IR(4 DOWNTO 3) = "01" ) THEN
					Rdst <= "0010" ;
				ELSIF (IR(4 DOWNTO 3) = "10" ) THEN
					Rdst <= "0100" ;
				ELSIF  (IR(4 DOWNTO 3) = "11" ) THEN
					Rdst <= "1000" ;
				END IF ;
				
				-- R1 register generator
				R1in  <= (SRCin  AND Rsrc(0)) or (DSTin  AND Rdst(0)) ;
				R1out <= (SRCout AND Rsrc(0)) or (DSTout AND Rdst(0)) ;
				
				
				-- R2 register generator
				R2in  <= (SRCin  AND Rsrc(1)) or (DSTin  AND Rdst(1)) ;
				R2out <= (SRCout AND Rsrc(1)) or (DSTout AND Rdst(1)) ;
				
				
				-- R3 register generator
				R3in  <= (SRCin  AND Rsrc(2)) or (DSTin  AND Rdst(2)) ;
				R3out <= (SRCout AND Rsrc(2)) or (DSTout AND Rdst(2)) ;
								
				-- R4 register generator
				R4in  <= (SRCin  AND Rsrc(3)) or (DSTin  AND Rdst(3)) ;
				R4out <= (SRCout AND Rsrc(3)) or (DSTout AND Rdst(3)) ;
									
		END PROCESS;
	

	
	
END a;
