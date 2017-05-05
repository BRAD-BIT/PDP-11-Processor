LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY CU IS 
	PORT  ( ZF   : IN	 std_logic ; 
		    CF   : IN	 std_logic ;
		    NF   : IN	 std_logic ;
		    PF   : IN	 std_logic ;
		    O    : IN	 std_logic ;
		    IR   : IN     std_logic_vector(15 downto 0) ; -- this is the output of IR
    	    ClocK: IN std_logic ;
					 
			 -- Actual Registers signals
			R1in : OUT std_logic ;
			R1out: OUT std_logic ;	
			R2in : OUT std_logic ;
			R2out: OUT std_logic ;	
					      
			R4in : OUT std_logic ;
			R4out: OUT std_logic ;	
				   
			PCin : OUT std_logic ;	
			PCout : OUT std_logic ;	
				
			IRin : OUT std_logic ;
				
			tempin : OUT std_logic ;
			tempout: OUT std_logic ;	
				
			MDRin : OUT std_logic ;
			MDRout: OUT std_logic ;	
			MARin :OUT  std_logic ;	
				
			Yin  : OUT std_logic ;
			Yclr: OUT std_logic ;	
				
			WR : OUT std_logic ;	
			RE : OUT std_logic ;	
				
			G: OUT std_logic ; --Gate signal
				
			-- ALU signals
			ALU: OUT std_logic_vector(3 DOWNTO 0) ;
			ALUcin: OUT std_logic ;
			
			CarryConn: OUT std_logic ;
			CarryConn2: OUT std_logic ;
			
			
			
			IR_Address_Out: OUT std_logic 
	);

END ENTITY CU;



ARCHITECTURE  struct OF CU IS
	
	component RegControl IS 
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
	END component RegControl;

	
	component Decoder IS
	PORT(
	      output  : OUT std_logic_vector(15 DOWNTO 0);
	      input :IN std_logic_vector(3  DOWNTO 0)
	);
	END component Decoder;
	
	component InstrDecoder IS
	PORT( output  : OUT std_logic_vector(63 DOWNTO 0);
	      selection :IN std_logic_vector(5 DOWNTO 0) );
	END component InstrDecoder;
	
	component MPC IS
	PORT( Clk,Rst,en : IN std_logic;
		  d : IN  std_logic_vector(15 DOWNTO 0);
		  q : OUT std_logic_vector(15 DOWNTO 0));
	END component MPC;

	component rom IS
	PORT(
		address : IN  std_logic_vector(15 DOWNTO 0);
		CW : OUT std_logic_vector(23 DOWNTO 0));
	END component rom;
	
	
	-----------------------------------------------------------------------
	signal Level1IN1 : std_logic_vector(15 DOWNTO 0) ;   -- Addr generator
	signal Level1IN2 : std_logic_vector(15 DOWNTO 0) ;	 -- CW set
	signal Level1IN3 : std_logic_vector(15 DOWNTO 0) ;   -- Special OR
	------------------------------------------------------------------------
	signal MPCIN: std_logic_vector(15 DOWNTO 0);    -- input to MPC
	signal address: std_logic_vector(15 DOWNTO 0);  -- from MPC to ROM address

	signal instr: std_logic_vector(63 DOWNTO 0);  -- instruction lines
	-------------------------------------------------------------------------
	
	signal Csignals: std_logic_vector(31 DOWNTO 0) ; -- this is the signals from the 3 Decoders 
	
	signal CW:std_logic_vector(23 DOWNTO 0) ;
	signal MPI:std_logic ; -- microbranch signal  => MPC en

	signal N: std_logic ;
	signal M: std_logic ;	
	signal X: std_logic ;	
	
	-- general control
	signal SRCin : std_logic ;
	signal SRCout: std_logic ;	
	signal DSTin : std_logic ;
	signal DSTout: std_logic ;	
	
	signal R3in : std_logic ;   -- those control signals will never be used bec, we don't need the programmer to control PC register ,,
	signal R3out: std_logic ;	--   ,,    ,,        ,, 
		
	signal SaveResult :std_logic ;
	signal NOTSaveResult :std_logic ;
	
	signal ENDSignal :std_logic ;
	
	
	---TEMP SIGNALS DUE TO ERRORS --
	signal F2Decoder: std_logic_vector(3 DOWNTO 0)	;
	signal ORing: std_logic_vector(15 DOWNTO 0) ;
	signal AddGenerator: std_logic_vector(15 DOWNTO 0) ;
	
	signal x1 :std_logic ;
	signal x2 :std_logic ;
	signal x3 :std_logic ;
	signal x4 :std_logic ;
	
	signal Mode :std_logic ;
	signal BranchSignal :std_logic ;
