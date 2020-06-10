library ieee;
use ieee.std_logic_1164.all;

entity reg_op is
  port ( clk : in  std_logic;
         rst : in  std_logic;

         i : in  std_logic_vector(15 downto 0);
         o : out std_logic_vector(15 downto 0) );
end reg_op;

architecture arch_reg_op of reg_op is
signal sig: std_logic_vector(15 downto 0);
begin
	process(clk,rst)
    begin
		  if(rst = '1') then
			 sig <= (others => '0' );
		  elsif(clk'event and clk = '1')then
			   sig <= i;
		     end if;
	  end process;
	o <= sig;
end arch_reg_op;

