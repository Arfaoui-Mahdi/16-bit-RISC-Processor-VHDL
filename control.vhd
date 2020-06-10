

library ieee;
use ieee.std_logic_1164.all;

entity control is
  port ( clk : in  std_logic;
         rst : in  std_logic;

         status     : in  std_logic_vector(3 downto 0);
         instr_cond : in  std_logic_vector(3 downto 0);
         instr_op   : in  std_logic_vector(3 downto 0);
         instr_updt : in  std_logic;

         instr_ce  : out std_logic;
         status_ce : out std_logic;
         acc_ce    : out std_logic;
         pc_ce     : out std_logic;
         rpc_ce    : out std_logic;
         rx_ce     : out std_logic;

         ram_we : out std_logic;

         sel_ram_addr : out std_logic;
         sel_op1      : out std_logic;
         sel_rf_din   : out std_logic_vector(1 downto 0) );
end entity;

architecture arch of control is
  type state is (st_fetch1, st_fetch2, st_decode, st_exec, st_store);

  signal state_0 : state;
  signal state_r : state := st_fetch1;
begin
  state_0 <= st_fetch2 when state_r = st_fetch1 else
             st_decode when state_r = st_fetch2 else
             st_exec   when state_r = st_decode else
             st_store  when state_r = st_exec   else
             st_fetch1 when state_r = st_store  else
             state_r;
								 
 p1: process(state_r,instr_op,instr_cond,status,instr_updt )
 begin
 
 
	instr_ce<='0';
         status_ce <='0';
         acc_ce  <='0';
         pc_ce   <='0';
         rpc_ce <='0';
         rx_ce  <='0';
         ram_we <='0';
			sel_ram_addr <='0';
         sel_op1 <='0';    
         sel_rf_din <="00";   

 case state_r is
      
      when st_fetch1 => sel_ram_addr <='0';
         
		when st_fetch2 => instr_ce <='1';
		   
		when st_decode =>
		    if not((instr_cond = "0001")or( instr_cond = "0010"and status="1000") 
or( instr_cond = "0011"and status/="1000")
or( instr_cond = "0100"and not(status="1000"or status="0100"))
or( instr_cond = "0101"and (status="1000"or status="0100" or status="1100"))
or( instr_cond = "0110"and status="0100")
or( instr_cond = "0111"and status/="0100")
or( instr_cond = "1000"and status="0010")
or( instr_cond = "1001"and status/="0010")
or( instr_cond = "1010"and status="0001")
or( instr_cond = "1011"and status/="0001")or(instr_cond /= "0000" ))               
then
instr_ce    <= '0';
                    status_ce   <= '0' ;
                    acc_ce      <= '0';
                    pc_ce       <= '0';
                    rpc_ce      <= '0';
                    rx_ce       <= '0' ;
                    ram_we      <= '0' ;
			 


elsif ( instr_op="0000" or instr_op="0001" or instr_op="0010" or
      			 instr_op="0100" or instr_op="0101" or instr_op="0110" or
					 instr_op="0111" or instr_op="1001" or instr_op="1011") then
					 
					     instr_ce    <='0';
                    status_ce   <='0';
                    acc_ce      <='0';
                    pc_ce       <='0';
                    rpc_ce      <='0'; 
                    rx_ce       <='0';
                    ram_we      <='0';
                    sel_op1     <='0' ;
			elsif (instr_op="1100" or instr_op="1101") then
					     instr_ce    <= '0' ;
                    status_ce   <= '0' ;
                    acc_ce      <= '0' ;
                    pc_ce       <= '0' ;
                    rpc_ce      <= '0' ;
                    rx_ce       <= '0' ;
                    ram_we      <= '0' ;
                    sel_op1     <= '1' ;
			else 
			           instr_ce    <= '0';
                    status_ce   <= '0';
                    acc_ce      <= '0' ;
                    pc_ce       <= '0';
                    rpc_ce      <= '0';
                    rx_ce       <= '0';
                    ram_we      <= '0';
						  
			end if;

