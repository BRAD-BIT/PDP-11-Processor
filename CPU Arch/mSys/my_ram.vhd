library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


Entity my_ram is
	port (
		clk : in std_logic;
		wr_sig : in std_logic;
		re_sig : in std_logic;
		address : in std_logic_vector(5 downto 0);
		datain : in std_logic_vector(15 downto 0);
		dataout : out std_logic_vector(15 downto 0) );
end entity my_ram;

architecture a_my_ram of my_ram is
   
	type ram_type is array(0 to 63) of std_logic_vector(15 downto 0);

signal ram : ram_type ;
begin
	process(clk,re_sig,address,wr_sig) is
  		Begin
			if falling_edge(clk) then  
  				if wr_sig = '1' then
  				ram(to_integer(unsigned(address))) <= datain;
				
  				end if;
			end if;
			
			 
				dataout <= ram(to_integer(unsigned(address)));
			
			
	end process;

end architecture a_my_ram;

