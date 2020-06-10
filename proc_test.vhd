library ieee;
use ieee.std_logic_1164.all;

entity instr_reg_dummy is
  port ( clk : in  std_logic;
         ce  : in  std_logic;
         rst : in  std_logic;

         instr : in  std_logic_vector(15 downto 0);
         cond  : out std_logic_vector(3 downto 0);
         op    : out std_logic_vector(3 downto 0);
         updt  : out std_logic;
         imm   : out std_logic;
         val   : out std_logic_vector(5 downto 0) );
end entity;

architecture arch of instr_reg_dummy is
  signal done   : boolean := false;
  signal passed : boolean := true;
  signal ok     : boolean := true;
begin

  -----------------------------------------------------------------------------
  -- Input stimuli
  -----------------------------------------------------------------------------

  process
  begin
    -- Reset ------------------------------------------------------------- 0 ns
    cond <= "0000";
    op   <= "0000";
    updt <= '0';
    imm  <= '0';
    val  <= "000000";
    wait for 12 ns;
    -- Instr CE --------------------------------------------------------- 12 ns
    wait for 10 ns;
    -- Instr cond ------------------------------------------------------- 22 ns
    cond <= "0101";
    wait for 10 ns;
    cond <= "0000";
    -- Instr op --------------------------------------------------------- 32 ns
    op   <= "1010";
    wait for 10 ns;
    op   <= "0000";
    -- Instr updt ------------------------------------------------------- 42 ns
    updt <= '1';
    wait for 10 ns;
    updt <= '0';
    -- Instr imm -------------------------------------------------------- 52 ns
    imm  <= '1';
    val  <= "100101";
    wait for 10 ns;
    -- Instr reg -------------------------------------------------------- 62 ns
    imm  <= '0';
    val  <= "011010";
    wait for 10 ns;
    val  <= "000000";
    -- Status CE -------------------------------------------------------- 72 ns
    wait for 10 ns;
    -- Status in -------------------------------------------------------- 82 ns
    wait for 10 ns;
    -- Status out ------------------------------------------------------- 92 ns
    wait for 10 ns;
    -- Accumulator CE -------------------------------------------------- 102 ns
    wait for 10 ns;
    -- Accumulator out ------------------------------------------------- 112 ns
    wait for 10 ns;
    -- Program counter CE ---------------------------------------------- 122 ns
    wait for 10 ns;
    -- Program counter out --------------------------------------------- 132 ns
    wait for 10 ns;
    -- Return program counter CE --------------------------------------- 142 ns
    wait for 10 ns;
    -- Register CE ----------------------------------------------------- 152 ns
    wait for 10 ns;
    -- Register out ---------------------------------------------------- 162 ns
    wait for 10 ns;
    -- RAM WE ---------------------------------------------------------- 172 ns
    wait for 10 ns;
    -- RAM out --------------------------------------------------------- 182 ns
    wait for 10 ns;
    -- Select RAM address [0] ------------------------------------------ 192 ns
    wait for 10 ns;
    -- Select RAM address [1] ------------------------------------------ 202 ns
    wait for 10 ns;
    -- Select operand 1 [0] -------------------------------------------- 212 ns
    wait for 10 ns;
    -- Select operand 1 [1] -------------------------------------------- 222 ns
    wait for 10 ns;
    -- Select register file in [00] ------------------------------------ 232 ns
    wait for 10 ns;
    -- Select register file in [01] ------------------------------------ 242 ns
    wait for 10 ns;
    -- Select register file in [10] ------------------------------------ 252 ns
    wait for 10 ns;
    -------------------------------------------------------------------- 262 ns
    cond <= "UUUU";
    op   <= "UUUU";
    updt <= 'U';
    imm  <= 'U';
    val  <= "UUUUUU";
    wait;
  end process;

  -----------------------------------------------------------------------------
  -- Output verification
  -----------------------------------------------------------------------------

  process
  begin
    wait for 9 ns;
    -- Reset (before clk) ------------------------------------------------ 9 ns
    ok <= (rst = '1') and
          (ce  = '0');
    wait for 2 ns;
    -- Reset (after clk) ------------------------------------------------ 11 ns
    ok <= (rst = '1') and
          (ce  = '0');
    wait for 8 ns;
    -- Instr CE (before clk) -------------------------------------------- 19 ns
    ok <= (rst = '0') and
          (ce  = '1');
    wait for 2 ns;
    -- Instr CE (after clk) --------------------------------------------- 21 ns
    ok <= (rst = '0') and
          (ce  = '1');
    wait for 8 ns;
    -- Instr cond (before clk) ------------------------------------------ 29 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Instr cond (after clk) ------------------------------------------- 31 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Instr op (before clk) -------------------------------------------- 39 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Instr op (after clk) --------------------------------------------- 41 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Instr updt (before clk) ------------------------------------------ 49 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Instr updt (after clk) ------------------------------------------- 51 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Instr imm (before clk) ------------------------------------------- 59 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Instr imm (after clk) -------------------------------------------- 61 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Instr reg (before clk) ------------------------------------------- 69 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Instr reg (after clk) -------------------------------------------- 71 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Status CE (before clk) ------------------------------------------- 79 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Status CE (after clk) -------------------------------------------- 81 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Status in (before clk) ------------------------------------------- 89 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Status in (after clk) -------------------------------------------- 91 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Status out (before clk) ------------------------------------------ 99 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Status out (after clk) ------------------------------------------ 101 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Accumulator CE (before clk) ------------------------------------- 109 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Accumulator CE (after clk) -------------------------------------- 111 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Accumulator out (before clk) ------------------------------------ 119 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Accumulator out (after clk) ------------------------------------- 121 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Program counter CE (before clk) --------------------------------- 129 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Program counter CE (after clk) ---------------------------------- 131 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Program counter out (before clk) -------------------------------- 139 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Program counter out (after clk) --------------------------------- 141 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Return program counter CE (before clk) -------------------------- 149 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Return program counter CE (after clk) --------------------------- 151 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Register CE (before clk) ---------------------------------------- 159 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Register CE (after clk) ----------------------------------------- 161 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Register out (before clk) --------------------------------------- 169 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Register out (after clk) ---------------------------------------- 171 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- RAM WE (before clk) --------------------------------------------- 179 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- RAM WE (after clk) ---------------------------------------------- 181 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- RAM out (before clk) -------------------------------------------- 189 ns
    ok <= (rst = '0') and
          (ce  = '0') and
          (instr = X"A5A5");
    wait for 2 ns;
    -- RAM out (after clk) --------------------------------------------- 191 ns
    ok <= (rst = '0') and
          (ce  = '0') and
          (instr = X"A5A5");
    wait for 8 ns;
    -- Select RAM address [0] (before clk) ----------------------------- 199 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Select RAM address [0] (after clk) ------------------------------ 201 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Select RAM address [1] (before clk) ----------------------------- 209 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Select RAM address [1] (after clk) ------------------------------ 211 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Select operand 1 [0] (before clk) ------------------------------- 219 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Select operand 1 [0] (after clk) -------------------------------- 221 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Select operand 1 [1] (before clk) ------------------------------- 229 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Select operand 1 [1] (after clk) -------------------------------- 231 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Select register file in [00] (before clk) ----------------------- 239 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Select register file in [00] (after clk) ------------------------ 241 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Select register file in [01] (before clk) ----------------------- 249 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Select register file in [01] (after clk) ------------------------ 251 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Select register file in [10] (before clk) ----------------------- 259 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Select register file in [10] (after clk) ------------------------ 261 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 1 ns;
    -------------------------------------------------------------------- 262 ns
    wait;
  end process;

  passed <= passed and ok;

