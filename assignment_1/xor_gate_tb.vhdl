library ieee;
use ieee.std_logic_1164.all;

entity xor_gate_tb is
end xor_gate_tb;

architecture behav of xor_gate_tb is 

  component xor_gate is
    port(
      i0 : in std_logic;
      i1 : in std_logic;
      xor_out: out std_logic
      );
  end component xor_gate;
  
  signal in0, in1, out0 : std_logic;

  for xor0 : xor_gate use entity work.xor_gate;
  
begin
  
  xor0 : xor_gate
    port map(
      i0 => in0,
      i1 => in1,
      xor_out => out0
      );

  process
    type pattern_type is record
      in_1, in_2 : std_logic;
      xor_out :  std_logic;
    end record;

    type pattern_arr is array (natural range <>) of pattern_type;
    constant patterns : pattern_arr :=
      (('0','0','0'),
       ('0','1','1'),
       ('1','0','1'),
       ('1','1','0'));

  begin
    for i in patterns'range loop

      in0 <= patterns(i).in_1;
      in1 <= patterns(i).in_2;

      wait for 1 ns;

      assert out0 = patterns(i).xor_out
        report "incorrect output" severity error;
    
    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;

end behav;
