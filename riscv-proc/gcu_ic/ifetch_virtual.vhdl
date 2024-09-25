entity tta0_ifetch_virtual is
    port (
        clk: in std_logic;
        rstx : in std_logic;
        glock_in : in std_logic;
        instruction_out : in std_logic_vector(IMEMWIDTHINMAUS*IMEMMAUWIDTH-1 downto 0);
        fetch_en: in std_logic);
    end tta0_ifetch_virtual;


