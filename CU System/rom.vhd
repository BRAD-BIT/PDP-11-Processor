LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY rom IS
	PORT(
		address : IN  std_logic_vector(15 DOWNTO 0);
		CW : OUT std_logic_vector(23 DOWNTO 0));
END ENTITY rom;

ARCHITECTURE sync_ram_a OF rom IS

	TYPE ram_type IS ARRAY(0 TO 1024) OF std_logic_vector(23 DOWNTO 0);
	SIGNAL rom : ram_type ;
	
	BEGIN
		CW <= rom(to_integer(unsigned(address)));
END sync_ram_a;
