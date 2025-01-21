```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity fixed_counter is
    port (
        clk : in std_logic;
        rst : in std_logic;
        count : out integer range 0 to 15
    );
end entity fixed_counter;

architecture behavioral of fixed_counter is
    signal internal_count : integer range 0 to 15 := 0;
    signal rst_sync : std_logic := '0'; -- Synchronized reset signal
begin
    process (clk)
    begin
        if rising_edge(clk) then
            rst_sync <= rst;
end process;

    process (clk, rst_sync)
    begin
        if rst_sync = '1' then
            internal_count <= 0;
        elsif rising_edge(clk) then
            if internal_count = 15 then
                internal_count <= 0;
            else
                internal_count <= internal_count + 1;
            end if;
        end if;
    end process;

    count <= internal_count;
end architecture behavioral;
```