-- NativePhy.vhd

-- Generated using ACDS version 15.1 193

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity NativePhy is
	port (
		pll_powerdown           : in  std_logic_vector(0 downto 0)   := (others => '0'); --           pll_powerdown.pll_powerdown
		tx_analogreset          : in  std_logic_vector(0 downto 0)   := (others => '0'); --          tx_analogreset.tx_analogreset
		tx_digitalreset         : in  std_logic_vector(0 downto 0)   := (others => '0'); --         tx_digitalreset.tx_digitalreset
		tx_pll_refclk           : in  std_logic_vector(0 downto 0)   := (others => '0'); --           tx_pll_refclk.tx_pll_refclk
		tx_serial_data          : out std_logic_vector(0 downto 0);                      --          tx_serial_data.tx_serial_data
		pll_locked              : out std_logic_vector(0 downto 0);                      --              pll_locked.pll_locked
		rx_analogreset          : in  std_logic_vector(0 downto 0)   := (others => '0'); --          rx_analogreset.rx_analogreset
		rx_digitalreset         : in  std_logic_vector(0 downto 0)   := (others => '0'); --         rx_digitalreset.rx_digitalreset
		rx_cdr_refclk           : in  std_logic_vector(0 downto 0)   := (others => '0'); --           rx_cdr_refclk.rx_cdr_refclk
		rx_pma_clkout           : out std_logic_vector(0 downto 0);                      --           rx_pma_clkout.rx_pma_clkout
		rx_serial_data          : in  std_logic_vector(0 downto 0)   := (others => '0'); --          rx_serial_data.rx_serial_data
		rx_set_locktodata       : in  std_logic_vector(0 downto 0)   := (others => '0'); --       rx_set_locktodata.rx_set_locktodata
		rx_set_locktoref        : in  std_logic_vector(0 downto 0)   := (others => '0'); --        rx_set_locktoref.rx_set_locktoref
		rx_is_lockedtoref       : out std_logic_vector(0 downto 0);                      --       rx_is_lockedtoref.rx_is_lockedtoref
		rx_is_lockedtodata      : out std_logic_vector(0 downto 0);                      --      rx_is_lockedtodata.rx_is_lockedtodata
		tx_std_coreclkin        : in  std_logic_vector(0 downto 0)   := (others => '0'); --        tx_std_coreclkin.tx_std_coreclkin
		rx_std_coreclkin        : in  std_logic_vector(0 downto 0)   := (others => '0'); --        rx_std_coreclkin.rx_std_coreclkin
		tx_std_clkout           : out std_logic_vector(0 downto 0);                      --           tx_std_clkout.tx_std_clkout
		rx_std_clkout           : out std_logic_vector(0 downto 0);                      --           rx_std_clkout.rx_std_clkout
		rx_std_wa_patternalign  : in  std_logic_vector(0 downto 0)   := (others => '0'); --  rx_std_wa_patternalign.rx_std_wa_patternalign
		tx_std_elecidle         : in  std_logic_vector(0 downto 0)   := (others => '0'); --         tx_std_elecidle.tx_std_elecidle
		rx_std_signaldetect     : out std_logic_vector(0 downto 0);                      --     rx_std_signaldetect.rx_std_signaldetect
		tx_cal_busy             : out std_logic_vector(0 downto 0);                      --             tx_cal_busy.tx_cal_busy
		rx_cal_busy             : out std_logic_vector(0 downto 0);                      --             rx_cal_busy.rx_cal_busy
		reconfig_to_xcvr        : in  std_logic_vector(139 downto 0) := (others => '0'); --        reconfig_to_xcvr.reconfig_to_xcvr
		reconfig_from_xcvr      : out std_logic_vector(91 downto 0);                     --      reconfig_from_xcvr.reconfig_from_xcvr
		tx_parallel_data        : in  std_logic_vector(31 downto 0)  := (others => '0'); --        tx_parallel_data.tx_parallel_data
		tx_datak                : in  std_logic_vector(3 downto 0)   := (others => '0'); --                tx_datak.tx_datak
		unused_tx_parallel_data : in  std_logic_vector(7 downto 0)   := (others => '0'); -- unused_tx_parallel_data.unused_tx_parallel_data
		rx_parallel_data        : out std_logic_vector(31 downto 0);                     --        rx_parallel_data.rx_parallel_data
		rx_datak                : out std_logic_vector(3 downto 0);                      --                rx_datak.rx_datak
		rx_errdetect            : out std_logic_vector(3 downto 0);                      --            rx_errdetect.rx_errdetect
		rx_disperr              : out std_logic_vector(3 downto 0);                      --              rx_disperr.rx_disperr
		rx_runningdisp          : out std_logic_vector(3 downto 0);                      --          rx_runningdisp.rx_runningdisp
		rx_patterndetect        : out std_logic_vector(3 downto 0);                      --        rx_patterndetect.rx_patterndetect
		rx_syncstatus           : out std_logic_vector(3 downto 0);                      --           rx_syncstatus.rx_syncstatus
		unused_rx_parallel_data : out std_logic_vector(7 downto 0)                       -- unused_rx_parallel_data.unused_rx_parallel_data
	);
