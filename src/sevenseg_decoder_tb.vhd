----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2025 12:57:52 AM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder_tb is
    Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is
  component sevenseg_decoder is
  port (
  i_Hex  :	in  std_logic_vector(3 downto 0);
  o_seg_n : 	out std_logic_vector(6 downto 0)
  );
  end component sevenseg_decoder;
  signal sw_in1     : std_logic_vector(3 downto 0) := "0000"; -- the numbers being added
  signal dis_out1   : std_logic_vector(6 downto 0) := "0000000";
begin

	--	Port map: wire your component up to the switches and seven-segment display cathodes
	-----------------------------------------------------	
	sevenseg_decoder_utt : sevenseg_decoder port map(
	i_Hex=> sw_in1(3 downto 0),
	o_seg_n=>dis_out1(6 downto 0)
	);
	test_process : process 
	begin
	-- will test the numerical output of 0 to 15
	sw_in1 <= "0001"; wait for 10 ns;
	       assert (dis_out1 = "0110000") report "bad with one" severity failure;
	sw_in1 <= "1010"; wait for 10 ns;
	       assert (dis_out1 = "0001000") report "bad with A" severity failure;
	sw_in1 <= "0111"; wait for 10 ns;
	       assert (dis_out1 = "0001111") report "bad with 7" severity failure;
	       wait;
	end process;

end test_bench;
