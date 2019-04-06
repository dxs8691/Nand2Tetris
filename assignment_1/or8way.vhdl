library ieee;
use ieee.std_logic_1164.all;

entity or8way is
  port(
    i0_8 : in std_logic_vector(7 downto 0);
    or8out : out std_logic
    );
end entity;

architecture rtl of or8way is
  component or_gate is
    port(
      i0 : in std_logic;
      i1 : in std_logic;
      or_out: out std_logic
      );
  end component or_gate;

  signal s0, s1, s2, s3, s4, s5, sout : std_logic;

begin

  or0 : or_gate port map(i0 => i0_8(0), i1 => i0_8(1), or_out => s0);
  or1 : or_gate port map(i0 => i0_8(2), i1 => s0, or_out => s1);
  or2 : or_gate port map(i0 => i0_8(3), i1 => s1, or_out => s2);
  or3 : or_gate port map(i0 => i0_8(4), i1 => s2, or_out => s3);
  or4 : or_gate port map(i0 => i0_8(5), i1 => s3, or_out => s4);
  or5 : or_gate port map(i0 => i0_8(6), i1 => s4, or_out => s5);
  or6 : or_gate port map(i0 => i0_8(7), i1 => s5, or_out => sout);
  
  or8out <= sout;

end rtl;
