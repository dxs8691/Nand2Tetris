library ieee;
use ieee.std_logic_1164.all;

entity nand_gate is 
	port(
		i0 :  in std_logic;
		i1 :  in std_logic;
		nand_out: out std_logic
	);
end nand_gate;

architecture rtl of nand_gate is 
	signal nand_op : std_logic;
begin
	nand_op <= i0 nand i1;
	nand_out <= nand_op;
end rtl;
