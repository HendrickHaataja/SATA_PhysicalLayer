-- megafunction wizard: %Custom PHY v15.1%
-- GENERATION: XML
-- CustomPhy.vhd

-- Generated using ACDS version 15.1 185

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CustomPhy is
	port (
		phy_mgmt_clk             : in  std_logic                      := '0';             --             phy_mgmt_clk.clk
		phy_mgmt_clk_reset       : in  std_logic                      := '0';             --       phy_mgmt_clk_reset.reset
		phy_mgmt_address         : in  std_logic_vector(8 downto 0)   := (others => '0'); --                 phy_mgmt.address
		phy_mgmt_read            : in  std_logic                      := '0';             --                         .read
		phy_mgmt_readdata        : out std_logic_vector(31 downto 0);                     --                         .readdata
		phy_mgmt_waitrequest     : out std_logic;                                         --                         .waitrequest
		phy_mgmt_write           : in  std_logic                      := '0';             --                         .write
		phy_mgmt_writedata       : in  std_logic_vector(31 downto 0)  := (others => '0'); --                         .writedata
		tx_ready                 : out std_logic;                                         --                 tx_ready.export
		rx_ready                 : out std_logic;                                         --                 rx_ready.export
		pll_ref_clk              : in  std_logic_vector(0 downto 0)   := (others => '0'); --              pll_ref_clk.clk
		tx_serial_data           : out std_logic_vector(0 downto 0);                      --           tx_serial_data.export
		tx_forceelecidle         : in  std_logic_vector(0 downto 0)   := (others => '0'); --         tx_forceelecidle.export
		tx_bitslipboundaryselect : in  std_logic_vector(4 downto 0)   := (others => '0'); -- tx_bitslipboundaryselect.export
		pll_locked               : out std_logic_vector(0 downto 0);                      --               pll_locked.export
		rx_serial_data           : in  std_logic_vector(0 downto 0)   := (others => '0'); --           rx_serial_data.export
		rx_runningdisp           : out std_logic_vector(3 downto 0);                      --           rx_runningdisp.export
		rx_is_lockedtoref        : out std_logic_vector(0 downto 0);                      --        rx_is_lockedtoref.export
		rx_is_lockedtodata       : out std_logic_vector(0 downto 0);                      --       rx_is_lockedtodata.export
		rx_signaldetect          : out std_logic_vector(0 downto 0);                      --          rx_signaldetect.export
		rx_bitslip               : in  std_logic_vector(0 downto 0)   := (others => '0'); --               rx_bitslip.export
		tx_clkout                : out std_logic_vector(0 downto 0);                      --                tx_clkout.export
		rx_clkout                : out std_logic_vector(0 downto 0);                      --                rx_clkout.export
		tx_parallel_data         : in  std_logic_vector(31 downto 0)  := (others => '0'); --         tx_parallel_data.export
		tx_datak                 : in  std_logic_vector(3 downto 0)   := (others => '0'); --                 tx_datak.export
		rx_parallel_data         : out std_logic_vector(31 downto 0);                     --         rx_parallel_data.export
		rx_datak                 : out std_logic_vector(3 downto 0);                      --                 rx_datak.export
		reconfig_from_xcvr       : out std_logic_vector(91 downto 0);                     --       reconfig_from_xcvr.reconfig_from_xcvr
		reconfig_to_xcvr         : in  std_logic_vector(139 downto 0) := (others => '0')  --         reconfig_to_xcvr.reconfig_to_xcvr
	);
end entity CustomPhy;

