library ieee;
use ieee.std_logic_1164.all;

entity cod_2x4 is
	port(     S_COD  :  in std_logic_vector(1 downto 0);
		  EN_COD :  in std_logic;
	      C0, C1, C2 : out std_logic
	);
end cod_2x4;

architecture logic of cod_2x4 is

begin

	C0 <= (EN_COD and not(S_COD(0)) and not(S_COD(1)));
	C1 <= (EN_COD and not(S_COD(0)) and     S_COD(1) );
	C2 <= (EN_COD and     S_COD(0)  and not(S_COD(1)));

end logic;
