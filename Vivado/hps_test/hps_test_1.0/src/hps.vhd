----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2023 09:37:24 PM
-- Design Name: 
-- Module Name: hps - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hps is
port(
    clk : in std_logic;
    data   : in std_logic_vector(15 downto 0);
    o   : out std_logic_vector(63 downto 0);
    ovalid : out std_logic
  );
end hps;

architecture Behavioral of hps is
signal d1 : std_logic_vector(15 downto 0);
signal d2 : std_logic_vector(15 downto 0);
signal d3 : std_logic_vector(15 downto 0);
signal d5 : std_logic_vector(15 downto 0);
signal temp1 : std_logic_vector(31 downto 0);
signal temp2 : std_logic_vector(31 downto 0);
signal counter : unsigned(2 downto 0);
constant count_limit : unsigned(2 downto 0) := "100";
begin
  process (clk)
  begin
    if rising_edge(clk) then
        if counter = "000" then
            d1 <= data;
	        ovalid <= '1';
        elsif counter = "001" then
            d2 <= data;
            ovalid <= '0';
        elsif counter = "010" then
            d3 <= data;
        elsif counter = "100" then
            d5 <= data;
        end if;

        if counter < count_limit then
            counter <= counter + 1;
        else
            counter <= (others => '0');
	    end if;
    end if;

    temp1 <= d1*d2;
    temp2 <= d3*d5;
    o <= temp1*temp2;
   
  end process;

end Behavioral;
