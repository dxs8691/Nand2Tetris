library ieee;
use ieee.std_logic_1164.all;

entity hack_ALU_min_stat is
  port(
    i0     : in std_logic_vector(15 downto 0);
    i1     : in std_logic_vector(15 downto 0);
    sel    : in std_logic_vector(5 downto 0);
    output : out std_logic_vector(15 downto 0)
    );
end entity;


architecture rtl of hack_ALU_min_stat is

  component not16_gate is
    port(
      i0_16   : in std_logic_vector(15 downto 0);
      out0_16 : out std_logic_vector(15 downto 0)
      );
  end component not16_gate;

  component and16_gate is
    port(
      i0      : in std_logic_vector(15 downto 0);
      i1      : in std_logic_vector(15 downto 0);
      and16_out : out std_logic_vector(15 downto 0)
      );
  end component and16_gate;

  component adder16 is
    port(
      i0      : in std_logic_vector(15 downto 0);
      i1      : in std_logic_vector(15 downto 0);
      sum_out : out std_logic_vector(15 downto 0)
      );
  end component adder16;
  
  component mux4way16 is
    port(
      i0    : in std_logic_vector(15 downto 0);
      i1    : in std_logic_vector(15 downto 0);
      i2    : in std_logic_vector(15 downto 0);
      i3    : in std_logic_vector(15 downto 0);
      sel   : in std_logic_vector(1 downto 0);
      out16 : out std_logic_vector(15 downto 0)
      );
  end component mux4way16;

  component mux16 is
    port(
      i0_16   : in std_logic_vector(15 downto 0);
      i1_16   : in std_logic_vector(15 downto 0);
      sel     : in std_logic;
      out0_16 : out std_logic_vector(15 downto 0)
      );
  end component mux16;
  
  constant zero : std_logic_vector(15 downto 0) := "0000000000000000";
  constant nzero: std_logic_vector(15 downto 0) := "1111111111111111";

  signal notX, notY, x, y, xPy, xNy, o, no: std_logic_vector(15 downto 0);
  
begin

  not0 : not16_gate port map(i0_16 => i0, out0_16 => notX);
  not1 : not16_gate port map(i0_16 => i1, out0_16 => notY);

  muxX : mux4way16 port map(i0 => i0, i1 => zero, i2 => notX,
                            i3 => nzero, sel => sel(1 downto 0),
                            out16 => x);
  muxY : mux4way16 port map(i0 => i1, i1 => zero, i2 => notY,
                            i3 => nzero, sel => sel(3 downto 2),
                            out16 => y);

  and0 : and16_gate port map(i0 => x, i1 => y, and16_out => xNy);

  add0 : adder16 port map(i0 => x, i1 => y, sum_out => xPy);

  muxout : mux16 port map(i0_16 => xNy, i1_16 => xPy, sel => sel(4),
                          out0_16 => o);

  not3 : not16_gate port map(i0_16 => o, out0_16 => no);

  muxnout : mux16 port map(i0_16 => o, i1_16 => no, sel => sel(5),
                           out0_16 => output);

end rtl;



    
