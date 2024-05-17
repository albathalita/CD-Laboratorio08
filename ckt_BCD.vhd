library ieee;
use ieee.std_logic_1164.all;

entity ckt_BCD is
	port( SW: in std_logic_vector(9 downto 0);
	      HEX2,HEX1,HEX0: out std_logic_vector(0 to 6));
end ckt_BCD;

architecture logica of ckt_BCD is

component display_7seg is
  port (w,x,y,z: in std_logic;
	A,B,C,D,E,F,G: out std_logic);
end component;

component bin_to_bcd is
  port (A3,A2,A1,A0: in std_logic;
	S3,S2,S1,S0: out std_logic);
end component;

  signal aux1 : std_logic_vector(0 to 3);
  signal aux2 : std_logic_vector(0 to 3);
  signal aux3 : std_logic_vector(0 to 3);
  signal aux4 : std_logic_vector(0 to 3);
  signal aux5 : std_logic_vector(0 to 3);
  signal aux6 : std_logic_vector(0 to 3);
  signal aux7 : std_logic_vector(0 to 3);

begin 

    U1: bin_to_bcd port map(SW(8),SW(7),SW(6),SW(5),aux1(0), aux1(1), aux1(2), aux1(3));
    U2: bin_to_bcd port map(aux1(1), aux1(2), aux1(3), SW(4), aux2(0), aux2(1), aux2(2), aux2(3));
    U3: bin_to_bcd port map(aux2(1), aux2(2), aux2(3), SW(3), aux3(0), aux3(1), aux3(2), aux3(3));
    U4: bin_to_bcd port map(SW(9), aux1(0), aux2(0), aux3(0), aux4(0), aux4(1), aux4(2), aux4(3));
    U5: bin_to_bcd port map(aux3(1), aux3(2), aux3(3), SW(2), aux5(0), aux5(1), aux5(2), aux5(3));
    U6: bin_to_bcd port map(aux4(1), aux4(2), aux4(3), aux5(0), aux6(0), aux6(1), aux6(2), aux6(3));
    U7: bin_to_bcd port map(aux5(1), aux5(2), aux5(3), SW(1), aux7(0), aux7(1), aux7(2), aux7(3));


    X1: display_7seg port map(aux7(1), aux7(2), aux7(3), SW(0), HEX0(0), HEX0(1), HEX0(2), HEX0(3), HEX0(4), HEX0(5), HEX0(6));
    X2: display_7seg port map(aux6(1), aux6(2), aux6(3), aux7(0), HEX1(0), HEX1(1), HEX1(2), HEX1(3), HEX1(4), HEX1(5), HEX1(6));
    X3: display_7seg port map('0', '0', aux4(0), aux6(0), HEX2(0), HEX2(1), HEX2(2), HEX2(3), HEX2(4), HEX2(5), HEX2(6));

end logica;
