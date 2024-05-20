library ieee;
use ieee.std_logic_1164.all;

entity lab_08 is
	port( SW: in std_logic_vector(7 downto 0);
			ld_out, ld_r, clr_r, en_cod: in std_logic;
			s_cod: in std_logic_vector(1 downto 0);
			clock: in std_logic;
			ledr: out std_logic;
	      HEX2,HEX1,HEX0: out std_logic_vector(0 to 6));
end lab_08;

architecture logica of lab_08 is

component ck_div is
   port (ck_in : in  std_logic;
         ck_out: out std_logic);
end component;

component Reg_RxC is
	port(               Y, C : in std_logic_vector(3 downto 0);
	       LD_C, LD_R, clr_r : in std_logic;
	                   clock : in std_logic;
	                 Y_saida : out std_logic_vector(3 downto 0);
	                       S : out std_logic_vector(9 downto 0));
end component;

component somador_10bits is
	port( A, B: in std_logic_vector(9 downto 0);
	         O: out std_logic_vector(9 downto 0);
	      Cout: out std_logic);
end component;

component cod_2x4 is
	port(     S_COD  :  in std_logic_vector(1 downto 0);
		  EN_COD :  in std_logic;
	      C0, C1, C2 : out std_logic);
end component;

component Reg_10bits is
	port( 	    E : in std_logic_vector(9 downto 0);
	         load : in std_logic;
		clock : in std_logic;
		    S : out std_logic_vector(9 downto 0)
	);
end component;

component ckt_BCD is
	port( SW: in std_logic_vector(9 downto 0);
	      HEX2,HEX1,HEX0: out std_logic_vector(0 to 6));
end component;

signal ck : std_logic;

signal ld_c0, ld_c1, ld_c2 : std_logic;
--signal ld_r   : std_logic;

--signal ld_out : std_logic;

signal Y : std_logic_vector(3 downto 0);
signal C : std_logic_vector(3 downto 0);
signal Y_s0, Y_s1, Y_s2 : std_logic_vector(3 downto 0);
signal S0, S1, S2 : std_logic_vector(9 downto 0);

signal Som_aux, Soma : std_logic_vector(9 downto 0);
signal cout1, cout2 : std_logic;

signal F : std_logic_vector(9 downto 0);


begin

	Y     <= SW(3 downto 0);
	C     <= SW(7 downto 4);

	C_D : ck_div port map(clock, ck);
	
	Cod : cod_2x4 port map(s_cod, en_cod, ld_c0, ld_c1, ld_c2);
	
	RxC0 : Reg_RxC port map(Y, C, ld_c0, ld_r, clr_r, ck, Y_s0, S0);
	
	RxC1 : Reg_RxC port map(Y_s0, C, ld_c1, ld_r, clr_r, ck, Y_s1, S1);
	
	RxC2 : Reg_RxC port map(Y_s1, C, ld_c2, ld_r, clr_r, ck, Y_s2, S2);
	
	Som1 : somador_10bits port map(S0, S1, Som_aux, cout1);
	
	Som2 : somador_10bits port map(Som_aux, S2, Soma, cout2);
	
	Reg : Reg_10bits port map(Soma, ld_out, ck, F);

	BCD : ckt_BCD port map(F, HEX2,HEX1,HEX0);
	
	ledr <= ck;

end logica;