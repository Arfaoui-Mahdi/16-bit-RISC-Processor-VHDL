library ieee;
use ieee.std_logic_1164.all;

entity multip_D is
port (i1, i2: in std_logic_vector(15 downto 0);
      imm : in std_logic; 
      op2: out std_logic_vector(15 downto 0));
end multip_D;
architecture arch_multip_D of multip_D is
begin
op2 <= i1 after 5 ns when imm='0' else 
       i2 after 5 ns  when imm='1' else 
       "0000000000000000" after 0 ns;
end arch_multip_D;


