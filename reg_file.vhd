library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity reg_file is
	port (
		clk,rst,acc_ce,pc_ce,rpc_ce,rx_ce : in std_logic;
		acc_out,pc_out,rx_out : out std_logic_vector(15 downto 0);
		rx_num : in std_logic_vector(5 downto 0);
		din : in std_logic_vector(15 downto 0) 
	);
end entity;
architecture arch of reg_file is
type regs is array (0 to 63) of std_logic_vector(15 downto 0);
signal tab: regs;
begin
	process(clk, rst)
	begin
		if(rst = '1') then
			for i in 0 to 62 loop
				tab(i) <= X"0000";
			end loop;
			tab(63) <= X"A000";
		elsif (rising_edge(clk)) then
			if(acc_ce = '1')then
				tab(0) <= din;
			elsif(pc_ce = '1')then
				tab(63) <= din;
			elsif(rpc_ce = '1')then
				tab(62) <= din;
			elsif(rx_ce = '1')then
				tab(to_integer(unsigned(rx_num))) <= din;
			end if;
		end if;	
	end process;
	rx_out <= tab(to_integer(unsigned(rx_num)));
	acc_out <= tab(0);
	pc_out <= tab(63);
end architecture;