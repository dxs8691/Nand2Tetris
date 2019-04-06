library ieee;
use ieee.std_logic_1164.all;

entity mux16_tb is
end entity;

architecture behav of mux16_tb is
  component mux16 is
    port(
      i0_16 : in std_logic_vector(15 downto 0);
      i1_16 : in std_logic_vector(15 downto 0);
      sel : in std_logic;
      out0_16:out std_logic_vector(15 downto 0)
      );
  end component mux16;

  signal sel : std_logic;
  
  signal in0_16, in1_16, out_16 : std_logic_vector(15 downto 0);
begin

  mux16_0 : mux16 port map(i0_16 => in0_16, i1_16 => in1_16, sel => sel, out0_16 => out_16);
  
  process

    type pattern_type is record
        i0_16 : std_logic_vector(15 downto 0);
        i1_16 : std_logic_vector(15 downto 0);
        sel : std_logic;
    end record;

    type in_pattern is array(natural range <>) of pattern_type;
    constant in_patterns : in_pattern :=
      ((('1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),'0'),
       (('1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),'1'),
       (('1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0'),('0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1'),'0'),
       (('1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0'),('0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1'),'1'));

    type out_pattern is array(natural range <>) of std_logic_vector(15 downto 0);
    constant out_patterns : out_pattern :=
      (('1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
       ('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
       ('1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0'),
       ('0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1'));

  begin

    for i in in_patterns'range loop

      in0_16 <= in_patterns(i).i0_16;
      in1_16 <= in_patterns(i).i1_16;
      sel <= in_patterns(i).sel;

      wait for 1 ns;
      
      assert out_16 = out_patterns(i)
        report "incorrect output" severity error;

    end loop;

    assert false report "end of test" severity note;
    
    wait;

  end process;

end behav;




        
