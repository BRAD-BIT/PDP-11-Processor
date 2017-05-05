LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY my_tri IS
	PORT(
		  en: IN std_logic;
		  input_tri: IN std_logic_vector(15 DOWNTO 0);
		  output_tri: OUT std_logic_vector(15 DOWNTO 0));
END my_tri;

ARCHITECTURE a_my_tri OF my_tri IS
	BEGIN
		   output_tri <= input_tri when en = '1'
		   ELSE "ZZZZZZZZZZZZZZZZ";
END a_my_tri;
