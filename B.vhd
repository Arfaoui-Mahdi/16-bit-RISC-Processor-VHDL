library ieee;
use ieee.std_logic_1164.all;

entity multip_B is
port (i1, i2: in std_logic_vector(15 downto 0);
           Sel_op1 : in std_logic; 
           op1: out std_logic_vector(15 downto 0));
end multip_B;

architecture arch_multip_B of multip_B is
begin
op1 <= i1 after 5 ns when Sel_op1 ='0' else 
       i2 after 5 ns  when Sel_op1='1' else 
       "0000000000000000" after 0 ns;
end arch_multip_B;
