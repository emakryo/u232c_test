library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity top_tb is
end entity;

architecture arch of top_tb is
  component top_sub
  port (
    clk : in std_logic;
    tx : out std_logic);
  end component;

  signal clk : std_logic;
  signal tx : std_logic;
begin
  main : top_sub port map (
    clk => clk,
    tx => tx);

  clkgen : process
  begin
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;
  end process;
end;
