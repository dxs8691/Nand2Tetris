library ieee;
use ieee.std_logic_1164.all;

entity and_gate_tb is
end and_gate_tb;

architecture behav of and_gate_tb is 

  component and_gate is
    port(
      i0 : in std_logic;
      i1 : in std_logic;
      and_out: out std_logic
      );
  end component and_gate;
  
  signal r_IN_1, r_IN_2, r_OUT : std_logic;

  for and0 : and_gate use entity work.and_gate;
  
begin
  
  and0 : and_gate
    port map(
      i0 => r_IN_1,
      i1 => r_IN_2,
      and_out => r_OUT
      );

  process
    type pattern_type is record
      in_1, in_2 : std_logic;
      and_out :  std_logic;
    end record;

    type pattern_arr is array (natural range <>) of pattern_type;
    constant patterns : pattern_arr :=
      (('0','0','0'),
       ('0','1','0'),
       ('1','0','0'),
       ('1','1','1'));

  begin
    for i in patterns'range loop

      r_IN_1 <= patterns(i).in_1;
      r_IN_2 <= patterns(i).in_2;

      wait for 1 ns;

      assert r_OUT = patterns(i).and_out
        report "incorrect output" severity error;
    
    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;

end behav;
