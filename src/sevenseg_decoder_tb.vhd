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
	sw_in1 <= "0000"; wait for 10 ns;
	       assert (dis_out1 = "1111110") report "bad with zero" severity failure;
	sw_in1 <= "0001"; wait for 10 ns;
	       assert (dis_out1 = "0110000") report "bad with one" severity failure;
	sw_in1 <= "0010"; wait for 10 ns;
	       assert (dis_out1 = "1101101") report "bad with two" severity failure;
	sw_in1 <= "0011"; wait for 10 ns;
	       assert (dis_out1 = "1111001") report "bad with three" severity failure;
	sw_in1 <= "0100"; wait for 10 ns;
	       assert (dis_out1 = "0110011") report "bad with four" severity failure;
	sw_in1 <= "0101"; wait for 10 ns;
	       assert (dis_out1 = "1011011") report "bad with five" severity failure;
	sw_in1 <= "0110"; wait for 10 ns;
	       assert (dis_out1 = "1011111") report "bad with six" severity failure;
	sw_in1 <= "0111"; wait for 10 ns;
	       assert (dis_out1 = "1110000") report "bad with seven" severity failure;
	sw_in1 <= "1000"; wait for 10 ns;
	       assert (dis_out1 = "1111111") report "bad with eight" severity failure;
	sw_in1 <= "1001"; wait for 10 ns;
	       assert (dis_out1 = "1110011") report "bad with nine" severity failure;
	sw_in1 <= "1010"; wait for 10 ns;
	       assert (dis_out1 = "0000000") report "bad with other" severity failure;
	sw_in1 <= "1011"; wait for 10 ns;
	       assert (dis_out1 = "0000000") report "bad with other" severity failure;
	sw_in1 <= "1101"; wait for 10 ns;
	       assert (dis_out1 = "0000000") report "bad with other" severity failure;
	sw_in1 <= "1110"; wait for 10 ns;
	       assert (dis_out1 = "0000000") report "bad with other" severity failure;
	sw_in1 <= "1111"; wait for 10 ns;
	       assert (dis_out1 = "0000000") report "bad with other" severity failure;
	       wait;
	end process;

end test_bench;
