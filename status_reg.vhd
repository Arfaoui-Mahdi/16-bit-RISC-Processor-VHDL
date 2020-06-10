library ieee;
use ieee.std_logic_1164.all;
entity status_reg is
  port ( 
	 clk,ce,rst : in  std_logic;
         i : in  std_logic_vector(3 downto 0);
         o : out std_logic_vector(3 downto 0) 
	);
end entity;


architecture arch of status_reg is

begin
	process(clk, rst)
	
	begin
		if (rst = '1') then
			o <= "0000";
		elsif(rising_edge(clk))then
			if(ce = '1')then
				o <= i;
			end if;
		end if;
	end process;
end architecture;