end entity NativePhy;

architecture rtl of NativePhy is
	component altera_xcvr_native_av is
		generic (
			tx_enable                       : integer := 1;
			rx_enable                       : integer := 1;
			enable_std                      : integer := 1;
			data_path_select                : string  := "standard";
			channels                        : integer := 1;
			bonded_mode                     : string  := "non_bonded";
			data_rate                       : string  := "";
			pma_width                       : integer := 10;
			tx_pma_clk_div                  : integer := 1;
			pll_reconfig_enable             : integer := 0;
			pll_external_enable             : integer := 0;
			pll_data_rate                   : string  := "0 Mbps";
			pll_type                        : string  := "CMU";
			pma_bonding_mode                : string  := "x1";
			plls                            : integer := 1;
			pll_select                      : integer := 0;
			pll_refclk_cnt                  : integer := 1;
			pll_refclk_select               : string  := "0";
			pll_refclk_freq                 : string  := "125.0 MHz";
			pll_feedback_path               : string  := "internal";
			cdr_reconfig_enable             : integer := 0;
			cdr_refclk_cnt                  : integer := 1;
			cdr_refclk_select               : integer := 0;
			cdr_refclk_freq                 : string  := "";
			rx_ppm_detect_threshold         : string  := "1000";
			rx_clkslip_enable               : integer := 0;
			std_protocol_hint               : string  := "basic";
			std_pcs_pma_width               : integer := 10;
			std_low_latency_bypass_enable   : integer := 0;
			std_tx_pcfifo_mode              : string  := "low_latency";
			std_rx_pcfifo_mode              : string  := "low_latency";
			std_rx_byte_order_enable        : integer := 0;
			std_rx_byte_order_mode          : string  := "manual";
			std_rx_byte_order_width         : integer := 10;
			std_rx_byte_order_symbol_count  : integer := 1;
			std_rx_byte_order_pattern       : string  := "0";
			std_rx_byte_order_pad           : string  := "0";
			std_tx_byte_ser_enable          : integer := 0;
			std_rx_byte_deser_enable        : integer := 0;
			std_tx_8b10b_enable             : integer := 0;
			std_tx_8b10b_disp_ctrl_enable   : integer := 0;
			std_rx_8b10b_enable             : integer := 0;
			std_rx_rmfifo_enable            : integer := 0;
			std_rx_rmfifo_pattern_p         : string  := "00000";
			std_rx_rmfifo_pattern_n         : string  := "00000";
			std_tx_bitslip_enable           : integer := 0;
			std_rx_word_aligner_mode        : string  := "bit_slip";
			std_rx_word_aligner_pattern_len : integer := 7;
			std_rx_word_aligner_pattern     : string  := "0000000000";
			std_rx_word_aligner_rknumber    : integer := 3;
			std_rx_word_aligner_renumber    : integer := 3;
			std_rx_word_aligner_rgnumber    : integer := 3;
			std_rx_run_length_val           : integer := 31;
			std_tx_bitrev_enable            : integer := 0;
			std_rx_bitrev_enable            : integer := 0;
			std_tx_byterev_enable           : integer := 0;
			std_rx_byterev_enable           : integer := 0;
			std_tx_polinv_enable            : integer := 0;
			std_rx_polinv_enable            : integer := 0
		);
		port (
			pll_powerdown             : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- pll_powerdown
			tx_analogreset            : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- tx_analogreset
			tx_digitalreset           : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- tx_digitalreset
			tx_pll_refclk             : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- tx_pll_refclk
			tx_serial_data            : out std_logic_vector(0 downto 0);                      -- tx_serial_data
			pll_locked                : out std_logic_vector(0 downto 0);                      -- pll_locked
			rx_analogreset            : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- rx_analogreset
			rx_digitalreset           : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- rx_digitalreset
			rx_cdr_refclk             : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- rx_cdr_refclk
			rx_pma_clkout             : out std_logic_vector(0 downto 0);                      -- rx_pma_clkout
			rx_serial_data            : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- rx_serial_data
			rx_set_locktodata         : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- rx_set_locktodata
			rx_set_locktoref          : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- rx_set_locktoref
			rx_is_lockedtoref         : out std_logic_vector(0 downto 0);                      -- rx_is_lockedtoref
			rx_is_lockedtodata        : out std_logic_vector(0 downto 0);                      -- rx_is_lockedtodata
			tx_std_coreclkin          : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- tx_std_coreclkin
			rx_std_coreclkin          : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- rx_std_coreclkin
			tx_std_clkout             : out std_logic_vector(0 downto 0);                      -- tx_std_clkout
			rx_std_clkout             : out std_logic_vector(0 downto 0);                      -- rx_std_clkout
			rx_std_wa_patternalign    : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- rx_std_wa_patternalign
			tx_std_elecidle           : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- tx_std_elecidle
			rx_std_signaldetect       : out std_logic_vector(0 downto 0);                      -- rx_std_signaldetect
			tx_cal_busy               : out std_logic_vector(0 downto 0);                      -- tx_cal_busy
			rx_cal_busy               : out std_logic_vector(0 downto 0);                      -- rx_cal_busy
			reconfig_to_xcvr          : in  std_logic_vector(139 downto 0) := (others => 'X'); -- reconfig_to_xcvr
			reconfig_from_xcvr        : out std_logic_vector(91 downto 0);                     -- reconfig_from_xcvr
			tx_parallel_data          : in  std_logic_vector(43 downto 0)  := (others => 'X'); -- unused_tx_parallel_data
			rx_parallel_data          : out std_logic_vector(63 downto 0);                     -- unused_rx_parallel_data
			tx_pma_clkout             : out std_logic_vector(0 downto 0);                      -- tx_pma_clkout
			tx_pma_parallel_data      : in  std_logic_vector(79 downto 0)  := (others => 'X'); -- tx_pma_parallel_data
			ext_pll_clk               : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- ext_pll_clk
			rx_pma_parallel_data      : out std_logic_vector(79 downto 0);                     -- rx_pma_parallel_data
			rx_clkslip                : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- rx_clkslip
			rx_clklow                 : out std_logic_vector(0 downto 0);                      -- rx_clklow
			rx_fref                   : out std_logic_vector(0 downto 0);                      -- rx_fref
			rx_seriallpbken           : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- rx_seriallpbken
			rx_signaldetect           : out std_logic_vector(0 downto 0);                      -- rx_signaldetect
			rx_std_prbs_done          : out std_logic_vector(0 downto 0);                      -- rx_std_prbs_done
			rx_std_prbs_err           : out std_logic_vector(0 downto 0);                      -- rx_std_prbs_err
			tx_std_pcfifo_full        : out std_logic_vector(0 downto 0);                      -- tx_std_pcfifo_full
			tx_std_pcfifo_empty       : out std_logic_vector(0 downto 0);                      -- tx_std_pcfifo_empty
			rx_std_pcfifo_full        : out std_logic_vector(0 downto 0);                      -- rx_std_pcfifo_full
			rx_std_pcfifo_empty       : out std_logic_vector(0 downto 0);                      -- rx_std_pcfifo_empty
			rx_std_byteorder_ena      : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- rx_std_byteorder_ena
			rx_std_byteorder_flag     : out std_logic_vector(0 downto 0);                      -- rx_std_byteorder_flag
			rx_std_rmfifo_full        : out std_logic_vector(0 downto 0);                      -- rx_std_rmfifo_full
			rx_std_rmfifo_empty       : out std_logic_vector(0 downto 0);                      -- rx_std_rmfifo_empty
			rx_std_wa_a1a2size        : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- rx_std_wa_a1a2size
			tx_std_bitslipboundarysel : in  std_logic_vector(4 downto 0)   := (others => 'X'); -- tx_std_bitslipboundarysel
			rx_std_bitslipboundarysel : out std_logic_vector(4 downto 0);                      -- rx_std_bitslipboundarysel
			rx_std_bitslip            : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- rx_std_bitslip
			rx_std_runlength_err      : out std_logic_vector(0 downto 0);                      -- rx_std_runlength_err
			rx_std_bitrev_ena         : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- rx_std_bitrev_ena
			rx_std_byterev_ena        : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- rx_std_byterev_ena
			tx_std_polinv             : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- tx_std_polinv
			rx_std_polinv             : in  std_logic_vector(0 downto 0)   := (others => 'X')  -- rx_std_polinv
		);
	end component altera_xcvr_native_av;

	signal nativephy_inst_rx_parallel_data : std_logic_vector(63 downto 0); -- port fragment

