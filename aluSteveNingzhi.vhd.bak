library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;

entity aluSteveNingzhi is
 	port (
            hex_D, hex_C, hex_B, hex_A 	: in std_logic_vector(3 downto 0);
            opSel_A,opSel_B,logicFun    : in std_logic_vector(1 downto 0);
            addOrLog                    : in std_logic;
            logResult 					: out std_logic_vector(3 downto 0);
            addResult                   : out std_logic_vector(4 downto 0);
            flag                        : out std_logic
			);
end aluSteveNingzhi;

architecture Circuit of aluSteveNingzhi is

-- Declare any Components to be Used ---
------------------------------------------------------------------- 
 
 
component full_adder_4bit is
    port (
           cin							: in std_logic;
           hex_val_A, hex_val_B 	: in std_logic_vector(3 downto 0);
           hex_sum 						: out std_logic_vector(3 downto 0);
          carry_out					: out std_logic
           );
end component;

component hex_mux is
    port (
           hex_num3, hex_num2, hex_num1, hex_num0 : in std_logic_vector(3 downto 0);
           mux_select 										: in std_logic_vector(1 downto 0); 
           hex_out				 							: out std_logic_vector(3 downto 0)
           );

end component;

component logical_processor_steveningzhi is
    port (
        hex_num1, hex_num0 : in std_logic_vector(3 downto 0);
        logic_select 										: in std_logic_vector(1 downto 0); 
        hex_out				 							: out std_logic_vector(3 downto 0)
        );
end component;
-------------------------------------------------------------------

-- Declare any signals to be used within the design---
-------------------------------------------------------------------
-- group of 4 logic signals with the group type defined as std_logic_vector(MSB downto LSB)
    signal info_A	: std_logic_vector(3 downto 0);
    signal info_B	: std_logic_vector(3 downto 0);
    signal out_logic : std_logic_vector(3 downto 0);
    signal out_add : std_logic_vector(4 downto 0);
    signal cin : std_logic;
-------------------------------------------------------------------
-------------------------------------------------------------------
-- add instances to complete the Full_Adder_4bit design
begin

adder0: full_adder_1bit port map (cin, hex_val_A(0), hex_val_B(0),hex_sum(0), cout(0));
getA: hex_mux port map(
						hex_D, hex_C, hex_B, hex_A, 
						opSel_A,
						info_A
                        );
getA: hex_mux port map(
						hex_D, hex_C, hex_B, hex_A, 
						opSel_B,
						info_B
                        );    
                        
getLogic: logical_processor_steveningzhi port map(
                            info_B, info_A,
                            logicFun,
                            out_logic
                            );

getAdd: full_adder_4bit port map(
                                '0',
                                info_B, info_A,
                                out_add(3 downto 0),
                                out_add(4)
                                );

with addOrLog select
logResult <= out_log when "1";
addResult <= out_add when "0";
flag <= addOrLog;

end Circuit;
