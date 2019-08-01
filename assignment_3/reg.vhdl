library ieee;
use ieee.std_logic_1164.all;

entity reg is
  port(
    i0  : in std_logic_vector(15 downto 0);
    clk : in std_logic;
    load: in std_logic;
    out16: out std_logic_vector(15 downto 0)
    );
end entity;


architecture rtl of reg is

  component bit is
    port(
      i0  : in std_logic;
      load: in std_logic;
      clk : in std_logic;
      q   : out std_logic;
      qbar: out std_logic
      );
  end component bit;

begin

  bit0 : bit port map(i0 => i0(0), load => load, clk => clk, q => out16(0));
  bit1 : bit port map(i0 => i0(1), load => load, clk => clk, q => out16(1));
  bit2 : bit port map(i0 => i0(2), load => load, clk => clk, q => out16(2));
  bit3 : bit port map(i0 => i0(3), load => load, clk => clk, q => out16(3));
  bit4 : bit port map(i0 => i0(4), load => load, clk => clk, q => out16(4));
  bit5 : bit port map(i0 => i0(5), load => load, clk => clk, q => out16(5));
  bit6 : bit port map(i0 => i0(6), load => load, clk => clk, q => out16(6));
  bit7 : bit port map(i0 => i0(7), load => load, clk => clk, q => out16(7));
  bit8 : bit port map(i0 => i0(8), load => load, clk => clk, q => out16(8));
  bit9 : bit port map(i0 => i0(9), load => load, clk => clk, q => out16(9));
  bit10: bit port map(i0 => i0(10), load => load, clk => clk, q => out16(10));
  bit11: bit port map(i0 => i0(11), load => load, clk => clk, q => out16(11));
  bit12: bit port map(i0 => i0(12), load => load, clk => clk, q => out16(12));
  bit13: bit port map(i0 => i0(13), load => load, clk => clk, q => out16(13));
  bit14: bit port map(i0 => i0(14), load => load, clk => clk, q => out16(14));
  bit15: bit port map(i0 => i0(15), load => load, clk => clk, q => out16(15));

end rtl;

      