begin

	nativephy_inst : component altera_xcvr_native_av
		generic map (
			tx_enable                       => 1,
			rx_enable                       => 1,
			enable_std                      => 1,
			data_path_select                => "standard",
			channels                        => 1,
			bonded_mode                     => "non_bonded",
			data_rate                       => "1500 Mbps",
			pma_width                       => 20,
			tx_pma_clk_div                  => 2,
			pll_reconfig_enable             => 1,
			pll_external_enable             => 0,
			pll_data_rate                   => "3000 Mbps",
			pll_type                        => "CMU",
			pma_bonding_mode                => "x1",
			plls                            => 1,
			pll_select                      => 0,
			pll_refclk_cnt                  => 1,
			pll_refclk_select               => "0",
			pll_refclk_freq                 => "150.0 MHz",
			pll_feedback_path               => "internal",
			cdr_reconfig_enable             => 0,
			cdr_refclk_cnt                  => 1,
			cdr_refclk_select               => 0,
			cdr_refclk_freq                 => "150.0 MHz",
			rx_ppm_detect_threshold         => "300",
			rx_clkslip_enable               => 0,
			std_protocol_hint               => "basic",
			std_pcs_pma_width               => 20,
			std_low_latency_bypass_enable   => 0,
			std_tx_pcfifo_mode              => "low_latency",
			std_rx_pcfifo_mode              => "low_latency",
			std_rx_byte_order_enable        => 0,
			std_rx_byte_order_mode          => "manual",
			std_rx_byte_order_width         => 9,
			std_rx_byte_order_symbol_count  => 1,
			std_rx_byte_order_pattern       => "0",
			std_rx_byte_order_pad           => "0",
			std_tx_byte_ser_enable          => 1,
			std_rx_byte_deser_enable        => 1,
			std_tx_8b10b_enable             => 1,
			std_tx_8b10b_disp_ctrl_enable   => 0,
			std_rx_8b10b_enable             => 1,
			std_rx_rmfifo_enable            => 0,
			std_rx_rmfifo_pattern_p         => "00000",
			std_rx_rmfifo_pattern_n         => "00000",
			std_tx_bitslip_enable           => 0,
			std_rx_word_aligner_mode        => "manual",
			std_rx_word_aligner_pattern_len => 20,
			std_rx_word_aligner_pattern     => "AA97C",
			std_rx_word_aligner_rknumber    => 3,
			std_rx_word_aligner_renumber    => 3,
			std_rx_word_aligner_rgnumber    => 3,
			std_rx_run_length_val           => 31,
			std_tx_bitrev_enable            => 0,
			std_rx_bitrev_enable            => 0,
			std_tx_byterev_enable           => 0,
			std_rx_byterev_enable           => 0,
			std_tx_polinv_enable            => 0,
			std_rx_polinv_enable            => 0
		)
		port map (
			pll_powerdown                  => pll_powerdown,                                                                      --          pll_powerdown.pll_powerdown
			tx_analogreset                 => tx_analogreset,                                                                     --         tx_analogreset.tx_analogreset
			tx_digitalreset                => tx_digitalreset,                                                                    --        tx_digitalreset.tx_digitalreset
			tx_pll_refclk                  => tx_pll_refclk,                                                                      --          tx_pll_refclk.tx_pll_refclk
			tx_serial_data                 => tx_serial_data,                                                                     --         tx_serial_data.tx_serial_data
			pll_locked                     => pll_locked,                                                                         --             pll_locked.pll_locked
			rx_analogreset                 => rx_analogreset,                                                                     --         rx_analogreset.rx_analogreset
			rx_digitalreset                => rx_digitalreset,                                                                    --        rx_digitalreset.rx_digitalreset
			rx_cdr_refclk                  => rx_cdr_refclk,                                                                      --          rx_cdr_refclk.rx_cdr_refclk
			rx_pma_clkout                  => rx_pma_clkout,                                                                      --          rx_pma_clkout.rx_pma_clkout
			rx_serial_data                 => rx_serial_data,                                                                     --         rx_serial_data.rx_serial_data
			rx_set_locktodata              => rx_set_locktodata,                                                                  --      rx_set_locktodata.rx_set_locktodata
			rx_set_locktoref               => rx_set_locktoref,                                                                   --       rx_set_locktoref.rx_set_locktoref
			rx_is_lockedtoref              => rx_is_lockedtoref,                                                                  --      rx_is_lockedtoref.rx_is_lockedtoref
			rx_is_lockedtodata             => rx_is_lockedtodata,                                                                 --     rx_is_lockedtodata.rx_is_lockedtodata
			tx_std_coreclkin               => tx_std_coreclkin,                                                                   --       tx_std_coreclkin.tx_std_coreclkin
			rx_std_coreclkin               => rx_std_coreclkin,                                                                   --       rx_std_coreclkin.rx_std_coreclkin
			tx_std_clkout                  => tx_std_clkout,                                                                      --          tx_std_clkout.tx_std_clkout
			rx_std_clkout                  => rx_std_clkout,                                                                      --          rx_std_clkout.rx_std_clkout
			rx_std_wa_patternalign         => rx_std_wa_patternalign,                                                             -- rx_std_wa_patternalign.rx_std_wa_patternalign
			tx_std_elecidle                => tx_std_elecidle,                                                                    --        tx_std_elecidle.tx_std_elecidle
			rx_std_signaldetect            => rx_std_signaldetect,                                                                --    rx_std_signaldetect.rx_std_signaldetect
			tx_cal_busy                    => tx_cal_busy,                                                                        --            tx_cal_busy.tx_cal_busy
			rx_cal_busy                    => rx_cal_busy,                                                                        --            rx_cal_busy.rx_cal_busy
			reconfig_to_xcvr               => reconfig_to_xcvr,                                                                   --       reconfig_to_xcvr.reconfig_to_xcvr
			reconfig_from_xcvr             => reconfig_from_xcvr,                                                                 --     reconfig_from_xcvr.reconfig_from_xcvr
			tx_parallel_data(0 downto 0)   => tx_parallel_data(0 downto 0),                                                       --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(1 downto 1)   => tx_parallel_data(1 downto 1),                                                       --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(2 downto 2)   => tx_parallel_data(2 downto 2),                                                       --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(3 downto 3)   => tx_parallel_data(3 downto 3),                                                       --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(4 downto 4)   => tx_parallel_data(4 downto 4),                                                       --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(5 downto 5)   => tx_parallel_data(5 downto 5),                                                       --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(6 downto 6)   => tx_parallel_data(6 downto 6),                                                       --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(7 downto 7)   => tx_parallel_data(7 downto 7),                                                       --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(8 downto 8)   => tx_datak(0 downto 0),                                                               --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(9 downto 9)   => unused_tx_parallel_data(0 downto 0),                                                --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(10 downto 10) => unused_tx_parallel_data(1 downto 1),                                                --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(11 downto 11) => tx_parallel_data(8 downto 8),                                                       --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(12 downto 12) => tx_parallel_data(9 downto 9),                                                       --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(13 downto 13) => tx_parallel_data(10 downto 10),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(14 downto 14) => tx_parallel_data(11 downto 11),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(15 downto 15) => tx_parallel_data(12 downto 12),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(16 downto 16) => tx_parallel_data(13 downto 13),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(17 downto 17) => tx_parallel_data(14 downto 14),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(18 downto 18) => tx_parallel_data(15 downto 15),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(19 downto 19) => tx_datak(1 downto 1),                                                               --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(20 downto 20) => unused_tx_parallel_data(2 downto 2),                                                --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(21 downto 21) => unused_tx_parallel_data(3 downto 3),                                                --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(22 downto 22) => tx_parallel_data(16 downto 16),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(23 downto 23) => tx_parallel_data(17 downto 17),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(24 downto 24) => tx_parallel_data(18 downto 18),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(25 downto 25) => tx_parallel_data(19 downto 19),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(26 downto 26) => tx_parallel_data(20 downto 20),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(27 downto 27) => tx_parallel_data(21 downto 21),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(28 downto 28) => tx_parallel_data(22 downto 22),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(29 downto 29) => tx_parallel_data(23 downto 23),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(30 downto 30) => tx_datak(2 downto 2),                                                               --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(31 downto 31) => unused_tx_parallel_data(4 downto 4),                                                --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(32 downto 32) => unused_tx_parallel_data(5 downto 5),                                                --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(33 downto 33) => tx_parallel_data(24 downto 24),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(34 downto 34) => tx_parallel_data(25 downto 25),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(35 downto 35) => tx_parallel_data(26 downto 26),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(36 downto 36) => tx_parallel_data(27 downto 27),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(37 downto 37) => tx_parallel_data(28 downto 28),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(38 downto 38) => tx_parallel_data(29 downto 29),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(39 downto 39) => tx_parallel_data(30 downto 30),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(40 downto 40) => tx_parallel_data(31 downto 31),                                                     --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(41 downto 41) => tx_datak(3 downto 3),                                                               --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(42 downto 42) => unused_tx_parallel_data(6 downto 6),                                                --       tx_parallel_data.tx_parallel_data
			tx_parallel_data(43 downto 43) => unused_tx_parallel_data(7 downto 7),                                                --       tx_parallel_data.tx_parallel_data
			rx_parallel_data               => nativephy_inst_rx_parallel_data,                                                    --       rx_parallel_data.rx_parallel_data
			tx_pma_clkout                  => open,                                                                               --            (terminated)
			tx_pma_parallel_data           => "00000000000000000000000000000000000000000000000000000000000000000000000000000000", --            (terminated)
			ext_pll_clk                    => "0",                                                                                --            (terminated)
			rx_pma_parallel_data           => open,                                                                               --            (terminated)
			rx_clkslip                     => "0",                                                                                --            (terminated)
			rx_clklow                      => open,                                                                               --            (terminated)
			rx_fref                        => open,                                                                               --            (terminated)
			rx_seriallpbken                => "0",                                                                                --            (terminated)
			rx_signaldetect                => open,                                                                               --            (terminated)
			rx_std_prbs_done               => open,                                                                               --            (terminated)
			rx_std_prbs_err                => open,                                                                               --            (terminated)
			tx_std_pcfifo_full             => open,                                                                               --            (terminated)
			tx_std_pcfifo_empty            => open,                                                                               --            (terminated)
			rx_std_pcfifo_full             => open,                                                                               --            (terminated)
			rx_std_pcfifo_empty            => open,                                                                               --            (terminated)
			rx_std_byteorder_ena           => "0",                                                                                --            (terminated)
			rx_std_byteorder_flag          => open,                                                                               --            (terminated)
			rx_std_rmfifo_full             => open,                                                                               --            (terminated)
			rx_std_rmfifo_empty            => open,                                                                               --            (terminated)
			rx_std_wa_a1a2size             => "0",                                                                                --            (terminated)
			tx_std_bitslipboundarysel      => "00000",                                                                            --            (terminated)
			rx_std_bitslipboundarysel      => open,                                                                               --            (terminated)
			rx_std_bitslip                 => "0",                                                                                --            (terminated)
			rx_std_runlength_err           => open,                                                                               --            (terminated)
			rx_std_bitrev_ena              => "0",                                                                                --            (terminated)
			rx_std_byterev_ena             => "0",                                                                                --            (terminated)
			tx_std_polinv                  => "0",                                                                                --            (terminated)
			rx_std_polinv                  => "0"                                                                                 --            (terminated)
		);

	rx_parallel_data <= NativePhy_inst_rx_parallel_data(55 downto 55) & NativePhy_inst_rx_parallel_data(54 downto 54) & NativePhy_inst_rx_parallel_data(53 downto 53) & NativePhy_inst_rx_parallel_data(52 downto 52) & NativePhy_inst_rx_parallel_data(51 downto 51) & NativePhy_inst_rx_parallel_data(50 downto 50) & NativePhy_inst_rx_parallel_data(49 downto 49) & NativePhy_inst_rx_parallel_data(48 downto 48) & NativePhy_inst_rx_parallel_data(39 downto 39) & NativePhy_inst_rx_parallel_data(38 downto 38) & NativePhy_inst_rx_parallel_data(37 downto 37) & NativePhy_inst_rx_parallel_data(36 downto 36) & NativePhy_inst_rx_parallel_data(35 downto 35) & NativePhy_inst_rx_parallel_data(34 downto 34) & NativePhy_inst_rx_parallel_data(33 downto 33) & NativePhy_inst_rx_parallel_data(32 downto 32) & NativePhy_inst_rx_parallel_data(23 downto 23) & NativePhy_inst_rx_parallel_data(22 downto 22) & NativePhy_inst_rx_parallel_data(21 downto 21) & NativePhy_inst_rx_parallel_data(20 downto 20) & NativePhy_inst_rx_parallel_data(19 downto 19) & NativePhy_inst_rx_parallel_data(18 downto 18) & NativePhy_inst_rx_parallel_data(17 downto 17) & NativePhy_inst_rx_parallel_data(16 downto 16) & NativePhy_inst_rx_parallel_data(7 downto 7) & NativePhy_inst_rx_parallel_data(6 downto 6) & NativePhy_inst_rx_parallel_data(5 downto 5) & NativePhy_inst_rx_parallel_data(4 downto 4) & NativePhy_inst_rx_parallel_data(3 downto 3) & NativePhy_inst_rx_parallel_data(2 downto 2) & NativePhy_inst_rx_parallel_data(1 downto 1) & NativePhy_inst_rx_parallel_data(0 downto 0);

	rx_syncstatus <= NativePhy_inst_rx_parallel_data(58 downto 58) & NativePhy_inst_rx_parallel_data(42 downto 42) & NativePhy_inst_rx_parallel_data(26 downto 26) & NativePhy_inst_rx_parallel_data(10 downto 10);

	rx_datak <= NativePhy_inst_rx_parallel_data(56 downto 56) & NativePhy_inst_rx_parallel_data(40 downto 40) & NativePhy_inst_rx_parallel_data(24 downto 24) & NativePhy_inst_rx_parallel_data(8 downto 8);

	rx_disperr <= NativePhy_inst_rx_parallel_data(59 downto 59) & NativePhy_inst_rx_parallel_data(43 downto 43) & NativePhy_inst_rx_parallel_data(27 downto 27) & NativePhy_inst_rx_parallel_data(11 downto 11);

	rx_patterndetect <= NativePhy_inst_rx_parallel_data(60 downto 60) & NativePhy_inst_rx_parallel_data(44 downto 44) & NativePhy_inst_rx_parallel_data(28 downto 28) & NativePhy_inst_rx_parallel_data(12 downto 12);

	unused_rx_parallel_data <= NativePhy_inst_rx_parallel_data(62 downto 62) & NativePhy_inst_rx_parallel_data(61 downto 61) & NativePhy_inst_rx_parallel_data(46 downto 46) & NativePhy_inst_rx_parallel_data(45 downto 45) & NativePhy_inst_rx_parallel_data(30 downto 30) & NativePhy_inst_rx_parallel_data(29 downto 29) & NativePhy_inst_rx_parallel_data(14 downto 14) & NativePhy_inst_rx_parallel_data(13 downto 13);

	rx_errdetect <= NativePhy_inst_rx_parallel_data(57 downto 57) & NativePhy_inst_rx_parallel_data(41 downto 41) & NativePhy_inst_rx_parallel_data(25 downto 25) & NativePhy_inst_rx_parallel_data(9 downto 9);

	rx_runningdisp <= NativePhy_inst_rx_parallel_data(63 downto 63) & NativePhy_inst_rx_parallel_data(47 downto 47) & NativePhy_inst_rx_parallel_data(31 downto 31) & NativePhy_inst_rx_parallel_data(15 downto 15);

end architecture rtl; -- of NativePhy
