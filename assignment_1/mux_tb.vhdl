library ieee;
use ieee.std_logic_1164.all;

entity mux_tb is
end mux_tb;

architecture behav of mux_tb is 

  component mux is
    port(
      i0 : in std_logic;
      i1 : in std_logic;
      sel: in std_logic;
      mux_out: out std_logic
      );
  end component mux;
  
  signal in0, in1, sel, out0 : std_logic;

  for mux0 : mux use entity work.mux;
  
begin
  
  mux0 : mux
    port map(
      i0 => in0,
      i1 => in1,
      sel=> sel,
      mux_out => out0
      );

  process
    type pattern_type is record
      in_1, in_2, sel: std_logic;
      mux_out :  std_logic;
    end record;

    type pattern_arr is array (natural range <>) of pattern_type;
    constant patterns : pattern_arr :=
      (('0','0','0','0'),
       ('0','1','0','0'),
       ('1','0','0','1'),
       ('1','1','0','1'),
       ('0','0','1','0'),
       ('0','1','1','1'),
       ('1','0','1','0'),
       ('1','1','1','1'));

  begin
    for i in patterns'range loop

      in0 <= patterns(i).in_1;
      in1 <= patterns(i).in_2;
      sel <= patterns(i).sel;

      wait for 1 ns;

      assert out0 = patterns(i).mux_out
        report "incorrect output" severity error;
    
    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;

end behav;
