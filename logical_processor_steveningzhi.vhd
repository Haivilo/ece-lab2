library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;

entity logical_processor_steveningzhi is
    port (
        hex_num1, hex_num0 : in std_logic_vector(3 downto 0);
        logic_select 										: in std_logic_vector(1 downto 0); 
        hex_out				 							: out std_logic_vector(3 downto 0)
        );
end logical_processor_steveningzhi;

architecture Log_Circuit of logical_processor_steveningzhi is

-- Declare any Components to be Used ---
------------------------------------------------------------------- 
-------------------------------------------------------------------

-- Declare any signals to be used within the design---
-------------------------------------------------------------------
begin 

-------------------------------------------------------------------
-------------------------------------------------------------------

with logic_select (1 downto 0) select
hex_out <= hex_num0 AND hex_num1 when "00",
           hex_num0 OR hex_num1 when "01",
           hex_num0 XOR hex_num1 when "10",
           hex_num0 XNOR hex_num1 when "11";


end Log_Circuit;