end architecture;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity status_reg_dummy is
  port ( clk : in  std_logic;
         ce  : in  std_logic;
         rst : in  std_logic;

         i : in  std_logic_vector(3 downto 0);
         o : out std_logic_vector(3 downto 0) );
end entity;

architecture arch of status_reg_dummy is
  signal done   : boolean := false;
  signal passed : boolean := true;
  signal ok     : boolean := true;
begin

  -----------------------------------------------------------------------------
  -- Input stimuli
  -----------------------------------------------------------------------------

  process
  begin
    -- Reset ------------------------------------------------------------- 0 ns
    o <= "0000";
    wait for 12 ns;
    -- Instr CE --------------------------------------------------------- 12 ns
    wait for 10 ns;
    -- Instr cond ------------------------------------------------------- 22 ns
    wait for 10 ns;
    -- Instr op --------------------------------------------------------- 32 ns
    wait for 10 ns;
    -- Instr updt ------------------------------------------------------- 42 ns
    wait for 10 ns;
    -- Instr imm -------------------------------------------------------- 52 ns
    wait for 10 ns;
    -- Instr reg -------------------------------------------------------- 62 ns
    wait for 10 ns;
    -- Status CE -------------------------------------------------------- 72 ns
    wait for 10 ns;
    -- Status in -------------------------------------------------------- 82 ns
    wait for 10 ns;
    -- Status out ------------------------------------------------------- 92 ns
    o <= "1010";
    wait for 10 ns;
    o <= "0000";
    -- Accumulator CE -------------------------------------------------- 102 ns
    wait for 10 ns;
    -- Accumulator out ------------------------------------------------- 112 ns
    wait for 10 ns;
    -- Program counter CE ---------------------------------------------- 122 ns
    wait for 10 ns;
    -- Program counter out --------------------------------------------- 132 ns
    wait for 10 ns;
    -- Return program counter CE --------------------------------------- 142 ns
    wait for 10 ns;
    -- Register CE ----------------------------------------------------- 152 ns
    wait for 10 ns;
    -- Register out ---------------------------------------------------- 162 ns
    wait for 10 ns;
    -- RAM WE ---------------------------------------------------------- 172 ns
    wait for 10 ns;
    -- RAM out --------------------------------------------------------- 182 ns
    wait for 10 ns;
    -- Select RAM address [0] ------------------------------------------ 192 ns
    wait for 10 ns;
    -- Select RAM address [1] ------------------------------------------ 202 ns
    wait for 10 ns;
    -- Select operand 1 [0] -------------------------------------------- 212 ns
    wait for 10 ns;
    -- Select operand 1 [1] -------------------------------------------- 222 ns
    wait for 10 ns;
    -- Select register file in [00] ------------------------------------ 232 ns
    wait for 10 ns;
    -- Select register file in [01] ------------------------------------ 242 ns
    wait for 10 ns;
    -- Select register file in [10] ------------------------------------ 252 ns
    wait for 10 ns;
    -------------------------------------------------------------------- 262 ns
    o <= "UUUU";
    wait;
  end process;

  -----------------------------------------------------------------------------
  -- Output verification
  -----------------------------------------------------------------------------

  process
  begin
    wait for 9 ns;
    -- Reset (before clk) ------------------------------------------------ 9 ns
    ok <= (rst = '1') and
          (ce  = '0');
    wait for 2 ns;
    -- Reset (after clk) ------------------------------------------------ 11 ns
    ok <= (rst = '1') and
          (ce  = '0');
    wait for 8 ns;
    -- Instr CE (before clk) -------------------------------------------- 19 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Instr CE (after clk) --------------------------------------------- 21 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Instr cond (before clk) ------------------------------------------ 29 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Instr cond (after clk) ------------------------------------------- 31 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Instr op (before clk) -------------------------------------------- 39 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Instr op (after clk) --------------------------------------------- 41 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Instr updt (before clk) ------------------------------------------ 49 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Instr updt (after clk) ------------------------------------------- 51 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Instr imm (before clk) ------------------------------------------- 59 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Instr imm (after clk) -------------------------------------------- 61 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Instr reg (before clk) ------------------------------------------- 69 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Instr reg (after clk) -------------------------------------------- 71 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Status CE (before clk) ------------------------------------------- 79 ns
    ok <= (rst = '0') and
          (ce  = '1');
    wait for 2 ns;
    -- Status CE (after clk) -------------------------------------------- 81 ns
    ok <= (rst = '0') and
          (ce  = '1');
    wait for 8 ns;
    -- Status in (before clk) ------------------------------------------- 89 ns
    ok <= (rst = '0') and
          (ce  = '0') and
          (i   = "0101");
    wait for 2 ns;
    -- Status in (after clk) -------------------------------------------- 91 ns
    ok <= (rst = '0') and
          (ce  = '0') and
          (i   = "0101");
    wait for 8 ns;
    -- Status out (before clk) ------------------------------------------ 99 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Status out (after clk) ------------------------------------------ 101 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Accumulator CE (before clk) ------------------------------------- 109 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Accumulator CE (after clk) -------------------------------------- 111 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Accumulator out (before clk) ------------------------------------ 119 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Accumulator out (after clk) ------------------------------------- 121 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Program counter CE (before clk) --------------------------------- 129 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Program counter CE (after clk) ---------------------------------- 131 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Program counter out (before clk) -------------------------------- 139 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Program counter out (after clk) --------------------------------- 141 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Return program counter CE (before clk) -------------------------- 149 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Return program counter CE (after clk) --------------------------- 151 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Register CE (before clk) ---------------------------------------- 159 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Register CE (after clk) ----------------------------------------- 161 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Register out (before clk) --------------------------------------- 169 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Register out (after clk) ---------------------------------------- 171 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- RAM WE (before clk) --------------------------------------------- 179 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- RAM WE (after clk) ---------------------------------------------- 181 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- RAM out (before clk) -------------------------------------------- 189 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- RAM out (after clk) --------------------------------------------- 191 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Select RAM address [0] (before clk) ----------------------------- 199 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Select RAM address [0] (after clk) ------------------------------ 201 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Select RAM address [1] (before clk) ----------------------------- 209 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Select RAM address [1] (after clk) ------------------------------ 211 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Select operand 1 [0] (before clk) ------------------------------- 219 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Select operand 1 [0] (after clk) -------------------------------- 221 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Select operand 1 [1] (before clk) ------------------------------- 229 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Select operand 1 [1] (after clk) -------------------------------- 231 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Select register file in [00] (before clk) ----------------------- 239 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Select register file in [00] (after clk) ------------------------ 241 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Select register file in [01] (before clk) ----------------------- 249 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Select register file in [01] (after clk) ------------------------ 251 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 8 ns;
    -- Select register file in [10] (before clk) ----------------------- 259 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 2 ns;
    -- Select register file in [10] (after clk) ------------------------ 261 ns
    ok <= (rst = '0') and
          (ce  = '0');
    wait for 1 ns;
    -------------------------------------------------------------------- 262 ns
    wait;
  end process;

  passed <= passed and ok;

