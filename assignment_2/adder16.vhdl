library ieee;
use ieee.std_logic_1164.all;

entity adder16 is
  port(
    i0      : in std_logic_vector(15 downto 0);
    i1      : in std_logic_vector(15 downto 0);
    sum_out : out std_logic_vector(15 downto 0)
    );
end adder16;


architecture rtl of adder16 is

  component full_adder is
    port(
      i0      : in std_logic;
      i1      : in std_logic;
      cin     : in std_logic;
      sum_out : out std_logic;
      car_out : out std_logic
      );
  end component full_adder;

  signal carVec : std_logic_vector(15 downto 0);
  
begin

  fadd0 : full_adder port map(i0 => i0(0), i1 => i1(0), cin => '0',
                              sum_out => sum_out(0), car_out => carVec(0));
  fadd1 : full_adder port map(i0 => i0(1), i1 => i1(1), cin => carVec(0),
                              sum_out => sum_out(1), car_out => carVec(1));
  fadd2 : full_adder port map(i0 => i0(2), i1 => i1(2), cin => carVec(1),
                              sum_out => sum_out(2), car_out => carVec(2));
  fadd3 : full_adder port map(i0 => i0(3), i1 => i1(3), cin => carVec(2),
                              sum_out => sum_out(3), car_out => carVec(3));
  fadd4 : full_adder port map(i0 => i0(4), i1 => i1(4), cin => carVec(3),
                              sum_out => sum_out(4), car_out => carVec(4));
  fadd5 : full_adder port map(i0 => i0(5), i1 => i1(5), cin => carVec(4),
                              sum_out => sum_out(5), car_out => carVec(5));
  fadd6 : full_adder port map(i0 => i0(6), i1 => i1(6), cin => carVec(5),
                              sum_out => sum_out(6), car_out => carVec(6));
  fadd7 : full_adder port map(i0 => i0(7), i1 => i1(7), cin => carVec(6),
                              sum_out => sum_out(7), car_out => carVec(7));
  fadd8 : full_adder port map(i0 => i0(8), i1 => i1(8), cin => carVec(7),
                              sum_out => sum_out(8), car_out => carVec(8));
  fadd9 : full_adder port map(i0 => i0(9), i1 => i1(9), cin => carVec(8),
                              sum_out => sum_out(9), car_out => carVec(9));
  fadd10 : full_adder port map(i0 => i0(10), i1 => i1(10), cin => carVec(9),
                              sum_out => sum_out(10), car_out => carVec(10));
  fadd11 : full_adder port map(i0 => i0(11), i1 => i1(11), cin => carVec(10),
                              sum_out => sum_out(11), car_out => carVec(11));
  fadd12 : full_adder port map(i0 => i0(12), i1 => i1(12), cin => carVec(11),
                              sum_out => sum_out(12), car_out => carVec(12));
  fadd13 : full_adder port map(i0 => i0(13), i1 => i1(13), cin => carVec(12),
                              sum_out => sum_out(13), car_out => carVec(13));
  fadd14 : full_adder port map(i0 => i0(14), i1 => i1(14), cin => carVec(13),
                              sum_out => sum_out(14), car_out => carVec(14));
  fadd15 : full_adder port map(i0 => i0(15), i1 => i1(15), cin => carVec(14),
                              sum_out => sum_out(15), car_out => carVec(15));

end rtl;











  
  
