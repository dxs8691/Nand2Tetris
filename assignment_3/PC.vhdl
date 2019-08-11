library ieee;
use ieee.std_logic_1164.all;


entity PC is
  port(
    PCin : in std_logic_vector(15 downto 0);
    inc  : in std_logic;
    load : in std_logic;
    rst  : in std_logic;
    clk  : in std_logic;
    PCout: out std_logic_vector(15 downto 0)
    );
end entity;


architecture rtl of PC is

  component reg is
    port(
    i0  : in std_logic_vector(15 downto 0);
    clk : in std_logic;
    load: in std_logic;
    out16: out std_logic_vector(15 downto 0)
    );
  end component reg;

  component incrementer16 is
    port(
      i0      : in std_logic_vector(15 downto 0);
      sum_out : out std_logic_vector(15 downto 0)
    );
  end component incrementer16;

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

  component or_gate is
    port(
      i0 : in std_logic;
      i1 : in std_logic;
      or_out : out std_logic
    );
  end component or_gate;

  component not_gate is
    port(
      i0 : in std_logic;
      not_out : out std_logic
      );
  end component not_gate;

  component and_gate is
    port(
      i0 : in std_logic;
      i1 : in std_logic;
      and_out: out std_logic
      );
  end component and_gate;

  signal muxOut, regOut, incOut : std_logic_vector(15 downto 0);
  signal highSel, lowSel, intLowSel, notrst: std_logic;

  constant zero16 : std_logic_vector(15 downto 0) := "0000000000000000";

  signal selBits : std_logic_vector(1 downto 0);

begin

  selBits(1) <= highSel;
  selBits(0) <= lowSel;
  PCout <= regOut;    

  PCreg : reg port map(i0 => muxOut, clk => clk, load => '1',
                          out16 => regOut); 
  loadMux : mux4way16 port map(i0 => regOut, i1 => incOut,
                               i2 => zero16, i3 => PCin, sel => selBits,
                               out16 => muxOut);
  PCinc  : incrementer16 port map(i0 => regOut, sum_out => incOut);
  nRst   : not_gate port map(i0 => rst, not_out => notrst);
  highOr : or_gate port map(i0 => rst, i1 => load, or_out => highSel);
  lowOr  : or_gate port map(i0 => load, i1 => inc, or_out => intLowSel);
  lowAnd : and_gate port map(i0 => notrst, i1 => intLowSel,
                             and_out => lowSel);



end rtl;


  
