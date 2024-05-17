library ieee;
use ieee.std_logic_1164.all;

entity Reg_RxC is
	port(               Y, C : in std_logic_vector(3 downto 0);
	       LD_C, LD_R, clr_r : in std_logic;
	                   clock : in std_logic;
	                 Y_saida : out std_logic_vector(3 downto 0);
	                       S : out std_logic_vector(9 downto 0)
	);
end Reg_RxC;

architecture logic of Reg_RxC is
	

component Reg_Y is
	port( 	       E : in std_logic_vector(3 downto 0);
	     clear, load : in std_logic;
		   clock : in std_logic;
		       S : out std_logic_vector(3 downto 0));
end component;

component Reg_C is
	port(       E : in std_logic_vector(3 downto 0);
	         load : in std_logic;
		clock : in std_logic;
		    S : out std_logic_vector(3 downto 0));
end component;

component Multiplicador is
	port ( A, B: in std_logic_vector(3 downto 0);
	         O : out std_logic_vector(9 downto 0);
	      Cout : out std_logic);
end component;

signal Aux_Y, Aux_C : std_logic_vector(3 downto 0);
signal Aux_Mult     : std_logic_vector(9 downto 0);


begin

	R1: Reg_Y port map(Y, clr_r, LD_R, clock, Aux_Y);
	R2: Reg_C port map(C, LD_C, clock, Aux_C);

	M1: Multiplicador port map(Aux_Y, Aux_C, Aux_Mult);


	Y_saida <= Aux_Y;
	S       <= Aux_Mult;

end logic;