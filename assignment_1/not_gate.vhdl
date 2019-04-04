library ieee;
use ieee.std_logic_1164.all;

entity not_gate is
  port(
    i0 : in std_logic;
    not_out : out std_logic
    );
end not_gate;

architecture rtl of not_gate is
  component nand_gate is
    port(
      input_1 : in std_logic;
      input_2 : in std_logic;
      nand_out: out std_logic
      );
  end component nand_gate;

  signal gate_out : std_logic;
  
begin

  g0 : nand_gate
    port map(
      input_1 => i0,
      input_2 => i0,
      nand_out => gate_out
      );

  not_out <= gate_out;

end rtl;

  
