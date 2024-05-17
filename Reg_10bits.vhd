library ieee;
use ieee.std_logic_1164.all;

entity Reg_10bits is
	port( 	    E : in std_logic_vector(9 downto 0);
	         load : in std_logic;
		clock : in std_logic;
		    S : out std_logic_vector(9 downto 0)
	);
end Reg_10bits;

architecture logic of Reg_10bits is
	
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

signal D, Q : std_logic_vector(9 downto 0);
signal set  : std_logic := '1';
signal clear: std_logic := '1';

begin

	M9 : Mux_2x1 port map(D(9), E(9), load, Q(9));
	F9 : FF_D port map(clock, clear, set, Q(9), D(9));

	M8 : Mux_2x1 port map(D(8), E(8), load, Q(8));
	F8 : FF_D port map(clock, clear, set, Q(8), D(8));

	M7 : Mux_2x1 port map(D(7), E(7), load, Q(7));
	F7 : FF_D port map(clock, clear, set, Q(7), D(7));

	M6 : Mux_2x1 port map(D(6), E(6), load, Q(6));
	F6 : FF_D port map(clock, clear, set, Q(6), D(6));

	M5 : Mux_2x1 port map(D(5), E(5), load, Q(5));
	F5 : FF_D port map(clock, clear, set, Q(5), D(5));

	M4 : Mux_2x1 port map(D(4), E(4), load, Q(4));
	F4 : FF_D port map(clock, clear, set, Q(4), D(4));
	
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
