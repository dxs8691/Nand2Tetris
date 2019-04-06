library ieee;
use ieee.std_logic_1164.all;

entity not16_gate is
  port(
    i0_16 : in std_logic_vector(15 downto 0);
    out0_16: out std_logic_vector(15 downto 0)
    );
end entity;

architecture rtl of not16_gate is
  component not_gate is
    port(
      i0 : in std_logic;
      not_out : out std_logic
      );
  end component not_gate;

  signal out_16 : std_logic_vector(15 downto 0);

begin

  not0 : not_gate port map(i0 => i0_16(0), not_out => out_16(0));
  not1 : not_gate port map(i0 => i0_16(1), not_out => out_16(1));
  not2 : not_gate port map(i0 => i0_16(2), not_out => out_16(2));
  not3 : not_gate port map(i0 => i0_16(3), not_out => out_16(3));
  not4 : not_gate port map(i0 => i0_16(4), not_out => out_16(4));
  not5 : not_gate port map(i0 => i0_16(5), not_out => out_16(5));
  not6 : not_gate port map(i0 => i0_16(6), not_out => out_16(6));
  not7 : not_gate port map(i0 => i0_16(7), not_out => out_16(7));
  not8 : not_gate port map(i0 => i0_16(8), not_out => out_16(8));
  not9 : not_gate port map(i0 => i0_16(9), not_out => out_16(9));
  not10 : not_gate port map(i0 => i0_16(10), not_out => out_16(10));
  not11 : not_gate port map(i0 => i0_16(11), not_out => out_16(11));
  not12 : not_gate port map(i0 => i0_16(12), not_out => out_16(12));
  not13 : not_gate port map(i0 => i0_16(13), not_out => out_16(13));
  not14 : not_gate port map(i0 => i0_16(14), not_out => out_16(14));
  not15 : not_gate port map(i0 => i0_16(15), not_out => out_16(15));

  out0_16 <= out_16;

end rtl;