architecture rtl of CustomPhy is
	component altera_xcvr_custom is
		generic (
			device_family                         : string  := "";
			protocol_hint                         : string  := "basic";
			operation_mode                        : string  := "Duplex";
			lanes                                 : integer := 1;
			bonded_group_size                     : integer := 1;
			bonded_mode                           : string  := "xN";
			pma_bonding_mode                      : string  := "x1";
			pcs_pma_width                         : integer := 8;
			ser_base_factor                       : integer := 8;
			ser_words                             : integer := 1;
			data_rate                             : string  := "1250 Mbps";
			base_data_rate                        : string  := "1250 Mbps";
			en_synce_support                      : integer := 0;
			tx_bitslip_enable                     : string  := "false";
			rx_use_coreclk                        : string  := "false";
			tx_use_coreclk                        : string  := "false";
			use_8b10b                             : string  := "false";
			use_8b10b_manual_control              : string  := "false";
			std_tx_pcfifo_mode                    : string  := "low_latency";
			std_rx_pcfifo_mode                    : string  := "low_latency";
			word_aligner_mode                     : string  := "manual";
			word_aligner_state_machine_datacnt    : integer := 1;
			word_aligner_state_machine_errcnt     : integer := 1;
			word_aligner_state_machine_patterncnt : integer := 10;
			word_aligner_pattern_length           : integer := 16;
			word_align_pattern                    : string  := "1111100111111111";
			run_length_violation_checking         : integer := 40;
			use_rate_match_fifo                   : integer := 0;
			rate_match_pattern1                   : string  := "11010000111010000011";
			rate_match_pattern2                   : string  := "00101111000101111100";
			byte_order_mode                       : string  := "none";
			byte_order_pattern                    : string  := "111111011";
			byte_order_pad_pattern                : string  := "000000000";
			coreclk_0ppm_enable                   : string  := "false";
			pll_refclk_cnt                        : integer := 1;
			pll_refclk_freq                       : string  := "62.5 MHz";
			pll_refclk_select                     : string  := "0";
			cdr_refclk_select                     : integer := 0;
			plls                                  : integer := 1;
			pll_type                              : string  := "AUTO";
			pll_select                            : integer := 0;
			pll_reconfig                          : integer := 0;
			pll_external_enable                   : integer := 0;
			gxb_analog_power                      : string  := "AUTO";
			pll_lock_speed                        : string  := "AUTO";
			tx_analog_power                       : string  := "AUTO";
			tx_slew_rate                          : string  := "OFF";
			tx_termination                        : string  := "OCT_100_OHMS";
			tx_use_external_termination           : string  := "false";
			tx_preemp_pretap                      : integer := 0;
			tx_preemp_pretap_inv                  : string  := "false";
			tx_preemp_tap_1                       : integer := 0;
			tx_preemp_tap_2                       : integer := 0;
			tx_preemp_tap_2_inv                   : string  := "false";
			tx_vod_selection                      : integer := 2;
			tx_common_mode                        : string  := "0.65V";
			rx_pll_lock_speed                     : string  := "AUTO";
			rx_common_mode                        : string  := "0.82V";
			rx_termination                        : string  := "OCT_100_OHMS";
			rx_use_external_termination           : string  := "false";
			rx_eq_dc_gain                         : integer := 1;
			rx_eq_ctrl                            : integer := 16;
			mgmt_clk_in_mhz                       : integer := 250;
			embedded_reset                        : integer := 1;
			channel_interface                     : integer := 0
		);
		port (
			phy_mgmt_clk                : in  std_logic                      := 'X';             -- clk
			phy_mgmt_clk_reset          : in  std_logic                      := 'X';             -- reset
			phy_mgmt_address            : in  std_logic_vector(8 downto 0)   := (others => 'X'); -- address
			phy_mgmt_read               : in  std_logic                      := 'X';             -- read
			phy_mgmt_readdata           : out std_logic_vector(31 downto 0);                     -- readdata
			phy_mgmt_waitrequest        : out std_logic;                                         -- waitrequest
			phy_mgmt_write              : in  std_logic                      := 'X';             -- write
			phy_mgmt_writedata          : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			tx_ready                    : out std_logic;                                         -- export
			rx_ready                    : out std_logic;                                         -- export
			pll_ref_clk                 : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- clk
			tx_serial_data              : out std_logic_vector(0 downto 0);                      -- export
			tx_forceelecidle            : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- export
			tx_bitslipboundaryselect    : in  std_logic_vector(4 downto 0)   := (others => 'X'); -- export
			pll_locked                  : out std_logic_vector(0 downto 0);                      -- export
			rx_serial_data              : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- export
			rx_runningdisp              : out std_logic_vector(3 downto 0);                      -- export
			rx_is_lockedtoref           : out std_logic_vector(0 downto 0);                      -- export
			rx_is_lockedtodata          : out std_logic_vector(0 downto 0);                      -- export
			rx_signaldetect             : out std_logic_vector(0 downto 0);                      -- export
			rx_bitslip                  : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- export
			tx_clkout                   : out std_logic_vector(0 downto 0);                      -- export
			rx_clkout                   : out std_logic_vector(0 downto 0);                      -- export
			tx_parallel_data            : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- export
			tx_datak                    : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- export
			rx_parallel_data            : out std_logic_vector(31 downto 0);                     -- export
			rx_datak                    : out std_logic_vector(3 downto 0);                      -- export
			reconfig_from_xcvr          : out std_logic_vector(91 downto 0);                     -- reconfig_from_xcvr
			reconfig_to_xcvr            : in  std_logic_vector(139 downto 0) := (others => 'X'); -- reconfig_to_xcvr
			rx_disperr                  : out std_logic_vector(3 downto 0);                      -- export
			rx_errdetect                : out std_logic_vector(3 downto 0);                      -- export
			rx_patterndetect            : out std_logic_vector(3 downto 0);                      -- export
			rx_syncstatus               : out std_logic_vector(3 downto 0);                      -- export
			rx_bitslipboundaryselectout : out std_logic_vector(4 downto 0);                      -- export
			rx_enabyteord               : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- export
			rx_rmfifodatainserted       : out std_logic_vector(3 downto 0);                      -- export
			rx_rmfifodatadeleted        : out std_logic_vector(3 downto 0);                      -- export
			rx_rlv                      : out std_logic_vector(0 downto 0);                      -- export
			rx_byteordflag              : out std_logic_vector(0 downto 0);                      -- export
			tx_coreclkin                : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- export
			rx_coreclkin                : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- export
			rx_recovered_clk            : out std_logic_vector(0 downto 0);                      -- export
			cdr_ref_clk                 : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- export
			tx_dispval                  : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- export
			tx_forcedisp                : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- export
			pll_powerdown               : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- export
			tx_digitalreset             : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- export
			tx_analogreset              : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- export
			tx_cal_busy                 : out std_logic_vector(0 downto 0);                      -- export
			rx_digitalreset             : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- export
			rx_analogreset              : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- export
			rx_cal_busy                 : out std_logic_vector(0 downto 0);                      -- export
			ext_pll_clk                 : in  std_logic_vector(0 downto 0)   := (others => 'X')  -- export
		);
	end component altera_xcvr_custom;

