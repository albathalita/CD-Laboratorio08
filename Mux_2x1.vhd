library ieee;
use ieee.std_logic_1164.all;

entity Mux_2x1 is
	port(   E1, E0 :  in std_logic;
		k0 :  in std_logic;
		S : out std_logic
	);
end Mux_2x1;

architecture logic of Mux_2x1 is

begin

	S <= (E0 and     k0 ) or 
	     (E1 and not(k0));

end logic;