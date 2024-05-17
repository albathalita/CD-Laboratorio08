library ieee;
use ieee.std_logic_1164.all;

entity Reg_C is
	port( 	    E : in std_logic_vector(3 downto 0);
	         load : in std_logic;
		clock : in std_logic;
		    S : out std_logic_vector(3 downto 0)
	);
end Reg_C;

architecture logic of Reg_C is
	
component FF_D is
	port(ck, clr, set, d :  in std_logic;
			   q : out std_logic
	);
end component;

component Mux_2x1 is
	port(E1, E0 :  in std_logic;
		 k0 :  in std_logic;
		  S : out std_logic
	);
end component;

signal D, Q : std_logic_vector(3 downto 0);
signal set  : std_logic := '1';
signal clear: std_logic := '1';

begin

	
	M3 : Mux_2x1 port map(D(3), E(3), load, Q(3));
	F3 : FF_D port map(clock, clear, set, Q(3), D(3));

	M2 : Mux_2x1 port map(D(2), E(2), load, Q(2));
	F2 : FF_D port map(clock, clear, set, Q(2), D(2));

	M1 : Mux_2x1 port map(D(1), E(1), load, Q(1));
	F1 : FF_D port map(clock, clear, set, Q(1), D(1));

	M0 : Mux_2x1 port map(D(0), E(0), load, Q(0));
	F0 : FF_D port map(clock, clear, set, Q(0), D(0));

	

	S <= Q;

end logic;