library ieee;
use ieee.std_logic_1164.all;

Entity my_or is
port( a,b : in std_logic;
	z : out std_logic);

end my_or;

Architecture a_my_or of my_or is
begin
        z <= a or b;
end a_my_or;

