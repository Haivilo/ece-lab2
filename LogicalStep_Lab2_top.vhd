library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;

entity LogicalStep_Lab2_top is port (
	pb					: in	std_logic_vector(6 downto 0); 	-- push buttons used for data input selection/operation control
 	sw   				: in  std_logic_vector(15 downto 0); 	-- The switch inputs used for data inputs
   leds				: out std_logic_vector(5 downto 0) 		--  leds for outputs
	
); 
end LogicalStep_Lab2_top;

architecture Circuit of LogicalStep_Lab2_top is

-- Declare any Components to be Used ---
------------------------------------------------------------------- 
 component hex_mux
 	port (
			hex_num3, hex_num2, hex_num1, hex_num0 : in std_logic_vector(3 downto 0);
			mux_select 										: in std_logic_vector(1 downto 0); 
			hex_out 											: out std_logic_vector(3 downto 0)
			);

 end component;
 
component full_adder_4bit 
	port (
			cin						: in std_logic;
			hex_val_A, hex_val_B	: in std_logic_vector(3 downto 0);
			hex_sum 					: out std_logic_vector(3 downto 0);
		   carry_out				: out std_logic
			);

end component;

component logical_processor_steveningzhi 
    port (
        hex_num1, hex_num0 : in std_logic_vector(3 downto 0);
        logic_select 		: in std_logic_vector(1 downto 0); 
        hex_out				: out std_logic_vector(3 downto 0)
        );
end component;
-- 
-------------------------------------------------------
-- Declare any signals here to be used within the design ---
-------------------------------------------------------
-- groups of logic signals with each group defined as std_logic_vector(MSB downto LSB)
	signal hex_A, hex_B, hex_C, hex_D		: std_logic_vector(3 downto 0);
--- some mux_selector nets
	signal mux_sel									: std_logic_vector(1 downto 0);
	
-------------------------------------------------------------------
-------------------------------------------------------------------

begin

-- assign (connect) one end of each input group (bus) to sepecific switch inputs
hex_A <= sw(3 downto 0);
hex_B <= sw(7 downto 4);
pbs <= pb(1 downto 0)
-- hex_C <= sw(11 downto 8);
-- hex_D <= sw(15 downto 12);
-- -- the other ends of hex_A - hex_D will connect to other parts of the circuit in the design

-- -- assign two of the pb inputs to drive a mux selection port
-- mux_sel <= pb(1 downto 0);
----------------------------------------------------------------------------
-- PLACE your compnent instances below with the interconnection required ---
----------------------------------------------------------------------------

-- inst1: hex_mux port map(
-- 						hex_D, hex_C, hex_B, hex_A, 
-- 						mux_sel,
-- 						leds(3 downto 0)
-- 						);

-- input to 4bit adder and output to leds(5 to 0)
inst1: logical_processor_steveningzhi port map(
	 hex_A, hex_B,pbs,
	leds(3 downto 0)
	);

end Circuit;