when st_exec =>
					    if not((instr_cond = "0001")or( instr_cond = "0010"and status="1000") 
or( instr_cond = "0011"and status/="1000")
or( instr_cond = "0100"and not(status="1000"or status="0100"))
or( instr_cond = "0101"and (status="1000"or status="0100" or status="1100"))
or( instr_cond = "0110"and status="0100")
or( instr_cond = "0111"and status/="0100")
or( instr_cond = "1000"and status="0010")
or( instr_cond = "1001"and status/="0010")
or( instr_cond = "1010"and status="0001")
or( instr_cond = "1011"and status/="0001"))        then
						  instr_ce    <= '0';
                    status_ce   <= '0';
                    acc_ce      <= '0';
                    pc_ce       <= '1';
                    rpc_ce      <= '0';
                    rx_ce       <= '0';
                    ram_we      <= '0';
                    sel_rf_din  <= "10" ;
				elsif (instr_op="1000" ) then
				        instr_ce    <= '0';
                    status_ce   <= '0';
                    acc_ce      <= '0';
                    pc_ce       <= '1';
                    rpc_ce      <= '0';
                    rx_ce       <= '0';
                    ram_we      <= '0';
                    sel_ram_addr<= '1';
                    sel_rf_din  <= "10";
						
				elsif (instr_op="1001" ) then
				        instr_ce    <= '0';
                    status_ce   <= '0';
                    acc_ce      <= '0';
                    pc_ce       <= '1';
                    rpc_ce      <= '0';
                    rx_ce       <= '0';
                    ram_we      <= '1';
                    sel_ram_addr<= '1';
                    sel_rf_din  <= "10";
				elsif (instr_op="1111" ) then
						  instr_ce    <= '0';
                    status_ce   <= '0';
                    acc_ce      <= '0';
                    rpc_ce      <= '1';
                    rx_ce       <= '0';
                    ram_we      <= '0';
                    sel_rf_din  <= "10";
				elsif (instr_op="1100" or instr_op="1101" or instr_op="1110") then
						  instr_ce    <= '0';
                    status_ce   <= '0';
                    acc_ce      <= '0';
                    rpc_ce      <= '0';
                    rx_ce       <= '0';
                    ram_we      <= '0';
				elsif( instr_updt='0' )  then
						  instr_ce    <= '0';
                    status_ce   <= '0';
                    acc_ce      <= '0';
                    pc_ce       <= '1';
                    rpc_ce      <= '0';
                    rx_ce       <= '0';
                    ram_we      <= '0';
                    sel_rf_din  <= "10";
				else  
			           
				        instr_ce    <= '0' ;
                    status_ce   <= '1' ;
                    acc_ce      <= '0' ;
                    pc_ce       <= '1' ;
                    rpc_ce      <= '0' ;
                    rx_ce       <= '0' ;
                    ram_we      <= '0' ;
                    sel_rf_din  <= "10";
					end if;
				
 when st_store =>
			    if not((instr_cond = "0001")or( instr_cond = "0010"and status="1000") 
or( instr_cond = "0011"and status/="1000")
or( instr_cond = "0100"and not(status="1000"or status="0100"))
or( instr_cond = "0101"and (status="1000"or status="0100" or status="1100"))
or( instr_cond = "0110"and status="0100")
or( instr_cond = "0111"and status/="0100")
or( instr_cond = "1000"and status="0010")
or( instr_cond = "1001"and status/="0010")
or( instr_cond = "1010"and status="0001")
or( instr_cond = "1011"and status/="0001") )      then
						  instr_ce   <= '0';
                    status_ce   <= '0';
                    acc_ce      <= '0';
                    pc_ce       <= '0';
                    rpc_ce      <= '0';
                    rx_ce       <= '0';
                    ram_we      <= '0';
			elsif (instr_op="1100" or instr_op="1101" or instr_op="1110" or instr_op="1111" ) then
						  instr_ce    <= '0';
                    status_ce   <= '0';
                    acc_ce      <= '0';
                    pc_ce       <= '1';
                    rpc_ce      <= '0';
                    rx_ce       <= '0';
                    ram_we      <= '0';
                    sel_rf_din  <= "00";
		   elsif (instr_op="1011") then
					     instr_ce    <= '0';
                    status_ce   <= '0';
                    acc_ce      <= '0';
                    pc_ce       <= '0';
                    rpc_ce      <= '0';
                    rx_ce       <= '1';
                    ram_we      <= '0';
                    sel_rf_din  <= "00";
			elsif (instr_op="1001") then			  
						  instr_ce    <= '0';
						  status_ce   <= '0';
						  acc_ce      <= '0';
                    pc_ce       <= '0';
                    rpc_ce      <= '0';
                    rx_ce       <= '0';
                    ram_we      <= '0';
			elsif (instr_op="1000") then
					     instr_ce    <= '0';
                    status_ce   <= '0';
                    acc_ce      <= '1';
                    pc_ce       <= '0';
                    rpc_ce      <= '0';
                    rx_ce       <= '0';
                    ram_we      <= '0';
                    sel_rf_din  <= "01";
			else
						  instr_ce    <= '0';
                    status_ce   <= '0';
                    acc_ce      <= '1';
                    pc_ce       <= '0';
                    rpc_ce      <= '0';
                    rx_ce       <= '0';
                    ram_we      <= '0';
                    sel_rf_din  <= "00";
						  
			end if;
			
		   
			 				
end case;
end process;
	
				
p2: process(clk, rst)
  begin
    if rst = '1' then
      state_r <= st_fetch1;
    elsif clk'event and clk = '1' then
      state_r <= state_0;
    end if;
  end process p2;

end architecture;