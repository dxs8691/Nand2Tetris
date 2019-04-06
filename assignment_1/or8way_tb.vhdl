library ieee;
use ieee.std_logic_1164.all;

entity or8way_tb is
end entity;

architecture behav of or8way_tb is
  component or8way is
    port(
      i0_8 : in std_logic_vector(7 downto 0);
      or8out : out std_logic
      );
  end component or8way;

  signal in0_8 : std_logic_vector(7 downto 0);
  signal out0 : std_logic;

  for or8 : or8way use entity work.or8way;
  
begin

  or8 : or8way
    port map(
      i0_8 => in0_8,
      or8out => out0
      );
  
  process

    type in_pattern is array(natural range <>) of std_logic_vector(7 downto 0);
    constant in_patterns : in_pattern :=
      (('0','0','0','0','0','0','0','0'),
       ('1','0','0','0','0','0','0','0'),
       ('0','1','0','0','0','0','0','0'),
       ('0','0','1','0','0','0','0','0'),
       ('0','0','0','1','0','0','0','0'),
       ('0','0','0','0','1','0','0','0'),
       ('0','0','0','0','0','1','0','0'),
       ('0','0','0','0','0','0','1','0'),
       ('0','0','0','0','0','0','0','1'),
       ('1','1','1','1','1','1','1','1'),
       ('0','1','0','0','0','0','1','0'),
       ('0','0','0','0','0','1','0','0'),
       ('0','1','0','1','0','1','0','1'),
       ('0','0','0','0','0','1','1','1'));

    type out_pattern is array(natural range <>) of std_logic;
    constant out_patterns : out_pattern :=
      ('0','1','1','1','1','1','1','1','1','1','1','1','1','1');

  begin

    for i in in_patterns'range loop

      in0_8 <= in_patterns(i);

      wait for 1 ns;

      assert out0 = out_patterns(i)
        report "incorrect output" severity error;

    end loop;

    assert false
      report "end of test" severity note;

    wait;

  end process;

end behav;
