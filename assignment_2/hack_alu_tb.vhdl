library ieee;
use ieee.std_logic_1164.all;

entity hack_alu_tb is
end entity;


architecture behav of hack_alu_tb is

  component hack_alu is
    port(
      i0     : in std_logic_vector(15 downto 0);
      i1     : in std_logic_vector(15 downto 0);
      sel    : in std_logic_vector(5 downto 0);
      output : out std_logic_vector(15 downto 0);
      zr     : out std_logic;
      ng     : out std_logic
    );
  end component hack_alu;

  signal in0, in1, out0 : std_logic_vector(15 downto 0);
  signal sel : std_logic_vector(5 downto 0);
  signal outzr, outng : std_logic;

begin

  alu0 : hack_alu port map(i0 => in0, i1 => in1, sel => sel,
                           output => out0, zr => outzr, ng => outng);

  process

    type pattern16bit is array(natural range <>)
      of std_logic_vector(15 downto 0);

    type pattern6bit is array(natural range <>)
      of std_logic_vector(5 downto 0);

    type outpattern is record
      zr : std_logic;
      ng : std_logic;
    end record;

    type outpatternarr is array(natural range <>) of outpattern;

    constant in_patterns0 : pattern16bit :=
      ("0000000000000000",
       "0000000000000001",
       "1000000000000000");

    constant in_patterns1 : pattern16bit :=
      ("1111111111111111",
       "0000000000001111",
       "1010101010101010");

    constant sel_patterns : pattern6bit :=
      ("000000","011000","101010",
       "010000","010000","000000",
       "010000","010000","010000");

    constant out_patterns : outpatternarr :=
      (('1','0'),('0','1'),('0','1'),
       ('1','0'),('0','0'),('1','0'),
       ('0','0'),('0','1'),('0','0'));

  begin

    for i in in_patterns0'range loop
      for j in in_patterns1'range loop

        in0 <= in_patterns0(i);
        in1 <= in_patterns1(j);

        sel <= sel_patterns(i*in_patterns1'length+j);
        
        wait for 1 ns;

        assert outzr = out_patterns(i*in_patterns1'length+j).zr
          report "incorrect zr output" severity error;

        assert outng = out_patterns(i*in_patterns1'length+j).ng
          report "incorrect ng output" severity error;

      end loop;
    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;
end behav;

    
