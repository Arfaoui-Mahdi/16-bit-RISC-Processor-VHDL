library ieee;
use ieee.std_logic_1164.all;

entity multip_A  is
port (i1, i2, i3: in std_logic_vector(15 downto 0);
          Sel_rf_din : in std_logic_vector(1 downto 0); 
          din: out std_logic_vector(15 downto 0));
end multip_A; 
architecture arch_multip_A of multip_A is
begin
din <= i1 after 5 ns when Sel_rf_din ="00" else 
       i2 after 5 ns  when Sel_rf_din ="01" else 
       i3 after 5 ns  when Sel_rf_din ="10"  else
       "0000000000000000" after 0 ns;
end arch_multip_A ;
