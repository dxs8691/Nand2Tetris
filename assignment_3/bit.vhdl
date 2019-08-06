library ieee;
use ieee.std_logic_1164.all;

entity bit is
  port(
    i0  : in std_logic;
    load: in std_logic;
    clk : in std_logic;
    q   : out std_logic;
    qbar: out std_logic
    );
end entity bit;


architecture rtl of bit is

  component DFF is
    port(
      i0  : in std_logic;
      clk : in std_logic;
      q   : out std_logic;
      qbar: out std_logic
      );
  end component DFF;

  component mux is
    port(
      i0  : in std_logic;
      i1  : in std_logic;
      sel : in std_logic;
      mux_out : out std_logic
      );
  end component mux;
  
  signal muxOut, Qout: std_logic;

begin

  DFF0 : DFF port map(i0 => muxOut, clk => clk,
                      q => Qout, qbar => qbar);
  Mux0 : mux port map(i0 => Qout, i1 => i0, sel => load,
                      mux_out => muxOut);

  q <= Qout;

end rtl;
  
                                 
