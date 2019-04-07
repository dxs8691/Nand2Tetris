library ieee;
use ieee.std_logic_1164.all;

entity mux8way16 is
  port(
    i0 : in std_logic_vector(15 downto 0);
    i1 : in std_logic_vector(15 downto 0);
    i2 : in std_logic_vector(15 downto 0);
    i3 : in std_logic_vector(15 downto 0);
    i4 : in std_logic_vector(15 downto 0);
    i5 : in std_logic_vector(15 downto 0);
    i6 : in std_logic_vector(15 downto 0);
    i7 : in std_logic_vector(15 downto 0);
    sel: in std_logic_vector(2 downto 0);
    out16: out std_logic_vector(15 downto 0)
    );
end entity;

architecture rtl of mux8way16 is
  component mux4way16 is
    port(
    i0 : in std_logic_vector(15 downto 0);
    i1 : in std_logic_vector(15 downto 0);
    i2 : in std_logic_vector(15 downto 0);
    i3 : in std_logic_vector(15 downto 0);
    sel: in std_logic_vector(1 downto 0);
    out16: out std_logic_vector(15 downto 0)
    );
  end component mux4way16;

  component mux16 is
    port(
      i0_16 : in std_logic_vector(15 downto 0);
      i1_16 : in std_logic_vector(15 downto 0);
      sel : in std_logic;
      out0_16: out std_logic_vector(15 downto 0)
      );
  end component mux16;

  signal in0a, in0b, out_16 : std_logic_vector(15 downto 0);

begin

  mux416a : mux4way16 port map(i0 => i0, i1 => i1, i2 => i2, i3 => i3, sel => sel(1 downto 0), out16 => in0a);
  mux416b : mux4way16 port map(i0 => i4, i1 => i5, i2 => i6, i3 => i7, sel => sel(1 downto 0), out16 => in0b);
  mux160 : mux16 port map(i0_16 => in0a, i1_16 => in0b, sel => sel(2), out0_16 => out_16);

  out16 <= out_16;

end rtl;