begin

	customphy_inst : component altera_xcvr_custom
		generic map (
			device_family                         => "Cyclone V",
			protocol_hint                         => "basic",
			operation_mode                        => "Duplex",
			lanes                                 => 1,
			bonded_group_size                     => 1,
			bonded_mode                           => "xN",
			pma_bonding_mode                      => "x1",
			pcs_pma_width                         => 20,
			ser_base_factor                       => 8,
			ser_words                             => 4,
			data_rate                             => "1500 Mbps",
			base_data_rate                        => "1500 Mbps",
			en_synce_support                      => 0,
			tx_bitslip_enable                     => "true",
			rx_use_coreclk                        => "false",
			tx_use_coreclk                        => "false",
			use_8b10b                             => "true",
			use_8b10b_manual_control              => "false",
			std_tx_pcfifo_mode                    => "low_latency",
			std_rx_pcfifo_mode                    => "low_latency",
			word_aligner_mode                     => "bitslip",
			word_aligner_state_machine_datacnt    => 1,
			word_aligner_state_machine_errcnt     => 1,
			word_aligner_state_machine_patterncnt => 10,
			word_aligner_pattern_length           => 16,
			word_align_pattern                    => "1111100111111111",
			run_length_violation_checking         => 40,
			use_rate_match_fifo                   => 0,
			rate_match_pattern1                   => "11010000111010000011",
			rate_match_pattern2                   => "00101111000101111100",
			byte_order_mode                       => "none",
			byte_order_pattern                    => "111111011",
			byte_order_pad_pattern                => "000000000",
			coreclk_0ppm_enable                   => "false",
			pll_refclk_cnt                        => 1,
			pll_refclk_freq                       => "150.0 MHz",
			pll_refclk_select                     => "0",
			cdr_refclk_select                     => 0,
			plls                                  => 1,
			pll_type                              => "CMU",
			pll_select                            => 0,
			pll_reconfig                          => 0,
			pll_external_enable                   => 0,
			gxb_analog_power                      => "AUTO",
			pll_lock_speed                        => "AUTO",
			tx_analog_power                       => "AUTO",
			tx_slew_rate                          => "OFF",
			tx_termination                        => "OCT_100_OHMS",
			tx_use_external_termination           => "false",
			tx_preemp_pretap                      => 0,
			tx_preemp_pretap_inv                  => "false",
			tx_preemp_tap_1                       => 0,
			tx_preemp_tap_2                       => 0,
			tx_preemp_tap_2_inv                   => "false",
			tx_vod_selection                      => 2,
			tx_common_mode                        => "0.65V",
			rx_pll_lock_speed                     => "AUTO",
			rx_common_mode                        => "0.82V",
			rx_termination                        => "OCT_100_OHMS",
			rx_use_external_termination           => "false",
			rx_eq_dc_gain                         => 1,
			rx_eq_ctrl                            => 16,
			mgmt_clk_in_mhz                       => 250,
			embedded_reset                        => 1,
			channel_interface                     => 0
		)
		port map (
			phy_mgmt_clk                => phy_mgmt_clk,             --             phy_mgmt_clk.clk
			phy_mgmt_clk_reset          => phy_mgmt_clk_reset,       --       phy_mgmt_clk_reset.reset
			phy_mgmt_address            => phy_mgmt_address,         --                 phy_mgmt.address
			phy_mgmt_read               => phy_mgmt_read,            --                         .read
			phy_mgmt_readdata           => phy_mgmt_readdata,        --                         .readdata
			phy_mgmt_waitrequest        => phy_mgmt_waitrequest,     --                         .waitrequest
			phy_mgmt_write              => phy_mgmt_write,           --                         .write
			phy_mgmt_writedata          => phy_mgmt_writedata,       --                         .writedata
			tx_ready                    => tx_ready,                 --                 tx_ready.export
			rx_ready                    => rx_ready,                 --                 rx_ready.export
			pll_ref_clk                 => pll_ref_clk,              --              pll_ref_clk.clk
			tx_serial_data              => tx_serial_data,           --           tx_serial_data.export
			tx_forceelecidle            => tx_forceelecidle,         --         tx_forceelecidle.export
			tx_bitslipboundaryselect    => tx_bitslipboundaryselect, -- tx_bitslipboundaryselect.export
			pll_locked                  => pll_locked,               --               pll_locked.export
			rx_serial_data              => rx_serial_data,           --           rx_serial_data.export
			rx_runningdisp              => rx_runningdisp,           --           rx_runningdisp.export
			rx_is_lockedtoref           => rx_is_lockedtoref,        --        rx_is_lockedtoref.export
			rx_is_lockedtodata          => rx_is_lockedtodata,       --       rx_is_lockedtodata.export
			rx_signaldetect             => rx_signaldetect,          --          rx_signaldetect.export
			rx_bitslip                  => rx_bitslip,               --               rx_bitslip.export
			tx_clkout                   => tx_clkout,                --                tx_clkout.export
			rx_clkout                   => rx_clkout,                --                rx_clkout.export
			tx_parallel_data            => tx_parallel_data,         --         tx_parallel_data.export
			tx_datak                    => tx_datak,                 --                 tx_datak.export
			rx_parallel_data            => rx_parallel_data,         --         rx_parallel_data.export
			rx_datak                    => rx_datak,                 --                 rx_datak.export
			reconfig_from_xcvr          => reconfig_from_xcvr,       --       reconfig_from_xcvr.reconfig_from_xcvr
			reconfig_to_xcvr            => reconfig_to_xcvr,         --         reconfig_to_xcvr.reconfig_to_xcvr
			rx_disperr                  => open,                     --              (terminated)
			rx_errdetect                => open,                     --              (terminated)
			rx_patterndetect            => open,                     --              (terminated)
			rx_syncstatus               => open,                     --              (terminated)
			rx_bitslipboundaryselectout => open,                     --              (terminated)
			rx_enabyteord               => "0",                      --              (terminated)
			rx_rmfifodatainserted       => open,                     --              (terminated)
			rx_rmfifodatadeleted        => open,                     --              (terminated)
			rx_rlv                      => open,                     --              (terminated)
			rx_byteordflag              => open,                     --              (terminated)
			tx_coreclkin                => "0",                      --              (terminated)
			rx_coreclkin                => "0",                      --              (terminated)
			rx_recovered_clk            => open,                     --              (terminated)
			cdr_ref_clk                 => "0",                      --              (terminated)
			tx_dispval                  => "0000",                   --              (terminated)
			tx_forcedisp                => "0000",                   --              (terminated)
			pll_powerdown               => "0",                      --              (terminated)
			tx_digitalreset             => "0",                      --              (terminated)
			tx_analogreset              => "0",                      --              (terminated)
			tx_cal_busy                 => open,                     --              (terminated)
			rx_digitalreset             => "0",                      --              (terminated)
			rx_analogreset              => "0",                      --              (terminated)
			rx_cal_busy                 => open,                     --              (terminated)
			ext_pll_clk                 => "0"                       --              (terminated)
		);

