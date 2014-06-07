library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sub_top is
  port (
    clk : in std_logic;
    tx : out std_logic);
end sub_top;

architecture arch of sub_top is
  component u232c
    generic (wtime: std_logic_vector(15 downto 0) := x"1ADB");
    port ( clk  : in  STD_LOGIC;
           data : in  STD_LOGIC_VECTOR (7 downto 0);
           go   : in  STD_LOGIC;
           busy : out STD_LOGIC;
           tx   : out STD_LOGIC);
  end component;
  constant data : std_logic_vector(7 downto 0) := x"41";
  signal go : std_logic;
  signal busy :std_logic;

begin
  main : u232c port map (
    clk => clk,
    data => data,
    go => go,
    busy => busy,
    tx => tx);
  
  process(clk)
  begin
    if rising_edge(clk) then
      if busy = '0' then
        go <= '1';
      else
        go <= '0';
      end if;
    end if;
  end process;
end;
  
