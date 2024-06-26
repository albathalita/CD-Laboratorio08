library ieee;
use ieee.std_logic_1164.all;

entity Reg_Y is
	port( 	       E : in std_logic_vector(3 downto 0);
	     clear, load : in std_logic;
		   clock : in std_logic;
		       S : out std_logic_vector(3 downto 0));
end Reg_Y;

architecture logic of Reg_Y is
	
component FF_D is
	port(ck, clr, set, d :  in std_logic;
			   q : out std_logic);
end component;

component Mux_2x1 is
	port(E1, E0 :  in std_logic;
		 k0 :  in std_logic;
		  S : out std_logic);
end component;

signal D, Q : std_logic_vector(3 downto 0);
signal set  : std_logic := '1';

begin
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