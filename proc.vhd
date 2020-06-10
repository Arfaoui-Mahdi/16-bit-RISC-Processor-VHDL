-------------------------------------------------------------------------------
-- Top-level processor component
--
-- Ports:
--   - clk [in]  : clock signal
--   - rst [in]  : reset signal
--
--   - ram_addr [out] : memory address
--   - ram_din  [out] : data input to memory
--   - ram_dout [in]  : data output from memory
--   - ram_we   [out] : write enable signal for memory
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity proc is
  port ( clk : in  std_logic;
         rst : in  std_logic;
         
         ram_addr : out std_logic_vector(15 downto 0);
         ram_din  : out std_logic_vector(15 downto 0);
         ram_dout : in  std_logic_vector(15 downto 0);
         ram_we   : out std_logic );
end proc;

architecture archprc of proc is
  component instr_reg 
   port ( clk : in  std_logic;
          ce  : in  std_logic;
          rst : in  std_logic;

          instr : in  std_logic_vector(15 downto 0);
          cond  : out std_logic_vector(3 downto 0);
          op    : out std_logic_vector(3 downto 0);
          updt  : out std_logic;
          imm   : out std_logic;
          val   : out std_logic_vector(5 downto 0) );
  end component;

  component status_reg
   port ( clk : in  std_logic;
          ce  : in  std_logic;
          rst : in  std_logic;

          i : in  std_logic_vector(3 downto 0);
          o : out std_logic_vector(3 downto 0) );
  end component;

  component reg_file 
    port ( clk : in  std_logic;
           rst : in  std_logic;

           acc_out : out std_logic_vector(15 downto 0);
           acc_ce  : in  std_logic;

           pc_out : out std_logic_vector(15 downto 0);
           pc_ce  : in  std_logic;
           rpc_ce : in  std_logic;

           rx_num : in  std_logic_vector(5 downto 0);
           rx_out : out std_logic_vector(15 downto 0);
           rx_ce  : in  std_logic;

           din : in  std_logic_vector(15 downto 0) );
  end component;

  component alu 
    port ( op : in  std_logic_vector(3 downto 0);
           i1 : in  std_logic_vector(15 downto 0);
           i2 : in  std_logic_vector(15 downto 0);
           o  : out std_logic_vector(15 downto 0);
           st : out std_logic_vector(3 downto 0) );
  end component;

  component control 
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
  end component;
component multip_A  is
port (i1, i2, i3: in std_logic_vector(15 downto 0);
          Sel_rf_din : in std_logic_vector(1 downto 0); 
          din: out std_logic_vector(15 downto 0));

end component;

component multip_B is
port (i1, i2: in std_logic_vector(15 downto 0);
           Sel_op1 : in std_logic; 
           op1: out std_logic_vector(15 downto 0));

end component;

component multip_C is
port (i1, i2: in std_logic_vector(15 downto 0);
      Sel_ram_addr : in std_logic; 
      s: out std_logic_vector(15 downto 0));
end component;

component multip_D is
port (i1, i2: in std_logic_vector(15 downto 0);
      imm : in std_logic; 
      op2: out std_logic_vector(15 downto 0));
end component;

component ajout is
port (i: in std_logic_vector(15 downto 0);
      o: out std_logic_vector(15 downto 0));
end component;

component reg_op
 port ( clk : in  std_logic;
         rst : in  std_logic;

         i : in  std_logic_vector(15 downto 0);
         o : out std_logic_vector(15 downto 0) );
end component;


component reg_res
 port ( clk : in  std_logic;
        rst : in  std_logic;

         i : in  std_logic_vector(15 downto 0);
         o : out std_logic_vector(15 downto 0) );
end component;

signal a11,a13,s_acc,s_pc,s_rx,out_alu,s_din,in_op1,out_op1,in_op2,out_op2:std_logic_vector(15 downto 0);
signal s_rxnum:std_logic_vector(5 downto 0);
signal s_op,s_stin,s_stout,s_cond:std_logic_vector(3 downto 0);
signal s_instr_ce,s_status_ce,s_acc_ce,s_pc_ce,s_rpc_ce,s_rx_ce,s_sel_op1,s_sel_ram_addr,s_updt,s_imm:std_logic;
signal s_sel_rf_din:std_logic_vector(1 downto 0);
signal s_valeur:std_logic_vector(15 downto 0);


begin
s_valeur<="0000000000" & s_rxnum;
A: multip_A port map(a11,ram_dout,a13,s_sel_rf_din,s_din);
banc : reg_file port map(clk,rst,s_acc,s_acc_ce,s_pc,s_pc_ce,s_rpc_ce,s_rxnum,s_rx,s_rx_ce,s_din);
B : multip_B port map(s_acc,s_pc,s_sel_op1,in_op1);
Aj : ajout port map(s_pc,a13);
C : multip_C port map(s_pc,out_op2,s_sel_ram_addr,ram_addr);
D : multip_D port map(s_rx,s_valeur,s_imm,in_op2);
regop1 : reg_op port map(clk,rst,in_op1,out_op1);
regop2 : reg_op port map(clk,rst,in_op2,out_op2);
ual : alu port map(s_op,out_op1,out_op2,out_alu,s_stin);
regres : reg_res port map(clk,rst,out_alu,a11);
statut : status_reg port map(clk,s_status_ce,rst,s_stin,s_stout);
instruction :  instr_reg port map(clk,s_instr_ce,rst,ram_dout,s_cond,s_op,s_updt,s_imm,s_rxnum);
controle : control port map(clk,rst,s_stout,s_cond,s_op,s_updt,s_instr_ce,s_status_ce,s_acc_ce,s_pc_ce,s_rpc_ce,s_rx_ce,ram_we,s_sel_ram_addr,s_sel_op1,s_sel_rf_din);
ram_din <= out_op1; 

end archprc;

