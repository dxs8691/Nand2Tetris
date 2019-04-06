library ieee;
use ieee.std_logic_1164.all;

entity mux16 is
  port(
    i0_16 : in std_logic_vector(15 downto 0);
    i1_16 : in std_logic_vector(15 downto 0);
    sel : in std_logic;
    out0_16 : out std_logic_vector(15 downto 0)
    );
end entity;

architecture rtl of mux16 is
  component mux is
    port(
      i0 : in std_logic;
      i1 : in std_logic;
      sel: in std_logic;
      mux_out: out std_logic
      );
  end component mux;

  signal out_16 : std_logic_vector(15 downto 0);

begin
    
  mux0 : mux port map(i0 => i0_16(0), i1 => i1_16(0), sel => sel, mux_out => out_16(0));
  mux1 : mux port map(i0 => i0_16(1), i1 => i1_16(1), sel => sel, mux_out => out_16(1));
  or2 : mux port map(i0 => i0_16(2), i1 => i1_16(2), sel => sel, mux_out => out_16(2));
  mux3 : mux port map(i0 => i0_16(3), i1 => i1_16(3), sel => sel, mux_out => out_16(3));
  mux4 : mux port map(i0 => i0_16(4), i1 => i1_16(4), sel => sel, mux_out => out_16(4));
  mux5 : mux port map(i0 => i0_16(5), i1 => i1_16(5), sel => sel, mux_out => out_16(5));
  mux6 : mux port map(i0 => i0_16(6), i1 => i1_16(6), sel => sel, mux_out => out_16(6));
  mux7 : mux port map(i0 => i0_16(7), i1 => i1_16(7), sel => sel, mux_out => out_16(7));
  mux8 : mux port map(i0 => i0_16(8), i1 => i1_16(8), sel => sel, mux_out => out_16(8));
  mux9 : mux port map(i0 => i0_16(9), i1 => i1_16(9), sel => sel, mux_out => out_16(9));
  mux10: mux port map(i0 => i0_16(10), i1 => i1_16(10), sel => sel, mux_out => out_16(10));
  mux11: mux port map(i0 => i0_16(11), i1 => i1_16(11), sel => sel, mux_out => out_16(11));
  mux12: mux port map(i0 => i0_16(12), i1 => i1_16(12), sel => sel, mux_out => out_16(12));
  mux13: mux port map(i0 => i0_16(13), i1 => i1_16(13), sel => sel, mux_out => out_16(13));
  mux14: mux port map(i0 => i0_16(14), i1 => i1_16(14), sel => sel, mux_out => out_16(14));
  mux15: mux port map(i0 => i0_16(15), i1 => i1_16(15), sel => sel, mux_out => out_16(15));

  out0_16 <= out_16;

end rtl;
