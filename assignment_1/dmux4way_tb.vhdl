library ieee;
use ieee.std_logic_1164.all;

entity dmux4way_tb is
end dmux4way_tb;

architecture behav of dmux4way_tb is
  component dmux4way is
    port(
      i0 : in std_logic;
      sel: in std_logic_vector(1 downto 0);
      out_4: out std_logic_vector(3 downto 0)
      );
  end component dmux4way;

  for dmux0 : dmux4way use entity work.dmux4way;

  signal in0 : std_logic;
  signal out4: std_logic_vector(3 downto 0);
  signal sel : std_logic_vector(1 downto 0);
  
begin

  dmux0 : dmux4way 
    port map(
      i0 => in0,
      sel => sel,
      out_4 => out4
      );

  process

    constant inputs : std_logic_vector(7 downto 0) := "00001111";

    type sel_patterns is array(natural range <>) of std_logic_vector(1 downto 0);
    constant sel_inputs : sel_patterns :=
      ("00","01","10","11","00","01","10","11");

    type out_patterns is array(natural range <>) of std_logic_vector(3 downto 0);
    constant outputs : out_patterns :=
      ("0001","0010","0100","1000","0000","0000","0000","0000");

  begin
    for i in inputs'range loop

      in0 <= inputs(i);
      sel <= sel_inputs(i);

      wait for 1 ns;
      
      assert out4 = outputs(i)
        report "incorrect output" severity error;

    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;
end behav;
