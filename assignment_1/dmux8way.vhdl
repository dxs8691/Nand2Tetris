library ieee;
use ieee.std_logic_1164.all;

entity dmux8way is
  port(
    i0 : in std_logic;
    sel: in std_logic_vector(2 downto 0);
    out8: out std_logic_vector(7 downto 0)
    );
end entity;

architecture rtl of dmux8way is
  component dmux is
    port(
      i0 : in std_logic;
      sel: in std_logic;
      out0: out std_logic;
      out1: out std_logic
      );
  end component dmux;

  component dmux4way is
    port(
      i0 : in std_logic;
      sel: in std_logic_vector(1 downto 0);
      out_4: out std_logic_vector(3 downto 0)
      );
  end component dmux4way;

  signal ia,ib : std_logic;
  signal out_8: std_logic_vector(7 downto 0);

begin

  dmux_0 : dmux port map(i0 => i0, sel => sel(2), out0 => ia, out1 => ib);
  dmux4_1a: dmux4way port map(i0 => ia, sel => sel(1 downto 0), out_4 => out_8(3 downto 0));
  dmux4_1b: dmux4way port map(i0 => ib, sel => sel(1 downto 0), out_4 => out_8(7 downto 4));

  out8 <= out_8;

end rtl;


  
  
                        
