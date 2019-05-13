library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hack_ALU_min_stat_tb is
end entity;


architecture behav of hack_ALU_min_stat_tb is

  component hack_ALU_min_stat is
    port(
      i0     : in std_logic_vector(15 downto 0);
      i1     : in std_logic_vector(15 downto 0);
      sel    : in std_logic_vector(5 downto 0);
      output : out std_logic_vector(15 downto 0)
      );
  end component hack_ALU_min_stat;

  for alu0 : hack_ALU_min_stat use entity work.hack_ALU_min_stat;
  
  signal in0, in1, out0 : std_logic_vector(15 downto 0);
  signal sel0 : std_logic_vector(5 downto 0);

begin

  alu0 : hack_ALU_min_stat port map(i0 => in0, i1 => in1,
                                    sel=> sel0, output => out0);

  process

    type pattern16bit is array (natural range <>)
      of std_logic_vector(15 downto 0);
    type selPattern is array (natural range <>)
      of std_logic_vector(5 downto 0);

    constant in_patterns0 : pattern16bit :=
      ("0000000000000001",
       "1111111111111111",
       "0000000000001111",
       "0000000000000000",
       "0000000000001010",
       "0000111100001111");

    constant in_patterns1 : pattern16bit :=
      ("0000000000000001",
       "0000000000001111",
       "0000000000000000");

    constant selPatterns : selPattern :=
      ("010000","000000",
       "110010","010011",
       "010010","110000",
       "010100","011000",
       "101100","111110",
       "111000","011000",
       "111111","110011",
       "111100","010101",
       "101010","110010");

    constant out_patterns : pattern16bit :=
      ("0000000000000010",
       "0000000000000001",
       "0000000000000001",
       "0000000000000000",
       "0000000000001111",
       "0000000000000000",
       "0000000000001111",
       "1111111111111111",
       "1111111111110000",
       "0000000000000001",
       "0000000000001111",
       "1111111111111111",
       "0000000000000001",
       "1111111111110001",
       "1111111111110110",
       "0000000000000000",
       "0000111100001111",
       "0000111100001111");
    
  begin

    for i in in_patterns0'range loop
      for j in in_patterns1'range loop

        in0 <= in_patterns0(i);
        in1 <= in_patterns1(j);

        sel0 <= selPatterns(i*in_patterns1'length+j);

        wait for 1 ns;
        
        assert out0 = out_patterns(i*in_patterns1'length+j) report
          "incorrect output" severity error;

      end loop;
    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;

end behav;

