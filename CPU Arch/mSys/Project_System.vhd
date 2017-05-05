LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY project_system IS
	PORT  ( 
			
			
			system_out_bus          : INOUT    std_logic_vector (15 DOWNTO 0);
			system_in_bus           : INOUT    std_logic_vector (15 DOWNTO 0)
			
			
		);
END project_system;

ARCHITECTURE a_project_system OF project_system IS
	
	COMPONENT my_reg IS
	PORT( Clk,rst,en : IN std_logic;
		  d : IN  std_logic_vector(15 DOWNTO 0);
		  q : OUT std_logic_vector(15 DOWNTO 0));
	END COMPONENT;

	COMPONENT my_tri IS
	PORT(
		  en: IN std_logic;
		  input_tri: IN std_logic_vector(15 DOWNTO 0);
		  output_tri: OUT std_logic_vector(15 DOWNTO 0));
	END COMPONENT;

	COMPONENT my_ram is
	port (
		clk : in std_logic;
		wr_sig : in std_logic;
		re_sig : in std_logic;
		address : in std_logic_vector(5 downto 0);
		datain : in std_logic_vector(15 downto 0);
		dataout : out std_logic_vector(15 downto 0) );
	END COMPONENT;

	COMPONENT my_or is
	port( a,b : in std_logic;
		z : out std_logic);

	END COMPONENT;

	COMPONENT mux2 IS  
		PORT (
			s : IN  std_logic;			
			a, b: IN std_logic_vector(15 downto 0);		      
			z   : OUT std_logic_vector(15 downto 0));    
	END COMPONENT;

	COMPONENT ALU is
	port(     a,b  : IN std_logic_vector (15 DOWNTO 0) ;
		  s    : IN std_logic_vector (3 DOWNTO 0) ;
		  cin  : IN std_logic;       
		  cout : OUT std_logic;
		  flags : OUT std_logic_vector (15 DOWNTO 0); 
		  f    : OUT std_logic_vector (15 DOWNTO 0) 
		);
	end COMPONENT;
	
	COMPONENT CU IS 
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
			G: OUT std_logic ; 
			ALU: OUT std_logic_vector(3 DOWNTO 0) ;
			ALUcin: OUT std_logic ;
			
			CarryConn: OUT std_logic ;
			CarryConn2: OUT std_logic ;
			
			IR_Address_Out: OUT std_logic 
	);
	END COMPONENT CU;

	
	-- those signals fed from CU
	signal Rest_Y                  :     std_logic;
	signal read_memory             :     std_logic;
	signal write_memory            :     std_logic;
	
	signal Y_in                    :   std_logic;
	
	signal R1_In                   :    std_logic;
	signal R2_In                   :     std_logic;
	signal R3_In                   :     std_logic;
	signal R4_In                   :     std_logic;
	signal R1_Out                  :   std_logic;
	signal R2_Out                  :   std_logic;
	signal R3_Out                  :   std_logic;
	signal R4_Out                  :   std_logic;
	
	signal TEMP_Out                :   std_logic;
	signal TEMP_In                 :     std_logic;
	signal MAR_In                  :     std_logic;
	signal MDR_In                  :     std_logic;
	signal MDR_Out                 :   std_logic;

	signal Alu_Select          : std_logic_vector (3 DOWNTO 0) ;
	signal Alu_Cin		        : std_logic  ;
	
	signal X_enable	               :      std_logic;
	signal IR_IN		    	   :     std_logic;	
	signal IR_Address_Out          :   std_logic;
	-- those signals fed from CU
	
	
	signal Flag_Out                :   std_logic;
	
	
	-- need to be forced here not from CU
	signal rest_registers          :     std_logic;
	signal Rest_Temp               :     std_logic;    -- no need for specefic signal to reset alu  can be done with alu
	signal system_clock            :     std_logic;
	signal system_clockINV          :     std_logic;
	signal memory_clock            :     std_logic;
	-- need to be forced here not from CU
	
	
	-- signals specefic to the bus architecture
	SIGNAL R1_data_Out,R2_data_Out,R3_data_Out,R4_data_Out,TEMP_data_Out,MAR_data_Out,MDR_data_Out,MDR_data_IN,Memory_data_Out,Y_data_Out,Flag_data_IN,Flag_data_Out,IR_data_Out : std_logic_vector(15 DOWNTO 0);
	SIGNAL MDR_Enable,Alu_Cout,Flag_Enable: std_logic;	
	signal xx :std_logic_vector(15 DOWNTO 0);  -- input to buffer of ir register to leak ir offset onto the bus 
	
	signal ALUCINSET :std_logic ;
	signal CarryCon :std_logic ;
	signal CarryCon2 :std_logic ;

	signal NOTW :std_logic ;
	signal MUXSEL:std_logic ;
	
	signal MDRENABLE :std_logic ;
	
	signal ZFLAG : std_logic ;
	signal CFLAG : std_logic ;
	
	signal FLAG_REG : std_logic_vector(15 DOWNTO 0) ;
	
	BEGIN
	--------------------------------------------------------------------
	----					CONTROL UNIT							----
	--------------------------------------------------------------------
	XmX:CU port map (
			ZF  =>  Flag_data_Out(1) , 
		    CF  =>  Flag_data_Out(0) ,
		    NF  =>  Flag_data_Out(2) ,
		    PF  =>  Flag_data_Out(3) ,
		    O   =>  Flag_data_Out(4) ,
		    IR  =>  IR_data_Out ,
    	    ClocK=> system_clock  ,
			R1in => R1_In  ,
			R1out=> R1_Out  ,	
			R2in => R2_In  ,
			R2out=> R2_Out  ,	  
			R4in => R4_In  ,
			R4out=> R4_Out  ,	
			PCin => R3_In  ,	
			PCout =>R3_Out   ,	
			IRin => IR_IN  ,
			tempin =>TEMP_In   ,
			tempout=>TEMP_Out   ,	
			MDRin => MDR_In  ,
			MDRout=> MDR_Out  ,	
			MARin => MAR_In  ,	
			Yin  =>  Y_in ,
			Yclr=>   Rest_Y,					
			WR =>    write_memory,	
			RE =>    read_memory,	
			G=>      X_enable, 
			ALU=>    Alu_Select ,
			ALUcin=> Alu_Cin ,
			CarryConn=>  CarryCon ,
			CarryConn2=>  CarryCon2 ,
			IR_Address_Out=> IR_Address_Out   
	);
	--------------------------------------------------------------------
	
	
	
	u1: my_reg     port map (system_clock,rest_registers,R1_In   ,system_in_bus,R1_data_Out);--R1
	u2: my_reg     port map (system_clock,rest_registers,R2_In   ,system_in_bus,R2_data_Out);--R2
	u3: my_reg     port map (system_clock,rest_registers,R3_In   ,system_in_bus,R3_data_Out);--R3
	u4: my_reg     port map (system_clock,rest_registers,R4_In   ,system_in_bus,R4_data_Out);--R4
	u5: my_reg     port map (system_clock,rest_registers,Temp_In ,system_in_bus,TEMP_data_Out);--Temp
	system_clockINV<= NOT(system_clock) ;
	u6: my_reg     port map (system_clockINV,rest_registers,MAR_In  ,system_in_bus,MAR_data_Out);--MAR
	
	MDRENABLE <= (read_memory OR MDR_In) ;
	u7: my_reg     port map (system_clock,rest_registers,MDRENABLE,MDR_data_IN,MDR_data_Out);--MDR
	
	
	u8: my_reg     port map (system_clock,rest_Y,Y_in,system_out_bus,Y_data_Out);--Y
	
	u9 : my_tri     port map (R1_Out  ,R1_data_Out    ,system_out_bus);--tri state from R1 to output bus
	u10: my_tri     port map (R2_Out  ,R2_data_Out    ,system_out_bus);--tri state from R2 to output bus
	u11: my_tri     port map (R3_Out  ,R3_data_Out    ,system_out_bus);--tri state from R3 to output bus
	u12: my_tri     port map (R4_Out  ,R4_data_Out    ,system_out_bus);--tri state from R4 to output bus
	u13: my_tri     port map (TEMP_Out,TEMP_data_Out  ,system_out_bus);--tri state from Temp to output bus
	
	u14: my_tri     port map (MDR_Out ,MDR_data_Out   ,system_out_bus);--tri state from MDR to output bus
	
	u15: my_tri     port map (X_enable ,system_out_bus ,system_in_bus);--tri state from output bus to input bus
	
	NOTW<= NOT(write_memory);
	
	
	U16 : my_or     port map (NOTW,MDR_In,MDR_Enable); 
	
	MUXSEL <= NOTW AND NOT(MDR_In);
	U17 : mux2      port map (MUXSEL,system_in_bus,Memory_data_Out,MDR_data_IN);
	
	u18 : my_ram    port map (memory_clock,write_memory,read_memory,MAR_data_Out(5 downto 0),MDR_data_Out,Memory_data_Out);
	
	ALUCINSET <= Alu_Cin               when CarryCon = '0' 
			ELSE Flag_data_Out(0)	   when CarryCon = '1'  ;
	
	ZFLAG <= '1' when system_in_bus = "0000000000000000" 
			ELSE '0' ;
	
	CFLAG <= Alu_Cout ;
 	FLAG_REG <=  "00000000000000" & ZFLAG & NOT(CFLAG) ;
	
	U19 : ALU       port map (system_out_bus,Y_data_Out,Alu_Select,ALUCINSET,Alu_Cout,Flag_data_IN,system_in_bus);
	
	Flag_Enable <= (Alu_Select(0) or Alu_Select(1) or Alu_Select(2) or Alu_Select(3)) and not(Alu_Select(0) and Alu_Select(1) and Alu_Select(2) and Alu_Select(3));
	
	
	u20: my_reg     port map (system_clock,rest_registers,CarryCon2,FLAG_REG,Flag_data_Out);--Flag
	
    u21: my_tri     port map ('0' ,Flag_data_Out,system_out_bus);--tri state from Flag to output bus
	
	
	u22: my_reg     port map (system_clock,rest_registers,IR_IN,system_in_bus,IR_data_Out);--IR
	
	xx <= '0' & '0' & '0' & '0' & '0' & '0' & IR_data_Out(9 DOWNTO 0) ;
	u23: my_tri   port map (IR_Address_Out , xx ,system_out_bus);--tri state from IR to output bus
	
END a_project_system;
