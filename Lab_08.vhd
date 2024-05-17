library ieee;
use ieee.std_logic_1164.all;

entity lab_08 is
	port( SW: in std_logic_vector(12 downto 0);
	       F: out std_logic_vector(9 downto 0));
end lab_08;

architecture logica of lab_08 is

signal Y : std_logic_vector(3 downto 0);
signal C : std_logic_vector(3 downto 0);
signal en_cod : std_logic;
signal ld_r   : std_logic;
signal ld_out : std_logic;
signal s_cod : std_logic_vector(1 downto 0);

begin

	Y     <= SW(3 downto 0);
	C     <= SW(7 downto 4);
	s_cod <= SW(12 downto 11);

	en_cod <= SW(8);
	ld_r   <= SW(9);
	ld_out <= SW(10);



end logica;