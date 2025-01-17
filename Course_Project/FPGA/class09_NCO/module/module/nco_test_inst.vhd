	component nco_test is
		port (
			clk         : in  std_logic                     := 'X';             -- clk
			clken       : in  std_logic                     := 'X';             -- clken
			phi_inc_i   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- phi_inc_i
			freq_mod_i  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- freq_mod_i
			phase_mod_i : in  std_logic_vector(15 downto 0) := (others => 'X'); -- phase_mod_i
			fsin_o      : out std_logic_vector(11 downto 0);                    -- fsin_o
			fcos_o      : out std_logic_vector(11 downto 0);                    -- fcos_o
			out_valid   : out std_logic;                                        -- out_valid
			reset_n     : in  std_logic                     := 'X'              -- reset_n
		);
	end component nco_test;

	u0 : component nco_test
		port map (
			clk         => CONNECTED_TO_clk,         -- clk.clk
			clken       => CONNECTED_TO_clken,       --  in.clken
			phi_inc_i   => CONNECTED_TO_phi_inc_i,   --    .phi_inc_i
			freq_mod_i  => CONNECTED_TO_freq_mod_i,  --    .freq_mod_i
			phase_mod_i => CONNECTED_TO_phase_mod_i, --    .phase_mod_i
			fsin_o      => CONNECTED_TO_fsin_o,      -- out.fsin_o
			fcos_o      => CONNECTED_TO_fcos_o,      --    .fcos_o
			out_valid   => CONNECTED_TO_out_valid,   --    .out_valid
			reset_n     => CONNECTED_TO_reset_n      -- rst.reset_n
		);

