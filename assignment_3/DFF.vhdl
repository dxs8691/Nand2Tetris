library ieee;
use ieee.std_logic_1164.all;

entity DFF is
  port(
    i0  : in std_logic;
    clk : in std_logic;
    q   : out std_logic;
    qbar: out std_logic
    );
end entity;

architecture rtl of DFF is

  component not_gate is
    port(
      i0 : in std_logic;
      not_out : out std_logic
      );
  end component not_gate;
  
  signal stored : std_logic;

begin

  not0 : not_gate port map(i0 => stored, not_out =>qbar);

  q <= stored;

  process(clk)
  begin
         if(clk'event and clk ='1') then
           stored <= i0;
         end if;
  end process;

end rtl;

    
