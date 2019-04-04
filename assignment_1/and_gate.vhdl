library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
  port(
    i0 : in std_logic;
    i1 : in std_logic;
    and_out: out std_logic
    );
end and_gate;

architecture rtl of and_gate is
  component nand_gate is
    port(
      input_1 : in std_logic;
      input_2 : in std_logic;
      nand_out: out std_logic
      );
  end component nand_gate;

  component not_gate is
    port(
      i0 : in std_logic;
      not_out : out std_logic
      );
  end component not_gate;

  signal s0, s1 : std_logic;

begin

  nand0 : nand_gate port map(input_1 => i0, input_2 => i1, nand_out => s0);
  not0 : not_gate port map(i0 => s0, not_out => s1);

  and_out <= s1;

end rtl;
  