end architecture rtl; -- of CustomPhy
-- Retrieval info: <?xml version="1.0"?>
--<!--
--	Generated by Altera MegaWizard Launcher Utility version 1.0
--	************************************************************
--	THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--	************************************************************
--	Copyright (C) 1991-2017 Altera Corporation
--	Any megafunction design, and related net list (encrypted or decrypted),
--	support information, device programming or simulation file, and any other
--	associated documentation or information provided by Altera or a partner
--	under Altera's Megafunction Partnership Program may be used only to
--	program PLD devices (but not masked PLD devices) from Altera.  Any other
--	use of such megafunction design, net list, support information, device
--	programming or simulation file, or any other related documentation or
--	information is prohibited for any other purpose, including, but not
--	limited to modification, reverse engineering, de-compiling, or use with
--	any other silicon devices, unless such use is explicitly licensed under
--	a separate agreement with Altera or a megafunction partner.  Title to
--	the intellectual property, including patents, copyrights, trademarks,
--	trade secrets, or maskworks, embodied in any such megafunction design,
--	net list, support information, device programming or simulation file, or
--	any other related documentation or information provided by Altera or a
--	megafunction partner, remains with Altera, the megafunction partner, or
--	their respective licensors.  No other licenses, including any licenses
--	needed under any third party's intellectual property, are provided herein.
---->
-- Retrieval info: <instance entity-name="altera_xcvr_custom_phy" version="15.1" >
-- Retrieval info: 	<generic name="device_family" value="Cyclone V" />
-- Retrieval info: 	<generic name="gui_parameter_rules" value="Custom" />
-- Retrieval info: 	<generic name="operation_mode" value="Duplex" />
-- Retrieval info: 	<generic name="lanes" value="1" />
-- Retrieval info: 	<generic name="gui_bonding_enable" value="false" />
-- Retrieval info: 	<generic name="gui_bonded_mode" value="xN" />
-- Retrieval info: 	<generic name="gui_pma_bonding_mode" value="x1" />
-- Retrieval info: 	<generic name="gui_deser_factor" value="32" />
-- Retrieval info: 	<generic name="gui_pcs_pma_width" value="PARAM_DEFAULT" />
-- Retrieval info: 	<generic name="gui_pll_type" value="CMU" />
-- Retrieval info: 	<generic name="data_rate" value="1500 Mbps" />
-- Retrieval info: 	<generic name="gui_base_data_rate" value="1250 Mbps" />
-- Retrieval info: 	<generic name="gui_pll_refclk_freq" value="150.0 MHz" />
-- Retrieval info: 	<generic name="en_synce_support" value="0" />
-- Retrieval info: 	<generic name="gui_tx_bitslip_enable" value="true" />
-- Retrieval info: 	<generic name="gui_rx_use_coreclk" value="false" />
-- Retrieval info: 	<generic name="gui_tx_use_coreclk" value="false" />
-- Retrieval info: 	<generic name="gui_rx_use_recovered_clk" value="false" />
-- Retrieval info: 	<generic name="gui_use_status" value="true" />
-- Retrieval info: 	<generic name="gui_use_8b10b" value="true" />
-- Retrieval info: 	<generic name="gui_use_8b10b_manual_control" value="false" />
-- Retrieval info: 	<generic name="gui_use_8b10b_status" value="false" />
-- Retrieval info: 	<generic name="std_tx_pcfifo_mode" value="low_latency" />
-- Retrieval info: 	<generic name="std_rx_pcfifo_mode" value="low_latency" />
-- Retrieval info: 	<generic name="word_aligner_mode" value="bitslip" />
-- Retrieval info: 	<generic name="word_aligner_state_machine_datacnt" value="1" />
-- Retrieval info: 	<generic name="word_aligner_state_machine_errcnt" value="1" />
-- Retrieval info: 	<generic name="word_aligner_state_machine_patterncnt" value="10" />
-- Retrieval info: 	<generic name="gui_use_wa_status" value="false" />
-- Retrieval info: 	<generic name="word_aligner_pattern_length" value="16" />
-- Retrieval info: 	<generic name="word_align_pattern" value="1111100111111111" />
-- Retrieval info: 	<generic name="gui_enable_run_length" value="false" />
-- Retrieval info: 	<generic name="run_length_violation_checking" value="40" />
-- Retrieval info: 	<generic name="use_rate_match_fifo" value="0" />
-- Retrieval info: 	<generic name="rate_match_pattern1" value="11010000111010000011" />
-- Retrieval info: 	<generic name="rate_match_pattern2" value="00101111000101111100" />
-- Retrieval info: 	<generic name="gui_use_rmfifo_status" value="false" />
-- Retrieval info: 	<generic name="gui_use_byte_order_block" value="false" />
-- Retrieval info: 	<generic name="gui_byte_order_pld_ctrl_enable" value="false" />
-- Retrieval info: 	<generic name="byte_order_pattern" value="111111011" />
-- Retrieval info: 	<generic name="byte_order_pad_pattern" value="000000000" />
-- Retrieval info: 	<generic name="use_double_data_mode" value="DEPRECATED" />
-- Retrieval info: 	<generic name="coreclk_0ppm_enable" value="false" />
-- Retrieval info: 	<generic name="pll_external_enable" value="0" />
-- Retrieval info: 	<generic name="gxb_analog_power" value="AUTO" />
-- Retrieval info: 	<generic name="pll_lock_speed" value="AUTO" />
-- Retrieval info: 	<generic name="tx_analog_power" value="AUTO" />
-- Retrieval info: 	<generic name="tx_slew_rate" value="OFF" />
-- Retrieval info: 	<generic name="tx_termination" value="OCT_100_OHMS" />
-- Retrieval info: 	<generic name="tx_use_external_termination" value="false" />
-- Retrieval info: 	<generic name="tx_preemp_pretap" value="0" />
-- Retrieval info: 	<generic name="gui_tx_preemp_pretap_inv" value="false" />
-- Retrieval info: 	<generic name="tx_preemp_tap_1" value="0" />
-- Retrieval info: 	<generic name="tx_preemp_tap_2" value="0" />
-- Retrieval info: 	<generic name="gui_tx_preemp_tap_2_inv" value="false" />
-- Retrieval info: 	<generic name="tx_vod_selection" value="2" />
-- Retrieval info: 	<generic name="tx_common_mode" value="0.65V" />
-- Retrieval info: 	<generic name="rx_pll_lock_speed" value="AUTO" />
-- Retrieval info: 	<generic name="rx_common_mode" value="0.82V" />
-- Retrieval info: 	<generic name="rx_termination" value="OCT_100_OHMS" />
-- Retrieval info: 	<generic name="rx_use_external_termination" value="false" />
-- Retrieval info: 	<generic name="rx_eq_dc_gain" value="1" />
-- Retrieval info: 	<generic name="rx_eq_ctrl" value="16" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_enable_pll_reconfig" value="false" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll_count" value="1" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_refclk_count" value="1" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_main_pll_index" value="0" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_cdr_pll_refclk_sel" value="0" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll0_pll_type" value="CMU" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll0_data_rate" value="0 Mbps" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll0_refclk_freq" value="0 MHz" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll0_refclk_sel" value="0" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll0_clk_network" value="x1" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll1_pll_type" value="CMU" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll1_data_rate" value="0 Mbps" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll1_refclk_freq" value="0 MHz" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll1_refclk_sel" value="0" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll1_clk_network" value="x1" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll2_pll_type" value="CMU" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll2_data_rate" value="0 Mbps" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll2_refclk_freq" value="0 MHz" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll2_refclk_sel" value="0" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll2_clk_network" value="x1" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll3_pll_type" value="CMU" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll3_data_rate" value="0 Mbps" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll3_refclk_freq" value="0 MHz" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll3_refclk_sel" value="0" />
-- Retrieval info: 	<generic name="gui_pll_reconfig_pll3_clk_network" value="x1" />
-- Retrieval info: 	<generic name="gui_mgmt_clk_in_hz" value="250000000" />
-- Retrieval info: 	<generic name="gui_split_interfaces" value="0" />
-- Retrieval info: 	<generic name="gui_embedded_reset" value="1" />
-- Retrieval info: 	<generic name="channel_interface" value="0" />
-- Retrieval info: </instance>
-- IPFS_FILES : CustomPhy.vho
-- RELATED_FILES: CustomPhy.vhd, altera_xcvr_functions.sv, altera_xcvr_custom.sv, av_xcvr_custom_nr.sv, av_xcvr_custom_native.sv, alt_xcvr_resync.sv, alt_xcvr_csr_common_h.sv, alt_xcvr_csr_common.sv, alt_xcvr_csr_pcs8g_h.sv, alt_xcvr_csr_pcs8g.sv, alt_xcvr_csr_selector.sv, alt_xcvr_mgmt2dec.sv, altera_wait_generate.v, sv_reconfig_bundle_to_xcvr.sv, sv_reconfig_bundle_to_ip.sv, sv_reconfig_bundle_merger.sv, av_xcvr_h.sv, av_xcvr_avmm_csr.sv, av_tx_pma_ch.sv, av_tx_pma.sv, av_rx_pma.sv, av_pma.sv, av_pcs_ch.sv, av_pcs.sv, av_xcvr_avmm.sv, av_xcvr_native.sv, av_xcvr_plls.sv, av_xcvr_data_adapter.sv, av_reconfig_bundle_to_basic.sv, av_reconfig_bundle_to_xcvr.sv, av_hssi_8g_rx_pcs_rbc.sv, av_hssi_8g_tx_pcs_rbc.sv, av_hssi_common_pcs_pma_interface_rbc.sv, av_hssi_common_pld_pcs_interface_rbc.sv, av_hssi_pipe_gen1_2_rbc.sv, av_hssi_rx_pcs_pma_interface_rbc.sv, av_hssi_rx_pld_pcs_interface_rbc.sv, av_hssi_tx_pcs_pma_interface_rbc.sv, av_hssi_tx_pld_pcs_interface_rbc.sv, altera_xcvr_reset_control.sv, alt_xcvr_reset_counter.sv, alt_xcvr_arbiter.sv, alt_xcvr_m2s.sv
