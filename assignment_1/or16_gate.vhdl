library ieee;
use ieee.std_logic_1164.all;

entity or16_gate is
  port(
    i0_16 : in std_logic_vector(15 downto 0);
    i1_16 : in std_logic_vector(15 downto 0);
    out0_16 : out std_logic_vector(15 downto 0)
    );
end entity;


architecture rtl of or16_gate is
  component or_gate is
    port(
      i0 : in std_logic;
      i1 : in std_logic;
      or_out: out std_logic
      );
  end component or_gate;

  signal out_16 : std_logic_vector(15 downto 0);

begin
  
  or0 : or_gate port map(i0 => i0_16(0), i1 => i1_16(0), or_out => out_16(0));
  or1 : or_gate port map(i0 => i0_16(1), i1 => i1_16(1), or_out => out_16(1));
  or2 : or_gate port map(i0 => i0_16(2), i1 => i1_16(2), or_out => out_16(2));
  or3 : or_gate port map(i0 => i0_16(3), i1 => i1_16(3), or_out => out_16(3));
  or4 : or_gate port map(i0 => i0_16(4), i1 => i1_16(4), or_out => out_16(4));
  or5 : or_gate port map(i0 => i0_16(5), i1 => i1_16(5), or_out => out_16(5));
  or6 : or_gate port map(i0 => i0_16(6), i1 => i1_16(6), or_out => out_16(6));
  or7 : or_gate port map(i0 => i0_16(7), i1 => i1_16(7), or_out => out_16(7));
  or8 : or_gate port map(i0 => i0_16(8), i1 => i1_16(8), or_out => out_16(8));
  or9 : or_gate port map(i0 => i0_16(9), i1 => i1_16(9), or_out => out_16(9));
  or10: or_gate port map(i0 => i0_16(10), i1 => i1_16(10), or_out => out_16(10));
  or11: or_gate port map(i0 => i0_16(11), i1 => i1_16(11), or_out => out_16(11));
  or12: or_gate port map(i0 => i0_16(12), i1 => i1_16(12), or_out => out_16(12));
  or13: or_gate port map(i0 => i0_16(13), i1 => i1_16(13), or_out => out_16(13));
  or14: or_gate port map(i0 => i0_16(14), i1 => i1_16(14), or_out => out_16(14));
  or15: or_gate port map(i0 => i0_16(15), i1 => i1_16(15), or_out => out_16(15));

  out0_16 <= out_16;

end rtl;
