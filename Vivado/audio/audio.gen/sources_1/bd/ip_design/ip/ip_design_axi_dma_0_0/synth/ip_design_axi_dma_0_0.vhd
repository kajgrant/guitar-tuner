-- (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:axi_dma:7.1
-- IP Revision: 23

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY axi_dma_v7_1_23;
USE axi_dma_v7_1_23.axi_dma;

ENTITY ip_design_axi_dma_0_0 IS
  PORT (
    s_axi_lite_aclk : IN STD_LOGIC;
    m_axi_mm2s_aclk : IN STD_LOGIC;
    m_axi_s2mm_aclk : IN STD_LOGIC;
    axi_resetn : IN STD_LOGIC;
    s_axi_lite_awvalid : IN STD_LOGIC;
    s_axi_lite_awready : OUT STD_LOGIC;
    s_axi_lite_awaddr : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    s_axi_lite_wvalid : IN STD_LOGIC;
    s_axi_lite_wready : OUT STD_LOGIC;
    s_axi_lite_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_lite_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_lite_bvalid : OUT STD_LOGIC;
    s_axi_lite_bready : IN STD_LOGIC;
    s_axi_lite_arvalid : IN STD_LOGIC;
    s_axi_lite_arready : OUT STD_LOGIC;
    s_axi_lite_araddr : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    s_axi_lite_rvalid : OUT STD_LOGIC;
    s_axi_lite_rready : IN STD_LOGIC;
    s_axi_lite_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_lite_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_mm2s_araddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_mm2s_arlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_mm2s_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_mm2s_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_mm2s_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_mm2s_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_mm2s_arvalid : OUT STD_LOGIC;
    m_axi_mm2s_arready : IN STD_LOGIC;
    m_axi_mm2s_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_mm2s_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_mm2s_rlast : IN STD_LOGIC;
    m_axi_mm2s_rvalid : IN STD_LOGIC;
    m_axi_mm2s_rready : OUT STD_LOGIC;
    mm2s_prmry_reset_out_n : OUT STD_LOGIC;
    m_axis_mm2s_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_mm2s_tkeep : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axis_mm2s_tvalid : OUT STD_LOGIC;
    m_axis_mm2s_tready : IN STD_LOGIC;
    m_axis_mm2s_tlast : OUT STD_LOGIC;
    m_axi_s2mm_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_s2mm_awlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_s2mm_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_s2mm_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_s2mm_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_s2mm_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_s2mm_awvalid : OUT STD_LOGIC;
    m_axi_s2mm_awready : IN STD_LOGIC;
    m_axi_s2mm_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_s2mm_wstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_s2mm_wlast : OUT STD_LOGIC;
    m_axi_s2mm_wvalid : OUT STD_LOGIC;
    m_axi_s2mm_wready : IN STD_LOGIC;
    m_axi_s2mm_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_s2mm_bvalid : IN STD_LOGIC;
    m_axi_s2mm_bready : OUT STD_LOGIC;
    s2mm_prmry_reset_out_n : OUT STD_LOGIC;
    s_axis_s2mm_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_s2mm_tkeep : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axis_s2mm_tvalid : IN STD_LOGIC;
    s_axis_s2mm_tready : OUT STD_LOGIC;
    s_axis_s2mm_tlast : IN STD_LOGIC;
    mm2s_introut : OUT STD_LOGIC;
    s2mm_introut : OUT STD_LOGIC;
    axi_dma_tstvec : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END ip_design_axi_dma_0_0;

ARCHITECTURE ip_design_axi_dma_0_0_arch OF ip_design_axi_dma_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF ip_design_axi_dma_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT axi_dma IS
    GENERIC (
      C_S_AXI_LITE_ADDR_WIDTH : INTEGER;
      C_S_AXI_LITE_DATA_WIDTH : INTEGER;
      C_DLYTMR_RESOLUTION : INTEGER;
      C_PRMRY_IS_ACLK_ASYNC : INTEGER;
      C_ENABLE_MULTI_CHANNEL : INTEGER;
      C_NUM_MM2S_CHANNELS : INTEGER;
      C_NUM_S2MM_CHANNELS : INTEGER;
      C_INCLUDE_SG : INTEGER;
      C_SG_INCLUDE_STSCNTRL_STRM : INTEGER;
      C_SG_USE_STSAPP_LENGTH : INTEGER;
      C_SG_LENGTH_WIDTH : INTEGER;
      C_M_AXI_SG_ADDR_WIDTH : INTEGER;
      C_M_AXI_SG_DATA_WIDTH : INTEGER;
      C_M_AXIS_MM2S_CNTRL_TDATA_WIDTH : INTEGER;
      C_S_AXIS_S2MM_STS_TDATA_WIDTH : INTEGER;
      C_MICRO_DMA : INTEGER;
      C_INCLUDE_MM2S : INTEGER;
      C_INCLUDE_MM2S_SF : INTEGER;
      C_MM2S_BURST_SIZE : INTEGER;
      C_M_AXI_MM2S_ADDR_WIDTH : INTEGER;
      C_M_AXI_MM2S_DATA_WIDTH : INTEGER;
      C_M_AXIS_MM2S_TDATA_WIDTH : INTEGER;
      C_INCLUDE_MM2S_DRE : INTEGER;
      C_INCLUDE_S2MM : INTEGER;
      C_INCLUDE_S2MM_SF : INTEGER;
      C_S2MM_BURST_SIZE : INTEGER;
      C_M_AXI_S2MM_ADDR_WIDTH : INTEGER;
      C_M_AXI_S2MM_DATA_WIDTH : INTEGER;
      C_S_AXIS_S2MM_TDATA_WIDTH : INTEGER;
      C_INCLUDE_S2MM_DRE : INTEGER;
      C_INCREASE_THROUGHPUT : INTEGER;
      C_FAMILY : STRING
    );
    PORT (
      s_axi_lite_aclk : IN STD_LOGIC;
      m_axi_sg_aclk : IN STD_LOGIC;
      m_axi_mm2s_aclk : IN STD_LOGIC;
      m_axi_s2mm_aclk : IN STD_LOGIC;
      axi_resetn : IN STD_LOGIC;
      s_axi_lite_awvalid : IN STD_LOGIC;
      s_axi_lite_awready : OUT STD_LOGIC;
      s_axi_lite_awaddr : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      s_axi_lite_wvalid : IN STD_LOGIC;
      s_axi_lite_wready : OUT STD_LOGIC;
      s_axi_lite_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_lite_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_lite_bvalid : OUT STD_LOGIC;
      s_axi_lite_bready : IN STD_LOGIC;
      s_axi_lite_arvalid : IN STD_LOGIC;
      s_axi_lite_arready : OUT STD_LOGIC;
      s_axi_lite_araddr : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      s_axi_lite_rvalid : OUT STD_LOGIC;
      s_axi_lite_rready : IN STD_LOGIC;
      s_axi_lite_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_lite_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_sg_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_sg_awlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_sg_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_sg_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_sg_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_sg_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_sg_awuser : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_sg_awvalid : OUT STD_LOGIC;
      m_axi_sg_awready : IN STD_LOGIC;
      m_axi_sg_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_sg_wstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_sg_wlast : OUT STD_LOGIC;
      m_axi_sg_wvalid : OUT STD_LOGIC;
      m_axi_sg_wready : IN STD_LOGIC;
      m_axi_sg_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_sg_bvalid : IN STD_LOGIC;
      m_axi_sg_bready : OUT STD_LOGIC;
      m_axi_sg_araddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_sg_arlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_sg_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_sg_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_sg_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_sg_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_sg_aruser : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_sg_arvalid : OUT STD_LOGIC;
      m_axi_sg_arready : IN STD_LOGIC;
      m_axi_sg_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_sg_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_sg_rlast : IN STD_LOGIC;
      m_axi_sg_rvalid : IN STD_LOGIC;
      m_axi_sg_rready : OUT STD_LOGIC;
      m_axi_mm2s_araddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_mm2s_arlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_mm2s_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_mm2s_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_mm2s_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_mm2s_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_mm2s_aruser : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_mm2s_arvalid : OUT STD_LOGIC;
      m_axi_mm2s_arready : IN STD_LOGIC;
      m_axi_mm2s_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_mm2s_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_mm2s_rlast : IN STD_LOGIC;
      m_axi_mm2s_rvalid : IN STD_LOGIC;
      m_axi_mm2s_rready : OUT STD_LOGIC;
      mm2s_prmry_reset_out_n : OUT STD_LOGIC;
      m_axis_mm2s_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axis_mm2s_tkeep : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axis_mm2s_tvalid : OUT STD_LOGIC;
      m_axis_mm2s_tready : IN STD_LOGIC;
      m_axis_mm2s_tlast : OUT STD_LOGIC;
      m_axis_mm2s_tuser : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axis_mm2s_tid : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      m_axis_mm2s_tdest : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      mm2s_cntrl_reset_out_n : OUT STD_LOGIC;
      m_axis_mm2s_cntrl_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axis_mm2s_cntrl_tkeep : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axis_mm2s_cntrl_tvalid : OUT STD_LOGIC;
      m_axis_mm2s_cntrl_tready : IN STD_LOGIC;
      m_axis_mm2s_cntrl_tlast : OUT STD_LOGIC;
      m_axi_s2mm_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_s2mm_awlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_s2mm_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_s2mm_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_s2mm_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_s2mm_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_s2mm_awuser : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_s2mm_awvalid : OUT STD_LOGIC;
      m_axi_s2mm_awready : IN STD_LOGIC;
      m_axi_s2mm_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_s2mm_wstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_s2mm_wlast : OUT STD_LOGIC;
      m_axi_s2mm_wvalid : OUT STD_LOGIC;
      m_axi_s2mm_wready : IN STD_LOGIC;
      m_axi_s2mm_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_s2mm_bvalid : IN STD_LOGIC;
      m_axi_s2mm_bready : OUT STD_LOGIC;
      s2mm_prmry_reset_out_n : OUT STD_LOGIC;
      s_axis_s2mm_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axis_s2mm_tkeep : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axis_s2mm_tvalid : IN STD_LOGIC;
      s_axis_s2mm_tready : OUT STD_LOGIC;
      s_axis_s2mm_tlast : IN STD_LOGIC;
      s_axis_s2mm_tuser : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axis_s2mm_tid : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      s_axis_s2mm_tdest : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      s2mm_sts_reset_out_n : OUT STD_LOGIC;
      s_axis_s2mm_sts_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axis_s2mm_sts_tkeep : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axis_s2mm_sts_tvalid : IN STD_LOGIC;
      s_axis_s2mm_sts_tready : OUT STD_LOGIC;
      s_axis_s2mm_sts_tlast : IN STD_LOGIC;
      mm2s_introut : OUT STD_LOGIC;
      s2mm_introut : OUT STD_LOGIC;
      axi_dma_tstvec : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT axi_dma;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF ip_design_axi_dma_0_0_arch: ARCHITECTURE IS "axi_dma,Vivado 2020.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF ip_design_axi_dma_0_0_arch : ARCHITECTURE IS "ip_design_axi_dma_0_0,axi_dma,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF ip_design_axi_dma_0_0_arch: ARCHITECTURE IS "ip_design_axi_dma_0_0,axi_dma,{x_ipProduct=Vivado 2020.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=axi_dma,x_ipVersion=7.1,x_ipCoreRevision=23,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,C_S_AXI_LITE_ADDR_WIDTH=10,C_S_AXI_LITE_DATA_WIDTH=32,C_DLYTMR_RESOLUTION=125,C_PRMRY_IS_ACLK_ASYNC=0,C_ENABLE_MULTI_CHANNEL=0,C_NUM_MM2S_CHANNELS=1,C_NUM_S2MM_CHANNELS=1,C_INCLUDE_SG=0,C_SG_INCLUDE_STSCNTRL_STRM=0,C_SG_USE_STSAPP_LENGTH=0,C_SG_LENGTH_WIDTH=14,C_M_AXI_SG_ADDR_WIDTH=32,C_M_AXI_SG_DATA_WIDTH=32,C_" & 
"M_AXIS_MM2S_CNTRL_TDATA_WIDTH=32,C_S_AXIS_S2MM_STS_TDATA_WIDTH=32,C_MICRO_DMA=0,C_INCLUDE_MM2S=1,C_INCLUDE_MM2S_SF=1,C_MM2S_BURST_SIZE=16,C_M_AXI_MM2S_ADDR_WIDTH=32,C_M_AXI_MM2S_DATA_WIDTH=32,C_M_AXIS_MM2S_TDATA_WIDTH=32,C_INCLUDE_MM2S_DRE=0,C_INCLUDE_S2MM=1,C_INCLUDE_S2MM_SF=1,C_S2MM_BURST_SIZE=16,C_M_AXI_S2MM_ADDR_WIDTH=32,C_M_AXI_S2MM_DATA_WIDTH=32,C_S_AXIS_S2MM_TDATA_WIDTH=32,C_INCLUDE_S2MM_DRE=0,C_INCREASE_THROUGHPUT=0,C_FAMILY=zynq}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF s2mm_introut: SIGNAL IS "XIL_INTERFACENAME S2MM_INTROUT, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  ATTRIBUTE X_INTERFACE_INFO OF s2mm_introut: SIGNAL IS "xilinx.com:signal:interrupt:1.0 S2MM_INTROUT INTERRUPT";
  ATTRIBUTE X_INTERFACE_PARAMETER OF mm2s_introut: SIGNAL IS "XIL_INTERFACENAME MM2S_INTROUT, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  ATTRIBUTE X_INTERFACE_INFO OF mm2s_introut: SIGNAL IS "xilinx.com:signal:interrupt:1.0 MM2S_INTROUT INTERRUPT";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_s2mm_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXIS_S2MM TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_s2mm_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXIS_S2MM TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_s2mm_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXIS_S2MM TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_s2mm_tkeep: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXIS_S2MM TKEEP";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axis_s2mm_tdata: SIGNAL IS "XIL_INTERFACENAME S_AXIS_S2MM, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN ip_design_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 3" & 
"2768} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chan} size {attribs {resolve_type generated dependency chan_size format long minimum {} maximum {}} value 1} stride {attribs {resolve_type generated dependency chan_stride format long minimum {} maximum {}} value 32} datatype {name {attribs {resolve_type immediate dependency {} format " & 
"string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 32768} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_xn_re {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value xn_re} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resol" & 
"ve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 32752} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} size {attribs {resolve_type generated dependency frame_size format long minimum {} maximum {}} value 1024" & 
"} stride {attribs {resolve_type generated dependency frame_stride format long minimum {} maximum {}} value 32} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency xn_width format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type generated dependency xn_f" & 
"ractwidth format long minimum {} maximum {}} value 15} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}} field_xn_im {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value xn_im} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {at" & 
"tribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 32752} bitoffset {attribs {resolve_type generated dependency xn_im_offset format long minimum {} maximum {}} value 16} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} size {attribs {resolve_type generated dependency frame_size format long minimum {} maximum {}} value 1024} stride {attribs {resolve_type generated dependency frame_stride format long mi" & 
"nimum {} maximum {}} value 32} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency xn_width format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type generated dependency xn_fractwidth format long minimum {} maximum {}} value 15} signed {attribs {resolve_" & 
"type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}}}}}}} TDATA_WIDTH 32 TUSER {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_xk_index {name {attribs {resolve_type immediate dependency {} forma" & 
"t string minimum {} maximum {}} value xk_index} enabled {attribs {resolve_type generated dependency xk_index_enabled format bool minimum {} maximum {}} value false} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency xk_index_width format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {sign" & 
"ed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_blk_exp {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value blk_exp} enabled {attribs {resolve_type generated dependency blk_exp_enabled format bool minimum {} maximum {}} value false} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {}" & 
" format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type generated dependency blk_exp_offset format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} size {attribs {resolve_type generated dependency chan_size format long minimum {} maximum {}} value 1} stride {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} datatype {name {attribs {resol" & 
"ve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}} field_ovflo {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} va" & 
"lue ovflo} enabled {attribs {resolve_type generated dependency ovflo_enabled format bool minimum {} maximum {}} value false} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type generated dependency ovflo_offset format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate depen" & 
"dency {} format string minimum {} maximum {}} value {}} size {attribs {resolve_type generated dependency chan_size format long minimum {} maximum {}} value 1} stride {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type i" & 
"mmediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}}}} TUSER_WIDTH 0}, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_s2mm_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXIS_S2MM TDATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s2mm_prmry_reset_out_n: SIGNAL IS "XIL_INTERFACENAME S2MM_PRMRY_RESET_OUT_N, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s2mm_prmry_reset_out_n: SIGNAL IS "xilinx.com:signal:reset:1.0 S2MM_PRMRY_RESET_OUT_N RST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_s2mm_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_S2MM BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_s2mm_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_S2MM BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_s2mm_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_S2MM BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_s2mm_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_S2MM WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_s2mm_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_S2MM WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_s2mm_wlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_S2MM WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_s2mm_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_S2MM WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_s2mm_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_S2MM WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_s2mm_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_S2MM AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_s2mm_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_S2MM AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_s2mm_awcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_S2MM AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_s2mm_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_S2MM AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_s2mm_awburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_S2MM AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_s2mm_awsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_S2MM AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_s2mm_awlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_S2MM AWLEN";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m_axi_s2mm_awaddr: SIGNAL IS "XIL_INTERFACENAME M_AXI_S2MM, SUPPORTS_NARROW_BURST 0, NUM_WRITE_OUTSTANDING 16, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE WRITE_ONLY, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 0, NUM_READ_OUTSTANDING 2, MAX_BURST_LENGTH 16, PHASE 0.000, CLK_DOMAIN ip_design_processing_system7_0_0_FCLK_CLK0, NUM_READ_TH" & 
"READS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_s2mm_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_S2MM AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_mm2s_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS_MM2S TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_mm2s_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS_MM2S TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_mm2s_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS_MM2S TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_mm2s_tkeep: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS_MM2S TKEEP";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m_axis_mm2s_tdata: SIGNAL IS "XIL_INTERFACENAME M_AXIS_MM2S, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN ip_design_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0, HAS_BURST 0";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_mm2s_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS_MM2S TDATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF mm2s_prmry_reset_out_n: SIGNAL IS "XIL_INTERFACENAME MM2S_PRMRY_RESET_OUT_N, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF mm2s_prmry_reset_out_n: SIGNAL IS "xilinx.com:signal:reset:1.0 MM2S_PRMRY_RESET_OUT_N RST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_mm2s_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_MM2S RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_mm2s_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_MM2S RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_mm2s_rlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_MM2S RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_mm2s_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_MM2S RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_mm2s_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_MM2S RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_mm2s_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_mm2s_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_mm2s_arcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_mm2s_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_mm2s_arburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_mm2s_arsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_mm2s_arlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARLEN";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m_axi_mm2s_araddr: SIGNAL IS "XIL_INTERFACENAME M_AXI_MM2S, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 16, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_ONLY, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 0, HAS_BRESP 0, HAS_RRESP 1, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 16, PHASE 0.000, CLK_DOMAIN ip_design_processing_system7_0_0_FCLK_CLK0, NUM_READ_THR" & 
"EADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_mm2s_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_lite_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_LITE RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_lite_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_LITE RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_lite_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_LITE RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_lite_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_LITE RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_lite_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_lite_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_lite_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_lite_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_LITE BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_lite_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_LITE BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_lite_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_LITE BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_lite_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_LITE WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_lite_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_LITE WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_lite_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_LITE WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_lite_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_lite_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_lite_awvalid: SIGNAL IS "XIL_INTERFACENAME S_AXI_LITE, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 10, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 0, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN ip_design_processing_system7_0_0_FCLK_CLK0, NUM_READ_" & 
"THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_lite_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF axi_resetn: SIGNAL IS "XIL_INTERFACENAME AXI_RESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF axi_resetn: SIGNAL IS "xilinx.com:signal:reset:1.0 AXI_RESETN RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m_axi_s2mm_aclk: SIGNAL IS "XIL_INTERFACENAME M_AXI_S2MM_CLK, ASSOCIATED_BUSIF M_AXI_S2MM:S_AXIS_S2MM:S_AXIS_STS, ASSOCIATED_RESET s2mm_prmry_reset_out_n:s2mm_sts_reset_out_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN ip_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_s2mm_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 M_AXI_S2MM_CLK CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m_axi_mm2s_aclk: SIGNAL IS "XIL_INTERFACENAME M_AXI_MM2S_CLK, ASSOCIATED_BUSIF M_AXI_MM2S:M_AXIS_MM2S:M_AXIS_CNTRL, ASSOCIATED_RESET mm2s_prmry_reset_out_n:mm2s_cntrl_reset_out_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN ip_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_mm2s_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 M_AXI_MM2S_CLK CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_lite_aclk: SIGNAL IS "XIL_INTERFACENAME S_AXI_LITE_ACLK, ASSOCIATED_BUSIF S_AXI_LITE:M_AXI, ASSOCIATED_RESET axi_resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN ip_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_lite_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 S_AXI_LITE_ACLK CLK";
BEGIN
  U0 : axi_dma
    GENERIC MAP (
      C_S_AXI_LITE_ADDR_WIDTH => 10,
      C_S_AXI_LITE_DATA_WIDTH => 32,
      C_DLYTMR_RESOLUTION => 125,
      C_PRMRY_IS_ACLK_ASYNC => 0,
      C_ENABLE_MULTI_CHANNEL => 0,
      C_NUM_MM2S_CHANNELS => 1,
      C_NUM_S2MM_CHANNELS => 1,
      C_INCLUDE_SG => 0,
      C_SG_INCLUDE_STSCNTRL_STRM => 0,
      C_SG_USE_STSAPP_LENGTH => 0,
      C_SG_LENGTH_WIDTH => 14,
      C_M_AXI_SG_ADDR_WIDTH => 32,
      C_M_AXI_SG_DATA_WIDTH => 32,
      C_M_AXIS_MM2S_CNTRL_TDATA_WIDTH => 32,
      C_S_AXIS_S2MM_STS_TDATA_WIDTH => 32,
      C_MICRO_DMA => 0,
      C_INCLUDE_MM2S => 1,
      C_INCLUDE_MM2S_SF => 1,
      C_MM2S_BURST_SIZE => 16,
      C_M_AXI_MM2S_ADDR_WIDTH => 32,
      C_M_AXI_MM2S_DATA_WIDTH => 32,
      C_M_AXIS_MM2S_TDATA_WIDTH => 32,
      C_INCLUDE_MM2S_DRE => 0,
      C_INCLUDE_S2MM => 1,
      C_INCLUDE_S2MM_SF => 1,
      C_S2MM_BURST_SIZE => 16,
      C_M_AXI_S2MM_ADDR_WIDTH => 32,
      C_M_AXI_S2MM_DATA_WIDTH => 32,
      C_S_AXIS_S2MM_TDATA_WIDTH => 32,
      C_INCLUDE_S2MM_DRE => 0,
      C_INCREASE_THROUGHPUT => 0,
      C_FAMILY => "zynq"
    )
    PORT MAP (
      s_axi_lite_aclk => s_axi_lite_aclk,
      m_axi_sg_aclk => '0',
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      m_axi_s2mm_aclk => m_axi_s2mm_aclk,
      axi_resetn => axi_resetn,
      s_axi_lite_awvalid => s_axi_lite_awvalid,
      s_axi_lite_awready => s_axi_lite_awready,
      s_axi_lite_awaddr => s_axi_lite_awaddr,
      s_axi_lite_wvalid => s_axi_lite_wvalid,
      s_axi_lite_wready => s_axi_lite_wready,
      s_axi_lite_wdata => s_axi_lite_wdata,
      s_axi_lite_bresp => s_axi_lite_bresp,
      s_axi_lite_bvalid => s_axi_lite_bvalid,
      s_axi_lite_bready => s_axi_lite_bready,
      s_axi_lite_arvalid => s_axi_lite_arvalid,
      s_axi_lite_arready => s_axi_lite_arready,
      s_axi_lite_araddr => s_axi_lite_araddr,
      s_axi_lite_rvalid => s_axi_lite_rvalid,
      s_axi_lite_rready => s_axi_lite_rready,
      s_axi_lite_rdata => s_axi_lite_rdata,
      s_axi_lite_rresp => s_axi_lite_rresp,
      m_axi_sg_awready => '0',
      m_axi_sg_wready => '0',
      m_axi_sg_bresp => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      m_axi_sg_bvalid => '0',
      m_axi_sg_arready => '0',
      m_axi_sg_rdata => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
      m_axi_sg_rresp => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      m_axi_sg_rlast => '0',
      m_axi_sg_rvalid => '0',
      m_axi_mm2s_araddr => m_axi_mm2s_araddr,
      m_axi_mm2s_arlen => m_axi_mm2s_arlen,
      m_axi_mm2s_arsize => m_axi_mm2s_arsize,
      m_axi_mm2s_arburst => m_axi_mm2s_arburst,
      m_axi_mm2s_arprot => m_axi_mm2s_arprot,
      m_axi_mm2s_arcache => m_axi_mm2s_arcache,
      m_axi_mm2s_arvalid => m_axi_mm2s_arvalid,
      m_axi_mm2s_arready => m_axi_mm2s_arready,
      m_axi_mm2s_rdata => m_axi_mm2s_rdata,
      m_axi_mm2s_rresp => m_axi_mm2s_rresp,
      m_axi_mm2s_rlast => m_axi_mm2s_rlast,
      m_axi_mm2s_rvalid => m_axi_mm2s_rvalid,
      m_axi_mm2s_rready => m_axi_mm2s_rready,
      mm2s_prmry_reset_out_n => mm2s_prmry_reset_out_n,
      m_axis_mm2s_tdata => m_axis_mm2s_tdata,
      m_axis_mm2s_tkeep => m_axis_mm2s_tkeep,
      m_axis_mm2s_tvalid => m_axis_mm2s_tvalid,
      m_axis_mm2s_tready => m_axis_mm2s_tready,
      m_axis_mm2s_tlast => m_axis_mm2s_tlast,
      m_axis_mm2s_cntrl_tready => '0',
      m_axi_s2mm_awaddr => m_axi_s2mm_awaddr,
      m_axi_s2mm_awlen => m_axi_s2mm_awlen,
      m_axi_s2mm_awsize => m_axi_s2mm_awsize,
      m_axi_s2mm_awburst => m_axi_s2mm_awburst,
      m_axi_s2mm_awprot => m_axi_s2mm_awprot,
      m_axi_s2mm_awcache => m_axi_s2mm_awcache,
      m_axi_s2mm_awvalid => m_axi_s2mm_awvalid,
      m_axi_s2mm_awready => m_axi_s2mm_awready,
      m_axi_s2mm_wdata => m_axi_s2mm_wdata,
      m_axi_s2mm_wstrb => m_axi_s2mm_wstrb,
      m_axi_s2mm_wlast => m_axi_s2mm_wlast,
      m_axi_s2mm_wvalid => m_axi_s2mm_wvalid,
      m_axi_s2mm_wready => m_axi_s2mm_wready,
      m_axi_s2mm_bresp => m_axi_s2mm_bresp,
      m_axi_s2mm_bvalid => m_axi_s2mm_bvalid,
      m_axi_s2mm_bready => m_axi_s2mm_bready,
      s2mm_prmry_reset_out_n => s2mm_prmry_reset_out_n,
      s_axis_s2mm_tdata => s_axis_s2mm_tdata,
      s_axis_s2mm_tkeep => s_axis_s2mm_tkeep,
      s_axis_s2mm_tvalid => s_axis_s2mm_tvalid,
      s_axis_s2mm_tready => s_axis_s2mm_tready,
      s_axis_s2mm_tlast => s_axis_s2mm_tlast,
      s_axis_s2mm_tuser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axis_s2mm_tid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 5)),
      s_axis_s2mm_tdest => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 5)),
      s_axis_s2mm_sts_tdata => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
      s_axis_s2mm_sts_tkeep => X"F",
      s_axis_s2mm_sts_tvalid => '0',
      s_axis_s2mm_sts_tlast => '0',
      mm2s_introut => mm2s_introut,
      s2mm_introut => s2mm_introut,
      axi_dma_tstvec => axi_dma_tstvec
    );
END ip_design_axi_dma_0_0_arch;
