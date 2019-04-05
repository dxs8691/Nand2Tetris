library ieee;
use ieee.std_logic_1164.all;

entity and16_gate is
  port(
    i0 : in std_logic_vector(15 downto 0);
    i1 : in std_logic_vector(15 downto 0);
    and16_out : out std_logic_vector(15 downto 0)
    );
end and16_gate;

architecture rtl of and16_gate is

  component and_gate is
    port(
      i0 : in std_logic;
      i1 : in std_logic;
      and_out : out std_logic
      );
  end component and_gate;

  signal out_vec : std_logic_vector(15 downto 0);

begin

  and0 : and_gate port map(i0 => i0(0), i1 => i1(0), and_out => out_vec(0));
  and1 : and_gate port map(i0 => i0(1), i1 => i1(1), and_out => out_vec(1));
  and2 : and_gate port map(i0 => i0(2), i1 => i1(2), and_out => out_vec(2));
  and3 : and_gate port map(i0 => i0(3), i1 => i1(3), and_out => out_vec(3));
  and4 : and_gate port map(i0 => i0(4), i1 => i1(4), and_out => out_vec(4));
  and5 : and_gate port map(i0 => i0(5), i1 => i1(5), and_out => out_vec(5));
  and6 : and_gate port map(i0 => i0(6), i1 => i1(6), and_out => out_vec(6));
  and7 : and_gate port map(i0 => i0(7), i1 => i1(7), and_out => out_vec(7));
  and8 : and_gate port map(i0 => i0(8), i1 => i1(8), and_out => out_vec(8));
  and9 : and_gate port map(i0 => i0(9), i1 => i1(9), and_out => out_vec(9));
  and10: and_gate port map(i0 => i0(10), i1 => i1(10), and_out => out_vec(10));
  and11: and_gate port map(i0 => i0(11), i1 => i1(11), and_out => out_vec(11));
  and12: and_gate port map(i0 => i0(12), i1 => i1(12), and_out => out_vec(12));
  and13: and_gate port map(i0 => i0(13), i1 => i1(13), and_out => out_vec(13));
  and14: and_gate port map(i0 => i0(14), i1 => i1(14), and_out => out_vec(14));
  and15: and_gate port map(i0 => i0(15), i1 => i1(15), and_out => out_vec(15));

  and16_out <= out_vec;

end rtl;

