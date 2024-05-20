library ieee;
use ieee.std_logic_1164.all;

entity porta_AND is
	port (	A, B:  in std_logic_vector(9 downto 0);
		   O: out std_logic_vector(9 downto 0));
end porta_AND;

architecture logic of porta_AND is

begin
	O(9) <= (A(9) and B(9));
	O(8) <= (A(8) and B(8));
	O(7) <= (A(7) and B(7));
	O(6) <= (A(6) and B(6));
	O(5) <= (A(5) and B(5));
	O(4) <= (A(4) and B(4));
	O(3) <= (A(3) and B(3));
	O(2) <= (A(2) and B(2));
	O(1) <= (A(1) and B(1));
	O(0) <= (A(0) and B(0));

end logic;
