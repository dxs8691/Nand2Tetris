library ieee;
use ieee.std_logic_1164.all;

entity mux4way16_tb is
end mux4way16_tb;

architecture behav of mux4way16_tb is
  component mux4way16 is
    port(
      i0 : in std_logic_vector(15 downto 0);
      i1 : in std_logic_vector(15 downto 0);
      i2 : in std_logic_vector(15 downto 0);
      i3 : in std_logic_vector(15 downto 0);
      sel: in std_logic_vector(1 downto 0);
      out16: out std_logic_vector(15 downto 0)
      );
  end component mux4way16;

  for dmux0 : mux4way16 use entity work.mux4way16;

  signal in0, in1, in2, in3 : std_logic_vector(15 downto 0);
  signal out_16: std_logic_vector(15 downto 0);
  signal sel : std_logic_vector(1 downto 0);
  
begin

  dmux0 : mux4way16 
    port map(
      i0 => in0,
      i1 => in1,
      i2 => in2,
      i3 => in3,
      sel => sel,
      out16 => out_16
      );

  process

    type input_pattern is array(0 to 3) of std_logic_vector(15 downto 0);
    constant inputs : input_pattern := (
      "1111111111111111","0000000000000000","0000111100001111","1010101010101010");

    type sel_pattern is array(natural range <>) of std_logic_vector(1 downto 0);
    constant sel_inputs : sel_pattern :=(
      "00","10","01","11");

    type out_pattern is array(natural range <>) of std_logic_vector(15 downto 0);
    constant outputs : out_pattern :=(
      "1111111111111111","0000000000000000","0000111100001111","1010101010101010");
    
  begin
    for i in inputs'range loop

      in0 <= inputs(0);
      in1 <= inputs(1);
      in2 <= inputs(2);
      in3 <= inputs(3);
      sel <= sel_inputs(i);

      wait for 1 ns;
      
      assert out_16 = outputs(i)
        report "incorrect output" severity error;

    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;
end behav;
