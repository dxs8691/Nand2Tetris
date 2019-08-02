library ieee;
use ieee.std_logic_1164.all;

entity ram8 is
  port(
    i0  : in std_logic_vector(15 downto 0);
    addr: in std_logic_vector(2 downto 0);
    load: in std_logic;
    clk : in std_logic;
    out16: out std_logic_vector(15 downto 0)
    );
end entity;


architecture rtl of ram8 is

  component reg is
    port(
      i0  : in std_logic_vector(15 downto 0);
      clk : in std_logic;
      load: in std_logic;
      out16: out std_logic_vector(15 downto 0)
      );
  end component reg;

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


  signal dmux0, dmux1, dmux2, dmux3, dmux4, dmux5, dmux6, dmux7 : std_logic;
  signal dmuxVec : std_logic_vector(7 downto 0);
  signal out0, out1, out2, out3, out4, out5, out6, out7 : std_logic_vector(15 downto 0);

begin

  reg0 : reg port map(i0 => i0, clk => clk, load => dmux0, out16 => out0);
  reg1 : reg port map(i0 => i0, clk => clk, load => dmux1, out16 => out1);
  reg2 : reg port map(i0 => i0, clk => clk, load => dmux2, out16 => out2);
  reg3 : reg port map(i0 => i0, clk => clk, load => dmux3, out16 => out3);
  reg4 : reg port map(i0 => i0, clk => clk, load => dmux4, out16 => out4);
  reg5 : reg port map(i0 => i0, clk => clk, load => dmux5, out16 => out5);
  reg6 : reg port map(i0 => i0, clk => clk, load => dmux6, out16 => out6);
  reg7 : reg port map(i0 => i0, clk => clk, load => dmux7, out16 => out7);


  dmuxObj : dmux8way port map(i0 => load, sel => addr, out8 => dmuxVec);

  dmux0 <= dmuxVec(0);
  dmux1 <= dmuxVec(1);
  dmux2 <= dmuxVec(2);
  dmux3 <= dmuxVec(3);
  dmux4 <= dmuxVec(4);
  dmux5 <= dmuxVec(5);
  dmux6 <= dmuxVec(6);
  dmux7 <= dmuxVec(7);

  muxObj : mux8way16 port map(i0 => out0, i1 => out1, i2 => out2,
                              i3 => out3, i4 => out4, i5 => out5,
                              i6 => out6, i7 => out7, sel => addr,
                              out16 => out16);
end rtl;
