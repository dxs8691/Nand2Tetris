library ieee;
use ieee.std_logic_1164.all;

entity dmux8way_tb is
end dmux8way_tb;

architecture behav of dmux8way_tb is
  component dmux8way is
    port(
      i0 : in std_logic;
      sel: in std_logic_vector(2 downto 0);
      out8: out std_logic_vector(7 downto 0)
      );
  end component dmux8way;

  for dmux0 : dmux8way use entity work.dmux8way;

  signal in0 : std_logic;
  signal out8: std_logic_vector(7 downto 0);
  signal sel : std_logic_vector(2 downto 0);
  
begin

  dmux0 : dmux8way 
    port map(
      i0 => in0,
      sel => sel,
      out8 => out8
      );

  process

    constant inputs : std_logic_vector(15 downto 0) := "0000000011111111";

    type sel_patterns is array(natural range <>) of std_logic_vector(2 downto 0);
    constant sel_inputs : sel_patterns :=
      ("000","001","010","011","100","101","110","111","000","001","010","011","100","101","110","111");

    type out_patterns is array(natural range <>) of std_logic_vector(7 downto 0);
    constant outputs : out_patterns :=
      ("00000001","00000010","00000100","00001000","00010000","00100000","01000000","10000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000");

  begin
    for i in inputs'range loop

      in0 <= inputs(i);
      sel <= sel_inputs(i);

      wait for 1 ns;

      assert out8 = outputs(i)
        report "incorrect output" severity error;

    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;
end behav;
