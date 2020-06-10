library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ajout is
port (i: in std_logic_vector(15 downto 0);
      o: out std_logic_vector(15 downto 0));
end ajout;
architecture arch_ajout of ajout is
signal s : signed(15 downto 0);
begin
s<= signed(i)+1;
o <= std_logic_vector(s);
end arch_ajout;

