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

	M9 : Mux_2x1 port map(Q(9), E(9), load, D(9));
	F9 : FF_D port map(clock, clear, set, D(9), Q(9));

	M8 : Mux_2x1 port map(Q(8), E(8), load, D(8));
	F8 : FF_D port map(clock, clear, set, D(8), Q(8));

	M7 : Mux_2x1 port map(Q(7), E(7), load, D(7));
	F7 : FF_D port map(clock, clear, set, D(7), Q(7));

	M6 : Mux_2x1 port map(Q(6), E(6), load, D(6));
	F6 : FF_D port map(clock, clear, set, D(6), Q(6));

	M5 : Mux_2x1 port map(Q(5), E(5), load, D(5));
	F5 : FF_D port map(clock, clear, set, D(5), Q(5));

	M4 : Mux_2x1 port map(Q(4), E(4), load, D(4));
	F4 : FF_D port map(clock, clear, set, D(4), Q(4));
	
	M3 : Mux_2x1 port map(Q(3), E(3), load, D(3));
	F3 : FF_D port map(clock, clear, set, D(3), Q(3));

	M2 : Mux_2x1 port map(Q(2), E(2), load, D(2));
	F2 : FF_D port map(clock, clear, set, D(2), Q(2));

	M1 : Mux_2x1 port map(Q(1), E(1), load, D(1));
	F1 : FF_D port map(clock, clear, set, D(1), Q(1));

	M0 : Mux_2x1 port map(Q(0), E(0), load, D(0));
	F0 : FF_D port map(clock, clear, set, D(0), Q(0));

	S <= Q;

end logic;
