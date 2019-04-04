library ieee;
use ieee.std_logic_1164.all;

entity not_gate_tb is
end not_gate_tb;

architecture behav of not_gate_tb is 

  component not_gate is
    port(
      i0 : in std_logic;
      not_out: out std_logic
      );
  end component not_gate;

  signal r_IN_1, r_OUT : std_logic;

  for not0 : not_gate use entity work.not_gate;
  
begin
  
  not0 : not_gate
    port map(
      i0 => r_IN_1,
      not_out => r_OUT
      );

  process
    type pattern_type is record
      in_1  : std_logic;
      not_out :  std_logic;
    end record;

    type pattern_arr is array (natural range <>) of pattern_type;
    constant patterns : pattern_arr :=
      (('1','0'),
       ('0','1'));

  begin
    for i in patterns'range loop

      r_IN_1 <= patterns(i).in_1;
  
      wait for 1 ns;

      assert r_OUT = patterns(i).not_out
        report "incorrect output" severity error;
    
    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;

end behav;