BEGIN

	--                         output     input
	xx:InstrDecoder PORT MAP(instr,IR(15 DOWNTO 10)) ;
	yy:MPC PORT MAP(Clock ,ENDSignal,MPI, MPCIN,address) ;
	zz:ROM PORT MAP(address ,CW) ;
	
	-- Control signals Decoders    Output        input
	f1:Decoder PORT MAP(  CSignals(15 DOWNTO 0) , CW(23 DOWNTO 20)) ;
		SRCout<=CSignals(1)   ;
		DSTout<=CSignals(2)   ;
		tempout<=CSignals(3)   ;
		-- <=CSignals(4)   ;
		MDRout<=CSignals(5)   ;
		MPI <=CSignals(6) ;
	
	
	F2Decoder <= '0' & CW(18 DOWNTO 16) ;
	f2:Decoder PORT MAP(  CSignals(31 DOWNTO 16) ,F2Decoder) ; -- this is 3 bit decoder so the most significant bit is hardwired 0[4bit decoder used as 3bit one]
		SRCin<=Csignals(17)   ;
		DSTin<=Csignals(18)   ;
		IRin <=Csignals(19)   ;
		MDRin<=Csignals(20)   ;
		tempin<=Csignals(21)  ;
		--	flagin<=Csignals(22) <=   ;
		MARin <= CW(19) and NOT(MPI)  ; -- output MARin signal directly from CW to Csignals
	
	--F3
		Yin <=  CW(12) and NOT(MPI);
		Yclr<=  CW(13) and NOT(MPI);
		RE  <=  CW(14) and NOT(MPI);
		WR  <=  CW(15) and NOT(MPI);
	
	-- ALU 
		ALU    <= CW(11 DOWNTO 8) and (3 DOWNTO 0 => NOT(MPI));
		ALUcin <= CW(7) and NOT(MPI);
		
		G <= CW(6) and NOT(MPI);
		
		BranchSignal <= '1' when address = "0000000000000011" 
					ELSE '0' ;
		ENDSignal <= (CW(4) and NOT(MPI)) or (((instr(22) and not(ZF)) or (instr(23) and ZF) or (instr(24) and CF) or (instr(25) and not(not(CF) or ZF)) or (instr(26) and not(CF)) or (instr(27) and not(CF or ZF))) and BranchSignal);
		
		 --;  -- branch instr from 21 - 27   (21 = Unconditional branch)
		N <= CW(3) ;
		M <= CW(2) ;
		X <= CW(1) ;
		
		PCout <= (CW(5) and NOT(MPI)) or R3out ; 
		PCin <=  (CW(0) and NOT(MPI)) or R3in  ;
		
		CarryConn <= M and NOT(MPI);
		CarryConn2<= N and NOT(MPI);
		IR_Address_Out <= X and NOT(MPI); 
	-- CW fully decoded --
	

	-- Actual control register signals CIRCUIT --
	zxz:RegControl PORT MAP (SRCin,SRCout,DSTin,DSTout,IR,R1in,R1out,R2in,R2out ,R3in,R3out,R4in,R4out) ;

	-- CU circuit
	
	-- Decode CW to generate saveresult signal
	x1 <= ((CW(19) NOR CW(18)) NOR CW(17)) NOR CW(16);
	x2 <= not(CW(15)) AND not(CW(14)) AND CW(13) AND not(CW(12));
	x3 <= CW(11) AND CW(10) AND not(CW(9)) AND not(CW(8)) ;
	x4 <= ((CW(7) NOR CW(6)) NOR CW(5)) NOR CW(4);  -- to generate saveresult signal
	
	SaveResult <=  MPI AND x1 AND x2 AND x3 AND x4;
	NOTSaveResult <= not(SaveResult) ;
	
	Mode <= CW(10) or CW(11) ; -- if MOde == 0 then OR srcMODE if MOde == 1 then OR DstMode in IR
	ORing <=  ( 1  => (IR(0) or IR(1) or IR(2))  and SaveResult ,  
				5  =>((IR(2) and  Mode) or (IR(7) and not(Mode))) and NOTSaveResult, 
				4  =>((IR(1) and  Mode) or (IR(6) and not(Mode))) and NOTSaveResult,  
				3  =>((IR(0) and  Mode) or (IR(5) and not(Mode))) and NOTSaveResult, 
		    others => '0' ) ;
			
	AddGenerator<=(  3 => (instr(28)or instr(30))
		,	4 => (instr(0) or instr(2) or instr(4)or instr(6)or instr(8)  or instr(10)or instr(12)or instr(14)or instr(16)or instr(18)or instr(20)or instr(22)or instr(24)or instr(26)or instr(29)or instr(30)or instr(31)) 
		,   5 => (instr(1) or instr(2) or instr(5)or instr(6)or instr(9)  or instr(10)or instr(13)or instr(14)or instr(17)or instr(18)or instr(21)or instr(22)or instr(25)or instr(26)or instr(31))
		,   6 => (instr(3) or instr(4) or instr(5)or instr(6)or instr(11)  or instr(12)or instr(13)or instr(14)or instr(19)or instr(20)or instr(21)or instr(22)or instr(27)or instr(28)or instr(29)or instr(30) or instr(31))
		,   7 => (instr(7) or instr(8) or instr(9)or instr(10)or instr(11)  or instr(12)or instr(13)or instr(14) or instr(23)or instr(24)or instr(25)or instr(26)or instr(27)or instr(28)or instr(29)or instr(30)or instr(31)) 
		,   8 => (instr(15) or instr(16) or instr(17)or instr(18)or instr(19)  or instr(20)or instr(21)or instr(22)or instr(23)or instr(24)or instr(25)or instr(26)or instr(27) or instr(28)or instr(29)or instr(30)or instr(31))
		, others =>  '0' ) ;	
	
	
	Level1IN3 <= (15 DOWNTO 0 =>X) and ORing ; -- this is special OR address part
	Level1IN2 <= (15 DOWNTO 0 =>M) and CW(19 DOWNTO 4) ; -- this is CW set address part
	Level1IN1 <= (15 DOWNTO 0 =>N ) and AddGenerator ; 

	MPCIN <= (Level1IN1 or Level1IN2 or Level1IN3) ;  -- level one or array
	
END struct;


