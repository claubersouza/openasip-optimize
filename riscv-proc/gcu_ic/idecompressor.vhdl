-- Copyright (c) 2002-2009 Tampere University.
--
-- This file is part of TTA-Based Codesign Environment (TCE).
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the "Software"),
-- to deal in the Software without restriction, including without limitation
-- the rights to use, copy, modify, merge, publish, distribute, sublicense,
-- and/or sell copies of the Software, and to permit persons to whom the
-- Software is furnished to do so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-- FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-- DEALINGS IN THE SOFTWARE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.tta0_globals.all;
use work.tta0_imem_mau.all;


entity tta0_decompressor is

  port (
    fetch_en        : out std_logic;
    lock            : in  std_logic;
    fetchblock      : in  std_logic_vector(INSTRUCTIONWIDTH-1 downto 0);
    instructionword : out std_logic_vector(INSTRUCTIONWIDTH-1 downto 0);
    glock           : out std_logic;
    lock_r          : in  std_logic;
    clk             : in  std_logic;
    rstx            : in  std_logic);
  
end tta0_decompressor;

architecture structural of tta0_decompressor is
  signal teste       : std_logic;
  signal counter       : integer;
  signal teste2 : unsigned(INSTRUCTIONWIDTH-1 downto 0);
  --signal teste2 :  integer := 21894267136;
  --signal teste2 : std_logic_vector(INSTRUCTIONWIDTH-1 downto 0) := "00000101000100000101010000000001000";
begin  -- structural
process (clk, rstx)
  begin
    if rstx = '0' then
      teste <= '0';
      counter <= 0;
      elsif rising_edge(clk) then
        counter <= counter + 1 ;

        -- if instructionword = "0000010100010000010101000000000100000000" then
        --     teste <= '1';
        -- end if;
        end if;
        -- if counter = 8 then
        --   fetch_en <= '1';
        --   else 
        --   fetch_en <= '0';
        --   end if ;
  end process;

  -- process (counter)
  -- begin

  --  if counter = 8 then
  --   fetch_en <= '1';
  --   else 
  --   fetch_en <= '0';
  --   end if ;
  -- end process;

  glock <= '0';
  fetch_en <= '1' when (counter = 25 or counter = 26 or counter = 27) else '1';--- not lock_r;
  instructionword <= fetchblock(fetchblock'length-1 downto fetchblock'length-INSTRUCTIONWIDTH);
  
  -- process (clk, rstx)
  -- begin  -- process immediates
  --   if rstx = '0' then
  --     instructionword <= (others => '0');
  --     teste2 <= unsigned(21894267136, 36);
  --     elsif clk'event and clk = '1' then 
      
  --     if  counter = 5 then
  --       instructionword <= std_logic_vector(teste2);
  --     else    
  --     instructionword <= fetchblock(fetchblock'length-1 downto fetchblock'length-INSTRUCTIONWIDTH);
  --       end if ;
  --     end if;
  -- end process;
    

end structural;

