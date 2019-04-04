library ieee;
use ieee.std_logic_1164.all;

entity nand_gate_tb is
end nand_gate_tb;

architecture behav of nand_gate_tb is 

  component nand_gate is
    port(
      input_1 : in std_logic;
      input_2 : in std_logic;
      nand_out: out std_logic
      );
  end component nand_gate;

  signal r_IN_1, r_IN_2, r_OUT : std_logic;

  for nand_0 : nand_gate use entity work.nand_gate;
  
begin
  
  nand_0 : nand_gate
    port map(
      input_1 => r_IN_1,
      input_2 => r_IN_2,
      nand_out => r_OUT
      );

  process
    type pattern_type is record
      in_1, in_2 : std_logic;
      nand_out :  std_logic;
    end record;

    type pattern_arr is array (natural range <>) of pattern_type;
    constant patterns : pattern_arr :=
      (('0','0','1'),
       ('0','1','1'),
       ('1','0','1'),
       ('1','1','0'));

  begin
    for i in patterns'range loop

      r_IN_1 <= patterns(i).in_1;
      r_IN_2 <= patterns(i).in_2;

      wait for 1 ns;

      assert r_OUT = patterns(i).nand_out
        report "incorrect output" severity error;
    
    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;

end behav;
