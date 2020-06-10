library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity control_test is
end entity;

architecture arch of control_test is
  signal done   : boolean := false;
  signal passed : boolean := true;
  signal ok     : boolean := true;

  component control is
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

  signal clk : std_logic;
  signal rst : std_logic;
  
  signal status     : std_logic_vector(3 downto 0);
  signal instr_cond : std_logic_vector(3 downto 0);
  signal instr_op   : std_logic_vector(3 downto 0);
  signal instr_updt : std_logic;

  signal instr_ce  : std_logic;
  signal status_ce : std_logic;
  signal acc_ce    : std_logic;
  signal pc_ce     : std_logic;
  signal rpc_ce    : std_logic;
  signal rx_ce     : std_logic;

  signal ram_we : std_logic;

  signal sel_ram_addr : std_logic;
  signal sel_op1      : std_logic;
  signal sel_rf_din   : std_logic_vector(1 downto 0);
begin

  control_0 : control
    port map ( clk => clk,
               rst => rst,

               status     => status,
               instr_cond => instr_cond,
               instr_op   => instr_op,
               instr_updt => instr_updt,
               
               instr_ce  => instr_ce,
               status_ce => status_ce,
               acc_ce    => acc_ce,
               pc_ce     => pc_ce,
               rpc_ce    => rpc_ce,
               rx_ce     => rx_ce,
               
               ram_we => ram_we,

               sel_ram_addr => sel_ram_addr,
               sel_op1      => sel_op1,
               sel_rf_din   => sel_rf_din );
  
  -----------------------------------------------------------------------------
  -- Clock and reset signal
  -----------------------------------------------------------------------------

  process
  begin
    if not done then
      clk <= '1';
      wait for 5 ns;
      clk <= '0';
      wait for 5 ns;
    else
      clk <= 'U';
      wait;
    end if;
  end process;

  process
  begin
    rst <= '1';
    wait for 12 ns;
    rst <= '0';
    wait;
  end process;

  -----------------------------------------------------------------------------
  -- Input stimuli
  -----------------------------------------------------------------------------

  process
  begin
    -- Reset ------------------------------------------------------------- 0 ns
    status     <= "0101";
    instr_cond <= "1010";
    instr_op   <= "0101";
    instr_updt <= '1';
    wait for 10 ns;
    -- Main loop -------------------------------------------------------- 10 ns
    for i in 0 to 15 loop
      ---------------------------------------------------------- 2400·i + 10 ns
      for c in 0 to 11 loop
        ------------------------------------------------ 2400·i + 200·c + 10 ns
        for u in 0 to 1 loop
          -------------------------------------- 2400·i + 200·c + 100·u + 10 ns
          for s in 0 to 1 loop
            -- Fetch -------------------- 2400·i + 200·c + 100·u + 50·s + 10 ns
            status     <= "0101";
            instr_cond <= "1010";
            instr_op   <= "0101";
            instr_updt <= '1';
            wait for 20 ns;
            -- Decode ------------------- 2400·i + 200·c + 100·u + 50·s + 30 ns
            if c/2 = 0 then
              if c mod 2 = s then
                status <= "0101";
              else
                status <= "1010";
              end if;
            elsif c/2 = 1 then
              if c mod 2 = s then
                status <= "0000";
              else
                status <= "1000";
              end if;
            elsif c/2 = 2 then
              if c mod 2 = s then
                status <= "0100";
              else
                status <= "0000";
              end if;
            elsif c/2 = 3 then
              if c mod 2 = s then
                status <= "0000";
              else
                status <= "0100";
              end if;
            elsif c/2 = 4 then
              if c mod 2 = s then
                status <= "0000";
              else
                status <= "0010";
              end if;
            elsif c/2 = 5 then
              if c mod 2 = s then
                status <= "0000";
              else
                status <= "0001";
              end if;
            end if;
            instr_cond <= conv_std_logic_vector(c, 4);
            instr_op   <= conv_std_logic_vector(i, 4);
            instr_updt <= conv_std_logic_vector(u, 1)(0);
            wait for 30 ns;
            ----------------------------- 2400·i + 200·c + 100·u + 50·s + 60 ns
          end loop;
          ------------------------------------- 2400·i + 200·c + 100·u + 110 ns
        end loop;
        ----------------------------------------------- 2400·i + 200·c + 210 ns
      end loop;
      -------------------------------------------------------- 2400·i + 2410 ns
    end loop;
    ------------------------------------------------------------------ 38410 ns
    status     <= "UUUU";
    instr_cond <= "UUUU";
    instr_op   <= "UUUU";
    instr_updt <= 'U';
    wait;
  end process;

  -----------------------------------------------------------------------------
  -- Output verification
  -----------------------------------------------------------------------------

  process
  begin
    wait for 9 ns;
    -- Reset (before clk) ------------------------------------------------ 9 ns
    ok   <= (instr_ce     = '0' ) and
            (status_ce    = '0' ) and
            (acc_ce       = '0' ) and
            (pc_ce        = '0' ) and
            (rpc_ce       = '0' ) and
            (rx_ce        = '0' ) and
            (ram_we       = '0' ) and
            (sel_ram_addr = '0' );
    wait for 2 ns;
    -- Main loop -------------------------------------------------------- 11 ns
    for i in 0 to 15 loop
      ---------------------------------------------------------- 2400·i + 11 ns
      for c in 0 to 11 loop
        ------------------------------------------------ 2400·i + 200·c + 11 ns
        for u in 0 to 1 loop
          -------------------------------------- 2400·i + 200·c + 100·u + 11 ns
          for s in 0 to 1 loop
            -- Fetch 1 ------------------ 2400·i + 200·c + 100·u + 50·s + 11 ns
            ok <= (instr_ce     = '0' ) and
                  (status_ce    = '0' ) and
                  (acc_ce       = '0' ) and
                  (pc_ce        = '0' ) and
                  (rpc_ce       = '0' ) and
                  (rx_ce        = '0' ) and
                  (ram_we       = '0' ) and
                  (sel_ram_addr = '0' );
            wait for 10 ns;
            -- Fetch 2 ------------------ 2400·i + 200·c + 100·u + 50·s + 21 ns
            ok <= (instr_ce     = '1' ) and
                  (status_ce    = '0' ) and
                  (acc_ce       = '0' ) and
                  (pc_ce        = '0' ) and
                  (rpc_ce       = '0' ) and
                  (rx_ce        = '0' ) and
                  (ram_we       = '0' );
            wait for 10 ns;
            -- Decode ------------------- 2400·i + 200·c + 100·u + 50·s + 31 ns
            if (s = 0 and c /= 1) or c = 0 then
              ok <= (instr_ce     = '0' ) and
                    (status_ce    = '0' ) and
                    (acc_ce       = '0' ) and
                    (pc_ce        = '0' ) and
                    (rpc_ce       = '0' ) and
                    (rx_ce        = '0' ) and
                    (ram_we       = '0' );
            elsif i = 0 or i = 1 or i = 2 or i = 4  or i = 5
               or i = 6 or i = 7 or i = 9 or i = 11 then
              ok <= (instr_ce     = '0' ) and
                    (status_ce    = '0' ) and
                    (acc_ce       = '0' ) and
                    (pc_ce        = '0' ) and
                    (rpc_ce       = '0' ) and
                    (rx_ce        = '0' ) and
                    (ram_we       = '0' ) and
                    (sel_op1      = '0' );
            elsif i = 12 or i = 13 then
              ok <= (instr_ce     = '0' ) and
                    (status_ce    = '0' ) and
                    (acc_ce       = '0' ) and
                    (pc_ce        = '0' ) and
                    (rpc_ce       = '0' ) and
                    (rx_ce        = '0' ) and
                    (ram_we       = '0' ) and
                    (sel_op1      = '1' );
            else
              ok <= (instr_ce     = '0' ) and
                    (status_ce    = '0' ) and
                    (acc_ce       = '0' ) and
                    (pc_ce        = '0' ) and
                    (rpc_ce       = '0' ) and
                    (rx_ce        = '0' ) and
                    (ram_we       = '0' );
            end if;
            wait for 10 ns;
            -- Execute ------------------ 2400·i + 200·c + 100·u + 50·s + 41 ns
            if (s = 0 and c /= 1) or c = 0 then
              ok <= (instr_ce     = '0' ) and
                    (status_ce    = '0' ) and
                    (acc_ce       = '0' ) and
                    (pc_ce        = '1' ) and
                    (rpc_ce       = '0' ) and
                    (rx_ce        = '0' ) and
                    (ram_we       = '0' ) and
                    (sel_rf_din   = "10");
            elsif i = 8 then
              ok <= (instr_ce     = '0' ) and
                    (status_ce    = '0' ) and
                    (acc_ce       = '0' ) and
                    (pc_ce        = '1' ) and
                    (rpc_ce       = '0' ) and
                    (rx_ce        = '0' ) and
                    (ram_we       = '0' ) and
                    (sel_ram_addr = '1' ) and
                    (sel_rf_din   = "10");
            elsif i = 9 then
              ok <= (instr_ce     = '0' ) and
                    (status_ce    = '0' ) and
                    (acc_ce       = '0' ) and
                    (pc_ce        = '1' ) and
                    (rpc_ce       = '0' ) and
                    (rx_ce        = '0' ) and
                    (ram_we       = '1' ) and
                    (sel_ram_addr = '1' ) and
                    (sel_rf_din   = "10");
            elsif i = 15 then
              ok <= (instr_ce     = '0' ) and
                    (status_ce    = '0' ) and
                    (acc_ce       = '0' ) and
                    (rpc_ce       = '1' ) and
                    (rx_ce        = '0' ) and
                    (ram_we       = '0' ) and
                    (sel_rf_din   = "10");
            elsif i = 12 or i = 13 or i = 14 then
              ok <= (instr_ce     = '0' ) and
                    (status_ce    = '0' ) and
                    (acc_ce       = '0' ) and
                    (rpc_ce       = '0' ) and
                    (rx_ce        = '0' ) and
                    (ram_we       = '0' );
            elsif u = 0 then
              ok <= (instr_ce     = '0' ) and
                    (status_ce    = '0' ) and
                    (acc_ce       = '0' ) and
                    (pc_ce        = '1' ) and
                    (rpc_ce       = '0' ) and
                    (rx_ce        = '0' ) and
                    (ram_we       = '0' ) and
                    (sel_rf_din   = "10");
            else
              ok <= (instr_ce     = '0' ) and
                    (status_ce    = '1' ) and
                    (acc_ce       = '0' ) and
                    (pc_ce        = '1' ) and
                    (rpc_ce       = '0' ) and
                    (rx_ce        = '0' ) and
                    (ram_we       = '0' ) and
                    (sel_rf_din   = "10");
            end if;
            wait for 10 ns;
            -- Store -------------------- 2400·i + 200·c + 100·u + 50·s + 51 ns
            if (s = 0 and c /= 1) or c = 0 then
              ok <= (instr_ce     = '0' ) and
                    (status_ce    = '0' ) and
                    (acc_ce       = '0' ) and
                    (pc_ce        = '0' ) and
                    (rpc_ce       = '0' ) and
                    (rx_ce        = '0' ) and
                    (ram_we       = '0' );
            elsif i = 12 or i = 13 or i = 14 or i = 15 then
              ok <= (instr_ce     = '0' ) and
                    (status_ce    = '0' ) and
                    (acc_ce       = '0' ) and
                    (pc_ce        = '1' ) and
                    (rpc_ce       = '0' ) and
                    (rx_ce        = '0' ) and
                    (ram_we       = '0' ) and
                    (sel_rf_din   = "00");
            elsif i = 11 then
              ok <= (instr_ce     = '0' ) and
                    (status_ce    = '0' ) and
                    (acc_ce       = '0' ) and
                    (pc_ce        = '0' ) and
                    (rpc_ce       = '0' ) and
                    (rx_ce        = '1' ) and
                    (ram_we       = '0' ) and
                    (sel_rf_din   = "00");
            elsif i = 9 then
              ok <= (instr_ce     = '0' ) and
                    (status_ce    = '0' ) and
                    (acc_ce       = '0' ) and
                    (pc_ce        = '0' ) and
                    (rpc_ce       = '0' ) and
                    (rx_ce        = '0' ) and
                    (ram_we       = '0' );
            elsif i = 8 then
              ok <= (instr_ce     = '0' ) and
                    (status_ce    = '0' ) and
                    (acc_ce       = '1' ) and
                    (pc_ce        = '0' ) and
                    (rpc_ce       = '0' ) and
                    (rx_ce        = '0' ) and
                    (ram_we       = '0' ) and
                    (sel_rf_din   = "01");
            else
              ok <= (instr_ce     = '0' ) and
                    (status_ce    = '0' ) and
                    (acc_ce       = '1' ) and
                    (pc_ce        = '0' ) and
                    (rpc_ce       = '0' ) and
                    (rx_ce        = '0' ) and
                    (ram_we       = '0' ) and
                    (sel_rf_din   = "00");
            end if;
            wait for 10 ns;
            ----------------------------- 2400·i + 200·c + 100·u + 50·s + 61 ns
          end loop;
          ------------------------------------- 2400·i + 200·c + 100·u + 111 ns
        end loop;
        ----------------------------------------------- 2400·i + 200·c + 211 ns
      end loop;
      -------------------------------------------------------- 2400·i + 2411 ns
    end loop;
    ------------------------------------------------------------------ 38411 ns
    wait for 1 ns;
    ------------------------------------------------------------------ 38412 ns
    ok   <= true;
    done <= true;
    wait;
  end process;

  passed <= passed and ok;
  
end architecture;