end architecture;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity reg_file_dummy is
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
end entity;

architecture arch of reg_file_dummy is
  signal done   : boolean := false;
  signal passed : boolean := true;
  signal ok     : boolean := true;
begin

  -----------------------------------------------------------------------------
  -- Input stimuli
  -----------------------------------------------------------------------------

  process
  begin
    -- Reset ------------------------------------------------------------- 0 ns
    acc_out <= X"0000";
    pc_out  <= X"0000";
    rx_out  <= X"0000";
    wait for 12 ns;
    -- Instr CE --------------------------------------------------------- 12 ns
    wait for 10 ns;
    -- Instr cond ------------------------------------------------------- 22 ns
    wait for 10 ns;
    -- Instr op --------------------------------------------------------- 32 ns
    wait for 10 ns;
    -- Instr updt ------------------------------------------------------- 42 ns
    wait for 10 ns;
    -- Instr imm -------------------------------------------------------- 52 ns
    wait for 10 ns;
    -- Instr reg -------------------------------------------------------- 62 ns
    wait for 10 ns;
    -- Status CE -------------------------------------------------------- 72 ns
    wait for 10 ns;
    -- Status in -------------------------------------------------------- 82 ns
    wait for 10 ns;
    -- Status out ------------------------------------------------------- 92 ns
    wait for 10 ns;
    -- Accumulator CE -------------------------------------------------- 102 ns
    wait for 10 ns;
    -- Accumulator out ------------------------------------------------- 112 ns
    acc_out <= X"4B4B";
    wait for 10 ns;
    acc_out <= X"0000";
    -- Program counter CE ---------------------------------------------- 122 ns
    wait for 10 ns;
    -- Program counter out --------------------------------------------- 132 ns
    pc_out  <= X"3C3C";
    wait for 10 ns;
    pc_out  <= X"0000";
    -- Return program counter CE --------------------------------------- 142 ns
    wait for 10 ns;
    -- Register CE ----------------------------------------------------- 152 ns
    wait for 10 ns;
    -- Register out ---------------------------------------------------- 162 ns
    rx_out  <= X"2D2D";
    wait for 10 ns;
    rx_out  <= X"0000";
    -- RAM WE ---------------------------------------------------------- 172 ns
    wait for 10 ns;
    -- RAM out --------------------------------------------------------- 182 ns
    wait for 10 ns;
    -- Select RAM address [0] ------------------------------------------ 192 ns
    pc_out  <= X"5A5A";
    wait for 10 ns;
    pc_out  <= X"0000";
    -- Select RAM address [1] ------------------------------------------ 202 ns
    rx_out  <= X"A5A5";
    wait for 10 ns;
    rx_out  <= X"0000";
    -- Select operand 1 [0] -------------------------------------------- 212 ns
    acc_out <= X"5A5A";
    wait for 10 ns;
    acc_out <= X"0000";
    -- Select operand 1 [1] -------------------------------------------- 222 ns
    pc_out  <= X"4B4B";
    wait for 10 ns;
    pc_out  <= X"0000";
    -- Select register file in [00] ------------------------------------ 232 ns
    wait for 10 ns;
    -- Select register file in [01] ------------------------------------ 242 ns
    wait for 10 ns;
    -- Select register file in [10] ------------------------------------ 252 ns
    pc_out  <= X"3C3B";
    wait for 10 ns;
    pc_out  <= X"0000";
    -------------------------------------------------------------------- 262 ns
    acc_out <= "UUUUUUUUUUUUUUUU";
    pc_out  <= "UUUUUUUUUUUUUUUU";
    rx_out  <= "UUUUUUUUUUUUUUUU";
    wait;
  end process;

  -----------------------------------------------------------------------------
  -- Output verification
  -----------------------------------------------------------------------------

  process
  begin
    wait for 9 ns;
    -- Reset (before clk) ------------------------------------------------ 9 ns
    ok <= (rst    = '1') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- Reset (after clk) ------------------------------------------------ 11 ns
    ok <= (rst    = '1') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- Instr CE (before clk) -------------------------------------------- 19 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- Instr CE (after clk) --------------------------------------------- 21 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- Instr cond (before clk) ------------------------------------------ 29 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- Instr cond (after clk) ------------------------------------------- 31 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- Instr op (before clk) -------------------------------------------- 39 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- Instr op (after clk) --------------------------------------------- 41 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- Instr updt (before clk) ------------------------------------------ 49 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- Instr updt (after clk) ------------------------------------------- 51 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- Instr imm (before clk) ------------------------------------------- 59 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- Instr imm (after clk) -------------------------------------------- 61 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- Instr reg (before clk) ------------------------------------------- 69 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0') and
          (rx_num = "011010");
    wait for 2 ns;
    -- Instr reg (after clk) -------------------------------------------- 71 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0') and
          (rx_num = "011010");
    wait for 8 ns;
    -- Status CE (before clk) ------------------------------------------- 79 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- Status CE (after clk) -------------------------------------------- 81 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- Status in (before clk) ------------------------------------------- 89 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- Status in (after clk) -------------------------------------------- 91 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- Status out (before clk) ------------------------------------------ 99 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- Status out (after clk) ------------------------------------------ 101 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- Accumulator CE (before clk) ------------------------------------- 109 ns
    ok <= (rst    = '0') and
          (acc_ce = '1') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- Accumulator CE (after clk) -------------------------------------- 111 ns
    ok <= (rst    = '0') and
          (acc_ce = '1') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- Accumulator out (before clk) ------------------------------------ 119 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- Accumulator out (after clk) ------------------------------------- 121 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- Program counter CE (before clk) --------------------------------- 129 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '1') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- Program counter CE (after clk) ---------------------------------- 131 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '1') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- Program counter out (before clk) -------------------------------- 139 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- Program counter out (after clk) --------------------------------- 141 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- Return program counter CE (before clk) -------------------------- 149 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '1') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- Return program counter CE (after clk) --------------------------- 151 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '1') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- Register CE (before clk) ---------------------------------------- 159 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '1');
    wait for 2 ns;
    -- Register CE (after clk) ----------------------------------------- 161 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '1');
    wait for 8 ns;
    -- Register out (before clk) --------------------------------------- 169 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- Register out (after clk) ---------------------------------------- 171 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- RAM WE (before clk) --------------------------------------------- 179 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- RAM WE (after clk) ---------------------------------------------- 181 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- RAM out (before clk) -------------------------------------------- 189 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0') and
          (din    = X"A5A5");
    wait for 2 ns;
    -- RAM out (after clk) --------------------------------------------- 191 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0') and
          (din    = X"A5A5");
    wait for 8 ns;
    -- Select RAM address [0] (before clk) ----------------------------- 199 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- Select RAM address [0] (after clk) ------------------------------ 201 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- Select RAM address [1] (before clk) ----------------------------- 209 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- Select RAM address [1] (after clk) ------------------------------ 211 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- Select operand 1 [0] (before clk) ------------------------------- 219 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- Select operand 1 [0] (after clk) -------------------------------- 221 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- Select operand 1 [1] (before clk) ------------------------------- 229 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 2 ns;
    -- Select operand 1 [1] (after clk) -------------------------------- 231 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0');
    wait for 8 ns;
    -- Select register file in [00] (before clk) ----------------------- 239 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0') and
          (din    = X"0000");
    wait for 2 ns;
    -- Select register file in [00] (after clk) ------------------------ 241 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0') and
          (din    = X"5A5A");
    wait for 8 ns;
    -- Select register file in [01] (before clk) ----------------------- 249 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0') and
          (din    = X"4B4B");
    wait for 2 ns;
    -- Select register file in [01] (after clk) ------------------------ 251 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0') and
          (din    = X"4B4B");
    wait for 8 ns;
    -- Select register file in [10] (before clk) ----------------------- 259 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0') and
          (din    = X"3C3C");
    wait for 2 ns;
    -- Select register file in [10] (after clk) ------------------------ 261 ns
    ok <= (rst    = '0') and
          (acc_ce = '0') and
          (pc_ce  = '0') and
          (rpc_ce = '0') and
          (rx_ce  = '0') and
          (din    = X"3C3C");
    wait for 1 ns;
    -------------------------------------------------------------------- 262 ns
    wait;
  end process;

  passed <= passed and ok;

