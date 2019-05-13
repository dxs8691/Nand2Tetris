library ieee;
use ieee.std_logic_1164.all;

entity incrementer16 is
  port(
    i0      : in std_logic_vector(15 downto 0);
    sum_out : out std_logic_vector(15 downto 0)
    );
end entity;


architecture rtl of incrementer16 is

  component adder16 is
    port(
      i0      : in std_logic_vector(15 downto 0);
      i1      : in std_logic_vector(15 downto 0);
      sum_out : out std_logic_vector(15 downto 0)
      );
  end component adder16;

  constant one : std_logic_vector(15 downto 0) := "0000000000000001";

begin

  add0 : adder16 port map(i0 => i0, i1 => one, sum_out => sum_out);

end rtl;

