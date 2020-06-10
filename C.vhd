library ieee;
use ieee.std_logic_1164.all;

entity multip_C is
port (i1, i2: in std_logic_vector(15 downto 0);
      Sel_ram_addr : in std_logic; 
      s: out std_logic_vector(15 downto 0));
end multip_C;
architecture arch_multip_C of multip_C is
begin
s <= i1 after 7 ns when Sel_ram_addr ='0' else 
     i2 after 7 ns  when Sel_ram_addr ='1' else       
       "0000000000000000" after 0 ns;
end arch_multip_C;