end architecture;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity alu_dummy is
  port ( op : in  std_logic_vector(3 downto 0);
         i1 : in  std_logic_vector(15 downto 0);
         i2 : in  std_logic_vector(15 downto 0);
         o  : out std_logic_vector(15 downto 0);
         st : out std_logic_vector(3 downto 0) );
end entity;

architecture arch of alu_dummy is
  signal done   : boolean := false;
  signal passed : boolean := true;
  signal ok     : boolean := true;
begin

  -----------------------------------------------------------------------------
  -- Input stimuli
  -----------------------------------------------------------------------------

  process
  begin
    -- Reset ------------------------------------------------------------- 0 ns
    o  <= X"0000";
    st <= "0000";
    wait for 12 ns;
    -- Instr CE --------------------------------------------------------- 12 ns
    wait for 10 ns;
    -- Instr cond ------------------------------------------------------- 22 ns
    wait for 10 ns;
    -- Instr op --------------------------------------------------------- 32 ns
    wait for 10 ns;
    -- Instr updt ------------------------------------------------------- 42 ns
    wait for 10 ns;
    -- Instr imm -------------------------------------------------------- 52 ns
    wait for 10 ns;
    -- Instr reg -------------------------------------------------------- 62 ns
    wait for 10 ns;
    -- Status CE -------------------------------------------------------- 72 ns
    wait for 10 ns;
    -- Status in -------------------------------------------------------- 82 ns
    st <= "0101";
    wait for 10 ns;
    st <= "0000";
    -- Status out ------------------------------------------------------- 92 ns
    wait for 10 ns;
    -- Accumulator CE -------------------------------------------------- 102 ns
    wait for 10 ns;
    -- Accumulator out ------------------------------------------------- 112 ns
    wait for 10 ns;
    -- Program counter CE ---------------------------------------------- 122 ns
    wait for 10 ns;
    -- Program counter out --------------------------------------------- 132 ns
    wait for 10 ns;
    -- Return program counter CE --------------------------------------- 142 ns
    wait for 10 ns;
    -- Register CE ----------------------------------------------------- 152 ns
    wait for 10 ns;
    -- Register out ---------------------------------------------------- 162 ns
    wait for 10 ns;
    -- RAM WE ---------------------------------------------------------- 172 ns
    wait for 10 ns;
    -- RAM out --------------------------------------------------------- 182 ns
    wait for 10 ns;
    -- Select RAM address [0] ------------------------------------------ 192 ns
    wait for 10 ns;
    -- Select RAM address [1] ------------------------------------------ 202 ns
    wait for 10 ns;
    -- Select operand 1 [0] -------------------------------------------- 212 ns
    wait for 10 ns;
    -- Select operand 1 [1] -------------------------------------------- 222 ns
    wait for 10 ns;
    -- Select register file in [00] ------------------------------------ 232 ns
    o  <= X"5A5A";
    wait for 10 ns;
    o  <= X"0000";
    -- Select register file in [01] ------------------------------------ 242 ns
    wait for 10 ns;
    -- Select register file in [10] ------------------------------------ 252 ns
    wait for 10 ns;
    -------------------------------------------------------------------- 262 ns
    o  <= "UUUUUUUUUUUUUUUU";
    st <= "UUUU";
    wait;
  end process;

  -----------------------------------------------------------------------------
  -- Output verification
  -----------------------------------------------------------------------------

  process
  begin
    wait for 9 ns;
    -- Reset (before clk) ------------------------------------------------ 9 ns
    wait for 2 ns;
    -- Reset (after clk) ------------------------------------------------ 11 ns
    wait for 8 ns;
    -- Instr CE (before clk) -------------------------------------------- 19 ns
    wait for 2 ns;
    -- Instr CE (after clk) --------------------------------------------- 21 ns
    wait for 8 ns;
    -- Instr cond (before clk) ------------------------------------------ 29 ns
    wait for 2 ns;
    -- Instr cond (after clk) ------------------------------------------- 31 ns
    wait for 8 ns;
    -- Instr op (before clk) -------------------------------------------- 39 ns
    wait for 2 ns;
    -- Instr op (after clk) --------------------------------------------- 41 ns
    wait for 8 ns;
    -- Instr updt (before clk) ------------------------------------------ 49 ns
    wait for 2 ns;
    -- Instr updt (after clk) ------------------------------------------- 51 ns
    wait for 8 ns;
    -- Instr imm (before clk) ------------------------------------------- 59 ns
    ok <= (i2 = "0000000000000000");
    wait for 2 ns;
    -- Instr imm (after clk) -------------------------------------------- 61 ns
    ok <= (i2 = "0000000000100101");
    wait for 8 ns;
    ok <= true;
    -- Instr reg (before clk) ------------------------------------------- 69 ns
    wait for 2 ns;
    -- Instr reg (after clk) -------------------------------------------- 71 ns
    wait for 8 ns;
    -- Status CE (before clk) ------------------------------------------- 79 ns
    wait for 2 ns;
    -- Status CE (after clk) -------------------------------------------- 81 ns
    wait for 8 ns;
    -- Status in (before clk) ------------------------------------------- 89 ns
    wait for 2 ns;
    -- Status in (after clk) -------------------------------------------- 91 ns
    wait for 8 ns;
    -- Status out (before clk) ------------------------------------------ 99 ns
    wait for 2 ns;
    -- Status out (after clk) ------------------------------------------ 101 ns
    wait for 8 ns;
    -- Accumulator CE (before clk) ------------------------------------- 109 ns
    wait for 2 ns;
    -- Accumulator CE (after clk) -------------------------------------- 111 ns
    wait for 8 ns;
    -- Accumulator out (before clk) ------------------------------------ 119 ns
    ok <= (i1 = X"0000");
    wait for 2 ns;
    -- Accumulator out (after clk) ------------------------------------- 121 ns
    ok <= (i1 = X"4B4B");
    wait for 8 ns;
    -- Program counter CE (before clk) --------------------------------- 129 ns
    wait for 2 ns;
    -- Program counter CE (after clk) ---------------------------------- 131 ns
    wait for 8 ns;
    -- Program counter out (before clk) -------------------------------- 139 ns
    ok <= (i1 = X"0000");
    wait for 2 ns;
    -- Program counter out (after clk) --------------------------------- 141 ns
    ok <= (i1 = X"3C3C");
    wait for 8 ns;
    -- Return program counter CE (before clk) -------------------------- 149 ns
    wait for 2 ns;
    -- Return program counter CE (after clk) --------------------------- 151 ns
    wait for 8 ns;
    -- Register CE (before clk) ---------------------------------------- 159 ns
    wait for 2 ns;
    -- Register CE (after clk) ----------------------------------------- 161 ns
    wait for 8 ns;
    -- Register out (before clk) --------------------------------------- 169 ns
    ok <= (i2 = X"0000");
    wait for 2 ns;
    -- Register out (after clk) ---------------------------------------- 171 ns
    ok <= (i2 = X"2D2D");
    wait for 8 ns;
    -- RAM WE (before clk) --------------------------------------------- 179 ns
    wait for 2 ns;
    -- RAM WE (after clk) ---------------------------------------------- 181 ns
    wait for 8 ns;
    -- RAM out (before clk) -------------------------------------------- 189 ns
    wait for 2 ns;
    -- RAM out (after clk) --------------------------------------------- 191 ns
    wait for 8 ns;
    -- Select RAM address [0] (before clk) ----------------------------- 199 ns
    wait for 2 ns;
    -- Select RAM address [0] (after clk) ------------------------------ 201 ns
    wait for 8 ns;
    -- Select RAM address [1] (before clk) ----------------------------- 209 ns
    wait for 2 ns;
    -- Select RAM address [1] (after clk) ------------------------------ 211 ns
    wait for 8 ns;
    -- Select operand 1 [0] (before clk) ------------------------------- 219 ns
    ok <= (i1 = X"0000");
    wait for 2 ns;
    -- Select operand 1 [0] (after clk) -------------------------------- 221 ns
    ok <= (i1 = X"5A5A");
    wait for 8 ns;
    -- Select operand 1 [1] (before clk) ------------------------------- 229 ns
    ok <= (i1 = X"5A5A");
    wait for 2 ns;
    -- Select operand 1 [1] (after clk) -------------------------------- 231 ns
    ok <= (i1 = X"4B4B");
    wait for 8 ns;
    -- Select register file in [00] (before clk) ----------------------- 239 ns
    wait for 2 ns;
    -- Select register file in [00] (after clk) ------------------------ 241 ns
    wait for 8 ns;
    -- Select register file in [01] (before clk) ----------------------- 249 ns
    wait for 2 ns;
    -- Select register file in [01] (after clk) ------------------------ 251 ns
    wait for 8 ns;
    -- Select register file in [10] (before clk) ----------------------- 259 ns
    wait for 2 ns;
    -- Select register file in [10] (after clk) ------------------------ 261 ns
    wait for 1 ns;
    -------------------------------------------------------------------- 262 ns
    wait;
  end process;

  passed <= passed and ok;

