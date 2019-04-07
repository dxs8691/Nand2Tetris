library ieee;
use ieee.std_logic_1164.all;

entity dmux4way is
  port(
    i0 : in std_logic;
    sel: in std_logic_vector(1 downto 0);
    out_4: out std_logic_vector(3 downto 0)
    );
end entity;

architecture rtl of dmux4way is
  component dmux is
    port(
      i0 : in std_logic;
      sel: in std_logic;
      out0: out std_logic;
      out1: out std_logic
      );
  end component dmux;

  signal s0, s1, out0, out1, out2, out3 : std_logic;

begin

  dmux0 : dmux port map(i0 => i0, sel => sel(1), out0 => s0, out1 => s1);
  dmux1a: dmux port map(i0 => s0, sel => sel(0), out0 => out0, out1 => out1);

  dmux1b: dmux port map(i0 => s1, sel => sel(0), out0 => out2, out1 => out3);
  out_4(0) <= out0;
  out_4(1) <= out1;
  out_4(2) <= out2;
  out_4(3) <= out3;

end rtl;
