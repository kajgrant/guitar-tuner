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
    a   : in std_logic_vector(31 downto 0);
    b   : in std_logic_vector(31 downto 0);
    o   : out std_logic_vector(31 downto 0)
  );
end hps;

architecture Behavioral of hps is
signal temp : std_logic_vector(63 downto 0);
begin
    temp <= a(31 downto 16)*a(15 downto 0)*b(31 downto 16)*b(15 downto 0);
    o <= temp(63 downto 32);
 
end Behavioral;
