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
component aluSteveNingzhi is
	port (
		   hex_D, hex_C, hex_B, hex_A 	: in std_logic_vector(3 downto 0);
		   opSel_A,opSel_B,logicFun    : in std_logic_vector(1 downto 0);
		   addOrLog                    : in std_logic;
		   logResult 					: out std_logic_vector(3 downto 0);
		   addResult                   : out std_logic_vector(4 downto 0);
		   flag                        : out std_logic
		   );
end component;
-- 
-------------------------------------------------------
-- Declare any signals here to be used within the design ---
-------------------------------------------------------
-- groups of logic signals with each group defined as std_logic_vector(MSB downto LSB)
	signal hex_A, hex_B, hex_C, hex_D		: std_logic_vector(3 downto 0);
--- some mux_selector nets
	signal opSelA, opSelB, log_fun_sel							: std_logic_vector(1 downto 0);
	signal addLogSel :std_logic;
	
-------------------------------------------------------------------
-------------------------------------------------------------------

begin

-- assign (connect) one end of each input group (bus) to sepecific switch inputs
hex_A <= sw(3 downto 0);
hex_B <= sw(7 downto 4);
hex_C <= sw(11 downto 8);
hex_D <= sw(15 downto 12);
opSelA <= pb(1 downto 0);
opSelB <= pb(3 downto 2);
log_fun_sel <= pb(5 downto 4);
addLogSel <=pb(6);


----------------------------------------------------------------------------
-- PLACE your compnent instances below with the interconnection required ---
----------------------------------------------------------------------------

inst1: aluSteveNingzhi port map(
	 hex_D,hex_C,hex_B,hex_A,
	 opSelA,opSelB,log_fun_sel,addLogSel,
	leds(4 downto 0),leds(5)
	);

end Circuit;