end architecture;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity control_dummy is
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

architecture arch of control_dummy is
  signal done   : boolean := false;
  signal passed : boolean := true;
  signal ok     : boolean := true;
begin

  -----------------------------------------------------------------------------
  -- Input stimuli
  -----------------------------------------------------------------------------

  process
  begin
    -- Reset ------------------------------------------------------------- 0 ns
    instr_ce     <= '0';
    status_ce    <= '0';
    acc_ce       <= '0';
    pc_ce        <= '0';
    rpc_ce       <= '0';
    rx_ce        <= '0';
    ram_we       <= '0';
    sel_ram_addr <= '0';
    sel_op1      <= '0';
    sel_rf_din   <= "00";
    wait for 12 ns;
    -- Instr CE --------------------------------------------------------- 12 ns
    instr_ce     <= '1';
    wait for 10 ns;
    instr_ce     <= '0';
    -- Instr cond ------------------------------------------------------- 22 ns
    wait for 10 ns;
    -- Instr op --------------------------------------------------------- 32 ns
    wait for 10 ns;
    -- Instr updt ------------------------------------------------------- 42 ns
    wait for 10 ns;
    -- Instr imm -------------------------------------------------------- 52 ns
    wait for 10 ns;
    -- Instr reg -------------------------------------------------------- 62 ns
    wait for 10 ns;
    -- Status CE -------------------------------------------------------- 72 ns
    status_ce    <= '1';
    wait for 10 ns;
    status_ce    <= '0';
    -- Status in -------------------------------------------------------- 82 ns
    wait for 10 ns;
    -- Status out ------------------------------------------------------- 92 ns
    wait for 10 ns;
    -- Accumulator CE -------------------------------------------------- 102 ns
    acc_ce       <= '1';
    wait for 10 ns;
    acc_ce       <= '0';
    -- Accumulator out ------------------------------------------------- 112 ns
    wait for 10 ns;
    -- Program counter CE ---------------------------------------------- 122 ns
    pc_ce        <= '1';
    wait for 10 ns;
    pc_ce        <= '0';
    -- Program counter out --------------------------------------------- 132 ns
    sel_op1      <= '1';
    wait for 10 ns;
    sel_op1      <= '0';
    -- Return program counter CE --------------------------------------- 142 ns
    rpc_ce       <= '1';
    wait for 10 ns;
    rpc_ce       <= '0';
    -- Register CE ----------------------------------------------------- 152 ns
    rx_ce        <= '1';
    wait for 10 ns;
    rx_ce        <= '0';
    -- Register out ---------------------------------------------------- 162 ns
    wait for 10 ns;
    -- RAM WE ---------------------------------------------------------- 172 ns
    ram_we       <= '1';
    wait for 10 ns;
    ram_we       <= '0';
    -- RAM out --------------------------------------------------------- 182 ns
    sel_rf_din   <= "01";
    wait for 10 ns;
    sel_rf_din   <= "00";
    -- Select RAM address [0] ------------------------------------------ 192 ns
    sel_ram_addr <= '0';
    wait for 10 ns;
    -- Select RAM address [1] ------------------------------------------ 202 ns
    sel_ram_addr <= '1';
    wait for 10 ns;
    sel_ram_addr <= '0';
    -- Select operand 1 [0] -------------------------------------------- 212 ns
    sel_op1      <= '0';
    wait for 10 ns;
    -- Select operand 1 [1] -------------------------------------------- 222 ns
    sel_op1      <= '1';
    wait for 10 ns;
    sel_op1      <= '0';
    -- Select register file in [00] ------------------------------------ 232 ns
    sel_rf_din   <= "00";
    wait for 10 ns;
    -- Select register file in [01] ------------------------------------ 242 ns
    sel_rf_din   <= "01";
    wait for 10 ns;
    -- Select register file in [10] ------------------------------------ 252 ns
    sel_rf_din   <= "10";
    wait for 10 ns;
    -------------------------------------------------------------------- 262 ns
    instr_ce     <= 'U';
    status_ce    <= 'U';
    acc_ce       <= 'U';
    pc_ce        <= 'U';
    rpc_ce       <= 'U';
    rx_ce        <= 'U';
    ram_we       <= 'U';
    sel_ram_addr <= 'U';
    sel_op1      <= 'U';
    sel_rf_din   <= "UU";
    wait;
  end process;

  -----------------------------------------------------------------------------
  -- Output verification
  -----------------------------------------------------------------------------

  process
  begin
    wait for 9 ns;
    -- Reset (before clk) ------------------------------------------------ 9 ns
    ok <= (rst = '1');
    wait for 2 ns;
    -- Reset (after clk) ------------------------------------------------ 11 ns
    ok <= (rst = '1');
    wait for 8 ns;
    -- Instr CE (before clk) -------------------------------------------- 19 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- Instr CE (after clk) --------------------------------------------- 21 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- Instr cond (before clk) ------------------------------------------ 29 ns
    ok <= (rst = '0') and
          (instr_cond = "0101");
    wait for 2 ns;
    -- Instr cond (after clk) ------------------------------------------- 31 ns
    ok <= (rst = '0') and
          (instr_cond = "0101");
    wait for 8 ns;
    -- Instr op (before clk) -------------------------------------------- 39 ns
    ok <= (rst = '0') and
          (instr_op = "1010");
    wait for 2 ns;
    -- Instr op (after clk) --------------------------------------------- 41 ns
    ok <= (rst = '0') and
          (instr_op = "1010");
    wait for 8 ns;
    -- Instr updt (before clk) ------------------------------------------ 49 ns
    ok <= (rst = '0') and
          (instr_updt = '1');
    wait for 2 ns;
    -- Instr updt (after clk) ------------------------------------------- 51 ns
    ok <= (rst = '0') and
          (instr_updt = '1');
    wait for 8 ns;
    -- Instr imm (before clk) ------------------------------------------- 59 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- Instr imm (after clk) -------------------------------------------- 61 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- Instr reg (before clk) ------------------------------------------- 69 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- Instr reg (after clk) -------------------------------------------- 71 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- Status CE (before clk) ------------------------------------------- 79 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- Status CE (after clk) -------------------------------------------- 81 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- Status in (before clk) ------------------------------------------- 89 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- Status in (after clk) -------------------------------------------- 91 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- Status out (before clk) ------------------------------------------ 99 ns
    ok <= (rst = '0') and
          (status = "1010");
    wait for 2 ns;
    -- Status out (after clk) ------------------------------------------ 101 ns
    ok <= (rst = '0') and
          (status = "1010");
    wait for 8 ns;
    -- Accumulator CE (before clk) ------------------------------------- 109 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- Accumulator CE (after clk) -------------------------------------- 111 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- Accumulator out (before clk) ------------------------------------ 119 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- Accumulator out (after clk) ------------------------------------- 121 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- Program counter CE (before clk) --------------------------------- 129 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- Program counter CE (after clk) ---------------------------------- 131 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- Program counter out (before clk) -------------------------------- 139 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- Program counter out (after clk) --------------------------------- 141 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- Return program counter CE (before clk) -------------------------- 149 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- Return program counter CE (after clk) --------------------------- 151 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- Register CE (before clk) ---------------------------------------- 159 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- Register CE (after clk) ----------------------------------------- 161 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- Register out (before clk) --------------------------------------- 169 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- Register out (after clk) ---------------------------------------- 171 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- RAM WE (before clk) --------------------------------------------- 179 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- RAM WE (after clk) ---------------------------------------------- 181 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- RAM out (before clk) -------------------------------------------- 189 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- RAM out (after clk) --------------------------------------------- 191 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- Select RAM address [0] (before clk) ----------------------------- 199 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- Select RAM address [0] (after clk) ------------------------------ 201 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- Select RAM address [1] (before clk) ----------------------------- 209 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- Select RAM address [1] (after clk) ------------------------------ 211 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- Select operand 1 [0] (before clk) ------------------------------- 219 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- Select operand 1 [0] (after clk) -------------------------------- 221 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- Select operand 1 [1] (before clk) ------------------------------- 229 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- Select operand 1 [1] (after clk) -------------------------------- 231 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- Select register file in [00] (before clk) ----------------------- 239 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- Select register file in [00] (after clk) ------------------------ 241 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- Select register file in [01] (before clk) ----------------------- 249 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- Select register file in [01] (after clk) ------------------------ 251 ns
    ok <= (rst = '0');
    wait for 8 ns;
    -- Select register file in [10] (before clk) ----------------------- 259 ns
    ok <= (rst = '0');
    wait for 2 ns;
    -- Select register file in [10] (after clk) ------------------------ 261 ns
    ok <= (rst = '0');
    wait for 1 ns;
    -------------------------------------------------------------------- 262 ns
    wait;
  end process;

  passed <= passed and ok;

