library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
  port(
    i0 : in std_logic;
    i1 : in std_logic;
    or_out : out std_logic
    );
end or_gate;

architecture rtl of or_gate is
  component nand_gate is
    port(
      i0 : in std_logic;
      i1 : in std_logic;
      nand_out : out std_logic
      );
  end component nand_gate;

  component not_gate is
    port(
      i0 : in std_logic;
      not_out : out std_logic
      );
  end component not_gate;

  signal s0,s1,s2 : std_logic;

begin
  not0 : not_gate port map(i0 => i0, not_out => s0);
  not1 : not_gate port map(i0 => i1, not_out => s1);
  nand0:nand_gate port map(i0 => s0, i1 => s1, nand_out => s2);

  or_out <= s2;

end rtl;
  
