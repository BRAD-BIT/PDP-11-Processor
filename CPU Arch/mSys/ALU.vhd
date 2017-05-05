-- interface 

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity ALU is
port(     a,b  : IN std_logic_vector (15 DOWNTO 0) ;
	  s    : IN std_logic_vector (3 DOWNTO 0) ;
	  cin  : IN std_logic;       
	  cout : OUT std_logic;
	  flags : OUT std_logic_vector (15 DOWNTO 0); 
	  f    : OUT std_logic_vector (15 DOWNTO 0) 
    );
end ALU;


-- implementation
architecture struct of ALU is
-- includes 
	
	component PartA	is	
		PORT ( a,b      : IN std_logic_vector (15 DOWNTO 0) ;
			  s0,s1,cin : IN  std_logic;
			  cout      : OUT  std_logic;
			  f         : OUT std_logic_vector (15 DOWNTO 0) 
			);
	end component;
	

	component PartB	is	
		PORT ( a,b  : IN std_logic_vector (15 DOWNTO 0) ;
			  s0,s1 : IN  std_logic;
	          f     : OUT std_logic_vector (15 DOWNTO 0) 
		);
	end component;
	

    component PartC  is  
		PORT (	a       : IN std_logic_vector (15 DOWNTO 0) ;
			  s0,s1 ,cin: IN  std_logic;
			  cout      : OUT  std_logic;
			  f         : OUT std_logic_vector (15 DOWNTO 0) 
		);
	end component ;


	component PartD  is  
		PORT (  a          : IN std_logic_vector (15 DOWNTO 0) ;
	            s0,s1 ,cin : IN  std_logic;
		     	cout       : OUT  std_logic;
		    	f          : OUT std_logic_vector (15 DOWNTO 0) 
		);
	end component ;

-- wires 
    signal  x1 :std_logic_vector (15 DOWNTO 0);
	signal  x2 :std_logic_vector (15 DOWNTO 0);
	signal  x3 :std_logic_vector (15 DOWNTO 0);
	signal  x4 :std_logic_vector (15 DOWNTO 0);
	
	signal  cout1,cout2,cout3,cout4 :std_logic;
	
	
	
	begin

		u3: PartA port map (a,b,s(0),s(1),cin,cout1,x1);
		u0: PartB port map (a,b,s(0),s(1),x2);
		u1: PartC port map (a,s(0),s(1),cin,cout3,x3);
		u2: PartD port map (a,s(0),s(1),cin,cout4,x4);
		cout2<='0';
		
		
		
		f <= "ZZZZZZZZZZZZZZZZ" WHEN s(3) = '0' and s(2) ='0' and s(1) = '0' and s(0) ='0'
		ELSE x1 WHEN s(3) = '0' and s(2) ='0'
		ELSE x2 WHEN s(3) = '0' and s(2) ='1'
		ELSE x3 WHEN s(3) = '1' and s(2) ='0'
		ELSE x4;		
		
		
		cout <= '0' WHEN s(3) = '0' and s(2) ='0' and s(1) = '0' and s(0) ='0'
		ELSE cout1 WHEN s(3) = '0' and s(2) ='0'
		ELSE cout2 WHEN s(3) = '0' and s(2) ='1'
		ELSE cout3 WHEN s(3) = '1' and s(2) ='0'
		ELSE cout4;	

		--flags
		flags(0) <= '0' WHEN s(3) = '0' and s(2) ='0' and s(1) = '0' and s(0) ='0'  -- carry
		ELSE cout1 WHEN s(3) = '0' and s(2) ='0'
		ELSE cout2 WHEN s(3) = '0' and s(2) ='1'
		ELSE cout3 WHEN s(3) = '1' and s(2) ='0'
		ELSE cout4;	

	    flags(1) <= not(x1(0) or x1(1) or x1(2) or x1(3) or x1(4) or x1(5) or x1(6) or x1(7) or x1(8) or x1(9) or x1(10) or x1(11) or x1(12) or x1(13) or x1(14) or x1(15)) ;
		
		
		flags(2) <= '0' WHEN s(3) = '0' and s(2) ='0' and s(1) = '0' and s(0) ='0'  --negative
		ELSE x1(15) WHEN s(3) = '0' and s(2) ='0'
		ELSE x2(15) WHEN s(3) = '0' and s(2) ='1'
		ELSE x3(15) WHEN s(3) = '1' and s(2) ='0'
		ELSE x4(15);	

        flags(3) <= '0' WHEN s(3) = '0' and s(2) ='0' and s(1) = '0' and s(0) ='0'  --parity
		ELSE not(x1(0)) WHEN s(3) = '0' and s(2) ='0'
		ELSE not(x2(0)) WHEN s(3) = '0' and s(2) ='1'
		ELSE not(x3(0)) WHEN s(3) = '1' and s(2) ='0'
		ELSE not(x4(0));	
		
		
		--overflow
	--flags(4)<='1' WHEN (unsigned(flags(2))+unsigned(flags(2))=unsigned((flags(3)) or flags(3)+flags(3)=flags(2) or flags(3)-flags(2)=flags(2) or flags(2)-flags(3)=flags(3) )
	--ELSE '0';
 
end struct;

