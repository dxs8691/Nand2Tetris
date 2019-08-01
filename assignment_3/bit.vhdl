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

  component and_gate is
    port(
      i0 : in std_logic;
      i1 : in std_logic;
      and_out : out std_logic
      );
  end component and_gate;
  
  signal and_clk : std_logic;

begin

  DFF0 : DFF port map(i0 => i0, clk => and_clk,
                                q => q, qbar => qbar);
  and0 : and_gate port map(i0 => clk, i1 => load,
                                     and_out => and_clk);


end rtl;
  
                                 
