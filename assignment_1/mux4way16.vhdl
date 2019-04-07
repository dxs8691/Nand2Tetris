library ieee;
use ieee.std_logic_1164.all;

entity mux4way16 is
  port(
    i0 : in std_logic_vector(15 downto 0);
    i1 : in std_logic_vector(15 downto 0);
    i2 : in std_logic_vector(15 downto 0);
    i3 : in std_logic_vector(15 downto 0);
    sel: in std_logic_vector(1 downto 0);
    out16: out std_logic_vector(15 downto 0)
    );
end entity;

architecture rtl of mux4way16 is
  component mux16 is
    port(
      i0_16 : in std_logic_vector(15 downto 0);
      i1_16 : in std_logic_vector(15 downto 0);
      sel: in std_logic;
      out0_16: out std_logic_vector(15 downto 0)
      );
  end component mux16;

  signal a, b, out_16 : std_logic_vector(15 downto 0);

begin

  mux0a : mux16 port map(i0_16 => i0, i1_16 => i1, sel => sel(0), out0_16 => a);
  mux0b : mux16 port map(i0_16 => i2, i1_16 => i3, sel => sel(0), out0_16 => b);
  mux1 : mux16 port map(i0_16 => a, i1_16 => b, sel => sel(1), out0_16 => out_16);

  out16 <= out_16;

end rtl;
