library ieee;
use ieee.std_logic_1164.all;

entity dmux_tb is
end dmux_tb;

architecture behav of dmux_tb is 

  component dmux is
    port(
      i0 : in std_logic;
      sel: in std_logic;
      out0: out std_logic;
      out1: out std_logic
      );
  end component dmux;
  
  signal in0, sel, out0, out1 : std_logic;

  for dmux0 : dmux use entity work.dmux;
  
begin
  
  dmux0 : dmux
    port map(
      i0 => in0,
      sel=> sel,
      out0 => out0,
      out1 => out1
      );

  process
    type pattern_type is record
      in_1, sel : std_logic;
      out0, out1 :  std_logic;
    end record;

    type pattern_arr is array (natural range <>) of pattern_type;
    constant patterns : pattern_arr :=
      (('0','0','0','0'),
       ('0','1','0','0'),
       ('1','0','1','0'),
       ('1','1','0','1'));

  begin
    for i in patterns'range loop

      in0 <= patterns(i).in_1;
      sel <= patterns(i).sel;

      wait for 1 ns;

      assert out0 = patterns(i).out0
        report "incorrect output" severity error;

      assert out1 = patterns(i).out1
        report "incorrect output" severity error;
    
    
    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;

end behav;