end architecture;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity proc_test is
end entity;

architecture arch of proc_test is
  signal done   : boolean := false;
  signal passed : boolean := true;
  signal ok     : boolean := true;

  component proc is
    port ( clk : in  std_logic;
           rst : in  std_logic;
         
           ram_addr : out std_logic_vector(15 downto 0);
           ram_din  : out std_logic_vector(15 downto 0);
           ram_dout : in  std_logic_vector(15 downto 0);
           ram_we   : out std_logic );
  end component;

  signal clk : std_logic;
  signal rst : std_logic;
  
  signal ram_addr : std_logic_vector(15 downto 0);
  signal ram_din  : std_logic_vector(15 downto 0);
  signal ram_dout : std_logic_vector(15 downto 0);
  signal ram_we   : std_logic;
begin

  proc_0 : proc
    port map ( clk => clk,
               rst => rst,

               ram_addr => ram_addr,
               ram_din  => ram_din,
               ram_dout => ram_dout,
               ram_we   => ram_we );

  -----------------------------------------------------------------------------
  -- Clock signal
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

  -----------------------------------------------------------------------------
  -- Input stimuli
  -----------------------------------------------------------------------------

  process
  begin
    -- Reset ------------------------------------------------------------- 0 ns
    rst      <= '1';
    ram_dout <= X"0000";
    wait for 12 ns;
    rst      <= '0';
    -- Instr CE --------------------------------------------------------- 12 ns
    wait for 10 ns;
    -- Instr cond ------------------------------------------------------- 22 ns
    wait for 10 ns;
    -- Instr op --------------------------------------------------------- 32 ns
    wait for 10 ns;
    -- Instr updt ------------------------------------------------------- 42 ns
    wait for 10 ns;
    -- Instr imm -------------------------------------------------------- 52 ns
    wait for 10 ns;
    -- Instr reg -------------------------------------------------------- 62 ns
    wait for 10 ns;
    -- Status CE -------------------------------------------------------- 72 ns
    wait for 10 ns;
    -- Status in -------------------------------------------------------- 82 ns
    wait for 10 ns;
    -- Status out ------------------------------------------------------- 92 ns
    wait for 10 ns;
    -- Accumulator CE -------------------------------------------------- 102 ns
    wait for 10 ns;
    -- Accumulator out ------------------------------------------------- 112 ns
    wait for 10 ns;
    -- Program counter CE ---------------------------------------------- 122 ns
    wait for 10 ns;
    -- Program counter out --------------------------------------------- 132 ns
    wait for 10 ns;
    -- Return program counter CE --------------------------------------- 142 ns
    wait for 10 ns;
    -- Register CE ----------------------------------------------------- 152 ns
    wait for 10 ns;
    -- Register out ---------------------------------------------------- 162 ns
    wait for 10 ns;
    -- RAM WE ---------------------------------------------------------- 172 ns
    wait for 10 ns;
    -- RAM out --------------------------------------------------------- 182 ns
    ram_dout <= X"A5A5";
    wait for 10 ns;
    ram_dout <= X"0000";
    -- Select RAM address [0] ------------------------------------------ 192 ns
    wait for 10 ns;
    -- Select RAM address [1] ------------------------------------------ 202 ns
    wait for 10 ns;
    -- Select operand 1 [0] -------------------------------------------- 212 ns
    wait for 10 ns;
    -- Select operand 1 [1] -------------------------------------------- 222 ns
    wait for 10 ns;
    -- Select register file in [00] ------------------------------------ 232 ns
    wait for 10 ns;
    -- Select register file in [01] ------------------------------------ 242 ns
    ram_dout <= X"4B4B";
    wait for 10 ns;
    ram_dout <= X"0000";
    -- Select register file in [10] ------------------------------------ 252 ns
    wait for 10 ns;
    -------------------------------------------------------------------- 262 ns
    rst      <= 'U';
    ram_dout <= "UUUUUUUUUUUUUUUU";
    wait;
  end process;

  -----------------------------------------------------------------------------
  -- Output verification
  -----------------------------------------------------------------------------

  process
  begin
    wait for 9 ns;
    -- Reset (before clk) ------------------------------------------------ 9 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Reset (after clk) ------------------------------------------------ 11 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Instr CE (before clk) -------------------------------------------- 19 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Instr CE (after clk) --------------------------------------------- 21 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Instr cond (before clk) ------------------------------------------ 29 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Instr cond (after clk) ------------------------------------------- 31 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Instr op (before clk) -------------------------------------------- 39 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Instr op (after clk) --------------------------------------------- 41 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Instr updt (before clk) ------------------------------------------ 49 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Instr updt (after clk) ------------------------------------------- 51 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Instr imm (before clk) ------------------------------------------- 59 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Instr imm (after clk) -------------------------------------------- 61 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Instr reg (before clk) ------------------------------------------- 69 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Instr reg (after clk) -------------------------------------------- 71 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Status CE (before clk) ------------------------------------------- 79 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Status CE (after clk) -------------------------------------------- 81 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Status in (before clk) ------------------------------------------- 89 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Status in (after clk) -------------------------------------------- 91 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Status out (before clk) ------------------------------------------ 99 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Status out (after clk) ------------------------------------------ 101 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Accumulator CE (before clk) ------------------------------------- 109 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Accumulator CE (after clk) -------------------------------------- 111 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Accumulator out (before clk) ------------------------------------ 119 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Accumulator out (after clk) ------------------------------------- 121 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Program counter CE (before clk) --------------------------------- 129 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Program counter CE (after clk) ---------------------------------- 131 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Program counter out (before clk) -------------------------------- 139 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Program counter out (after clk) --------------------------------- 141 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Return program counter CE (before clk) -------------------------- 149 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Return program counter CE (after clk) --------------------------- 151 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Register CE (before clk) ---------------------------------------- 159 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Register CE (after clk) ----------------------------------------- 161 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Register out (before clk) --------------------------------------- 169 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Register out (after clk) ---------------------------------------- 171 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- RAM WE (before clk) --------------------------------------------- 179 ns
    ok <= (ram_we = '1');
    wait for 2 ns;
    -- RAM WE (after clk) ---------------------------------------------- 181 ns
    ok <= (ram_we = '1');
    wait for 8 ns;
    -- RAM out (before clk) -------------------------------------------- 189 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- RAM out (after clk) --------------------------------------------- 191 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Select RAM address [0] (before clk) ----------------------------- 199 ns
    ok <= (ram_we = '0') and
          (ram_addr = X"5A5A");
    wait for 2 ns;
    -- Select RAM address [0] (after clk) ------------------------------ 201 ns
    ok <= (ram_we = '0') and
          (ram_addr = X"5A5A");
    wait for 8 ns;
    -- Select RAM address [1] (before clk) ----------------------------- 209 ns
    ok <= (ram_we = '0') and
          (ram_addr = X"0000");
    wait for 2 ns;
    -- Select RAM address [1] (after clk) ------------------------------ 211 ns
    ok <= (ram_we = '0') and
          (ram_addr = X"A5A5");
    wait for 8 ns;
    -- Select operand 1 [0] (before clk) ------------------------------- 219 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Select operand 1 [0] (after clk) -------------------------------- 221 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Select operand 1 [1] (before clk) ------------------------------- 229 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Select operand 1 [1] (after clk) -------------------------------- 231 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Select register file in [00] (before clk) ----------------------- 239 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Select register file in [00] (after clk) ------------------------ 241 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Select register file in [01] (before clk) ----------------------- 249 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Select register file in [01] (after clk) ------------------------ 251 ns
    ok <= (ram_we = '0');
    wait for 8 ns;
    -- Select register file in [10] (before clk) ----------------------- 259 ns
    ok <= (ram_we = '0');
    wait for 2 ns;
    -- Select register file in [10] (after clk) ------------------------ 261 ns
    ok <= (ram_we = '0');
    wait for 1 ns;
    -------------------------------------------------------------------- 262 ns
    ok   <= true;
    done <= true;
    wait;
  end process;

  passed <= passed and ok;
  
end architecture;
