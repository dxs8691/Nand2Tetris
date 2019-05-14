library ieee;
use ieee.std_logic_1164.all;

entity hack_alu is
  port(
    i0     : in std_logic_vector(15 downto 0);
    i1     : in std_logic_vector(15 downto 0);
    sel    : in std_logic_vector(5 downto 0);
    output : out std_logic_vector(15 downto 0);
    zr     : out std_logic;
    ng     : out std_logic
    );
end entity;


architecture rtl of hack_alu is

  component hack_alu_min_stat is
    port(
      i0     : in std_logic_vector(15 downto 0);
      i1     : in std_logic_vector(15 downto 0);
      sel    : in std_logic_vector(5 downto 0);
      output : out std_logic_vector(15 downto 0)
      );
  end component hack_alu_min_stat;

  component or_gate is
    port(i0     : in std_logic;
         i1     : in std_logic;
         or_out : out std_logic
         );
  end component or_gate;
  
  component not_gate is
    port(
      i0 : in std_logic;
      not_out : out std_logic
      );
  end component not_gate;
    
  signal out0, zrprop : std_logic_vector(15 downto 0);

begin

  alu0 : hack_alu_min_stat port map(i0 => i0, i1 => i1, sel => sel,
                                    output => out0);

  ng <= out0(15);

  orzr0 : or_gate port map(i0 => out0(0), i1 => out0(1),
                           or_out => zrprop(0));
  orzr1 : or_gate port map(i0 => zrprop(0), i1 => out0(2),
                           or_out => zrprop(1));
  orzr2 : or_gate port map(i0 => zrprop(1), i1 => out0(3),
                           or_out => zrprop(2));
  orzr3 : or_gate port map(i0 => zrprop(2), i1 => out0(4),
                           or_out => zrprop(3));
  orzr4 : or_gate port map(i0 => zrprop(3), i1 => out0(5),
                           or_out => zrprop(4));
  orzr5 : or_gate port map(i0 => zrprop(4), i1 => out0(6),
                           or_out => zrprop(5));
  orzr6 : or_gate port map(i0 => zrprop(5), i1 => out0(7),
                           or_out => zrprop(6));
  orzr7 : or_gate port map(i0 => zrprop(6), i1 => out0(8),
                           or_out => zrprop(7));
  orzr8 : or_gate port map(i0 => zrprop(7), i1 => out0(9),
                           or_out => zrprop(8));
  orzr9 : or_gate port map(i0 => zrprop(8), i1 => out0(10),
                           or_out => zrprop(9));
  orzr10 : or_gate port map(i0 => zrprop(9), i1 => out0(11),
                           or_out => zrprop(10));
  orzr11 : or_gate port map(i0 => zrprop(10), i1 => out0(12),
                           or_out => zrprop(11));
  orzr12 : or_gate port map(i0 => zrprop(11), i1 => out0(13),
                           or_out => zrprop(12));
  orzr13 : or_gate port map(i0 => zrprop(12), i1 => out0(14),
                            or_out => zrprop(13));
  orzr14 : or_gate port map(i0 => zrprop(13), i1 => out0(15),
                           or_out => zrprop(14));
  notzr : not_gate port map(i0 => zrprop(14), not_out => zr);
  

end rtl;

  
