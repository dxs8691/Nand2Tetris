library ieee;
use ieee.std_logic_1164.all;

entity mux8way16_tb is
end mux8way16_tb;

architecture behav of mux8way16_tb is
  component mux8way16 is
    port(
      i0 : in std_logic_vector(15 downto 0);
      i1 : in std_logic_vector(15 downto 0);
      i2 : in std_logic_vector(15 downto 0);
      i3 : in std_logic_vector(15 downto 0);
      i4 : in std_logic_vector(15 downto 0);
      i5 : in std_logic_vector(15 downto 0);
      i6 : in std_logic_vector(15 downto 0);
      i7 : in std_logic_vector(15 downto 0);
      sel: in std_logic_vector(2 downto 0);
      out16: out std_logic_vector(15 downto 0)
      );
  end component mux8way16;

  for mux816 : mux8way16 use entity work.mux8way16;

  signal in0, in1, in2, in3, in4, in5, in6, in7 : std_logic_vector(15 downto 0);
  signal out_16: std_logic_vector(15 downto 0);
  signal sel : std_logic_vector(2 downto 0);
  
begin

  mux816 : mux8way16 
    port map(
      i0 => in0,
      i1 => in1,
      i2 => in2,
      i3 => in3,
      i4 => in4,
      i5 => in5,
      i6 => in6,
      i7 => in7,
      sel => sel,
      out16 => out_16
      );

  process

    type input_pattern is array(0 to 7) of std_logic_vector(15 downto 0);
    constant inputs : input_pattern := (
      "1111111111111111","0000000000000000","0000111100001111","1010101010101010","1000000000000001","1111000011110000","1110000000000000","0000000000000001");

    type sel_pattern is array(natural range <>) of std_logic_vector(2 downto 0);
    constant sel_inputs : sel_pattern :=(
      "000","001","010","011","100","101","110","111");

    type out_pattern is array(natural range <>) of std_logic_vector(15 downto 0);
    constant outputs : out_pattern :=(
      "1111111111111111","0000000000000000","0000111100001111","1010101010101010","1000000000000001","1111000011110000","1110000000000000","0000000000000001");
    
  begin
    for i in inputs'range loop

      in0 <= inputs(0);
      in1 <= inputs(1);
      in2 <= inputs(2);
      in3 <= inputs(3);
      in4 <= inputs(4);
      in5 <= inputs(5);
      in6 <= inputs(6);
      in7 <= inputs(7);
      sel <= sel_inputs(i);

      wait for 1 ns;
      
      assert out_16 = outputs(i)
        report "incorrect output" severity error;

    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;
end behav;
