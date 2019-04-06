library ieee;
use ieee.std_logic_1164.all;

entity xor_gate is
  port(
    i0 : in std_logic;
    i1 : in std_logic;
    xor_out : out std_logic
    );
end xor_gate;

architecture rtl of xor_gate is
  component nand_gate is
    port(
      i0 : in std_logic;
      i1 : in std_logic;
      nand_out: out std_logic
      );
  end component nand_gate;

  signal s0, s1, s2, out0 : std_logic;

begin

  nand0 : nand_gate port map(i0 => i0, i1 => i1, nand_out => s0);
  nand1 : nand_gate port map(i0 => i0, i1 => s0, nand_out => s1);
  nand2 : nand_gate port map(i0 => s0, i1 => i1, nand_out => s2);
  nand3 : nand_gate port map(i0 => s1, i1 => s2, nand_out => out0);

  xor_out <= out0;

end rtl;
