library ieee;
use ieee.std_logic_1164.all;

entity ram4K is
  port(
    i0  : in std_logic_vector(15 downto 0);
    addr: in std_logic_vector(11 downto 0);
    load: in std_logic;
    clk : in std_logic;
    out16: out std_logic_vector(15 downto 0)
    );
end entity;


architecture rtl of ram4K is

  component ram512 is
    port(
      i0  : in std_logic_vector(15 downto 0);
      addr: in std_logic_vector(8 downto 0);
      load: in std_logic;
      clk : in std_logic;
      out16: out std_logic_vector(15 downto 0)
      );
  end component ram512;

  component mux8way16 is
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
  end component mux8way16;

  component dmux8way is
    port(
      i0 : in std_logic;
      sel: in std_logic_vector(2 downto 0);
      out8: out std_logic_vector(7 downto 0)
      );
  end component dmux8way;

  signal dmux : std_logic_vector(7 downto 0);

  signal highAddr : std_logic_vector(2 downto 0);
  signal lowAddr : std_logic_vector(8 downto 0);

  type ramOut is array (7 downto 0) of std_logic_vector(15 downto 0);
  signal ramSig : ramOut;
  
begin

  highAddr <= addr(11 downto 9);
  lowAddr <= addr(8 downto 0);

  ramGen : for i in 7 downto 0 generate
    compRam: ram512 port map(i0 => i0, addr => lowAddr, clk => clk,
                            load => dmux(i), out16 => ramSig(i));
  end generate ramGen;

  dmuxObj : dmux8way port map(i0 => load, sel => highAddr, out8 => dmux);

  muxObj : mux8way16 port map(i0 => ramSig(0), i1 => ramSig(1),
                              i2 => ramSig(2), i3 => ramSig(3),
                              i4 => ramSig(4), i5 => ramSig(5),
                              i6 => ramSig(6), i7 => ramSig(7),
                              out16 => out16);

end rtl;

