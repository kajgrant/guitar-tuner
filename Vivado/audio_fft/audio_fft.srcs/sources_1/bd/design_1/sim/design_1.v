//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Sat Mar  4 14:46:16 2023
//Host        : KAJ-MAIN running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module accelerator_imp_VJ4YIN
   (M_AXIS_DATA_tdata,
    M_AXIS_DATA_tlast,
    M_AXIS_DATA_tready,
    M_AXIS_DATA_tvalid,
    S_AXIS_DATA_tdata,
    S_AXIS_DATA_tlast,
    S_AXIS_DATA_tready,
    S_AXIS_DATA_tvalid,
    aclk,
    s_axis_config_tdata,
    s_axis_config_tvalid);
  output [31:0]M_AXIS_DATA_tdata;
  output M_AXIS_DATA_tlast;
  input M_AXIS_DATA_tready;
  output M_AXIS_DATA_tvalid;
  input [31:0]S_AXIS_DATA_tdata;
  input S_AXIS_DATA_tlast;
  output S_AXIS_DATA_tready;
  input S_AXIS_DATA_tvalid;
  input aclk;
  input [31:0]s_axis_config_tdata;
  input s_axis_config_tvalid;

  wire [31:0]axi_dma_0_m_axis_mm2s_TDATA;
  wire axi_dma_0_m_axis_mm2s_TLAST;
  wire axi_dma_0_m_axis_mm2s_TREADY;
  wire axi_dma_0_m_axis_mm2s_TVALID;
  wire [31:0]axi_gpio_0_gpio_io_o;
  wire edge_detect_0_edge_detected;
  wire processing_system7_0_fclk_clk0;
  wire [31:0]xfft_0_m_axis_data_TDATA;
  wire xfft_0_m_axis_data_TLAST;
  wire xfft_0_m_axis_data_TREADY;
  wire xfft_0_m_axis_data_TVALID;

  assign M_AXIS_DATA_tdata[31:0] = xfft_0_m_axis_data_TDATA;
  assign M_AXIS_DATA_tlast = xfft_0_m_axis_data_TLAST;
  assign M_AXIS_DATA_tvalid = xfft_0_m_axis_data_TVALID;
  assign S_AXIS_DATA_tready = axi_dma_0_m_axis_mm2s_TREADY;
  assign axi_dma_0_m_axis_mm2s_TDATA = S_AXIS_DATA_tdata[31:0];
  assign axi_dma_0_m_axis_mm2s_TLAST = S_AXIS_DATA_tlast;
  assign axi_dma_0_m_axis_mm2s_TVALID = S_AXIS_DATA_tvalid;
  assign axi_gpio_0_gpio_io_o = s_axis_config_tdata[31:0];
  assign edge_detect_0_edge_detected = s_axis_config_tvalid;
  assign processing_system7_0_fclk_clk0 = aclk;
  assign xfft_0_m_axis_data_TREADY = M_AXIS_DATA_tready;
  design_1_xfft_0_0 xfft_0
       (.aclk(processing_system7_0_fclk_clk0),
        .m_axis_data_tdata(xfft_0_m_axis_data_TDATA),
        .m_axis_data_tlast(xfft_0_m_axis_data_TLAST),
        .m_axis_data_tready(xfft_0_m_axis_data_TREADY),
        .m_axis_data_tvalid(xfft_0_m_axis_data_TVALID),
        .s_axis_config_tdata(axi_gpio_0_gpio_io_o),
        .s_axis_config_tvalid(edge_detect_0_edge_detected),
        .s_axis_data_tdata(axi_dma_0_m_axis_mm2s_TDATA),
        .s_axis_data_tlast(axi_dma_0_m_axis_mm2s_TLAST),
        .s_axis_data_tready(axi_dma_0_m_axis_mm2s_TREADY),
        .s_axis_data_tvalid(axi_dma_0_m_axis_mm2s_TVALID));
endmodule

module ctrl_imp_1POYFNJ
   (In2,
    M_AXIS_ACCEL_tdata,
    M_AXIS_ACCEL_tlast,
    M_AXIS_ACCEL_tready,
    M_AXIS_ACCEL_tvalid,
    M_AXI_DMA_DATA_araddr,
    M_AXI_DMA_DATA_arburst,
    M_AXI_DMA_DATA_arcache,
    M_AXI_DMA_DATA_arid,
    M_AXI_DMA_DATA_arlen,
    M_AXI_DMA_DATA_arlock,
    M_AXI_DMA_DATA_arprot,
    M_AXI_DMA_DATA_arqos,
    M_AXI_DMA_DATA_arready,
    M_AXI_DMA_DATA_arsize,
    M_AXI_DMA_DATA_arvalid,
    M_AXI_DMA_DATA_awaddr,
    M_AXI_DMA_DATA_awburst,
    M_AXI_DMA_DATA_awcache,
    M_AXI_DMA_DATA_awid,
    M_AXI_DMA_DATA_awlen,
    M_AXI_DMA_DATA_awlock,
    M_AXI_DMA_DATA_awprot,
    M_AXI_DMA_DATA_awqos,
    M_AXI_DMA_DATA_awready,
    M_AXI_DMA_DATA_awsize,
    M_AXI_DMA_DATA_awvalid,
    M_AXI_DMA_DATA_bid,
    M_AXI_DMA_DATA_bready,
    M_AXI_DMA_DATA_bresp,
    M_AXI_DMA_DATA_bvalid,
    M_AXI_DMA_DATA_rdata,
    M_AXI_DMA_DATA_rid,
    M_AXI_DMA_DATA_rlast,
    M_AXI_DMA_DATA_rready,
    M_AXI_DMA_DATA_rresp,
    M_AXI_DMA_DATA_rvalid,
    M_AXI_DMA_DATA_wdata,
    M_AXI_DMA_DATA_wid,
    M_AXI_DMA_DATA_wlast,
    M_AXI_DMA_DATA_wready,
    M_AXI_DMA_DATA_wstrb,
    M_AXI_DMA_DATA_wvalid,
    S_AXIS_ACCEL_tdata,
    S_AXIS_ACCEL_tlast,
    S_AXIS_ACCEL_tready,
    S_AXIS_ACCEL_tvalid,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wid,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid,
    ctrl_aclk,
    dma_irqs,
    ext_reset_in,
    fft_config_tdata,
    fft_config_tvalid,
    interconnect_aresetn,
    peripheral_aresetn,
    peripheral_reset,
    slowest_sync_clk);
  input [0:0]In2;
  output [31:0]M_AXIS_ACCEL_tdata;
  output M_AXIS_ACCEL_tlast;
  input M_AXIS_ACCEL_tready;
  output M_AXIS_ACCEL_tvalid;
  output [31:0]M_AXI_DMA_DATA_araddr;
  output [1:0]M_AXI_DMA_DATA_arburst;
  output [3:0]M_AXI_DMA_DATA_arcache;
  output [0:0]M_AXI_DMA_DATA_arid;
  output [3:0]M_AXI_DMA_DATA_arlen;
  output [1:0]M_AXI_DMA_DATA_arlock;
  output [2:0]M_AXI_DMA_DATA_arprot;
  output [3:0]M_AXI_DMA_DATA_arqos;
  input M_AXI_DMA_DATA_arready;
  output [2:0]M_AXI_DMA_DATA_arsize;
  output M_AXI_DMA_DATA_arvalid;
  output [31:0]M_AXI_DMA_DATA_awaddr;
  output [1:0]M_AXI_DMA_DATA_awburst;
  output [3:0]M_AXI_DMA_DATA_awcache;
  output [0:0]M_AXI_DMA_DATA_awid;
  output [3:0]M_AXI_DMA_DATA_awlen;
  output [1:0]M_AXI_DMA_DATA_awlock;
  output [2:0]M_AXI_DMA_DATA_awprot;
  output [3:0]M_AXI_DMA_DATA_awqos;
  input M_AXI_DMA_DATA_awready;
  output [2:0]M_AXI_DMA_DATA_awsize;
  output M_AXI_DMA_DATA_awvalid;
  input [5:0]M_AXI_DMA_DATA_bid;
  output M_AXI_DMA_DATA_bready;
  input [1:0]M_AXI_DMA_DATA_bresp;
  input M_AXI_DMA_DATA_bvalid;
  input [63:0]M_AXI_DMA_DATA_rdata;
  input [5:0]M_AXI_DMA_DATA_rid;
  input M_AXI_DMA_DATA_rlast;
  output M_AXI_DMA_DATA_rready;
  input [1:0]M_AXI_DMA_DATA_rresp;
  input M_AXI_DMA_DATA_rvalid;
  output [63:0]M_AXI_DMA_DATA_wdata;
  output [0:0]M_AXI_DMA_DATA_wid;
  output M_AXI_DMA_DATA_wlast;
  input M_AXI_DMA_DATA_wready;
  output [7:0]M_AXI_DMA_DATA_wstrb;
  output M_AXI_DMA_DATA_wvalid;
  input [31:0]S_AXIS_ACCEL_tdata;
  input S_AXIS_ACCEL_tlast;
  output S_AXIS_ACCEL_tready;
  input S_AXIS_ACCEL_tvalid;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [3:0]S_AXI_arlen;
  input [1:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [3:0]S_AXI_awlen;
  input [1:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input [11:0]S_AXI_wid;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;
  input ctrl_aclk;
  output [2:0]dma_irqs;
  input ext_reset_in;
  output [31:0]fft_config_tdata;
  output fft_config_tvalid;
  output [0:0]interconnect_aresetn;
  output [0:0]peripheral_aresetn;
  output [0:0]peripheral_reset;
  input slowest_sync_clk;

  wire [0:0]In2_1;
  wire [31:0]axi_dma_0_m_axi_mm2s_ARADDR;
  wire [1:0]axi_dma_0_m_axi_mm2s_ARBURST;
  wire [3:0]axi_dma_0_m_axi_mm2s_ARCACHE;
  wire [7:0]axi_dma_0_m_axi_mm2s_ARLEN;
  wire [2:0]axi_dma_0_m_axi_mm2s_ARPROT;
  wire [0:0]axi_dma_0_m_axi_mm2s_ARREADY;
  wire [2:0]axi_dma_0_m_axi_mm2s_ARSIZE;
  wire axi_dma_0_m_axi_mm2s_ARVALID;
  wire [63:0]axi_dma_0_m_axi_mm2s_RDATA;
  wire [0:0]axi_dma_0_m_axi_mm2s_RLAST;
  wire axi_dma_0_m_axi_mm2s_RREADY;
  wire [1:0]axi_dma_0_m_axi_mm2s_RRESP;
  wire [0:0]axi_dma_0_m_axi_mm2s_RVALID;
  wire [31:0]axi_dma_0_m_axi_s2mm_AWADDR;
  wire [1:0]axi_dma_0_m_axi_s2mm_AWBURST;
  wire [3:0]axi_dma_0_m_axi_s2mm_AWCACHE;
  wire [7:0]axi_dma_0_m_axi_s2mm_AWLEN;
  wire [2:0]axi_dma_0_m_axi_s2mm_AWPROT;
  wire [0:0]axi_dma_0_m_axi_s2mm_AWREADY;
  wire [2:0]axi_dma_0_m_axi_s2mm_AWSIZE;
  wire axi_dma_0_m_axi_s2mm_AWVALID;
  wire axi_dma_0_m_axi_s2mm_BREADY;
  wire [1:0]axi_dma_0_m_axi_s2mm_BRESP;
  wire [0:0]axi_dma_0_m_axi_s2mm_BVALID;
  wire [63:0]axi_dma_0_m_axi_s2mm_WDATA;
  wire axi_dma_0_m_axi_s2mm_WLAST;
  wire [0:0]axi_dma_0_m_axi_s2mm_WREADY;
  wire [7:0]axi_dma_0_m_axi_s2mm_WSTRB;
  wire axi_dma_0_m_axi_s2mm_WVALID;
  wire [31:0]axi_dma_0_m_axis_mm2s_TDATA;
  wire axi_dma_0_m_axis_mm2s_TLAST;
  wire axi_dma_0_m_axis_mm2s_TREADY;
  wire axi_dma_0_m_axis_mm2s_TVALID;
  wire axi_dma_0_mm2s_introut;
  wire axi_dma_0_s2mm_introut;
  wire [31:0]axi_gpio_0_gpio_io_o;
  wire [31:0]axi_interconnect_0_m00_axi_ARADDR;
  wire [1:0]axi_interconnect_0_m00_axi_ARBURST;
  wire [3:0]axi_interconnect_0_m00_axi_ARCACHE;
  wire [0:0]axi_interconnect_0_m00_axi_ARID;
  wire [3:0]axi_interconnect_0_m00_axi_ARLEN;
  wire [1:0]axi_interconnect_0_m00_axi_ARLOCK;
  wire [2:0]axi_interconnect_0_m00_axi_ARPROT;
  wire [3:0]axi_interconnect_0_m00_axi_ARQOS;
  wire axi_interconnect_0_m00_axi_ARREADY;
  wire [2:0]axi_interconnect_0_m00_axi_ARSIZE;
  wire axi_interconnect_0_m00_axi_ARVALID;
  wire [31:0]axi_interconnect_0_m00_axi_AWADDR;
  wire [1:0]axi_interconnect_0_m00_axi_AWBURST;
  wire [3:0]axi_interconnect_0_m00_axi_AWCACHE;
  wire [0:0]axi_interconnect_0_m00_axi_AWID;
  wire [3:0]axi_interconnect_0_m00_axi_AWLEN;
  wire [1:0]axi_interconnect_0_m00_axi_AWLOCK;
  wire [2:0]axi_interconnect_0_m00_axi_AWPROT;
  wire [3:0]axi_interconnect_0_m00_axi_AWQOS;
  wire axi_interconnect_0_m00_axi_AWREADY;
  wire [2:0]axi_interconnect_0_m00_axi_AWSIZE;
  wire axi_interconnect_0_m00_axi_AWVALID;
  wire [5:0]axi_interconnect_0_m00_axi_BID;
  wire axi_interconnect_0_m00_axi_BREADY;
  wire [1:0]axi_interconnect_0_m00_axi_BRESP;
  wire axi_interconnect_0_m00_axi_BVALID;
  wire [63:0]axi_interconnect_0_m00_axi_RDATA;
  wire [5:0]axi_interconnect_0_m00_axi_RID;
  wire axi_interconnect_0_m00_axi_RLAST;
  wire axi_interconnect_0_m00_axi_RREADY;
  wire [1:0]axi_interconnect_0_m00_axi_RRESP;
  wire axi_interconnect_0_m00_axi_RVALID;
  wire [63:0]axi_interconnect_0_m00_axi_WDATA;
  wire [0:0]axi_interconnect_0_m00_axi_WID;
  wire axi_interconnect_0_m00_axi_WLAST;
  wire axi_interconnect_0_m00_axi_WREADY;
  wire [7:0]axi_interconnect_0_m00_axi_WSTRB;
  wire axi_interconnect_0_m00_axi_WVALID;
  wire [31:0]axi_interconnect_1_m00_axi_ARADDR;
  wire axi_interconnect_1_m00_axi_ARREADY;
  wire [0:0]axi_interconnect_1_m00_axi_ARVALID;
  wire [31:0]axi_interconnect_1_m00_axi_AWADDR;
  wire axi_interconnect_1_m00_axi_AWREADY;
  wire [0:0]axi_interconnect_1_m00_axi_AWVALID;
  wire [0:0]axi_interconnect_1_m00_axi_BREADY;
  wire [1:0]axi_interconnect_1_m00_axi_BRESP;
  wire axi_interconnect_1_m00_axi_BVALID;
  wire [31:0]axi_interconnect_1_m00_axi_RDATA;
  wire [0:0]axi_interconnect_1_m00_axi_RREADY;
  wire [1:0]axi_interconnect_1_m00_axi_RRESP;
  wire axi_interconnect_1_m00_axi_RVALID;
  wire [31:0]axi_interconnect_1_m00_axi_WDATA;
  wire axi_interconnect_1_m00_axi_WREADY;
  wire [0:0]axi_interconnect_1_m00_axi_WVALID;
  wire [31:0]axi_interconnect_1_m01_axi_ARADDR;
  wire axi_interconnect_1_m01_axi_ARREADY;
  wire [0:0]axi_interconnect_1_m01_axi_ARVALID;
  wire [31:0]axi_interconnect_1_m01_axi_AWADDR;
  wire axi_interconnect_1_m01_axi_AWREADY;
  wire [0:0]axi_interconnect_1_m01_axi_AWVALID;
  wire [0:0]axi_interconnect_1_m01_axi_BREADY;
  wire [1:0]axi_interconnect_1_m01_axi_BRESP;
  wire axi_interconnect_1_m01_axi_BVALID;
  wire [31:0]axi_interconnect_1_m01_axi_RDATA;
  wire [0:0]axi_interconnect_1_m01_axi_RREADY;
  wire [1:0]axi_interconnect_1_m01_axi_RRESP;
  wire axi_interconnect_1_m01_axi_RVALID;
  wire [31:0]axi_interconnect_1_m01_axi_WDATA;
  wire axi_interconnect_1_m01_axi_WREADY;
  wire [3:0]axi_interconnect_1_m01_axi_WSTRB;
  wire [0:0]axi_interconnect_1_m01_axi_WVALID;
  wire edge_detect_0_edge_detected;
  wire [0:0]proc_sys_reset_0_interconnect_aresetn;
  wire [0:0]proc_sys_reset_0_peripheral_aresetn;
  wire [0:0]proc_sys_reset_0_peripheral_reset;
  wire processing_system7_0_FCLK_RESET0_N;
  wire processing_system7_0_fclk_clk0;
  wire [31:0]s00_axi_1_ARADDR;
  wire [1:0]s00_axi_1_ARBURST;
  wire [3:0]s00_axi_1_ARCACHE;
  wire [11:0]s00_axi_1_ARID;
  wire [3:0]s00_axi_1_ARLEN;
  wire [1:0]s00_axi_1_ARLOCK;
  wire [2:0]s00_axi_1_ARPROT;
  wire [3:0]s00_axi_1_ARQOS;
  wire s00_axi_1_ARREADY;
  wire [2:0]s00_axi_1_ARSIZE;
  wire s00_axi_1_ARVALID;
  wire [31:0]s00_axi_1_AWADDR;
  wire [1:0]s00_axi_1_AWBURST;
  wire [3:0]s00_axi_1_AWCACHE;
  wire [11:0]s00_axi_1_AWID;
  wire [3:0]s00_axi_1_AWLEN;
  wire [1:0]s00_axi_1_AWLOCK;
  wire [2:0]s00_axi_1_AWPROT;
  wire [3:0]s00_axi_1_AWQOS;
  wire s00_axi_1_AWREADY;
  wire [2:0]s00_axi_1_AWSIZE;
  wire s00_axi_1_AWVALID;
  wire [11:0]s00_axi_1_BID;
  wire s00_axi_1_BREADY;
  wire [1:0]s00_axi_1_BRESP;
  wire s00_axi_1_BVALID;
  wire [31:0]s00_axi_1_RDATA;
  wire [11:0]s00_axi_1_RID;
  wire s00_axi_1_RLAST;
  wire s00_axi_1_RREADY;
  wire [1:0]s00_axi_1_RRESP;
  wire s00_axi_1_RVALID;
  wire [31:0]s00_axi_1_WDATA;
  wire [11:0]s00_axi_1_WID;
  wire s00_axi_1_WLAST;
  wire s00_axi_1_WREADY;
  wire [3:0]s00_axi_1_WSTRB;
  wire s00_axi_1_WVALID;
  wire slowest_sync_clk_1;
  wire [31:0]xfft_0_m_axis_data_TDATA;
  wire xfft_0_m_axis_data_TLAST;
  wire xfft_0_m_axis_data_TREADY;
  wire xfft_0_m_axis_data_TVALID;
  wire [2:0]xlconcat_0_dout;

  assign In2_1 = In2[0];
  assign M_AXIS_ACCEL_tdata[31:0] = axi_dma_0_m_axis_mm2s_TDATA;
  assign M_AXIS_ACCEL_tlast = axi_dma_0_m_axis_mm2s_TLAST;
  assign M_AXIS_ACCEL_tvalid = axi_dma_0_m_axis_mm2s_TVALID;
  assign M_AXI_DMA_DATA_araddr[31:0] = axi_interconnect_0_m00_axi_ARADDR;
  assign M_AXI_DMA_DATA_arburst[1:0] = axi_interconnect_0_m00_axi_ARBURST;
  assign M_AXI_DMA_DATA_arcache[3:0] = axi_interconnect_0_m00_axi_ARCACHE;
  assign M_AXI_DMA_DATA_arid[0] = axi_interconnect_0_m00_axi_ARID;
  assign M_AXI_DMA_DATA_arlen[3:0] = axi_interconnect_0_m00_axi_ARLEN;
  assign M_AXI_DMA_DATA_arlock[1:0] = axi_interconnect_0_m00_axi_ARLOCK;
  assign M_AXI_DMA_DATA_arprot[2:0] = axi_interconnect_0_m00_axi_ARPROT;
  assign M_AXI_DMA_DATA_arqos[3:0] = axi_interconnect_0_m00_axi_ARQOS;
  assign M_AXI_DMA_DATA_arsize[2:0] = axi_interconnect_0_m00_axi_ARSIZE;
  assign M_AXI_DMA_DATA_arvalid = axi_interconnect_0_m00_axi_ARVALID;
  assign M_AXI_DMA_DATA_awaddr[31:0] = axi_interconnect_0_m00_axi_AWADDR;
  assign M_AXI_DMA_DATA_awburst[1:0] = axi_interconnect_0_m00_axi_AWBURST;
  assign M_AXI_DMA_DATA_awcache[3:0] = axi_interconnect_0_m00_axi_AWCACHE;
  assign M_AXI_DMA_DATA_awid[0] = axi_interconnect_0_m00_axi_AWID;
  assign M_AXI_DMA_DATA_awlen[3:0] = axi_interconnect_0_m00_axi_AWLEN;
  assign M_AXI_DMA_DATA_awlock[1:0] = axi_interconnect_0_m00_axi_AWLOCK;
  assign M_AXI_DMA_DATA_awprot[2:0] = axi_interconnect_0_m00_axi_AWPROT;
  assign M_AXI_DMA_DATA_awqos[3:0] = axi_interconnect_0_m00_axi_AWQOS;
  assign M_AXI_DMA_DATA_awsize[2:0] = axi_interconnect_0_m00_axi_AWSIZE;
  assign M_AXI_DMA_DATA_awvalid = axi_interconnect_0_m00_axi_AWVALID;
  assign M_AXI_DMA_DATA_bready = axi_interconnect_0_m00_axi_BREADY;
  assign M_AXI_DMA_DATA_rready = axi_interconnect_0_m00_axi_RREADY;
  assign M_AXI_DMA_DATA_wdata[63:0] = axi_interconnect_0_m00_axi_WDATA;
  assign M_AXI_DMA_DATA_wid[0] = axi_interconnect_0_m00_axi_WID;
  assign M_AXI_DMA_DATA_wlast = axi_interconnect_0_m00_axi_WLAST;
  assign M_AXI_DMA_DATA_wstrb[7:0] = axi_interconnect_0_m00_axi_WSTRB;
  assign M_AXI_DMA_DATA_wvalid = axi_interconnect_0_m00_axi_WVALID;
  assign S_AXIS_ACCEL_tready = xfft_0_m_axis_data_TREADY;
  assign S_AXI_arready = s00_axi_1_ARREADY;
  assign S_AXI_awready = s00_axi_1_AWREADY;
  assign S_AXI_bid[11:0] = s00_axi_1_BID;
  assign S_AXI_bresp[1:0] = s00_axi_1_BRESP;
  assign S_AXI_bvalid = s00_axi_1_BVALID;
  assign S_AXI_rdata[31:0] = s00_axi_1_RDATA;
  assign S_AXI_rid[11:0] = s00_axi_1_RID;
  assign S_AXI_rlast = s00_axi_1_RLAST;
  assign S_AXI_rresp[1:0] = s00_axi_1_RRESP;
  assign S_AXI_rvalid = s00_axi_1_RVALID;
  assign S_AXI_wready = s00_axi_1_WREADY;
  assign axi_dma_0_m_axis_mm2s_TREADY = M_AXIS_ACCEL_tready;
  assign axi_interconnect_0_m00_axi_ARREADY = M_AXI_DMA_DATA_arready;
  assign axi_interconnect_0_m00_axi_AWREADY = M_AXI_DMA_DATA_awready;
  assign axi_interconnect_0_m00_axi_BID = M_AXI_DMA_DATA_bid[5:0];
  assign axi_interconnect_0_m00_axi_BRESP = M_AXI_DMA_DATA_bresp[1:0];
  assign axi_interconnect_0_m00_axi_BVALID = M_AXI_DMA_DATA_bvalid;
  assign axi_interconnect_0_m00_axi_RDATA = M_AXI_DMA_DATA_rdata[63:0];
  assign axi_interconnect_0_m00_axi_RID = M_AXI_DMA_DATA_rid[5:0];
  assign axi_interconnect_0_m00_axi_RLAST = M_AXI_DMA_DATA_rlast;
  assign axi_interconnect_0_m00_axi_RRESP = M_AXI_DMA_DATA_rresp[1:0];
  assign axi_interconnect_0_m00_axi_RVALID = M_AXI_DMA_DATA_rvalid;
  assign axi_interconnect_0_m00_axi_WREADY = M_AXI_DMA_DATA_wready;
  assign dma_irqs[2:0] = xlconcat_0_dout;
  assign fft_config_tdata[31:0] = axi_gpio_0_gpio_io_o;
  assign fft_config_tvalid = edge_detect_0_edge_detected;
  assign interconnect_aresetn[0] = proc_sys_reset_0_interconnect_aresetn;
  assign peripheral_aresetn[0] = proc_sys_reset_0_peripheral_aresetn;
  assign peripheral_reset[0] = proc_sys_reset_0_peripheral_reset;
  assign processing_system7_0_FCLK_RESET0_N = ext_reset_in;
  assign processing_system7_0_fclk_clk0 = ctrl_aclk;
  assign s00_axi_1_ARADDR = S_AXI_araddr[31:0];
  assign s00_axi_1_ARBURST = S_AXI_arburst[1:0];
  assign s00_axi_1_ARCACHE = S_AXI_arcache[3:0];
  assign s00_axi_1_ARID = S_AXI_arid[11:0];
  assign s00_axi_1_ARLEN = S_AXI_arlen[3:0];
  assign s00_axi_1_ARLOCK = S_AXI_arlock[1:0];
  assign s00_axi_1_ARPROT = S_AXI_arprot[2:0];
  assign s00_axi_1_ARQOS = S_AXI_arqos[3:0];
  assign s00_axi_1_ARSIZE = S_AXI_arsize[2:0];
  assign s00_axi_1_ARVALID = S_AXI_arvalid;
  assign s00_axi_1_AWADDR = S_AXI_awaddr[31:0];
  assign s00_axi_1_AWBURST = S_AXI_awburst[1:0];
  assign s00_axi_1_AWCACHE = S_AXI_awcache[3:0];
  assign s00_axi_1_AWID = S_AXI_awid[11:0];
  assign s00_axi_1_AWLEN = S_AXI_awlen[3:0];
  assign s00_axi_1_AWLOCK = S_AXI_awlock[1:0];
  assign s00_axi_1_AWPROT = S_AXI_awprot[2:0];
  assign s00_axi_1_AWQOS = S_AXI_awqos[3:0];
  assign s00_axi_1_AWSIZE = S_AXI_awsize[2:0];
  assign s00_axi_1_AWVALID = S_AXI_awvalid;
  assign s00_axi_1_BREADY = S_AXI_bready;
  assign s00_axi_1_RREADY = S_AXI_rready;
  assign s00_axi_1_WDATA = S_AXI_wdata[31:0];
  assign s00_axi_1_WID = S_AXI_wid[11:0];
  assign s00_axi_1_WLAST = S_AXI_wlast;
  assign s00_axi_1_WSTRB = S_AXI_wstrb[3:0];
  assign s00_axi_1_WVALID = S_AXI_wvalid;
  assign slowest_sync_clk_1 = slowest_sync_clk;
  assign xfft_0_m_axis_data_TDATA = S_AXIS_ACCEL_tdata[31:0];
  assign xfft_0_m_axis_data_TLAST = S_AXIS_ACCEL_tlast;
  assign xfft_0_m_axis_data_TVALID = S_AXIS_ACCEL_tvalid;
  design_1_axi_dma_0_0 axi_dma_0
       (.axi_resetn(proc_sys_reset_0_peripheral_aresetn),
        .m_axi_mm2s_aclk(processing_system7_0_fclk_clk0),
        .m_axi_mm2s_araddr(axi_dma_0_m_axi_mm2s_ARADDR),
        .m_axi_mm2s_arburst(axi_dma_0_m_axi_mm2s_ARBURST),
        .m_axi_mm2s_arcache(axi_dma_0_m_axi_mm2s_ARCACHE),
        .m_axi_mm2s_arlen(axi_dma_0_m_axi_mm2s_ARLEN),
        .m_axi_mm2s_arprot(axi_dma_0_m_axi_mm2s_ARPROT),
        .m_axi_mm2s_arready(axi_dma_0_m_axi_mm2s_ARREADY),
        .m_axi_mm2s_arsize(axi_dma_0_m_axi_mm2s_ARSIZE),
        .m_axi_mm2s_arvalid(axi_dma_0_m_axi_mm2s_ARVALID),
        .m_axi_mm2s_rdata(axi_dma_0_m_axi_mm2s_RDATA),
        .m_axi_mm2s_rlast(axi_dma_0_m_axi_mm2s_RLAST),
        .m_axi_mm2s_rready(axi_dma_0_m_axi_mm2s_RREADY),
        .m_axi_mm2s_rresp(axi_dma_0_m_axi_mm2s_RRESP),
        .m_axi_mm2s_rvalid(axi_dma_0_m_axi_mm2s_RVALID),
        .m_axi_s2mm_aclk(processing_system7_0_fclk_clk0),
        .m_axi_s2mm_awaddr(axi_dma_0_m_axi_s2mm_AWADDR),
        .m_axi_s2mm_awburst(axi_dma_0_m_axi_s2mm_AWBURST),
        .m_axi_s2mm_awcache(axi_dma_0_m_axi_s2mm_AWCACHE),
        .m_axi_s2mm_awlen(axi_dma_0_m_axi_s2mm_AWLEN),
        .m_axi_s2mm_awprot(axi_dma_0_m_axi_s2mm_AWPROT),
        .m_axi_s2mm_awready(axi_dma_0_m_axi_s2mm_AWREADY),
        .m_axi_s2mm_awsize(axi_dma_0_m_axi_s2mm_AWSIZE),
        .m_axi_s2mm_awvalid(axi_dma_0_m_axi_s2mm_AWVALID),
        .m_axi_s2mm_bready(axi_dma_0_m_axi_s2mm_BREADY),
        .m_axi_s2mm_bresp(axi_dma_0_m_axi_s2mm_BRESP),
        .m_axi_s2mm_bvalid(axi_dma_0_m_axi_s2mm_BVALID),
        .m_axi_s2mm_wdata(axi_dma_0_m_axi_s2mm_WDATA),
        .m_axi_s2mm_wlast(axi_dma_0_m_axi_s2mm_WLAST),
        .m_axi_s2mm_wready(axi_dma_0_m_axi_s2mm_WREADY),
        .m_axi_s2mm_wstrb(axi_dma_0_m_axi_s2mm_WSTRB),
        .m_axi_s2mm_wvalid(axi_dma_0_m_axi_s2mm_WVALID),
        .m_axis_mm2s_tdata(axi_dma_0_m_axis_mm2s_TDATA),
        .m_axis_mm2s_tlast(axi_dma_0_m_axis_mm2s_TLAST),
        .m_axis_mm2s_tready(axi_dma_0_m_axis_mm2s_TREADY),
        .m_axis_mm2s_tvalid(axi_dma_0_m_axis_mm2s_TVALID),
        .mm2s_introut(axi_dma_0_mm2s_introut),
        .s2mm_introut(axi_dma_0_s2mm_introut),
        .s_axi_lite_aclk(processing_system7_0_fclk_clk0),
        .s_axi_lite_araddr(axi_interconnect_1_m00_axi_ARADDR[9:0]),
        .s_axi_lite_arready(axi_interconnect_1_m00_axi_ARREADY),
        .s_axi_lite_arvalid(axi_interconnect_1_m00_axi_ARVALID),
        .s_axi_lite_awaddr(axi_interconnect_1_m00_axi_AWADDR[9:0]),
        .s_axi_lite_awready(axi_interconnect_1_m00_axi_AWREADY),
        .s_axi_lite_awvalid(axi_interconnect_1_m00_axi_AWVALID),
        .s_axi_lite_bready(axi_interconnect_1_m00_axi_BREADY),
        .s_axi_lite_bresp(axi_interconnect_1_m00_axi_BRESP),
        .s_axi_lite_bvalid(axi_interconnect_1_m00_axi_BVALID),
        .s_axi_lite_rdata(axi_interconnect_1_m00_axi_RDATA),
        .s_axi_lite_rready(axi_interconnect_1_m00_axi_RREADY),
        .s_axi_lite_rresp(axi_interconnect_1_m00_axi_RRESP),
        .s_axi_lite_rvalid(axi_interconnect_1_m00_axi_RVALID),
        .s_axi_lite_wdata(axi_interconnect_1_m00_axi_WDATA),
        .s_axi_lite_wready(axi_interconnect_1_m00_axi_WREADY),
        .s_axi_lite_wvalid(axi_interconnect_1_m00_axi_WVALID),
        .s_axis_s2mm_tdata(xfft_0_m_axis_data_TDATA),
        .s_axis_s2mm_tkeep({1'b1,1'b1,1'b1,1'b1}),
        .s_axis_s2mm_tlast(xfft_0_m_axis_data_TLAST),
        .s_axis_s2mm_tready(xfft_0_m_axis_data_TREADY),
        .s_axis_s2mm_tvalid(xfft_0_m_axis_data_TVALID));
  design_1_axi_gpio_0_0 axi_gpio_0
       (.gpio_io_i(axi_gpio_0_gpio_io_o),
        .gpio_io_o(axi_gpio_0_gpio_io_o),
        .s_axi_aclk(processing_system7_0_fclk_clk0),
        .s_axi_araddr(axi_interconnect_1_m01_axi_ARADDR[8:0]),
        .s_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axi_arready(axi_interconnect_1_m01_axi_ARREADY),
        .s_axi_arvalid(axi_interconnect_1_m01_axi_ARVALID),
        .s_axi_awaddr(axi_interconnect_1_m01_axi_AWADDR[8:0]),
        .s_axi_awready(axi_interconnect_1_m01_axi_AWREADY),
        .s_axi_awvalid(axi_interconnect_1_m01_axi_AWVALID),
        .s_axi_bready(axi_interconnect_1_m01_axi_BREADY),
        .s_axi_bresp(axi_interconnect_1_m01_axi_BRESP),
        .s_axi_bvalid(axi_interconnect_1_m01_axi_BVALID),
        .s_axi_rdata(axi_interconnect_1_m01_axi_RDATA),
        .s_axi_rready(axi_interconnect_1_m01_axi_RREADY),
        .s_axi_rresp(axi_interconnect_1_m01_axi_RRESP),
        .s_axi_rvalid(axi_interconnect_1_m01_axi_RVALID),
        .s_axi_wdata(axi_interconnect_1_m01_axi_WDATA),
        .s_axi_wready(axi_interconnect_1_m01_axi_WREADY),
        .s_axi_wstrb(axi_interconnect_1_m01_axi_WSTRB),
        .s_axi_wvalid(axi_interconnect_1_m01_axi_WVALID));
  design_1_axi_interconnect_0_0 axi_interconnect_0
       (.ACLK(processing_system7_0_fclk_clk0),
        .ARESETN(proc_sys_reset_0_interconnect_aresetn),
        .M00_ACLK(processing_system7_0_fclk_clk0),
        .M00_ARESETN(proc_sys_reset_0_interconnect_aresetn),
        .M00_AXI_araddr(axi_interconnect_0_m00_axi_ARADDR),
        .M00_AXI_arburst(axi_interconnect_0_m00_axi_ARBURST),
        .M00_AXI_arcache(axi_interconnect_0_m00_axi_ARCACHE),
        .M00_AXI_arid(axi_interconnect_0_m00_axi_ARID),
        .M00_AXI_arlen(axi_interconnect_0_m00_axi_ARLEN),
        .M00_AXI_arlock(axi_interconnect_0_m00_axi_ARLOCK),
        .M00_AXI_arprot(axi_interconnect_0_m00_axi_ARPROT),
        .M00_AXI_arqos(axi_interconnect_0_m00_axi_ARQOS),
        .M00_AXI_arready(axi_interconnect_0_m00_axi_ARREADY),
        .M00_AXI_arsize(axi_interconnect_0_m00_axi_ARSIZE),
        .M00_AXI_arvalid(axi_interconnect_0_m00_axi_ARVALID),
        .M00_AXI_awaddr(axi_interconnect_0_m00_axi_AWADDR),
        .M00_AXI_awburst(axi_interconnect_0_m00_axi_AWBURST),
        .M00_AXI_awcache(axi_interconnect_0_m00_axi_AWCACHE),
        .M00_AXI_awid(axi_interconnect_0_m00_axi_AWID),
        .M00_AXI_awlen(axi_interconnect_0_m00_axi_AWLEN),
        .M00_AXI_awlock(axi_interconnect_0_m00_axi_AWLOCK),
        .M00_AXI_awprot(axi_interconnect_0_m00_axi_AWPROT),
        .M00_AXI_awqos(axi_interconnect_0_m00_axi_AWQOS),
        .M00_AXI_awready(axi_interconnect_0_m00_axi_AWREADY),
        .M00_AXI_awsize(axi_interconnect_0_m00_axi_AWSIZE),
        .M00_AXI_awvalid(axi_interconnect_0_m00_axi_AWVALID),
        .M00_AXI_bid(axi_interconnect_0_m00_axi_BID),
        .M00_AXI_bready(axi_interconnect_0_m00_axi_BREADY),
        .M00_AXI_bresp(axi_interconnect_0_m00_axi_BRESP),
        .M00_AXI_bvalid(axi_interconnect_0_m00_axi_BVALID),
        .M00_AXI_rdata(axi_interconnect_0_m00_axi_RDATA),
        .M00_AXI_rid(axi_interconnect_0_m00_axi_RID),
        .M00_AXI_rlast(axi_interconnect_0_m00_axi_RLAST),
        .M00_AXI_rready(axi_interconnect_0_m00_axi_RREADY),
        .M00_AXI_rresp(axi_interconnect_0_m00_axi_RRESP),
        .M00_AXI_rvalid(axi_interconnect_0_m00_axi_RVALID),
        .M00_AXI_wdata(axi_interconnect_0_m00_axi_WDATA),
        .M00_AXI_wid(axi_interconnect_0_m00_axi_WID),
        .M00_AXI_wlast(axi_interconnect_0_m00_axi_WLAST),
        .M00_AXI_wready(axi_interconnect_0_m00_axi_WREADY),
        .M00_AXI_wstrb(axi_interconnect_0_m00_axi_WSTRB),
        .M00_AXI_wvalid(axi_interconnect_0_m00_axi_WVALID),
        .S00_ACLK(processing_system7_0_fclk_clk0),
        .S00_ARESETN(proc_sys_reset_0_interconnect_aresetn),
        .S00_AXI_araddr(axi_dma_0_m_axi_mm2s_ARADDR),
        .S00_AXI_arburst(axi_dma_0_m_axi_mm2s_ARBURST),
        .S00_AXI_arcache(axi_dma_0_m_axi_mm2s_ARCACHE),
        .S00_AXI_arlen(axi_dma_0_m_axi_mm2s_ARLEN),
        .S00_AXI_arprot(axi_dma_0_m_axi_mm2s_ARPROT),
        .S00_AXI_arready(axi_dma_0_m_axi_mm2s_ARREADY),
        .S00_AXI_arsize(axi_dma_0_m_axi_mm2s_ARSIZE),
        .S00_AXI_arvalid(axi_dma_0_m_axi_mm2s_ARVALID),
        .S00_AXI_rdata(axi_dma_0_m_axi_mm2s_RDATA),
        .S00_AXI_rlast(axi_dma_0_m_axi_mm2s_RLAST),
        .S00_AXI_rready(axi_dma_0_m_axi_mm2s_RREADY),
        .S00_AXI_rresp(axi_dma_0_m_axi_mm2s_RRESP),
        .S00_AXI_rvalid(axi_dma_0_m_axi_mm2s_RVALID),
        .S01_ACLK(processing_system7_0_fclk_clk0),
        .S01_ARESETN(proc_sys_reset_0_interconnect_aresetn),
        .S01_AXI_awaddr(axi_dma_0_m_axi_s2mm_AWADDR),
        .S01_AXI_awburst(axi_dma_0_m_axi_s2mm_AWBURST),
        .S01_AXI_awcache(axi_dma_0_m_axi_s2mm_AWCACHE),
        .S01_AXI_awlen(axi_dma_0_m_axi_s2mm_AWLEN),
        .S01_AXI_awprot(axi_dma_0_m_axi_s2mm_AWPROT),
        .S01_AXI_awready(axi_dma_0_m_axi_s2mm_AWREADY),
        .S01_AXI_awsize(axi_dma_0_m_axi_s2mm_AWSIZE),
        .S01_AXI_awvalid(axi_dma_0_m_axi_s2mm_AWVALID),
        .S01_AXI_bready(axi_dma_0_m_axi_s2mm_BREADY),
        .S01_AXI_bresp(axi_dma_0_m_axi_s2mm_BRESP),
        .S01_AXI_bvalid(axi_dma_0_m_axi_s2mm_BVALID),
        .S01_AXI_wdata(axi_dma_0_m_axi_s2mm_WDATA),
        .S01_AXI_wlast(axi_dma_0_m_axi_s2mm_WLAST),
        .S01_AXI_wready(axi_dma_0_m_axi_s2mm_WREADY),
        .S01_AXI_wstrb(axi_dma_0_m_axi_s2mm_WSTRB),
        .S01_AXI_wvalid(axi_dma_0_m_axi_s2mm_WVALID));
  design_1_axi_interconnect_1_0 axi_interconnect_1
       (.ACLK(processing_system7_0_fclk_clk0),
        .ARESETN(proc_sys_reset_0_interconnect_aresetn),
        .M00_ACLK(processing_system7_0_fclk_clk0),
        .M00_ARESETN(proc_sys_reset_0_interconnect_aresetn),
        .M00_AXI_araddr(axi_interconnect_1_m00_axi_ARADDR),
        .M00_AXI_arready(axi_interconnect_1_m00_axi_ARREADY),
        .M00_AXI_arvalid(axi_interconnect_1_m00_axi_ARVALID),
        .M00_AXI_awaddr(axi_interconnect_1_m00_axi_AWADDR),
        .M00_AXI_awready(axi_interconnect_1_m00_axi_AWREADY),
        .M00_AXI_awvalid(axi_interconnect_1_m00_axi_AWVALID),
        .M00_AXI_bready(axi_interconnect_1_m00_axi_BREADY),
        .M00_AXI_bresp(axi_interconnect_1_m00_axi_BRESP),
        .M00_AXI_bvalid(axi_interconnect_1_m00_axi_BVALID),
        .M00_AXI_rdata(axi_interconnect_1_m00_axi_RDATA),
        .M00_AXI_rready(axi_interconnect_1_m00_axi_RREADY),
        .M00_AXI_rresp(axi_interconnect_1_m00_axi_RRESP),
        .M00_AXI_rvalid(axi_interconnect_1_m00_axi_RVALID),
        .M00_AXI_wdata(axi_interconnect_1_m00_axi_WDATA),
        .M00_AXI_wready(axi_interconnect_1_m00_axi_WREADY),
        .M00_AXI_wvalid(axi_interconnect_1_m00_axi_WVALID),
        .M01_ACLK(processing_system7_0_fclk_clk0),
        .M01_ARESETN(proc_sys_reset_0_interconnect_aresetn),
        .M01_AXI_araddr(axi_interconnect_1_m01_axi_ARADDR),
        .M01_AXI_arready(axi_interconnect_1_m01_axi_ARREADY),
        .M01_AXI_arvalid(axi_interconnect_1_m01_axi_ARVALID),
        .M01_AXI_awaddr(axi_interconnect_1_m01_axi_AWADDR),
        .M01_AXI_awready(axi_interconnect_1_m01_axi_AWREADY),
        .M01_AXI_awvalid(axi_interconnect_1_m01_axi_AWVALID),
        .M01_AXI_bready(axi_interconnect_1_m01_axi_BREADY),
        .M01_AXI_bresp(axi_interconnect_1_m01_axi_BRESP),
        .M01_AXI_bvalid(axi_interconnect_1_m01_axi_BVALID),
        .M01_AXI_rdata(axi_interconnect_1_m01_axi_RDATA),
        .M01_AXI_rready(axi_interconnect_1_m01_axi_RREADY),
        .M01_AXI_rresp(axi_interconnect_1_m01_axi_RRESP),
        .M01_AXI_rvalid(axi_interconnect_1_m01_axi_RVALID),
        .M01_AXI_wdata(axi_interconnect_1_m01_axi_WDATA),
        .M01_AXI_wready(axi_interconnect_1_m01_axi_WREADY),
        .M01_AXI_wstrb(axi_interconnect_1_m01_axi_WSTRB),
        .M01_AXI_wvalid(axi_interconnect_1_m01_axi_WVALID),
        .S00_ACLK(processing_system7_0_fclk_clk0),
        .S00_ARESETN(proc_sys_reset_0_interconnect_aresetn),
        .S00_AXI_araddr(s00_axi_1_ARADDR),
        .S00_AXI_arburst(s00_axi_1_ARBURST),
        .S00_AXI_arcache(s00_axi_1_ARCACHE),
        .S00_AXI_arid(s00_axi_1_ARID),
        .S00_AXI_arlen(s00_axi_1_ARLEN),
        .S00_AXI_arlock(s00_axi_1_ARLOCK),
        .S00_AXI_arprot(s00_axi_1_ARPROT),
        .S00_AXI_arqos(s00_axi_1_ARQOS),
        .S00_AXI_arready(s00_axi_1_ARREADY),
        .S00_AXI_arsize(s00_axi_1_ARSIZE),
        .S00_AXI_arvalid(s00_axi_1_ARVALID),
        .S00_AXI_awaddr(s00_axi_1_AWADDR),
        .S00_AXI_awburst(s00_axi_1_AWBURST),
        .S00_AXI_awcache(s00_axi_1_AWCACHE),
        .S00_AXI_awid(s00_axi_1_AWID),
        .S00_AXI_awlen(s00_axi_1_AWLEN),
        .S00_AXI_awlock(s00_axi_1_AWLOCK),
        .S00_AXI_awprot(s00_axi_1_AWPROT),
        .S00_AXI_awqos(s00_axi_1_AWQOS),
        .S00_AXI_awready(s00_axi_1_AWREADY),
        .S00_AXI_awsize(s00_axi_1_AWSIZE),
        .S00_AXI_awvalid(s00_axi_1_AWVALID),
        .S00_AXI_bid(s00_axi_1_BID),
        .S00_AXI_bready(s00_axi_1_BREADY),
        .S00_AXI_bresp(s00_axi_1_BRESP),
        .S00_AXI_bvalid(s00_axi_1_BVALID),
        .S00_AXI_rdata(s00_axi_1_RDATA),
        .S00_AXI_rid(s00_axi_1_RID),
        .S00_AXI_rlast(s00_axi_1_RLAST),
        .S00_AXI_rready(s00_axi_1_RREADY),
        .S00_AXI_rresp(s00_axi_1_RRESP),
        .S00_AXI_rvalid(s00_axi_1_RVALID),
        .S00_AXI_wdata(s00_axi_1_WDATA),
        .S00_AXI_wid(s00_axi_1_WID),
        .S00_AXI_wlast(s00_axi_1_WLAST),
        .S00_AXI_wready(s00_axi_1_WREADY),
        .S00_AXI_wstrb(s00_axi_1_WSTRB),
        .S00_AXI_wvalid(s00_axi_1_WVALID));
  design_1_edge_detect_0_0 edge_detect_0
       (.clk(processing_system7_0_fclk_clk0),
        .din(axi_gpio_0_gpio_io_o),
        .edge_detected(edge_detect_0_edge_detected));
  design_1_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .interconnect_aresetn(proc_sys_reset_0_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .peripheral_reset(proc_sys_reset_0_peripheral_reset),
        .slowest_sync_clk(slowest_sync_clk_1));
  design_1_xlconcat_0_0 xlconcat_0
       (.In0(axi_dma_0_s2mm_introut),
        .In1(axi_dma_0_mm2s_introut),
        .In2(In2_1),
        .dout(xlconcat_0_dout));
endmodule

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=25,numReposBlks=15,numNonXlnxBlks=1,numHierBlks=10,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=2,da_board_cnt=2,da_clkrst_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    VGA_B,
    VGA_G,
    VGA_HS,
    VGA_R,
    VGA_VS);
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) inout [14:0]DDR_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR BA" *) inout [2:0]DDR_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CAS_N" *) inout DDR_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_N" *) inout DDR_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_P" *) inout DDR_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CKE" *) inout DDR_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CS_N" *) inout DDR_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DM" *) inout [3:0]DDR_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQ" *) inout [31:0]DDR_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_N" *) inout [3:0]DDR_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_P" *) inout [3:0]DDR_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ODT" *) inout DDR_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RAS_N" *) inout DDR_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RESET_N" *) inout DDR_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR WE_N" *) inout DDR_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false" *) inout FIXED_IO_ddr_vrn;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP" *) inout FIXED_IO_ddr_vrp;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO" *) inout [53:0]FIXED_IO_mio;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK" *) inout FIXED_IO_ps_clk;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB" *) inout FIXED_IO_ps_porb;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB" *) inout FIXED_IO_ps_srstb;
  output [3:0]VGA_B;
  output [3:0]VGA_G;
  output VGA_HS;
  output [3:0]VGA_R;
  output VGA_VS;

  wire Net;
  wire [31:0]axi_dma_0_m_axis_mm2s_TDATA;
  wire axi_dma_0_m_axis_mm2s_TLAST;
  wire axi_dma_0_m_axis_mm2s_TREADY;
  wire axi_dma_0_m_axis_mm2s_TVALID;
  wire [31:0]axi_gpio_0_gpio_io_o;
  wire [31:0]axi_interconnect_0_m00_axi_ARADDR;
  wire [1:0]axi_interconnect_0_m00_axi_ARBURST;
  wire [3:0]axi_interconnect_0_m00_axi_ARCACHE;
  wire [0:0]axi_interconnect_0_m00_axi_ARID;
  wire [3:0]axi_interconnect_0_m00_axi_ARLEN;
  wire [1:0]axi_interconnect_0_m00_axi_ARLOCK;
  wire [2:0]axi_interconnect_0_m00_axi_ARPROT;
  wire [3:0]axi_interconnect_0_m00_axi_ARQOS;
  wire axi_interconnect_0_m00_axi_ARREADY;
  wire [2:0]axi_interconnect_0_m00_axi_ARSIZE;
  wire axi_interconnect_0_m00_axi_ARVALID;
  wire [31:0]axi_interconnect_0_m00_axi_AWADDR;
  wire [1:0]axi_interconnect_0_m00_axi_AWBURST;
  wire [3:0]axi_interconnect_0_m00_axi_AWCACHE;
  wire [0:0]axi_interconnect_0_m00_axi_AWID;
  wire [3:0]axi_interconnect_0_m00_axi_AWLEN;
  wire [1:0]axi_interconnect_0_m00_axi_AWLOCK;
  wire [2:0]axi_interconnect_0_m00_axi_AWPROT;
  wire [3:0]axi_interconnect_0_m00_axi_AWQOS;
  wire axi_interconnect_0_m00_axi_AWREADY;
  wire [2:0]axi_interconnect_0_m00_axi_AWSIZE;
  wire axi_interconnect_0_m00_axi_AWVALID;
  wire [5:0]axi_interconnect_0_m00_axi_BID;
  wire axi_interconnect_0_m00_axi_BREADY;
  wire [1:0]axi_interconnect_0_m00_axi_BRESP;
  wire axi_interconnect_0_m00_axi_BVALID;
  wire [63:0]axi_interconnect_0_m00_axi_RDATA;
  wire [5:0]axi_interconnect_0_m00_axi_RID;
  wire axi_interconnect_0_m00_axi_RLAST;
  wire axi_interconnect_0_m00_axi_RREADY;
  wire [1:0]axi_interconnect_0_m00_axi_RRESP;
  wire axi_interconnect_0_m00_axi_RVALID;
  wire [63:0]axi_interconnect_0_m00_axi_WDATA;
  wire [0:0]axi_interconnect_0_m00_axi_WID;
  wire axi_interconnect_0_m00_axi_WLAST;
  wire axi_interconnect_0_m00_axi_WREADY;
  wire [7:0]axi_interconnect_0_m00_axi_WSTRB;
  wire axi_interconnect_0_m00_axi_WVALID;
  wire axi_timer_0_interrupt;
  wire clk_wiz_0_clk_out1;
  wire [0:0]ctrl_interconnect_aresetn;
  wire [0:0]ctrl_peripheral_aresetn;
  wire [0:0]ctrl_peripheral_reset;
  wire edge_detect_0_edge_detected;
  wire processing_system7_0_FCLK_RESET0_N;
  wire [31:0]processing_system7_0_M_AXI_GP1_ARADDR;
  wire [1:0]processing_system7_0_M_AXI_GP1_ARBURST;
  wire [3:0]processing_system7_0_M_AXI_GP1_ARCACHE;
  wire [11:0]processing_system7_0_M_AXI_GP1_ARID;
  wire [3:0]processing_system7_0_M_AXI_GP1_ARLEN;
  wire [1:0]processing_system7_0_M_AXI_GP1_ARLOCK;
  wire [2:0]processing_system7_0_M_AXI_GP1_ARPROT;
  wire [3:0]processing_system7_0_M_AXI_GP1_ARQOS;
  wire processing_system7_0_M_AXI_GP1_ARREADY;
  wire [2:0]processing_system7_0_M_AXI_GP1_ARSIZE;
  wire processing_system7_0_M_AXI_GP1_ARVALID;
  wire [31:0]processing_system7_0_M_AXI_GP1_AWADDR;
  wire [1:0]processing_system7_0_M_AXI_GP1_AWBURST;
  wire [3:0]processing_system7_0_M_AXI_GP1_AWCACHE;
  wire [11:0]processing_system7_0_M_AXI_GP1_AWID;
  wire [3:0]processing_system7_0_M_AXI_GP1_AWLEN;
  wire [1:0]processing_system7_0_M_AXI_GP1_AWLOCK;
  wire [2:0]processing_system7_0_M_AXI_GP1_AWPROT;
  wire [3:0]processing_system7_0_M_AXI_GP1_AWQOS;
  wire processing_system7_0_M_AXI_GP1_AWREADY;
  wire [2:0]processing_system7_0_M_AXI_GP1_AWSIZE;
  wire processing_system7_0_M_AXI_GP1_AWVALID;
  wire [11:0]processing_system7_0_M_AXI_GP1_BID;
  wire processing_system7_0_M_AXI_GP1_BREADY;
  wire [1:0]processing_system7_0_M_AXI_GP1_BRESP;
  wire processing_system7_0_M_AXI_GP1_BVALID;
  wire [31:0]processing_system7_0_M_AXI_GP1_RDATA;
  wire [11:0]processing_system7_0_M_AXI_GP1_RID;
  wire processing_system7_0_M_AXI_GP1_RLAST;
  wire processing_system7_0_M_AXI_GP1_RREADY;
  wire [1:0]processing_system7_0_M_AXI_GP1_RRESP;
  wire processing_system7_0_M_AXI_GP1_RVALID;
  wire [31:0]processing_system7_0_M_AXI_GP1_WDATA;
  wire [11:0]processing_system7_0_M_AXI_GP1_WID;
  wire processing_system7_0_M_AXI_GP1_WLAST;
  wire processing_system7_0_M_AXI_GP1_WREADY;
  wire [3:0]processing_system7_0_M_AXI_GP1_WSTRB;
  wire processing_system7_0_M_AXI_GP1_WVALID;
  wire [7:0]processing_system7_0_S_AXI_HP0_RCOUNT;
  wire [14:0]processing_system7_0_ddr_ADDR;
  wire [2:0]processing_system7_0_ddr_BA;
  wire processing_system7_0_ddr_CAS_N;
  wire processing_system7_0_ddr_CKE;
  wire processing_system7_0_ddr_CK_N;
  wire processing_system7_0_ddr_CK_P;
  wire processing_system7_0_ddr_CS_N;
  wire [3:0]processing_system7_0_ddr_DM;
  wire [31:0]processing_system7_0_ddr_DQ;
  wire [3:0]processing_system7_0_ddr_DQS_N;
  wire [3:0]processing_system7_0_ddr_DQS_P;
  wire processing_system7_0_ddr_ODT;
  wire processing_system7_0_ddr_RAS_N;
  wire processing_system7_0_ddr_RESET_N;
  wire processing_system7_0_ddr_WE_N;
  wire processing_system7_0_fclk_clk0;
  wire processing_system7_0_fixed_io_DDR_VRN;
  wire processing_system7_0_fixed_io_DDR_VRP;
  wire [53:0]processing_system7_0_fixed_io_MIO;
  wire processing_system7_0_fixed_io_PS_CLK;
  wire processing_system7_0_fixed_io_PS_PORB;
  wire processing_system7_0_fixed_io_PS_SRSTB;
  wire [31:0]s00_axi_1_ARADDR;
  wire [1:0]s00_axi_1_ARBURST;
  wire [3:0]s00_axi_1_ARCACHE;
  wire [11:0]s00_axi_1_ARID;
  wire [3:0]s00_axi_1_ARLEN;
  wire [1:0]s00_axi_1_ARLOCK;
  wire [2:0]s00_axi_1_ARPROT;
  wire [3:0]s00_axi_1_ARQOS;
  wire s00_axi_1_ARREADY;
  wire [2:0]s00_axi_1_ARSIZE;
  wire s00_axi_1_ARVALID;
  wire [31:0]s00_axi_1_AWADDR;
  wire [1:0]s00_axi_1_AWBURST;
  wire [3:0]s00_axi_1_AWCACHE;
  wire [11:0]s00_axi_1_AWID;
  wire [3:0]s00_axi_1_AWLEN;
  wire [1:0]s00_axi_1_AWLOCK;
  wire [2:0]s00_axi_1_AWPROT;
  wire [3:0]s00_axi_1_AWQOS;
  wire s00_axi_1_AWREADY;
  wire [2:0]s00_axi_1_AWSIZE;
  wire s00_axi_1_AWVALID;
  wire [11:0]s00_axi_1_BID;
  wire s00_axi_1_BREADY;
  wire [1:0]s00_axi_1_BRESP;
  wire s00_axi_1_BVALID;
  wire [31:0]s00_axi_1_RDATA;
  wire [11:0]s00_axi_1_RID;
  wire s00_axi_1_RLAST;
  wire s00_axi_1_RREADY;
  wire [1:0]s00_axi_1_RRESP;
  wire s00_axi_1_RVALID;
  wire [31:0]s00_axi_1_WDATA;
  wire [11:0]s00_axi_1_WID;
  wire s00_axi_1_WLAST;
  wire s00_axi_1_WREADY;
  wire [3:0]s00_axi_1_WSTRB;
  wire s00_axi_1_WVALID;
  wire [4:0]smartconnect_0_M00_AXI_ARADDR;
  wire smartconnect_0_M00_AXI_ARREADY;
  wire smartconnect_0_M00_AXI_ARVALID;
  wire [4:0]smartconnect_0_M00_AXI_AWADDR;
  wire smartconnect_0_M00_AXI_AWREADY;
  wire smartconnect_0_M00_AXI_AWVALID;
  wire smartconnect_0_M00_AXI_BREADY;
  wire [1:0]smartconnect_0_M00_AXI_BRESP;
  wire smartconnect_0_M00_AXI_BVALID;
  wire [31:0]smartconnect_0_M00_AXI_RDATA;
  wire smartconnect_0_M00_AXI_RREADY;
  wire [1:0]smartconnect_0_M00_AXI_RRESP;
  wire smartconnect_0_M00_AXI_RVALID;
  wire [31:0]smartconnect_0_M00_AXI_WDATA;
  wire smartconnect_0_M00_AXI_WREADY;
  wire [3:0]smartconnect_0_M00_AXI_WSTRB;
  wire smartconnect_0_M00_AXI_WVALID;
  wire [31:0]vga_controller_0_M_AXI_ARADDR;
  wire [1:0]vga_controller_0_M_AXI_ARBURST;
  wire [3:0]vga_controller_0_M_AXI_ARCACHE;
  wire [2:0]vga_controller_0_M_AXI_ARID;
  wire [3:0]vga_controller_0_M_AXI_ARLEN;
  wire [1:0]vga_controller_0_M_AXI_ARLOCK;
  wire [2:0]vga_controller_0_M_AXI_ARPROT;
  wire [3:0]vga_controller_0_M_AXI_ARQOS;
  wire vga_controller_0_M_AXI_ARREADY;
  wire [2:0]vga_controller_0_M_AXI_ARSIZE;
  wire vga_controller_0_M_AXI_ARVALID;
  wire [31:0]vga_controller_0_M_AXI_AWADDR;
  wire [1:0]vga_controller_0_M_AXI_AWBURST;
  wire [3:0]vga_controller_0_M_AXI_AWCACHE;
  wire [2:0]vga_controller_0_M_AXI_AWID;
  wire [3:0]vga_controller_0_M_AXI_AWLEN;
  wire [1:0]vga_controller_0_M_AXI_AWLOCK;
  wire [2:0]vga_controller_0_M_AXI_AWPROT;
  wire [3:0]vga_controller_0_M_AXI_AWQOS;
  wire vga_controller_0_M_AXI_AWREADY;
  wire [2:0]vga_controller_0_M_AXI_AWSIZE;
  wire vga_controller_0_M_AXI_AWVALID;
  wire [5:0]vga_controller_0_M_AXI_BID;
  wire vga_controller_0_M_AXI_BREADY;
  wire [1:0]vga_controller_0_M_AXI_BRESP;
  wire vga_controller_0_M_AXI_BVALID;
  wire [63:0]vga_controller_0_M_AXI_RDATA;
  wire [5:0]vga_controller_0_M_AXI_RID;
  wire vga_controller_0_M_AXI_RLAST;
  wire vga_controller_0_M_AXI_RREADY;
  wire [1:0]vga_controller_0_M_AXI_RRESP;
  wire vga_controller_0_M_AXI_RVALID;
  wire [63:0]vga_controller_0_M_AXI_WDATA;
  wire [5:0]vga_controller_0_M_AXI_WID;
  wire vga_controller_0_M_AXI_WLAST;
  wire vga_controller_0_M_AXI_WREADY;
  wire [7:0]vga_controller_0_M_AXI_WSTRB;
  wire vga_controller_0_M_AXI_WVALID;
  wire [3:0]vga_controller_0_VGA_B;
  wire [3:0]vga_controller_0_VGA_G;
  wire vga_controller_0_VGA_HS;
  wire [3:0]vga_controller_0_VGA_R;
  wire vga_controller_0_VGA_VS;
  wire [31:0]xfft_0_m_axis_data_TDATA;
  wire xfft_0_m_axis_data_TLAST;
  wire xfft_0_m_axis_data_TREADY;
  wire xfft_0_m_axis_data_TVALID;
  wire [2:0]xlconcat_0_dout;

  assign VGA_B[3:0] = vga_controller_0_VGA_B;
  assign VGA_G[3:0] = vga_controller_0_VGA_G;
  assign VGA_HS = vga_controller_0_VGA_HS;
  assign VGA_R[3:0] = vga_controller_0_VGA_R;
  assign VGA_VS = vga_controller_0_VGA_VS;
  accelerator_imp_VJ4YIN accelerator
       (.M_AXIS_DATA_tdata(xfft_0_m_axis_data_TDATA),
        .M_AXIS_DATA_tlast(xfft_0_m_axis_data_TLAST),
        .M_AXIS_DATA_tready(xfft_0_m_axis_data_TREADY),
        .M_AXIS_DATA_tvalid(xfft_0_m_axis_data_TVALID),
        .S_AXIS_DATA_tdata(axi_dma_0_m_axis_mm2s_TDATA),
        .S_AXIS_DATA_tlast(axi_dma_0_m_axis_mm2s_TLAST),
        .S_AXIS_DATA_tready(axi_dma_0_m_axis_mm2s_TREADY),
        .S_AXIS_DATA_tvalid(axi_dma_0_m_axis_mm2s_TVALID),
        .aclk(processing_system7_0_fclk_clk0),
        .s_axis_config_tdata(axi_gpio_0_gpio_io_o),
        .s_axis_config_tvalid(edge_detect_0_edge_detected));
  design_1_axi_timer_0_0 axi_timer_0
       (.capturetrig0(1'b0),
        .capturetrig1(1'b0),
        .freeze(1'b0),
        .interrupt(axi_timer_0_interrupt),
        .s_axi_aclk(Net),
        .s_axi_araddr(smartconnect_0_M00_AXI_ARADDR),
        .s_axi_aresetn(ctrl_peripheral_aresetn),
        .s_axi_arready(smartconnect_0_M00_AXI_ARREADY),
        .s_axi_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .s_axi_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .s_axi_awready(smartconnect_0_M00_AXI_AWREADY),
        .s_axi_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .s_axi_bready(smartconnect_0_M00_AXI_BREADY),
        .s_axi_bresp(smartconnect_0_M00_AXI_BRESP),
        .s_axi_bvalid(smartconnect_0_M00_AXI_BVALID),
        .s_axi_rdata(smartconnect_0_M00_AXI_RDATA),
        .s_axi_rready(smartconnect_0_M00_AXI_RREADY),
        .s_axi_rresp(smartconnect_0_M00_AXI_RRESP),
        .s_axi_rvalid(smartconnect_0_M00_AXI_RVALID),
        .s_axi_wdata(smartconnect_0_M00_AXI_WDATA),
        .s_axi_wready(smartconnect_0_M00_AXI_WREADY),
        .s_axi_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .s_axi_wvalid(smartconnect_0_M00_AXI_WVALID));
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(Net),
        .clk_out1(clk_wiz_0_clk_out1),
        .resetn(processing_system7_0_FCLK_RESET0_N));
  ctrl_imp_1POYFNJ ctrl
       (.In2(axi_timer_0_interrupt),
        .M_AXIS_ACCEL_tdata(axi_dma_0_m_axis_mm2s_TDATA),
        .M_AXIS_ACCEL_tlast(axi_dma_0_m_axis_mm2s_TLAST),
        .M_AXIS_ACCEL_tready(axi_dma_0_m_axis_mm2s_TREADY),
        .M_AXIS_ACCEL_tvalid(axi_dma_0_m_axis_mm2s_TVALID),
        .M_AXI_DMA_DATA_araddr(axi_interconnect_0_m00_axi_ARADDR),
        .M_AXI_DMA_DATA_arburst(axi_interconnect_0_m00_axi_ARBURST),
        .M_AXI_DMA_DATA_arcache(axi_interconnect_0_m00_axi_ARCACHE),
        .M_AXI_DMA_DATA_arid(axi_interconnect_0_m00_axi_ARID),
        .M_AXI_DMA_DATA_arlen(axi_interconnect_0_m00_axi_ARLEN),
        .M_AXI_DMA_DATA_arlock(axi_interconnect_0_m00_axi_ARLOCK),
        .M_AXI_DMA_DATA_arprot(axi_interconnect_0_m00_axi_ARPROT),
        .M_AXI_DMA_DATA_arqos(axi_interconnect_0_m00_axi_ARQOS),
        .M_AXI_DMA_DATA_arready(axi_interconnect_0_m00_axi_ARREADY),
        .M_AXI_DMA_DATA_arsize(axi_interconnect_0_m00_axi_ARSIZE),
        .M_AXI_DMA_DATA_arvalid(axi_interconnect_0_m00_axi_ARVALID),
        .M_AXI_DMA_DATA_awaddr(axi_interconnect_0_m00_axi_AWADDR),
        .M_AXI_DMA_DATA_awburst(axi_interconnect_0_m00_axi_AWBURST),
        .M_AXI_DMA_DATA_awcache(axi_interconnect_0_m00_axi_AWCACHE),
        .M_AXI_DMA_DATA_awid(axi_interconnect_0_m00_axi_AWID),
        .M_AXI_DMA_DATA_awlen(axi_interconnect_0_m00_axi_AWLEN),
        .M_AXI_DMA_DATA_awlock(axi_interconnect_0_m00_axi_AWLOCK),
        .M_AXI_DMA_DATA_awprot(axi_interconnect_0_m00_axi_AWPROT),
        .M_AXI_DMA_DATA_awqos(axi_interconnect_0_m00_axi_AWQOS),
        .M_AXI_DMA_DATA_awready(axi_interconnect_0_m00_axi_AWREADY),
        .M_AXI_DMA_DATA_awsize(axi_interconnect_0_m00_axi_AWSIZE),
        .M_AXI_DMA_DATA_awvalid(axi_interconnect_0_m00_axi_AWVALID),
        .M_AXI_DMA_DATA_bid(axi_interconnect_0_m00_axi_BID),
        .M_AXI_DMA_DATA_bready(axi_interconnect_0_m00_axi_BREADY),
        .M_AXI_DMA_DATA_bresp(axi_interconnect_0_m00_axi_BRESP),
        .M_AXI_DMA_DATA_bvalid(axi_interconnect_0_m00_axi_BVALID),
        .M_AXI_DMA_DATA_rdata(axi_interconnect_0_m00_axi_RDATA),
        .M_AXI_DMA_DATA_rid(axi_interconnect_0_m00_axi_RID),
        .M_AXI_DMA_DATA_rlast(axi_interconnect_0_m00_axi_RLAST),
        .M_AXI_DMA_DATA_rready(axi_interconnect_0_m00_axi_RREADY),
        .M_AXI_DMA_DATA_rresp(axi_interconnect_0_m00_axi_RRESP),
        .M_AXI_DMA_DATA_rvalid(axi_interconnect_0_m00_axi_RVALID),
        .M_AXI_DMA_DATA_wdata(axi_interconnect_0_m00_axi_WDATA),
        .M_AXI_DMA_DATA_wid(axi_interconnect_0_m00_axi_WID),
        .M_AXI_DMA_DATA_wlast(axi_interconnect_0_m00_axi_WLAST),
        .M_AXI_DMA_DATA_wready(axi_interconnect_0_m00_axi_WREADY),
        .M_AXI_DMA_DATA_wstrb(axi_interconnect_0_m00_axi_WSTRB),
        .M_AXI_DMA_DATA_wvalid(axi_interconnect_0_m00_axi_WVALID),
        .S_AXIS_ACCEL_tdata(xfft_0_m_axis_data_TDATA),
        .S_AXIS_ACCEL_tlast(xfft_0_m_axis_data_TLAST),
        .S_AXIS_ACCEL_tready(xfft_0_m_axis_data_TREADY),
        .S_AXIS_ACCEL_tvalid(xfft_0_m_axis_data_TVALID),
        .S_AXI_araddr(s00_axi_1_ARADDR),
        .S_AXI_arburst(s00_axi_1_ARBURST),
        .S_AXI_arcache(s00_axi_1_ARCACHE),
        .S_AXI_arid(s00_axi_1_ARID),
        .S_AXI_arlen(s00_axi_1_ARLEN),
        .S_AXI_arlock(s00_axi_1_ARLOCK),
        .S_AXI_arprot(s00_axi_1_ARPROT),
        .S_AXI_arqos(s00_axi_1_ARQOS),
        .S_AXI_arready(s00_axi_1_ARREADY),
        .S_AXI_arsize(s00_axi_1_ARSIZE),
        .S_AXI_arvalid(s00_axi_1_ARVALID),
        .S_AXI_awaddr(s00_axi_1_AWADDR),
        .S_AXI_awburst(s00_axi_1_AWBURST),
        .S_AXI_awcache(s00_axi_1_AWCACHE),
        .S_AXI_awid(s00_axi_1_AWID),
        .S_AXI_awlen(s00_axi_1_AWLEN),
        .S_AXI_awlock(s00_axi_1_AWLOCK),
        .S_AXI_awprot(s00_axi_1_AWPROT),
        .S_AXI_awqos(s00_axi_1_AWQOS),
        .S_AXI_awready(s00_axi_1_AWREADY),
        .S_AXI_awsize(s00_axi_1_AWSIZE),
        .S_AXI_awvalid(s00_axi_1_AWVALID),
        .S_AXI_bid(s00_axi_1_BID),
        .S_AXI_bready(s00_axi_1_BREADY),
        .S_AXI_bresp(s00_axi_1_BRESP),
        .S_AXI_bvalid(s00_axi_1_BVALID),
        .S_AXI_rdata(s00_axi_1_RDATA),
        .S_AXI_rid(s00_axi_1_RID),
        .S_AXI_rlast(s00_axi_1_RLAST),
        .S_AXI_rready(s00_axi_1_RREADY),
        .S_AXI_rresp(s00_axi_1_RRESP),
        .S_AXI_rvalid(s00_axi_1_RVALID),
        .S_AXI_wdata(s00_axi_1_WDATA),
        .S_AXI_wid(s00_axi_1_WID),
        .S_AXI_wlast(s00_axi_1_WLAST),
        .S_AXI_wready(s00_axi_1_WREADY),
        .S_AXI_wstrb(s00_axi_1_WSTRB),
        .S_AXI_wvalid(s00_axi_1_WVALID),
        .ctrl_aclk(processing_system7_0_fclk_clk0),
        .dma_irqs(xlconcat_0_dout),
        .ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .fft_config_tdata(axi_gpio_0_gpio_io_o),
        .fft_config_tvalid(edge_detect_0_edge_detected),
        .interconnect_aresetn(ctrl_interconnect_aresetn),
        .peripheral_aresetn(ctrl_peripheral_aresetn),
        .peripheral_reset(ctrl_peripheral_reset),
        .slowest_sync_clk(clk_wiz_0_clk_out1));
  design_1_processing_system7_0_0 processing_system7_0
       (.DDR_Addr(DDR_addr[14:0]),
        .DDR_BankAddr(DDR_ba[2:0]),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm[3:0]),
        .DDR_DQ(DDR_dq[31:0]),
        .DDR_DQS(DDR_dqs_p[3:0]),
        .DDR_DQS_n(DDR_dqs_n[3:0]),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_CLK0(processing_system7_0_fclk_clk0),
        .FCLK_CLK1(Net),
        .FCLK_RESET0_N(processing_system7_0_FCLK_RESET0_N),
        .IRQ_F2P(xlconcat_0_dout),
        .MIO(FIXED_IO_mio[53:0]),
        .M_AXI_GP0_ACLK(processing_system7_0_fclk_clk0),
        .M_AXI_GP0_ARADDR(s00_axi_1_ARADDR),
        .M_AXI_GP0_ARBURST(s00_axi_1_ARBURST),
        .M_AXI_GP0_ARCACHE(s00_axi_1_ARCACHE),
        .M_AXI_GP0_ARID(s00_axi_1_ARID),
        .M_AXI_GP0_ARLEN(s00_axi_1_ARLEN),
        .M_AXI_GP0_ARLOCK(s00_axi_1_ARLOCK),
        .M_AXI_GP0_ARPROT(s00_axi_1_ARPROT),
        .M_AXI_GP0_ARQOS(s00_axi_1_ARQOS),
        .M_AXI_GP0_ARREADY(s00_axi_1_ARREADY),
        .M_AXI_GP0_ARSIZE(s00_axi_1_ARSIZE),
        .M_AXI_GP0_ARVALID(s00_axi_1_ARVALID),
        .M_AXI_GP0_AWADDR(s00_axi_1_AWADDR),
        .M_AXI_GP0_AWBURST(s00_axi_1_AWBURST),
        .M_AXI_GP0_AWCACHE(s00_axi_1_AWCACHE),
        .M_AXI_GP0_AWID(s00_axi_1_AWID),
        .M_AXI_GP0_AWLEN(s00_axi_1_AWLEN),
        .M_AXI_GP0_AWLOCK(s00_axi_1_AWLOCK),
        .M_AXI_GP0_AWPROT(s00_axi_1_AWPROT),
        .M_AXI_GP0_AWQOS(s00_axi_1_AWQOS),
        .M_AXI_GP0_AWREADY(s00_axi_1_AWREADY),
        .M_AXI_GP0_AWSIZE(s00_axi_1_AWSIZE),
        .M_AXI_GP0_AWVALID(s00_axi_1_AWVALID),
        .M_AXI_GP0_BID(s00_axi_1_BID),
        .M_AXI_GP0_BREADY(s00_axi_1_BREADY),
        .M_AXI_GP0_BRESP(s00_axi_1_BRESP),
        .M_AXI_GP0_BVALID(s00_axi_1_BVALID),
        .M_AXI_GP0_RDATA(s00_axi_1_RDATA),
        .M_AXI_GP0_RID(s00_axi_1_RID),
        .M_AXI_GP0_RLAST(s00_axi_1_RLAST),
        .M_AXI_GP0_RREADY(s00_axi_1_RREADY),
        .M_AXI_GP0_RRESP(s00_axi_1_RRESP),
        .M_AXI_GP0_RVALID(s00_axi_1_RVALID),
        .M_AXI_GP0_WDATA(s00_axi_1_WDATA),
        .M_AXI_GP0_WID(s00_axi_1_WID),
        .M_AXI_GP0_WLAST(s00_axi_1_WLAST),
        .M_AXI_GP0_WREADY(s00_axi_1_WREADY),
        .M_AXI_GP0_WSTRB(s00_axi_1_WSTRB),
        .M_AXI_GP0_WVALID(s00_axi_1_WVALID),
        .M_AXI_GP1_ACLK(Net),
        .M_AXI_GP1_ARADDR(processing_system7_0_M_AXI_GP1_ARADDR),
        .M_AXI_GP1_ARBURST(processing_system7_0_M_AXI_GP1_ARBURST),
        .M_AXI_GP1_ARCACHE(processing_system7_0_M_AXI_GP1_ARCACHE),
        .M_AXI_GP1_ARID(processing_system7_0_M_AXI_GP1_ARID),
        .M_AXI_GP1_ARLEN(processing_system7_0_M_AXI_GP1_ARLEN),
        .M_AXI_GP1_ARLOCK(processing_system7_0_M_AXI_GP1_ARLOCK),
        .M_AXI_GP1_ARPROT(processing_system7_0_M_AXI_GP1_ARPROT),
        .M_AXI_GP1_ARQOS(processing_system7_0_M_AXI_GP1_ARQOS),
        .M_AXI_GP1_ARREADY(processing_system7_0_M_AXI_GP1_ARREADY),
        .M_AXI_GP1_ARSIZE(processing_system7_0_M_AXI_GP1_ARSIZE),
        .M_AXI_GP1_ARVALID(processing_system7_0_M_AXI_GP1_ARVALID),
        .M_AXI_GP1_AWADDR(processing_system7_0_M_AXI_GP1_AWADDR),
        .M_AXI_GP1_AWBURST(processing_system7_0_M_AXI_GP1_AWBURST),
        .M_AXI_GP1_AWCACHE(processing_system7_0_M_AXI_GP1_AWCACHE),
        .M_AXI_GP1_AWID(processing_system7_0_M_AXI_GP1_AWID),
        .M_AXI_GP1_AWLEN(processing_system7_0_M_AXI_GP1_AWLEN),
        .M_AXI_GP1_AWLOCK(processing_system7_0_M_AXI_GP1_AWLOCK),
        .M_AXI_GP1_AWPROT(processing_system7_0_M_AXI_GP1_AWPROT),
        .M_AXI_GP1_AWQOS(processing_system7_0_M_AXI_GP1_AWQOS),
        .M_AXI_GP1_AWREADY(processing_system7_0_M_AXI_GP1_AWREADY),
        .M_AXI_GP1_AWSIZE(processing_system7_0_M_AXI_GP1_AWSIZE),
        .M_AXI_GP1_AWVALID(processing_system7_0_M_AXI_GP1_AWVALID),
        .M_AXI_GP1_BID(processing_system7_0_M_AXI_GP1_BID),
        .M_AXI_GP1_BREADY(processing_system7_0_M_AXI_GP1_BREADY),
        .M_AXI_GP1_BRESP(processing_system7_0_M_AXI_GP1_BRESP),
        .M_AXI_GP1_BVALID(processing_system7_0_M_AXI_GP1_BVALID),
        .M_AXI_GP1_RDATA(processing_system7_0_M_AXI_GP1_RDATA),
        .M_AXI_GP1_RID(processing_system7_0_M_AXI_GP1_RID),
        .M_AXI_GP1_RLAST(processing_system7_0_M_AXI_GP1_RLAST),
        .M_AXI_GP1_RREADY(processing_system7_0_M_AXI_GP1_RREADY),
        .M_AXI_GP1_RRESP(processing_system7_0_M_AXI_GP1_RRESP),
        .M_AXI_GP1_RVALID(processing_system7_0_M_AXI_GP1_RVALID),
        .M_AXI_GP1_WDATA(processing_system7_0_M_AXI_GP1_WDATA),
        .M_AXI_GP1_WID(processing_system7_0_M_AXI_GP1_WID),
        .M_AXI_GP1_WLAST(processing_system7_0_M_AXI_GP1_WLAST),
        .M_AXI_GP1_WREADY(processing_system7_0_M_AXI_GP1_WREADY),
        .M_AXI_GP1_WSTRB(processing_system7_0_M_AXI_GP1_WSTRB),
        .M_AXI_GP1_WVALID(processing_system7_0_M_AXI_GP1_WVALID),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .S_AXI_HP0_ACLK(processing_system7_0_fclk_clk0),
        .S_AXI_HP0_ARADDR(axi_interconnect_0_m00_axi_ARADDR),
        .S_AXI_HP0_ARBURST(axi_interconnect_0_m00_axi_ARBURST),
        .S_AXI_HP0_ARCACHE(axi_interconnect_0_m00_axi_ARCACHE),
        .S_AXI_HP0_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,axi_interconnect_0_m00_axi_ARID}),
        .S_AXI_HP0_ARLEN(axi_interconnect_0_m00_axi_ARLEN),
        .S_AXI_HP0_ARLOCK(axi_interconnect_0_m00_axi_ARLOCK),
        .S_AXI_HP0_ARPROT(axi_interconnect_0_m00_axi_ARPROT),
        .S_AXI_HP0_ARQOS(axi_interconnect_0_m00_axi_ARQOS),
        .S_AXI_HP0_ARREADY(axi_interconnect_0_m00_axi_ARREADY),
        .S_AXI_HP0_ARSIZE(axi_interconnect_0_m00_axi_ARSIZE),
        .S_AXI_HP0_ARVALID(axi_interconnect_0_m00_axi_ARVALID),
        .S_AXI_HP0_AWADDR(axi_interconnect_0_m00_axi_AWADDR),
        .S_AXI_HP0_AWBURST(axi_interconnect_0_m00_axi_AWBURST),
        .S_AXI_HP0_AWCACHE(axi_interconnect_0_m00_axi_AWCACHE),
        .S_AXI_HP0_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,axi_interconnect_0_m00_axi_AWID}),
        .S_AXI_HP0_AWLEN(axi_interconnect_0_m00_axi_AWLEN),
        .S_AXI_HP0_AWLOCK(axi_interconnect_0_m00_axi_AWLOCK),
        .S_AXI_HP0_AWPROT(axi_interconnect_0_m00_axi_AWPROT),
        .S_AXI_HP0_AWQOS(axi_interconnect_0_m00_axi_AWQOS),
        .S_AXI_HP0_AWREADY(axi_interconnect_0_m00_axi_AWREADY),
        .S_AXI_HP0_AWSIZE(axi_interconnect_0_m00_axi_AWSIZE),
        .S_AXI_HP0_AWVALID(axi_interconnect_0_m00_axi_AWVALID),
        .S_AXI_HP0_BID(axi_interconnect_0_m00_axi_BID),
        .S_AXI_HP0_BREADY(axi_interconnect_0_m00_axi_BREADY),
        .S_AXI_HP0_BRESP(axi_interconnect_0_m00_axi_BRESP),
        .S_AXI_HP0_BVALID(axi_interconnect_0_m00_axi_BVALID),
        .S_AXI_HP0_RCOUNT(processing_system7_0_S_AXI_HP0_RCOUNT),
        .S_AXI_HP0_RDATA(axi_interconnect_0_m00_axi_RDATA),
        .S_AXI_HP0_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP0_RID(axi_interconnect_0_m00_axi_RID),
        .S_AXI_HP0_RLAST(axi_interconnect_0_m00_axi_RLAST),
        .S_AXI_HP0_RREADY(axi_interconnect_0_m00_axi_RREADY),
        .S_AXI_HP0_RRESP(axi_interconnect_0_m00_axi_RRESP),
        .S_AXI_HP0_RVALID(axi_interconnect_0_m00_axi_RVALID),
        .S_AXI_HP0_WDATA(axi_interconnect_0_m00_axi_WDATA),
        .S_AXI_HP0_WID({1'b0,1'b0,1'b0,1'b0,1'b0,axi_interconnect_0_m00_axi_WID}),
        .S_AXI_HP0_WLAST(axi_interconnect_0_m00_axi_WLAST),
        .S_AXI_HP0_WREADY(axi_interconnect_0_m00_axi_WREADY),
        .S_AXI_HP0_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP0_WSTRB(axi_interconnect_0_m00_axi_WSTRB),
        .S_AXI_HP0_WVALID(axi_interconnect_0_m00_axi_WVALID),
        .S_AXI_HP1_ACLK(Net),
        .S_AXI_HP1_ARADDR(vga_controller_0_M_AXI_ARADDR),
        .S_AXI_HP1_ARBURST(vga_controller_0_M_AXI_ARBURST),
        .S_AXI_HP1_ARCACHE(vga_controller_0_M_AXI_ARCACHE),
        .S_AXI_HP1_ARID({1'b0,1'b0,1'b0,vga_controller_0_M_AXI_ARID}),
        .S_AXI_HP1_ARLEN(vga_controller_0_M_AXI_ARLEN),
        .S_AXI_HP1_ARLOCK(vga_controller_0_M_AXI_ARLOCK),
        .S_AXI_HP1_ARPROT(vga_controller_0_M_AXI_ARPROT),
        .S_AXI_HP1_ARQOS(vga_controller_0_M_AXI_ARQOS),
        .S_AXI_HP1_ARREADY(vga_controller_0_M_AXI_ARREADY),
        .S_AXI_HP1_ARSIZE(vga_controller_0_M_AXI_ARSIZE),
        .S_AXI_HP1_ARVALID(vga_controller_0_M_AXI_ARVALID),
        .S_AXI_HP1_AWADDR(vga_controller_0_M_AXI_AWADDR),
        .S_AXI_HP1_AWBURST(vga_controller_0_M_AXI_AWBURST),
        .S_AXI_HP1_AWCACHE(vga_controller_0_M_AXI_AWCACHE),
        .S_AXI_HP1_AWID({1'b0,1'b0,1'b0,vga_controller_0_M_AXI_AWID}),
        .S_AXI_HP1_AWLEN(vga_controller_0_M_AXI_AWLEN),
        .S_AXI_HP1_AWLOCK(vga_controller_0_M_AXI_AWLOCK),
        .S_AXI_HP1_AWPROT(vga_controller_0_M_AXI_AWPROT),
        .S_AXI_HP1_AWQOS(vga_controller_0_M_AXI_AWQOS),
        .S_AXI_HP1_AWREADY(vga_controller_0_M_AXI_AWREADY),
        .S_AXI_HP1_AWSIZE(vga_controller_0_M_AXI_AWSIZE),
        .S_AXI_HP1_AWVALID(vga_controller_0_M_AXI_AWVALID),
        .S_AXI_HP1_BID(vga_controller_0_M_AXI_BID),
        .S_AXI_HP1_BREADY(vga_controller_0_M_AXI_BREADY),
        .S_AXI_HP1_BRESP(vga_controller_0_M_AXI_BRESP),
        .S_AXI_HP1_BVALID(vga_controller_0_M_AXI_BVALID),
        .S_AXI_HP1_RDATA(vga_controller_0_M_AXI_RDATA),
        .S_AXI_HP1_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP1_RID(vga_controller_0_M_AXI_RID),
        .S_AXI_HP1_RLAST(vga_controller_0_M_AXI_RLAST),
        .S_AXI_HP1_RREADY(vga_controller_0_M_AXI_RREADY),
        .S_AXI_HP1_RRESP(vga_controller_0_M_AXI_RRESP),
        .S_AXI_HP1_RVALID(vga_controller_0_M_AXI_RVALID),
        .S_AXI_HP1_WDATA(vga_controller_0_M_AXI_WDATA),
        .S_AXI_HP1_WID(vga_controller_0_M_AXI_WID),
        .S_AXI_HP1_WLAST(vga_controller_0_M_AXI_WLAST),
        .S_AXI_HP1_WREADY(vga_controller_0_M_AXI_WREADY),
        .S_AXI_HP1_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP1_WSTRB(vga_controller_0_M_AXI_WSTRB),
        .S_AXI_HP1_WVALID(vga_controller_0_M_AXI_WVALID),
        .USB0_VBUS_PWRFAULT(1'b0));
  design_1_smartconnect_0_0 smartconnect_0
       (.M00_AXI_araddr(smartconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arready(smartconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awready(smartconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(smartconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_0_M00_AXI_RDATA),
        .M00_AXI_rready(smartconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_0_M00_AXI_WDATA),
        .M00_AXI_wready(smartconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_0_M00_AXI_WVALID),
        .S00_AXI_araddr(processing_system7_0_M_AXI_GP1_ARADDR),
        .S00_AXI_arburst(processing_system7_0_M_AXI_GP1_ARBURST),
        .S00_AXI_arcache(processing_system7_0_M_AXI_GP1_ARCACHE),
        .S00_AXI_arid(processing_system7_0_M_AXI_GP1_ARID),
        .S00_AXI_arlen(processing_system7_0_M_AXI_GP1_ARLEN),
        .S00_AXI_arlock(processing_system7_0_M_AXI_GP1_ARLOCK),
        .S00_AXI_arprot(processing_system7_0_M_AXI_GP1_ARPROT),
        .S00_AXI_arqos(processing_system7_0_M_AXI_GP1_ARQOS),
        .S00_AXI_arready(processing_system7_0_M_AXI_GP1_ARREADY),
        .S00_AXI_arsize(processing_system7_0_M_AXI_GP1_ARSIZE),
        .S00_AXI_arvalid(processing_system7_0_M_AXI_GP1_ARVALID),
        .S00_AXI_awaddr(processing_system7_0_M_AXI_GP1_AWADDR),
        .S00_AXI_awburst(processing_system7_0_M_AXI_GP1_AWBURST),
        .S00_AXI_awcache(processing_system7_0_M_AXI_GP1_AWCACHE),
        .S00_AXI_awid(processing_system7_0_M_AXI_GP1_AWID),
        .S00_AXI_awlen(processing_system7_0_M_AXI_GP1_AWLEN),
        .S00_AXI_awlock(processing_system7_0_M_AXI_GP1_AWLOCK),
        .S00_AXI_awprot(processing_system7_0_M_AXI_GP1_AWPROT),
        .S00_AXI_awqos(processing_system7_0_M_AXI_GP1_AWQOS),
        .S00_AXI_awready(processing_system7_0_M_AXI_GP1_AWREADY),
        .S00_AXI_awsize(processing_system7_0_M_AXI_GP1_AWSIZE),
        .S00_AXI_awvalid(processing_system7_0_M_AXI_GP1_AWVALID),
        .S00_AXI_bid(processing_system7_0_M_AXI_GP1_BID),
        .S00_AXI_bready(processing_system7_0_M_AXI_GP1_BREADY),
        .S00_AXI_bresp(processing_system7_0_M_AXI_GP1_BRESP),
        .S00_AXI_bvalid(processing_system7_0_M_AXI_GP1_BVALID),
        .S00_AXI_rdata(processing_system7_0_M_AXI_GP1_RDATA),
        .S00_AXI_rid(processing_system7_0_M_AXI_GP1_RID),
        .S00_AXI_rlast(processing_system7_0_M_AXI_GP1_RLAST),
        .S00_AXI_rready(processing_system7_0_M_AXI_GP1_RREADY),
        .S00_AXI_rresp(processing_system7_0_M_AXI_GP1_RRESP),
        .S00_AXI_rvalid(processing_system7_0_M_AXI_GP1_RVALID),
        .S00_AXI_wdata(processing_system7_0_M_AXI_GP1_WDATA),
        .S00_AXI_wid(processing_system7_0_M_AXI_GP1_WID),
        .S00_AXI_wlast(processing_system7_0_M_AXI_GP1_WLAST),
        .S00_AXI_wready(processing_system7_0_M_AXI_GP1_WREADY),
        .S00_AXI_wstrb(processing_system7_0_M_AXI_GP1_WSTRB),
        .S00_AXI_wvalid(processing_system7_0_M_AXI_GP1_WVALID),
        .S01_AXI_araddr(1'b0),
        .S01_AXI_arburst({1'b0,1'b1}),
        .S01_AXI_arcache({1'b0,1'b0,1'b1,1'b1}),
        .S01_AXI_arid(1'b0),
        .S01_AXI_arlen(1'b0),
        .S01_AXI_arlock(1'b0),
        .S01_AXI_arprot({1'b0,1'b0,1'b0}),
        .S01_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_arsize({1'b0,1'b1,1'b0}),
        .S01_AXI_aruser(1'b0),
        .S01_AXI_arvalid(1'b0),
        .S01_AXI_awaddr(1'b0),
        .S01_AXI_awburst({1'b0,1'b1}),
        .S01_AXI_awcache({1'b0,1'b0,1'b1,1'b1}),
        .S01_AXI_awid(1'b0),
        .S01_AXI_awlen(1'b0),
        .S01_AXI_awlock(1'b0),
        .S01_AXI_awprot({1'b0,1'b0,1'b0}),
        .S01_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_awsize({1'b0,1'b1,1'b0}),
        .S01_AXI_awuser(1'b0),
        .S01_AXI_awvalid(1'b0),
        .S01_AXI_bready(1'b0),
        .S01_AXI_rready(1'b0),
        .S01_AXI_wdata(1'b0),
        .S01_AXI_wid(1'b0),
        .S01_AXI_wlast(1'b0),
        .S01_AXI_wstrb(1'b1),
        .S01_AXI_wuser(1'b0),
        .S01_AXI_wvalid(1'b0),
        .aclk(Net),
        .aresetn(ctrl_interconnect_aresetn));
  design_1_vga_controller_0_0 vga_controller_0
       (.M_AXI_ARADDR(vga_controller_0_M_AXI_ARADDR),
        .M_AXI_ARBURST(vga_controller_0_M_AXI_ARBURST),
        .M_AXI_ARCACHE(vga_controller_0_M_AXI_ARCACHE),
        .M_AXI_ARID(vga_controller_0_M_AXI_ARID),
        .M_AXI_ARLEN(vga_controller_0_M_AXI_ARLEN),
        .M_AXI_ARLOCK(vga_controller_0_M_AXI_ARLOCK),
        .M_AXI_ARPROT(vga_controller_0_M_AXI_ARPROT),
        .M_AXI_ARQOS(vga_controller_0_M_AXI_ARQOS),
        .M_AXI_ARREADY(vga_controller_0_M_AXI_ARREADY),
        .M_AXI_ARSIZE(vga_controller_0_M_AXI_ARSIZE),
        .M_AXI_ARVALID(vga_controller_0_M_AXI_ARVALID),
        .M_AXI_AWADDR(vga_controller_0_M_AXI_AWADDR),
        .M_AXI_AWBURST(vga_controller_0_M_AXI_AWBURST),
        .M_AXI_AWCACHE(vga_controller_0_M_AXI_AWCACHE),
        .M_AXI_AWID(vga_controller_0_M_AXI_AWID),
        .M_AXI_AWLEN(vga_controller_0_M_AXI_AWLEN),
        .M_AXI_AWLOCK(vga_controller_0_M_AXI_AWLOCK),
        .M_AXI_AWPROT(vga_controller_0_M_AXI_AWPROT),
        .M_AXI_AWQOS(vga_controller_0_M_AXI_AWQOS),
        .M_AXI_AWREADY(vga_controller_0_M_AXI_AWREADY),
        .M_AXI_AWSIZE(vga_controller_0_M_AXI_AWSIZE),
        .M_AXI_AWVALID(vga_controller_0_M_AXI_AWVALID),
        .M_AXI_BID(vga_controller_0_M_AXI_BID[2:0]),
        .M_AXI_BREADY(vga_controller_0_M_AXI_BREADY),
        .M_AXI_BRESP(vga_controller_0_M_AXI_BRESP),
        .M_AXI_BVALID(vga_controller_0_M_AXI_BVALID),
        .M_AXI_RDATA(vga_controller_0_M_AXI_RDATA),
        .M_AXI_RID(vga_controller_0_M_AXI_RID[2:0]),
        .M_AXI_RLAST(vga_controller_0_M_AXI_RLAST),
        .M_AXI_RREADY(vga_controller_0_M_AXI_RREADY),
        .M_AXI_RRESP(vga_controller_0_M_AXI_RRESP),
        .M_AXI_RVALID(vga_controller_0_M_AXI_RVALID),
        .M_AXI_WDATA(vga_controller_0_M_AXI_WDATA),
        .M_AXI_WID(vga_controller_0_M_AXI_WID),
        .M_AXI_WLAST(vga_controller_0_M_AXI_WLAST),
        .M_AXI_WREADY(vga_controller_0_M_AXI_WREADY),
        .M_AXI_WSTRB(vga_controller_0_M_AXI_WSTRB),
        .M_AXI_WVALID(vga_controller_0_M_AXI_WVALID),
        .VGA_B(vga_controller_0_VGA_B),
        .VGA_G(vga_controller_0_VGA_G),
        .VGA_HS(vga_controller_0_VGA_HS),
        .VGA_R(vga_controller_0_VGA_R),
        .VGA_VS(vga_controller_0_VGA_VS),
        .clk(Net),
        .fifo_rst(ctrl_peripheral_reset),
        .pixel_clk(clk_wiz_0_clk_out1),
        .pixel_rstn(ctrl_interconnect_aresetn),
        .rfifo_count(processing_system7_0_S_AXI_HP0_RCOUNT),
        .rstn(ctrl_interconnect_aresetn),
        .switch_buffer(1'b0));
endmodule

module design_1_axi_interconnect_0_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awid,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wid,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arlen,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_rdata,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S01_ACLK,
    S01_ARESETN,
    S01_AXI_awaddr,
    S01_AXI_awburst,
    S01_AXI_awcache,
    S01_AXI_awlen,
    S01_AXI_awprot,
    S01_AXI_awready,
    S01_AXI_awsize,
    S01_AXI_awvalid,
    S01_AXI_bready,
    S01_AXI_bresp,
    S01_AXI_bvalid,
    S01_AXI_wdata,
    S01_AXI_wlast,
    S01_AXI_wready,
    S01_AXI_wstrb,
    S01_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [0:0]M00_AXI_arid;
  output [3:0]M00_AXI_arlen;
  output [1:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [0:0]M00_AXI_awid;
  output [3:0]M00_AXI_awlen;
  output [1:0]M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  input [5:0]M00_AXI_bid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [63:0]M00_AXI_rdata;
  input [5:0]M00_AXI_rid;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [63:0]M00_AXI_wdata;
  output [0:0]M00_AXI_wid;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [7:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [7:0]S00_AXI_arlen;
  input [2:0]S00_AXI_arprot;
  output [0:0]S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input [0:0]S00_AXI_arvalid;
  output [63:0]S00_AXI_rdata;
  output [0:0]S00_AXI_rlast;
  input [0:0]S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output [0:0]S00_AXI_rvalid;
  input S01_ACLK;
  input S01_ARESETN;
  input [31:0]S01_AXI_awaddr;
  input [1:0]S01_AXI_awburst;
  input [3:0]S01_AXI_awcache;
  input [7:0]S01_AXI_awlen;
  input [2:0]S01_AXI_awprot;
  output [0:0]S01_AXI_awready;
  input [2:0]S01_AXI_awsize;
  input [0:0]S01_AXI_awvalid;
  input [0:0]S01_AXI_bready;
  output [1:0]S01_AXI_bresp;
  output [0:0]S01_AXI_bvalid;
  input [63:0]S01_AXI_wdata;
  input [0:0]S01_AXI_wlast;
  output [0:0]S01_AXI_wready;
  input [7:0]S01_AXI_wstrb;
  input [0:0]S01_AXI_wvalid;

  wire axi_interconnect_0_ACLK_net;
  wire axi_interconnect_0_ARESETN_net;
  wire [31:0]axi_interconnect_0_to_s00_couplers_ARADDR;
  wire [1:0]axi_interconnect_0_to_s00_couplers_ARBURST;
  wire [3:0]axi_interconnect_0_to_s00_couplers_ARCACHE;
  wire [7:0]axi_interconnect_0_to_s00_couplers_ARLEN;
  wire [2:0]axi_interconnect_0_to_s00_couplers_ARPROT;
  wire [0:0]axi_interconnect_0_to_s00_couplers_ARREADY;
  wire [2:0]axi_interconnect_0_to_s00_couplers_ARSIZE;
  wire [0:0]axi_interconnect_0_to_s00_couplers_ARVALID;
  wire [63:0]axi_interconnect_0_to_s00_couplers_RDATA;
  wire [0:0]axi_interconnect_0_to_s00_couplers_RLAST;
  wire [0:0]axi_interconnect_0_to_s00_couplers_RREADY;
  wire [1:0]axi_interconnect_0_to_s00_couplers_RRESP;
  wire [0:0]axi_interconnect_0_to_s00_couplers_RVALID;
  wire [31:0]axi_interconnect_0_to_s01_couplers_AWADDR;
  wire [1:0]axi_interconnect_0_to_s01_couplers_AWBURST;
  wire [3:0]axi_interconnect_0_to_s01_couplers_AWCACHE;
  wire [7:0]axi_interconnect_0_to_s01_couplers_AWLEN;
  wire [2:0]axi_interconnect_0_to_s01_couplers_AWPROT;
  wire [0:0]axi_interconnect_0_to_s01_couplers_AWREADY;
  wire [2:0]axi_interconnect_0_to_s01_couplers_AWSIZE;
  wire [0:0]axi_interconnect_0_to_s01_couplers_AWVALID;
  wire [0:0]axi_interconnect_0_to_s01_couplers_BREADY;
  wire [1:0]axi_interconnect_0_to_s01_couplers_BRESP;
  wire [0:0]axi_interconnect_0_to_s01_couplers_BVALID;
  wire [63:0]axi_interconnect_0_to_s01_couplers_WDATA;
  wire [0:0]axi_interconnect_0_to_s01_couplers_WLAST;
  wire [0:0]axi_interconnect_0_to_s01_couplers_WREADY;
  wire [7:0]axi_interconnect_0_to_s01_couplers_WSTRB;
  wire [0:0]axi_interconnect_0_to_s01_couplers_WVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_0_ARADDR;
  wire [1:0]m00_couplers_to_axi_interconnect_0_ARBURST;
  wire [3:0]m00_couplers_to_axi_interconnect_0_ARCACHE;
  wire [0:0]m00_couplers_to_axi_interconnect_0_ARID;
  wire [3:0]m00_couplers_to_axi_interconnect_0_ARLEN;
  wire [1:0]m00_couplers_to_axi_interconnect_0_ARLOCK;
  wire [2:0]m00_couplers_to_axi_interconnect_0_ARPROT;
  wire [3:0]m00_couplers_to_axi_interconnect_0_ARQOS;
  wire m00_couplers_to_axi_interconnect_0_ARREADY;
  wire [2:0]m00_couplers_to_axi_interconnect_0_ARSIZE;
  wire m00_couplers_to_axi_interconnect_0_ARVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_0_AWADDR;
  wire [1:0]m00_couplers_to_axi_interconnect_0_AWBURST;
  wire [3:0]m00_couplers_to_axi_interconnect_0_AWCACHE;
  wire [0:0]m00_couplers_to_axi_interconnect_0_AWID;
  wire [3:0]m00_couplers_to_axi_interconnect_0_AWLEN;
  wire [1:0]m00_couplers_to_axi_interconnect_0_AWLOCK;
  wire [2:0]m00_couplers_to_axi_interconnect_0_AWPROT;
  wire [3:0]m00_couplers_to_axi_interconnect_0_AWQOS;
  wire m00_couplers_to_axi_interconnect_0_AWREADY;
  wire [2:0]m00_couplers_to_axi_interconnect_0_AWSIZE;
  wire m00_couplers_to_axi_interconnect_0_AWVALID;
  wire [5:0]m00_couplers_to_axi_interconnect_0_BID;
  wire m00_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m00_couplers_to_axi_interconnect_0_BRESP;
  wire m00_couplers_to_axi_interconnect_0_BVALID;
  wire [63:0]m00_couplers_to_axi_interconnect_0_RDATA;
  wire [5:0]m00_couplers_to_axi_interconnect_0_RID;
  wire m00_couplers_to_axi_interconnect_0_RLAST;
  wire m00_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m00_couplers_to_axi_interconnect_0_RRESP;
  wire m00_couplers_to_axi_interconnect_0_RVALID;
  wire [63:0]m00_couplers_to_axi_interconnect_0_WDATA;
  wire [0:0]m00_couplers_to_axi_interconnect_0_WID;
  wire m00_couplers_to_axi_interconnect_0_WLAST;
  wire m00_couplers_to_axi_interconnect_0_WREADY;
  wire [7:0]m00_couplers_to_axi_interconnect_0_WSTRB;
  wire m00_couplers_to_axi_interconnect_0_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [1:0]s00_couplers_to_xbar_ARBURST;
  wire [3:0]s00_couplers_to_xbar_ARCACHE;
  wire [7:0]s00_couplers_to_xbar_ARLEN;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [2:0]s00_couplers_to_xbar_ARSIZE;
  wire [0:0]s00_couplers_to_xbar_ARVALID;
  wire [63:0]s00_couplers_to_xbar_RDATA;
  wire [0:0]s00_couplers_to_xbar_RLAST;
  wire [0:0]s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s01_couplers_to_xbar_AWADDR;
  wire [1:0]s01_couplers_to_xbar_AWBURST;
  wire [3:0]s01_couplers_to_xbar_AWCACHE;
  wire [7:0]s01_couplers_to_xbar_AWLEN;
  wire [2:0]s01_couplers_to_xbar_AWPROT;
  wire [1:1]s01_couplers_to_xbar_AWREADY;
  wire [2:0]s01_couplers_to_xbar_AWSIZE;
  wire [0:0]s01_couplers_to_xbar_AWVALID;
  wire [0:0]s01_couplers_to_xbar_BREADY;
  wire [3:2]s01_couplers_to_xbar_BRESP;
  wire [1:1]s01_couplers_to_xbar_BVALID;
  wire [63:0]s01_couplers_to_xbar_WDATA;
  wire [0:0]s01_couplers_to_xbar_WLAST;
  wire [1:1]s01_couplers_to_xbar_WREADY;
  wire [7:0]s01_couplers_to_xbar_WSTRB;
  wire [0:0]s01_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [1:0]xbar_to_m00_couplers_ARBURST;
  wire [3:0]xbar_to_m00_couplers_ARCACHE;
  wire [0:0]xbar_to_m00_couplers_ARID;
  wire [7:0]xbar_to_m00_couplers_ARLEN;
  wire [0:0]xbar_to_m00_couplers_ARLOCK;
  wire [2:0]xbar_to_m00_couplers_ARPROT;
  wire [3:0]xbar_to_m00_couplers_ARQOS;
  wire xbar_to_m00_couplers_ARREADY;
  wire [3:0]xbar_to_m00_couplers_ARREGION;
  wire [2:0]xbar_to_m00_couplers_ARSIZE;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [1:0]xbar_to_m00_couplers_AWBURST;
  wire [3:0]xbar_to_m00_couplers_AWCACHE;
  wire [0:0]xbar_to_m00_couplers_AWID;
  wire [7:0]xbar_to_m00_couplers_AWLEN;
  wire [0:0]xbar_to_m00_couplers_AWLOCK;
  wire [2:0]xbar_to_m00_couplers_AWPROT;
  wire [3:0]xbar_to_m00_couplers_AWQOS;
  wire xbar_to_m00_couplers_AWREADY;
  wire [3:0]xbar_to_m00_couplers_AWREGION;
  wire [2:0]xbar_to_m00_couplers_AWSIZE;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [63:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RID;
  wire xbar_to_m00_couplers_RLAST;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [63:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WLAST;
  wire xbar_to_m00_couplers_WREADY;
  wire [7:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [1:0]NLW_xbar_s_axi_awready_UNCONNECTED;
  wire [3:0]NLW_xbar_s_axi_bresp_UNCONNECTED;
  wire [1:0]NLW_xbar_s_axi_bvalid_UNCONNECTED;
  wire [1:0]NLW_xbar_s_axi_wready_UNCONNECTED;

  assign M00_AXI_araddr[31:0] = m00_couplers_to_axi_interconnect_0_ARADDR;
  assign M00_AXI_arburst[1:0] = m00_couplers_to_axi_interconnect_0_ARBURST;
  assign M00_AXI_arcache[3:0] = m00_couplers_to_axi_interconnect_0_ARCACHE;
  assign M00_AXI_arid[0] = m00_couplers_to_axi_interconnect_0_ARID;
  assign M00_AXI_arlen[3:0] = m00_couplers_to_axi_interconnect_0_ARLEN;
  assign M00_AXI_arlock[1:0] = m00_couplers_to_axi_interconnect_0_ARLOCK;
  assign M00_AXI_arprot[2:0] = m00_couplers_to_axi_interconnect_0_ARPROT;
  assign M00_AXI_arqos[3:0] = m00_couplers_to_axi_interconnect_0_ARQOS;
  assign M00_AXI_arsize[2:0] = m00_couplers_to_axi_interconnect_0_ARSIZE;
  assign M00_AXI_arvalid = m00_couplers_to_axi_interconnect_0_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_axi_interconnect_0_AWADDR;
  assign M00_AXI_awburst[1:0] = m00_couplers_to_axi_interconnect_0_AWBURST;
  assign M00_AXI_awcache[3:0] = m00_couplers_to_axi_interconnect_0_AWCACHE;
  assign M00_AXI_awid[0] = m00_couplers_to_axi_interconnect_0_AWID;
  assign M00_AXI_awlen[3:0] = m00_couplers_to_axi_interconnect_0_AWLEN;
  assign M00_AXI_awlock[1:0] = m00_couplers_to_axi_interconnect_0_AWLOCK;
  assign M00_AXI_awprot[2:0] = m00_couplers_to_axi_interconnect_0_AWPROT;
  assign M00_AXI_awqos[3:0] = m00_couplers_to_axi_interconnect_0_AWQOS;
  assign M00_AXI_awsize[2:0] = m00_couplers_to_axi_interconnect_0_AWSIZE;
  assign M00_AXI_awvalid = m00_couplers_to_axi_interconnect_0_AWVALID;
  assign M00_AXI_bready = m00_couplers_to_axi_interconnect_0_BREADY;
  assign M00_AXI_rready = m00_couplers_to_axi_interconnect_0_RREADY;
  assign M00_AXI_wdata[63:0] = m00_couplers_to_axi_interconnect_0_WDATA;
  assign M00_AXI_wid[0] = m00_couplers_to_axi_interconnect_0_WID;
  assign M00_AXI_wlast = m00_couplers_to_axi_interconnect_0_WLAST;
  assign M00_AXI_wstrb[7:0] = m00_couplers_to_axi_interconnect_0_WSTRB;
  assign M00_AXI_wvalid = m00_couplers_to_axi_interconnect_0_WVALID;
  assign S00_AXI_arready[0] = axi_interconnect_0_to_s00_couplers_ARREADY;
  assign S00_AXI_rdata[63:0] = axi_interconnect_0_to_s00_couplers_RDATA;
  assign S00_AXI_rlast[0] = axi_interconnect_0_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_interconnect_0_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid[0] = axi_interconnect_0_to_s00_couplers_RVALID;
  assign S01_AXI_awready[0] = axi_interconnect_0_to_s01_couplers_AWREADY;
  assign S01_AXI_bresp[1:0] = axi_interconnect_0_to_s01_couplers_BRESP;
  assign S01_AXI_bvalid[0] = axi_interconnect_0_to_s01_couplers_BVALID;
  assign S01_AXI_wready[0] = axi_interconnect_0_to_s01_couplers_WREADY;
  assign axi_interconnect_0_ACLK_net = ACLK;
  assign axi_interconnect_0_ARESETN_net = ARESETN;
  assign axi_interconnect_0_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign axi_interconnect_0_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_interconnect_0_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_interconnect_0_to_s00_couplers_ARLEN = S00_AXI_arlen[7:0];
  assign axi_interconnect_0_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_interconnect_0_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_interconnect_0_to_s00_couplers_ARVALID = S00_AXI_arvalid[0];
  assign axi_interconnect_0_to_s00_couplers_RREADY = S00_AXI_rready[0];
  assign axi_interconnect_0_to_s01_couplers_AWADDR = S01_AXI_awaddr[31:0];
  assign axi_interconnect_0_to_s01_couplers_AWBURST = S01_AXI_awburst[1:0];
  assign axi_interconnect_0_to_s01_couplers_AWCACHE = S01_AXI_awcache[3:0];
  assign axi_interconnect_0_to_s01_couplers_AWLEN = S01_AXI_awlen[7:0];
  assign axi_interconnect_0_to_s01_couplers_AWPROT = S01_AXI_awprot[2:0];
  assign axi_interconnect_0_to_s01_couplers_AWSIZE = S01_AXI_awsize[2:0];
  assign axi_interconnect_0_to_s01_couplers_AWVALID = S01_AXI_awvalid[0];
  assign axi_interconnect_0_to_s01_couplers_BREADY = S01_AXI_bready[0];
  assign axi_interconnect_0_to_s01_couplers_WDATA = S01_AXI_wdata[63:0];
  assign axi_interconnect_0_to_s01_couplers_WLAST = S01_AXI_wlast[0];
  assign axi_interconnect_0_to_s01_couplers_WSTRB = S01_AXI_wstrb[7:0];
  assign axi_interconnect_0_to_s01_couplers_WVALID = S01_AXI_wvalid[0];
  assign m00_couplers_to_axi_interconnect_0_ARREADY = M00_AXI_arready;
  assign m00_couplers_to_axi_interconnect_0_AWREADY = M00_AXI_awready;
  assign m00_couplers_to_axi_interconnect_0_BID = M00_AXI_bid[5:0];
  assign m00_couplers_to_axi_interconnect_0_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_axi_interconnect_0_BVALID = M00_AXI_bvalid;
  assign m00_couplers_to_axi_interconnect_0_RDATA = M00_AXI_rdata[63:0];
  assign m00_couplers_to_axi_interconnect_0_RID = M00_AXI_rid[5:0];
  assign m00_couplers_to_axi_interconnect_0_RLAST = M00_AXI_rlast;
  assign m00_couplers_to_axi_interconnect_0_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_axi_interconnect_0_RVALID = M00_AXI_rvalid;
  assign m00_couplers_to_axi_interconnect_0_WREADY = M00_AXI_wready;
  m00_couplers_imp_XVL3MG m00_couplers
       (.M_ACLK(axi_interconnect_0_ACLK_net),
        .M_ARESETN(axi_interconnect_0_ARESETN_net),
        .M_AXI_araddr(m00_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arburst(m00_couplers_to_axi_interconnect_0_ARBURST),
        .M_AXI_arcache(m00_couplers_to_axi_interconnect_0_ARCACHE),
        .M_AXI_arid(m00_couplers_to_axi_interconnect_0_ARID),
        .M_AXI_arlen(m00_couplers_to_axi_interconnect_0_ARLEN),
        .M_AXI_arlock(m00_couplers_to_axi_interconnect_0_ARLOCK),
        .M_AXI_arprot(m00_couplers_to_axi_interconnect_0_ARPROT),
        .M_AXI_arqos(m00_couplers_to_axi_interconnect_0_ARQOS),
        .M_AXI_arready(m00_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arsize(m00_couplers_to_axi_interconnect_0_ARSIZE),
        .M_AXI_arvalid(m00_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awburst(m00_couplers_to_axi_interconnect_0_AWBURST),
        .M_AXI_awcache(m00_couplers_to_axi_interconnect_0_AWCACHE),
        .M_AXI_awid(m00_couplers_to_axi_interconnect_0_AWID),
        .M_AXI_awlen(m00_couplers_to_axi_interconnect_0_AWLEN),
        .M_AXI_awlock(m00_couplers_to_axi_interconnect_0_AWLOCK),
        .M_AXI_awprot(m00_couplers_to_axi_interconnect_0_AWPROT),
        .M_AXI_awqos(m00_couplers_to_axi_interconnect_0_AWQOS),
        .M_AXI_awready(m00_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awsize(m00_couplers_to_axi_interconnect_0_AWSIZE),
        .M_AXI_awvalid(m00_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bid(m00_couplers_to_axi_interconnect_0_BID),
        .M_AXI_bready(m00_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m00_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m00_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m00_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rid(m00_couplers_to_axi_interconnect_0_RID),
        .M_AXI_rlast(m00_couplers_to_axi_interconnect_0_RLAST),
        .M_AXI_rready(m00_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m00_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m00_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m00_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wid(m00_couplers_to_axi_interconnect_0_WID),
        .M_AXI_wlast(m00_couplers_to_axi_interconnect_0_WLAST),
        .M_AXI_wready(m00_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m00_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m00_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m00_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m00_couplers_ARID),
        .S_AXI_arlen(xbar_to_m00_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m00_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m00_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m00_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m00_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m00_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m00_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m00_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m00_couplers_AWID),
        .S_AXI_awlen(xbar_to_m00_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m00_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m00_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m00_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m00_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m00_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m00_couplers_BID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rid(xbar_to_m00_couplers_RID),
        .S_AXI_rlast(xbar_to_m00_couplers_RLAST),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m00_couplers_WLAST),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  s00_couplers_imp_10E0L3U s00_couplers
       (.M_ACLK(axi_interconnect_0_ACLK_net),
        .M_ARESETN(axi_interconnect_0_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arburst(s00_couplers_to_xbar_ARBURST),
        .M_AXI_arcache(s00_couplers_to_xbar_ARCACHE),
        .M_AXI_arlen(s00_couplers_to_xbar_ARLEN),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arsize(s00_couplers_to_xbar_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rlast(s00_couplers_to_xbar_RLAST),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(axi_interconnect_0_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_interconnect_0_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_interconnect_0_to_s00_couplers_ARCACHE),
        .S_AXI_arlen(axi_interconnect_0_to_s00_couplers_ARLEN),
        .S_AXI_arprot(axi_interconnect_0_to_s00_couplers_ARPROT),
        .S_AXI_arready(axi_interconnect_0_to_s00_couplers_ARREADY),
        .S_AXI_arsize(axi_interconnect_0_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(axi_interconnect_0_to_s00_couplers_ARVALID),
        .S_AXI_rdata(axi_interconnect_0_to_s00_couplers_RDATA),
        .S_AXI_rlast(axi_interconnect_0_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_interconnect_0_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_interconnect_0_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_interconnect_0_to_s00_couplers_RVALID));
  s01_couplers_imp_U3CHFF s01_couplers
       (.M_ACLK(axi_interconnect_0_ACLK_net),
        .M_ARESETN(axi_interconnect_0_ARESETN_net),
        .M_AXI_awaddr(s01_couplers_to_xbar_AWADDR),
        .M_AXI_awburst(s01_couplers_to_xbar_AWBURST),
        .M_AXI_awcache(s01_couplers_to_xbar_AWCACHE),
        .M_AXI_awlen(s01_couplers_to_xbar_AWLEN),
        .M_AXI_awprot(s01_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s01_couplers_to_xbar_AWREADY),
        .M_AXI_awsize(s01_couplers_to_xbar_AWSIZE),
        .M_AXI_awvalid(s01_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s01_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s01_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s01_couplers_to_xbar_BVALID),
        .M_AXI_wdata(s01_couplers_to_xbar_WDATA),
        .M_AXI_wlast(s01_couplers_to_xbar_WLAST),
        .M_AXI_wready(s01_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s01_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s01_couplers_to_xbar_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_awaddr(axi_interconnect_0_to_s01_couplers_AWADDR),
        .S_AXI_awburst(axi_interconnect_0_to_s01_couplers_AWBURST),
        .S_AXI_awcache(axi_interconnect_0_to_s01_couplers_AWCACHE),
        .S_AXI_awlen(axi_interconnect_0_to_s01_couplers_AWLEN),
        .S_AXI_awprot(axi_interconnect_0_to_s01_couplers_AWPROT),
        .S_AXI_awready(axi_interconnect_0_to_s01_couplers_AWREADY),
        .S_AXI_awsize(axi_interconnect_0_to_s01_couplers_AWSIZE),
        .S_AXI_awvalid(axi_interconnect_0_to_s01_couplers_AWVALID),
        .S_AXI_bready(axi_interconnect_0_to_s01_couplers_BREADY),
        .S_AXI_bresp(axi_interconnect_0_to_s01_couplers_BRESP),
        .S_AXI_bvalid(axi_interconnect_0_to_s01_couplers_BVALID),
        .S_AXI_wdata(axi_interconnect_0_to_s01_couplers_WDATA),
        .S_AXI_wlast(axi_interconnect_0_to_s01_couplers_WLAST),
        .S_AXI_wready(axi_interconnect_0_to_s01_couplers_WREADY),
        .S_AXI_wstrb(axi_interconnect_0_to_s01_couplers_WSTRB),
        .S_AXI_wvalid(axi_interconnect_0_to_s01_couplers_WVALID));
  design_1_xbar_2 xbar
       (.aclk(axi_interconnect_0_ACLK_net),
        .aresetn(axi_interconnect_0_ARESETN_net),
        .m_axi_araddr(xbar_to_m00_couplers_ARADDR),
        .m_axi_arburst(xbar_to_m00_couplers_ARBURST),
        .m_axi_arcache(xbar_to_m00_couplers_ARCACHE),
        .m_axi_arid(xbar_to_m00_couplers_ARID),
        .m_axi_arlen(xbar_to_m00_couplers_ARLEN),
        .m_axi_arlock(xbar_to_m00_couplers_ARLOCK),
        .m_axi_arprot(xbar_to_m00_couplers_ARPROT),
        .m_axi_arqos(xbar_to_m00_couplers_ARQOS),
        .m_axi_arready(xbar_to_m00_couplers_ARREADY),
        .m_axi_arregion(xbar_to_m00_couplers_ARREGION),
        .m_axi_arsize(xbar_to_m00_couplers_ARSIZE),
        .m_axi_arvalid(xbar_to_m00_couplers_ARVALID),
        .m_axi_awaddr(xbar_to_m00_couplers_AWADDR),
        .m_axi_awburst(xbar_to_m00_couplers_AWBURST),
        .m_axi_awcache(xbar_to_m00_couplers_AWCACHE),
        .m_axi_awid(xbar_to_m00_couplers_AWID),
        .m_axi_awlen(xbar_to_m00_couplers_AWLEN),
        .m_axi_awlock(xbar_to_m00_couplers_AWLOCK),
        .m_axi_awprot(xbar_to_m00_couplers_AWPROT),
        .m_axi_awqos(xbar_to_m00_couplers_AWQOS),
        .m_axi_awready(xbar_to_m00_couplers_AWREADY),
        .m_axi_awregion(xbar_to_m00_couplers_AWREGION),
        .m_axi_awsize(xbar_to_m00_couplers_AWSIZE),
        .m_axi_awvalid(xbar_to_m00_couplers_AWVALID),
        .m_axi_bid(xbar_to_m00_couplers_BID),
        .m_axi_bready(xbar_to_m00_couplers_BREADY),
        .m_axi_bresp(xbar_to_m00_couplers_BRESP),
        .m_axi_bvalid(xbar_to_m00_couplers_BVALID),
        .m_axi_rdata(xbar_to_m00_couplers_RDATA),
        .m_axi_rid(xbar_to_m00_couplers_RID),
        .m_axi_rlast(xbar_to_m00_couplers_RLAST),
        .m_axi_rready(xbar_to_m00_couplers_RREADY),
        .m_axi_rresp(xbar_to_m00_couplers_RRESP),
        .m_axi_rvalid(xbar_to_m00_couplers_RVALID),
        .m_axi_wdata(xbar_to_m00_couplers_WDATA),
        .m_axi_wlast(xbar_to_m00_couplers_WLAST),
        .m_axi_wready(xbar_to_m00_couplers_WREADY),
        .m_axi_wstrb(xbar_to_m00_couplers_WSTRB),
        .m_axi_wvalid(xbar_to_m00_couplers_WVALID),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARADDR}),
        .s_axi_arburst({1'b0,1'b0,s00_couplers_to_xbar_ARBURST}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARCACHE}),
        .s_axi_arid({1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARLEN}),
        .s_axi_arlock({1'b0,1'b0}),
        .s_axi_arprot({1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARPROT}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arsize({1'b0,1'b0,1'b1,s00_couplers_to_xbar_ARSIZE}),
        .s_axi_arvalid({1'b0,s00_couplers_to_xbar_ARVALID}),
        .s_axi_awaddr({s01_couplers_to_xbar_AWADDR,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({s01_couplers_to_xbar_AWBURST,1'b0,1'b1}),
        .s_axi_awcache({s01_couplers_to_xbar_AWCACHE,1'b0,1'b0,1'b1,1'b1}),
        .s_axi_awid({1'b0,1'b0}),
        .s_axi_awlen({s01_couplers_to_xbar_AWLEN,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock({1'b0,1'b0}),
        .s_axi_awprot({s01_couplers_to_xbar_AWPROT,1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready({s01_couplers_to_xbar_AWREADY,NLW_xbar_s_axi_awready_UNCONNECTED[0]}),
        .s_axi_awsize({s01_couplers_to_xbar_AWSIZE,1'b0,1'b1,1'b1}),
        .s_axi_awvalid({s01_couplers_to_xbar_AWVALID,1'b0}),
        .s_axi_bready({s01_couplers_to_xbar_BREADY,1'b0}),
        .s_axi_bresp({s01_couplers_to_xbar_BRESP,NLW_xbar_s_axi_bresp_UNCONNECTED[1:0]}),
        .s_axi_bvalid({s01_couplers_to_xbar_BVALID,NLW_xbar_s_axi_bvalid_UNCONNECTED[0]}),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rlast(s00_couplers_to_xbar_RLAST),
        .s_axi_rready({1'b0,s00_couplers_to_xbar_RREADY}),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata({s01_couplers_to_xbar_WDATA,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast({s01_couplers_to_xbar_WLAST,1'b0}),
        .s_axi_wready({s01_couplers_to_xbar_WREADY,NLW_xbar_s_axi_wready_UNCONNECTED[0]}),
        .s_axi_wstrb({s01_couplers_to_xbar_WSTRB,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axi_wvalid({s01_couplers_to_xbar_WVALID,1'b0}));
endmodule

module design_1_axi_interconnect_1_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wid,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  input [0:0]M00_AXI_arready;
  output [0:0]M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  input [0:0]M00_AXI_awready;
  output [0:0]M00_AXI_awvalid;
  output [0:0]M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input [0:0]M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output [0:0]M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input [0:0]M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input [0:0]M00_AXI_wready;
  output [0:0]M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [31:0]M01_AXI_araddr;
  input [0:0]M01_AXI_arready;
  output [0:0]M01_AXI_arvalid;
  output [31:0]M01_AXI_awaddr;
  input [0:0]M01_AXI_awready;
  output [0:0]M01_AXI_awvalid;
  output [0:0]M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input [0:0]M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output [0:0]M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input [0:0]M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input [0:0]M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output [0:0]M01_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [11:0]S00_AXI_arid;
  input [3:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [11:0]S00_AXI_awid;
  input [3:0]S00_AXI_awlen;
  input [1:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [11:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [11:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input [11:0]S00_AXI_wid;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire axi_interconnect_1_ACLK_net;
  wire axi_interconnect_1_ARESETN_net;
  wire [31:0]axi_interconnect_1_to_s00_couplers_ARADDR;
  wire [1:0]axi_interconnect_1_to_s00_couplers_ARBURST;
  wire [3:0]axi_interconnect_1_to_s00_couplers_ARCACHE;
  wire [11:0]axi_interconnect_1_to_s00_couplers_ARID;
  wire [3:0]axi_interconnect_1_to_s00_couplers_ARLEN;
  wire [1:0]axi_interconnect_1_to_s00_couplers_ARLOCK;
  wire [2:0]axi_interconnect_1_to_s00_couplers_ARPROT;
  wire [3:0]axi_interconnect_1_to_s00_couplers_ARQOS;
  wire axi_interconnect_1_to_s00_couplers_ARREADY;
  wire [2:0]axi_interconnect_1_to_s00_couplers_ARSIZE;
  wire axi_interconnect_1_to_s00_couplers_ARVALID;
  wire [31:0]axi_interconnect_1_to_s00_couplers_AWADDR;
  wire [1:0]axi_interconnect_1_to_s00_couplers_AWBURST;
  wire [3:0]axi_interconnect_1_to_s00_couplers_AWCACHE;
  wire [11:0]axi_interconnect_1_to_s00_couplers_AWID;
  wire [3:0]axi_interconnect_1_to_s00_couplers_AWLEN;
  wire [1:0]axi_interconnect_1_to_s00_couplers_AWLOCK;
  wire [2:0]axi_interconnect_1_to_s00_couplers_AWPROT;
  wire [3:0]axi_interconnect_1_to_s00_couplers_AWQOS;
  wire axi_interconnect_1_to_s00_couplers_AWREADY;
  wire [2:0]axi_interconnect_1_to_s00_couplers_AWSIZE;
  wire axi_interconnect_1_to_s00_couplers_AWVALID;
  wire [11:0]axi_interconnect_1_to_s00_couplers_BID;
  wire axi_interconnect_1_to_s00_couplers_BREADY;
  wire [1:0]axi_interconnect_1_to_s00_couplers_BRESP;
  wire axi_interconnect_1_to_s00_couplers_BVALID;
  wire [31:0]axi_interconnect_1_to_s00_couplers_RDATA;
  wire [11:0]axi_interconnect_1_to_s00_couplers_RID;
  wire axi_interconnect_1_to_s00_couplers_RLAST;
  wire axi_interconnect_1_to_s00_couplers_RREADY;
  wire [1:0]axi_interconnect_1_to_s00_couplers_RRESP;
  wire axi_interconnect_1_to_s00_couplers_RVALID;
  wire [31:0]axi_interconnect_1_to_s00_couplers_WDATA;
  wire [11:0]axi_interconnect_1_to_s00_couplers_WID;
  wire axi_interconnect_1_to_s00_couplers_WLAST;
  wire axi_interconnect_1_to_s00_couplers_WREADY;
  wire [3:0]axi_interconnect_1_to_s00_couplers_WSTRB;
  wire axi_interconnect_1_to_s00_couplers_WVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_1_ARADDR;
  wire [0:0]m00_couplers_to_axi_interconnect_1_ARREADY;
  wire [0:0]m00_couplers_to_axi_interconnect_1_ARVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_1_AWADDR;
  wire [0:0]m00_couplers_to_axi_interconnect_1_AWREADY;
  wire [0:0]m00_couplers_to_axi_interconnect_1_AWVALID;
  wire [0:0]m00_couplers_to_axi_interconnect_1_BREADY;
  wire [1:0]m00_couplers_to_axi_interconnect_1_BRESP;
  wire [0:0]m00_couplers_to_axi_interconnect_1_BVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_1_RDATA;
  wire [0:0]m00_couplers_to_axi_interconnect_1_RREADY;
  wire [1:0]m00_couplers_to_axi_interconnect_1_RRESP;
  wire [0:0]m00_couplers_to_axi_interconnect_1_RVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_1_WDATA;
  wire [0:0]m00_couplers_to_axi_interconnect_1_WREADY;
  wire [0:0]m00_couplers_to_axi_interconnect_1_WVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_1_ARADDR;
  wire [0:0]m01_couplers_to_axi_interconnect_1_ARREADY;
  wire [0:0]m01_couplers_to_axi_interconnect_1_ARVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_1_AWADDR;
  wire [0:0]m01_couplers_to_axi_interconnect_1_AWREADY;
  wire [0:0]m01_couplers_to_axi_interconnect_1_AWVALID;
  wire [0:0]m01_couplers_to_axi_interconnect_1_BREADY;
  wire [1:0]m01_couplers_to_axi_interconnect_1_BRESP;
  wire [0:0]m01_couplers_to_axi_interconnect_1_BVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_1_RDATA;
  wire [0:0]m01_couplers_to_axi_interconnect_1_RREADY;
  wire [1:0]m01_couplers_to_axi_interconnect_1_RRESP;
  wire [0:0]m01_couplers_to_axi_interconnect_1_RVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_1_WDATA;
  wire [0:0]m01_couplers_to_axi_interconnect_1_WREADY;
  wire [3:0]m01_couplers_to_axi_interconnect_1_WSTRB;
  wire [0:0]m01_couplers_to_axi_interconnect_1_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire s00_couplers_to_xbar_AWVALID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [0:0]xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [0:0]xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire [0:0]xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire [0:0]xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WREADY;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [63:32]xbar_to_m01_couplers_ARADDR;
  wire [0:0]xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [63:32]xbar_to_m01_couplers_AWADDR;
  wire [0:0]xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire [0:0]xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire [0:0]xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire [0:0]xbar_to_m01_couplers_WREADY;
  wire [7:4]xbar_to_m01_couplers_WSTRB;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [7:0]NLW_xbar_m_axi_wstrb_UNCONNECTED;

  assign M00_AXI_araddr[31:0] = m00_couplers_to_axi_interconnect_1_ARADDR;
  assign M00_AXI_arvalid[0] = m00_couplers_to_axi_interconnect_1_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_axi_interconnect_1_AWADDR;
  assign M00_AXI_awvalid[0] = m00_couplers_to_axi_interconnect_1_AWVALID;
  assign M00_AXI_bready[0] = m00_couplers_to_axi_interconnect_1_BREADY;
  assign M00_AXI_rready[0] = m00_couplers_to_axi_interconnect_1_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_axi_interconnect_1_WDATA;
  assign M00_AXI_wvalid[0] = m00_couplers_to_axi_interconnect_1_WVALID;
  assign M01_AXI_araddr[31:0] = m01_couplers_to_axi_interconnect_1_ARADDR;
  assign M01_AXI_arvalid[0] = m01_couplers_to_axi_interconnect_1_ARVALID;
  assign M01_AXI_awaddr[31:0] = m01_couplers_to_axi_interconnect_1_AWADDR;
  assign M01_AXI_awvalid[0] = m01_couplers_to_axi_interconnect_1_AWVALID;
  assign M01_AXI_bready[0] = m01_couplers_to_axi_interconnect_1_BREADY;
  assign M01_AXI_rready[0] = m01_couplers_to_axi_interconnect_1_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_axi_interconnect_1_WDATA;
  assign M01_AXI_wstrb[3:0] = m01_couplers_to_axi_interconnect_1_WSTRB;
  assign M01_AXI_wvalid[0] = m01_couplers_to_axi_interconnect_1_WVALID;
  assign S00_AXI_arready = axi_interconnect_1_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = axi_interconnect_1_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[11:0] = axi_interconnect_1_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = axi_interconnect_1_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = axi_interconnect_1_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = axi_interconnect_1_to_s00_couplers_RDATA;
  assign S00_AXI_rid[11:0] = axi_interconnect_1_to_s00_couplers_RID;
  assign S00_AXI_rlast = axi_interconnect_1_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_interconnect_1_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = axi_interconnect_1_to_s00_couplers_RVALID;
  assign S00_AXI_wready = axi_interconnect_1_to_s00_couplers_WREADY;
  assign axi_interconnect_1_ACLK_net = ACLK;
  assign axi_interconnect_1_ARESETN_net = ARESETN;
  assign axi_interconnect_1_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign axi_interconnect_1_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_interconnect_1_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_interconnect_1_to_s00_couplers_ARID = S00_AXI_arid[11:0];
  assign axi_interconnect_1_to_s00_couplers_ARLEN = S00_AXI_arlen[3:0];
  assign axi_interconnect_1_to_s00_couplers_ARLOCK = S00_AXI_arlock[1:0];
  assign axi_interconnect_1_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_interconnect_1_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign axi_interconnect_1_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_interconnect_1_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign axi_interconnect_1_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign axi_interconnect_1_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign axi_interconnect_1_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign axi_interconnect_1_to_s00_couplers_AWID = S00_AXI_awid[11:0];
  assign axi_interconnect_1_to_s00_couplers_AWLEN = S00_AXI_awlen[3:0];
  assign axi_interconnect_1_to_s00_couplers_AWLOCK = S00_AXI_awlock[1:0];
  assign axi_interconnect_1_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign axi_interconnect_1_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign axi_interconnect_1_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign axi_interconnect_1_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign axi_interconnect_1_to_s00_couplers_BREADY = S00_AXI_bready;
  assign axi_interconnect_1_to_s00_couplers_RREADY = S00_AXI_rready;
  assign axi_interconnect_1_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign axi_interconnect_1_to_s00_couplers_WID = S00_AXI_wid[11:0];
  assign axi_interconnect_1_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign axi_interconnect_1_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign axi_interconnect_1_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign m00_couplers_to_axi_interconnect_1_ARREADY = M00_AXI_arready[0];
  assign m00_couplers_to_axi_interconnect_1_AWREADY = M00_AXI_awready[0];
  assign m00_couplers_to_axi_interconnect_1_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_axi_interconnect_1_BVALID = M00_AXI_bvalid[0];
  assign m00_couplers_to_axi_interconnect_1_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_axi_interconnect_1_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_axi_interconnect_1_RVALID = M00_AXI_rvalid[0];
  assign m00_couplers_to_axi_interconnect_1_WREADY = M00_AXI_wready[0];
  assign m01_couplers_to_axi_interconnect_1_ARREADY = M01_AXI_arready[0];
  assign m01_couplers_to_axi_interconnect_1_AWREADY = M01_AXI_awready[0];
  assign m01_couplers_to_axi_interconnect_1_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_axi_interconnect_1_BVALID = M01_AXI_bvalid[0];
  assign m01_couplers_to_axi_interconnect_1_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_axi_interconnect_1_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_axi_interconnect_1_RVALID = M01_AXI_rvalid[0];
  assign m01_couplers_to_axi_interconnect_1_WREADY = M01_AXI_wready[0];
  m00_couplers_imp_UAOAC8 m00_couplers
       (.M_ACLK(axi_interconnect_1_ACLK_net),
        .M_ARESETN(axi_interconnect_1_ARESETN_net),
        .M_AXI_araddr(m00_couplers_to_axi_interconnect_1_ARADDR),
        .M_AXI_arready(m00_couplers_to_axi_interconnect_1_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_axi_interconnect_1_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_axi_interconnect_1_AWADDR),
        .M_AXI_awready(m00_couplers_to_axi_interconnect_1_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_axi_interconnect_1_AWVALID),
        .M_AXI_bready(m00_couplers_to_axi_interconnect_1_BREADY),
        .M_AXI_bresp(m00_couplers_to_axi_interconnect_1_BRESP),
        .M_AXI_bvalid(m00_couplers_to_axi_interconnect_1_BVALID),
        .M_AXI_rdata(m00_couplers_to_axi_interconnect_1_RDATA),
        .M_AXI_rready(m00_couplers_to_axi_interconnect_1_RREADY),
        .M_AXI_rresp(m00_couplers_to_axi_interconnect_1_RRESP),
        .M_AXI_rvalid(m00_couplers_to_axi_interconnect_1_RVALID),
        .M_AXI_wdata(m00_couplers_to_axi_interconnect_1_WDATA),
        .M_AXI_wready(m00_couplers_to_axi_interconnect_1_WREADY),
        .M_AXI_wvalid(m00_couplers_to_axi_interconnect_1_WVALID),
        .S_ACLK(axi_interconnect_1_ACLK_net),
        .S_ARESETN(axi_interconnect_1_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_106DJND m01_couplers
       (.M_ACLK(axi_interconnect_1_ACLK_net),
        .M_ARESETN(axi_interconnect_1_ARESETN_net),
        .M_AXI_araddr(m01_couplers_to_axi_interconnect_1_ARADDR),
        .M_AXI_arready(m01_couplers_to_axi_interconnect_1_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_axi_interconnect_1_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_axi_interconnect_1_AWADDR),
        .M_AXI_awready(m01_couplers_to_axi_interconnect_1_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_axi_interconnect_1_AWVALID),
        .M_AXI_bready(m01_couplers_to_axi_interconnect_1_BREADY),
        .M_AXI_bresp(m01_couplers_to_axi_interconnect_1_BRESP),
        .M_AXI_bvalid(m01_couplers_to_axi_interconnect_1_BVALID),
        .M_AXI_rdata(m01_couplers_to_axi_interconnect_1_RDATA),
        .M_AXI_rready(m01_couplers_to_axi_interconnect_1_RREADY),
        .M_AXI_rresp(m01_couplers_to_axi_interconnect_1_RRESP),
        .M_AXI_rvalid(m01_couplers_to_axi_interconnect_1_RVALID),
        .M_AXI_wdata(m01_couplers_to_axi_interconnect_1_WDATA),
        .M_AXI_wready(m01_couplers_to_axi_interconnect_1_WREADY),
        .M_AXI_wstrb(m01_couplers_to_axi_interconnect_1_WSTRB),
        .M_AXI_wvalid(m01_couplers_to_axi_interconnect_1_WVALID),
        .S_ACLK(axi_interconnect_1_ACLK_net),
        .S_ARESETN(axi_interconnect_1_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m01_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  s00_couplers_imp_152VTAY s00_couplers
       (.M_ACLK(axi_interconnect_1_ACLK_net),
        .M_ARESETN(axi_interconnect_1_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(axi_interconnect_1_ACLK_net),
        .S_ARESETN(axi_interconnect_1_ARESETN_net),
        .S_AXI_araddr(axi_interconnect_1_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_interconnect_1_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_interconnect_1_to_s00_couplers_ARCACHE),
        .S_AXI_arid(axi_interconnect_1_to_s00_couplers_ARID),
        .S_AXI_arlen(axi_interconnect_1_to_s00_couplers_ARLEN),
        .S_AXI_arlock(axi_interconnect_1_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(axi_interconnect_1_to_s00_couplers_ARPROT),
        .S_AXI_arqos(axi_interconnect_1_to_s00_couplers_ARQOS),
        .S_AXI_arready(axi_interconnect_1_to_s00_couplers_ARREADY),
        .S_AXI_arsize(axi_interconnect_1_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(axi_interconnect_1_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(axi_interconnect_1_to_s00_couplers_AWADDR),
        .S_AXI_awburst(axi_interconnect_1_to_s00_couplers_AWBURST),
        .S_AXI_awcache(axi_interconnect_1_to_s00_couplers_AWCACHE),
        .S_AXI_awid(axi_interconnect_1_to_s00_couplers_AWID),
        .S_AXI_awlen(axi_interconnect_1_to_s00_couplers_AWLEN),
        .S_AXI_awlock(axi_interconnect_1_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(axi_interconnect_1_to_s00_couplers_AWPROT),
        .S_AXI_awqos(axi_interconnect_1_to_s00_couplers_AWQOS),
        .S_AXI_awready(axi_interconnect_1_to_s00_couplers_AWREADY),
        .S_AXI_awsize(axi_interconnect_1_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(axi_interconnect_1_to_s00_couplers_AWVALID),
        .S_AXI_bid(axi_interconnect_1_to_s00_couplers_BID),
        .S_AXI_bready(axi_interconnect_1_to_s00_couplers_BREADY),
        .S_AXI_bresp(axi_interconnect_1_to_s00_couplers_BRESP),
        .S_AXI_bvalid(axi_interconnect_1_to_s00_couplers_BVALID),
        .S_AXI_rdata(axi_interconnect_1_to_s00_couplers_RDATA),
        .S_AXI_rid(axi_interconnect_1_to_s00_couplers_RID),
        .S_AXI_rlast(axi_interconnect_1_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_interconnect_1_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_interconnect_1_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_interconnect_1_to_s00_couplers_RVALID),
        .S_AXI_wdata(axi_interconnect_1_to_s00_couplers_WDATA),
        .S_AXI_wid(axi_interconnect_1_to_s00_couplers_WID),
        .S_AXI_wlast(axi_interconnect_1_to_s00_couplers_WLAST),
        .S_AXI_wready(axi_interconnect_1_to_s00_couplers_WREADY),
        .S_AXI_wstrb(axi_interconnect_1_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(axi_interconnect_1_to_s00_couplers_WVALID));
  design_1_xbar_3 xbar
       (.aclk(axi_interconnect_1_ACLK_net),
        .aresetn(axi_interconnect_1_ARESETN_net),
        .m_axi_araddr({xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arready({xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awready({xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m01_couplers_WSTRB,NLW_xbar_m_axi_wstrb_UNCONNECTED[3:0]}),
        .m_axi_wvalid({xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module m00_couplers_imp_UAOAC8
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m00_couplers_to_m00_couplers_ARADDR;
  wire [0:0]m00_couplers_to_m00_couplers_ARREADY;
  wire [0:0]m00_couplers_to_m00_couplers_ARVALID;
  wire [31:0]m00_couplers_to_m00_couplers_AWADDR;
  wire [0:0]m00_couplers_to_m00_couplers_AWREADY;
  wire [0:0]m00_couplers_to_m00_couplers_AWVALID;
  wire [0:0]m00_couplers_to_m00_couplers_BREADY;
  wire [1:0]m00_couplers_to_m00_couplers_BRESP;
  wire [0:0]m00_couplers_to_m00_couplers_BVALID;
  wire [31:0]m00_couplers_to_m00_couplers_RDATA;
  wire [0:0]m00_couplers_to_m00_couplers_RREADY;
  wire [1:0]m00_couplers_to_m00_couplers_RRESP;
  wire [0:0]m00_couplers_to_m00_couplers_RVALID;
  wire [31:0]m00_couplers_to_m00_couplers_WDATA;
  wire [0:0]m00_couplers_to_m00_couplers_WREADY;
  wire [0:0]m00_couplers_to_m00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m00_couplers_to_m00_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m00_couplers_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m00_couplers_to_m00_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m00_couplers_to_m00_couplers_AWVALID;
  assign M_AXI_bready[0] = m00_couplers_to_m00_couplers_BREADY;
  assign M_AXI_rready[0] = m00_couplers_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_couplers_to_m00_couplers_WDATA;
  assign M_AXI_wvalid[0] = m00_couplers_to_m00_couplers_WVALID;
  assign S_AXI_arready[0] = m00_couplers_to_m00_couplers_ARREADY;
  assign S_AXI_awready[0] = m00_couplers_to_m00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_couplers_BRESP;
  assign S_AXI_bvalid[0] = m00_couplers_to_m00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_couplers_RRESP;
  assign S_AXI_rvalid[0] = m00_couplers_to_m00_couplers_RVALID;
  assign S_AXI_wready[0] = m00_couplers_to_m00_couplers_WREADY;
  assign m00_couplers_to_m00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_m00_couplers_ARREADY = M_AXI_arready[0];
  assign m00_couplers_to_m00_couplers_ARVALID = S_AXI_arvalid[0];
  assign m00_couplers_to_m00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_m00_couplers_AWREADY = M_AXI_awready[0];
  assign m00_couplers_to_m00_couplers_AWVALID = S_AXI_awvalid[0];
  assign m00_couplers_to_m00_couplers_BREADY = S_AXI_bready[0];
  assign m00_couplers_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_couplers_to_m00_couplers_BVALID = M_AXI_bvalid[0];
  assign m00_couplers_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_couplers_to_m00_couplers_RREADY = S_AXI_rready[0];
  assign m00_couplers_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_couplers_to_m00_couplers_RVALID = M_AXI_rvalid[0];
  assign m00_couplers_to_m00_couplers_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_couplers_WREADY = M_AXI_wready[0];
  assign m00_couplers_to_m00_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m00_couplers_imp_XVL3MG
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wid,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [0:0]M_AXI_arid;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [0:0]M_AXI_awid;
  output [3:0]M_AXI_awlen;
  output [1:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [5:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [63:0]M_AXI_rdata;
  input [5:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [63:0]M_AXI_wdata;
  output [0:0]M_AXI_wid;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [7:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [0:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [0:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [0:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [63:0]S_AXI_rdata;
  output [0:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [63:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [7:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_m00_couplers_ARADDR;
  wire [1:0]auto_pc_to_m00_couplers_ARBURST;
  wire [3:0]auto_pc_to_m00_couplers_ARCACHE;
  wire [0:0]auto_pc_to_m00_couplers_ARID;
  wire [3:0]auto_pc_to_m00_couplers_ARLEN;
  wire [1:0]auto_pc_to_m00_couplers_ARLOCK;
  wire [2:0]auto_pc_to_m00_couplers_ARPROT;
  wire [3:0]auto_pc_to_m00_couplers_ARQOS;
  wire auto_pc_to_m00_couplers_ARREADY;
  wire [2:0]auto_pc_to_m00_couplers_ARSIZE;
  wire auto_pc_to_m00_couplers_ARVALID;
  wire [31:0]auto_pc_to_m00_couplers_AWADDR;
  wire [1:0]auto_pc_to_m00_couplers_AWBURST;
  wire [3:0]auto_pc_to_m00_couplers_AWCACHE;
  wire [0:0]auto_pc_to_m00_couplers_AWID;
  wire [3:0]auto_pc_to_m00_couplers_AWLEN;
  wire [1:0]auto_pc_to_m00_couplers_AWLOCK;
  wire [2:0]auto_pc_to_m00_couplers_AWPROT;
  wire [3:0]auto_pc_to_m00_couplers_AWQOS;
  wire auto_pc_to_m00_couplers_AWREADY;
  wire [2:0]auto_pc_to_m00_couplers_AWSIZE;
  wire auto_pc_to_m00_couplers_AWVALID;
  wire [5:0]auto_pc_to_m00_couplers_BID;
  wire auto_pc_to_m00_couplers_BREADY;
  wire [1:0]auto_pc_to_m00_couplers_BRESP;
  wire auto_pc_to_m00_couplers_BVALID;
  wire [63:0]auto_pc_to_m00_couplers_RDATA;
  wire [5:0]auto_pc_to_m00_couplers_RID;
  wire auto_pc_to_m00_couplers_RLAST;
  wire auto_pc_to_m00_couplers_RREADY;
  wire [1:0]auto_pc_to_m00_couplers_RRESP;
  wire auto_pc_to_m00_couplers_RVALID;
  wire [63:0]auto_pc_to_m00_couplers_WDATA;
  wire [0:0]auto_pc_to_m00_couplers_WID;
  wire auto_pc_to_m00_couplers_WLAST;
  wire auto_pc_to_m00_couplers_WREADY;
  wire [7:0]auto_pc_to_m00_couplers_WSTRB;
  wire auto_pc_to_m00_couplers_WVALID;
  wire [31:0]m00_couplers_to_auto_pc_ARADDR;
  wire [1:0]m00_couplers_to_auto_pc_ARBURST;
  wire [3:0]m00_couplers_to_auto_pc_ARCACHE;
  wire [0:0]m00_couplers_to_auto_pc_ARID;
  wire [7:0]m00_couplers_to_auto_pc_ARLEN;
  wire [0:0]m00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]m00_couplers_to_auto_pc_ARPROT;
  wire [3:0]m00_couplers_to_auto_pc_ARQOS;
  wire m00_couplers_to_auto_pc_ARREADY;
  wire [3:0]m00_couplers_to_auto_pc_ARREGION;
  wire [2:0]m00_couplers_to_auto_pc_ARSIZE;
  wire m00_couplers_to_auto_pc_ARVALID;
  wire [31:0]m00_couplers_to_auto_pc_AWADDR;
  wire [1:0]m00_couplers_to_auto_pc_AWBURST;
  wire [3:0]m00_couplers_to_auto_pc_AWCACHE;
  wire [0:0]m00_couplers_to_auto_pc_AWID;
  wire [7:0]m00_couplers_to_auto_pc_AWLEN;
  wire [0:0]m00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]m00_couplers_to_auto_pc_AWPROT;
  wire [3:0]m00_couplers_to_auto_pc_AWQOS;
  wire m00_couplers_to_auto_pc_AWREADY;
  wire [3:0]m00_couplers_to_auto_pc_AWREGION;
  wire [2:0]m00_couplers_to_auto_pc_AWSIZE;
  wire m00_couplers_to_auto_pc_AWVALID;
  wire [0:0]m00_couplers_to_auto_pc_BID;
  wire m00_couplers_to_auto_pc_BREADY;
  wire [1:0]m00_couplers_to_auto_pc_BRESP;
  wire m00_couplers_to_auto_pc_BVALID;
  wire [63:0]m00_couplers_to_auto_pc_RDATA;
  wire [0:0]m00_couplers_to_auto_pc_RID;
  wire m00_couplers_to_auto_pc_RLAST;
  wire m00_couplers_to_auto_pc_RREADY;
  wire [1:0]m00_couplers_to_auto_pc_RRESP;
  wire m00_couplers_to_auto_pc_RVALID;
  wire [63:0]m00_couplers_to_auto_pc_WDATA;
  wire m00_couplers_to_auto_pc_WLAST;
  wire m00_couplers_to_auto_pc_WREADY;
  wire [7:0]m00_couplers_to_auto_pc_WSTRB;
  wire m00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_m00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = auto_pc_to_m00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = auto_pc_to_m00_couplers_ARCACHE;
  assign M_AXI_arid[0] = auto_pc_to_m00_couplers_ARID;
  assign M_AXI_arlen[3:0] = auto_pc_to_m00_couplers_ARLEN;
  assign M_AXI_arlock[1:0] = auto_pc_to_m00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = auto_pc_to_m00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = auto_pc_to_m00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = auto_pc_to_m00_couplers_ARSIZE;
  assign M_AXI_arvalid = auto_pc_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_m00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = auto_pc_to_m00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = auto_pc_to_m00_couplers_AWCACHE;
  assign M_AXI_awid[0] = auto_pc_to_m00_couplers_AWID;
  assign M_AXI_awlen[3:0] = auto_pc_to_m00_couplers_AWLEN;
  assign M_AXI_awlock[1:0] = auto_pc_to_m00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = auto_pc_to_m00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = auto_pc_to_m00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = auto_pc_to_m00_couplers_AWSIZE;
  assign M_AXI_awvalid = auto_pc_to_m00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_m00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_m00_couplers_RREADY;
  assign M_AXI_wdata[63:0] = auto_pc_to_m00_couplers_WDATA;
  assign M_AXI_wid[0] = auto_pc_to_m00_couplers_WID;
  assign M_AXI_wlast = auto_pc_to_m00_couplers_WLAST;
  assign M_AXI_wstrb[7:0] = auto_pc_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_m00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = m00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[0] = m00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = m00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = m00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[63:0] = m00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[0] = m00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = m00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = m00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = m00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = m00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_m00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_m00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_m00_couplers_BID = M_AXI_bid[5:0];
  assign auto_pc_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_m00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_m00_couplers_RDATA = M_AXI_rdata[63:0];
  assign auto_pc_to_m00_couplers_RID = M_AXI_rid[5:0];
  assign auto_pc_to_m00_couplers_RLAST = M_AXI_rlast;
  assign auto_pc_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_m00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_m00_couplers_WREADY = M_AXI_wready;
  assign m00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign m00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign m00_couplers_to_auto_pc_ARID = S_AXI_arid[0];
  assign m00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[7:0];
  assign m00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[0];
  assign m00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign m00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign m00_couplers_to_auto_pc_ARREGION = S_AXI_arregion[3:0];
  assign m00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign m00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign m00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign m00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign m00_couplers_to_auto_pc_AWID = S_AXI_awid[0];
  assign m00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[7:0];
  assign m00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[0];
  assign m00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign m00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign m00_couplers_to_auto_pc_AWREGION = S_AXI_awregion[3:0];
  assign m00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign m00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign m00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign m00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign m00_couplers_to_auto_pc_WDATA = S_AXI_wdata[63:0];
  assign m00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign m00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[7:0];
  assign m00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  design_1_auto_pc_0 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_m00_couplers_ARADDR),
        .m_axi_arburst(auto_pc_to_m00_couplers_ARBURST),
        .m_axi_arcache(auto_pc_to_m00_couplers_ARCACHE),
        .m_axi_arid(auto_pc_to_m00_couplers_ARID),
        .m_axi_arlen(auto_pc_to_m00_couplers_ARLEN),
        .m_axi_arlock(auto_pc_to_m00_couplers_ARLOCK),
        .m_axi_arprot(auto_pc_to_m00_couplers_ARPROT),
        .m_axi_arqos(auto_pc_to_m00_couplers_ARQOS),
        .m_axi_arready(auto_pc_to_m00_couplers_ARREADY),
        .m_axi_arsize(auto_pc_to_m00_couplers_ARSIZE),
        .m_axi_arvalid(auto_pc_to_m00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_m00_couplers_AWADDR),
        .m_axi_awburst(auto_pc_to_m00_couplers_AWBURST),
        .m_axi_awcache(auto_pc_to_m00_couplers_AWCACHE),
        .m_axi_awid(auto_pc_to_m00_couplers_AWID),
        .m_axi_awlen(auto_pc_to_m00_couplers_AWLEN),
        .m_axi_awlock(auto_pc_to_m00_couplers_AWLOCK),
        .m_axi_awprot(auto_pc_to_m00_couplers_AWPROT),
        .m_axi_awqos(auto_pc_to_m00_couplers_AWQOS),
        .m_axi_awready(auto_pc_to_m00_couplers_AWREADY),
        .m_axi_awsize(auto_pc_to_m00_couplers_AWSIZE),
        .m_axi_awvalid(auto_pc_to_m00_couplers_AWVALID),
        .m_axi_bid(auto_pc_to_m00_couplers_BID[0]),
        .m_axi_bready(auto_pc_to_m00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_m00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_m00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_m00_couplers_RDATA),
        .m_axi_rid(auto_pc_to_m00_couplers_RID[0]),
        .m_axi_rlast(auto_pc_to_m00_couplers_RLAST),
        .m_axi_rready(auto_pc_to_m00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_m00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_m00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_m00_couplers_WDATA),
        .m_axi_wid(auto_pc_to_m00_couplers_WID),
        .m_axi_wlast(auto_pc_to_m00_couplers_WLAST),
        .m_axi_wready(auto_pc_to_m00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_m00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_m00_couplers_WVALID),
        .s_axi_araddr(m00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(m00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(m00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(m00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(m00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(m00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(m00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(m00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(m00_couplers_to_auto_pc_ARREADY),
        .s_axi_arregion(m00_couplers_to_auto_pc_ARREGION),
        .s_axi_arsize(m00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(m00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(m00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(m00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(m00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(m00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(m00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(m00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(m00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(m00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(m00_couplers_to_auto_pc_AWREADY),
        .s_axi_awregion(m00_couplers_to_auto_pc_AWREGION),
        .s_axi_awsize(m00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(m00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(m00_couplers_to_auto_pc_BID),
        .s_axi_bready(m00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(m00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(m00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(m00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(m00_couplers_to_auto_pc_RID),
        .s_axi_rlast(m00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(m00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(m00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(m00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(m00_couplers_to_auto_pc_WDATA),
        .s_axi_wlast(m00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(m00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(m00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(m00_couplers_to_auto_pc_WVALID));
endmodule

module m01_couplers_imp_106DJND
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m01_couplers_to_m01_couplers_ARADDR;
  wire [0:0]m01_couplers_to_m01_couplers_ARREADY;
  wire [0:0]m01_couplers_to_m01_couplers_ARVALID;
  wire [31:0]m01_couplers_to_m01_couplers_AWADDR;
  wire [0:0]m01_couplers_to_m01_couplers_AWREADY;
  wire [0:0]m01_couplers_to_m01_couplers_AWVALID;
  wire [0:0]m01_couplers_to_m01_couplers_BREADY;
  wire [1:0]m01_couplers_to_m01_couplers_BRESP;
  wire [0:0]m01_couplers_to_m01_couplers_BVALID;
  wire [31:0]m01_couplers_to_m01_couplers_RDATA;
  wire [0:0]m01_couplers_to_m01_couplers_RREADY;
  wire [1:0]m01_couplers_to_m01_couplers_RRESP;
  wire [0:0]m01_couplers_to_m01_couplers_RVALID;
  wire [31:0]m01_couplers_to_m01_couplers_WDATA;
  wire [0:0]m01_couplers_to_m01_couplers_WREADY;
  wire [3:0]m01_couplers_to_m01_couplers_WSTRB;
  wire [0:0]m01_couplers_to_m01_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m01_couplers_to_m01_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m01_couplers_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m01_couplers_to_m01_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m01_couplers_to_m01_couplers_AWVALID;
  assign M_AXI_bready[0] = m01_couplers_to_m01_couplers_BREADY;
  assign M_AXI_rready[0] = m01_couplers_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m01_couplers_to_m01_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m01_couplers_to_m01_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m01_couplers_to_m01_couplers_WVALID;
  assign S_AXI_arready[0] = m01_couplers_to_m01_couplers_ARREADY;
  assign S_AXI_awready[0] = m01_couplers_to_m01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m01_couplers_to_m01_couplers_BRESP;
  assign S_AXI_bvalid[0] = m01_couplers_to_m01_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_m01_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m01_couplers_to_m01_couplers_RRESP;
  assign S_AXI_rvalid[0] = m01_couplers_to_m01_couplers_RVALID;
  assign S_AXI_wready[0] = m01_couplers_to_m01_couplers_WREADY;
  assign m01_couplers_to_m01_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m01_couplers_to_m01_couplers_ARREADY = M_AXI_arready[0];
  assign m01_couplers_to_m01_couplers_ARVALID = S_AXI_arvalid[0];
  assign m01_couplers_to_m01_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m01_couplers_to_m01_couplers_AWREADY = M_AXI_awready[0];
  assign m01_couplers_to_m01_couplers_AWVALID = S_AXI_awvalid[0];
  assign m01_couplers_to_m01_couplers_BREADY = S_AXI_bready[0];
  assign m01_couplers_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign m01_couplers_to_m01_couplers_BVALID = M_AXI_bvalid[0];
  assign m01_couplers_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign m01_couplers_to_m01_couplers_RREADY = S_AXI_rready[0];
  assign m01_couplers_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign m01_couplers_to_m01_couplers_RVALID = M_AXI_rvalid[0];
  assign m01_couplers_to_m01_couplers_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_m01_couplers_WREADY = M_AXI_wready[0];
  assign m01_couplers_to_m01_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m01_couplers_to_m01_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module s00_couplers_imp_10E0L3U
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arlen,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_rdata,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [7:0]M_AXI_arlen;
  output [2:0]M_AXI_arprot;
  input [0:0]M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output [0:0]M_AXI_arvalid;
  input [63:0]M_AXI_rdata;
  input [0:0]M_AXI_rlast;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [7:0]S_AXI_arlen;
  input [2:0]S_AXI_arprot;
  output [0:0]S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input [0:0]S_AXI_arvalid;
  output [63:0]S_AXI_rdata;
  output [0:0]S_AXI_rlast;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;

  wire [31:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [1:0]s00_couplers_to_s00_couplers_ARBURST;
  wire [3:0]s00_couplers_to_s00_couplers_ARCACHE;
  wire [7:0]s00_couplers_to_s00_couplers_ARLEN;
  wire [2:0]s00_couplers_to_s00_couplers_ARPROT;
  wire [0:0]s00_couplers_to_s00_couplers_ARREADY;
  wire [2:0]s00_couplers_to_s00_couplers_ARSIZE;
  wire [0:0]s00_couplers_to_s00_couplers_ARVALID;
  wire [63:0]s00_couplers_to_s00_couplers_RDATA;
  wire [0:0]s00_couplers_to_s00_couplers_RLAST;
  wire [0:0]s00_couplers_to_s00_couplers_RREADY;
  wire [1:0]s00_couplers_to_s00_couplers_RRESP;
  wire [0:0]s00_couplers_to_s00_couplers_RVALID;

  assign M_AXI_araddr[31:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = s00_couplers_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = s00_couplers_to_s00_couplers_ARCACHE;
  assign M_AXI_arlen[7:0] = s00_couplers_to_s00_couplers_ARLEN;
  assign M_AXI_arprot[2:0] = s00_couplers_to_s00_couplers_ARPROT;
  assign M_AXI_arsize[2:0] = s00_couplers_to_s00_couplers_ARSIZE;
  assign M_AXI_arvalid[0] = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_rready[0] = s00_couplers_to_s00_couplers_RREADY;
  assign S_AXI_arready[0] = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_rdata[63:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rlast[0] = s00_couplers_to_s00_couplers_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_s00_couplers_RRESP;
  assign S_AXI_rvalid[0] = s00_couplers_to_s00_couplers_RVALID;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_s00_couplers_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_s00_couplers_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_s00_couplers_ARLEN = S_AXI_arlen[7:0];
  assign s00_couplers_to_s00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready[0];
  assign s00_couplers_to_s00_couplers_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid[0];
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[63:0];
  assign s00_couplers_to_s00_couplers_RLAST = M_AXI_rlast[0];
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready[0];
  assign s00_couplers_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid[0];
endmodule

module s00_couplers_imp_152VTAY
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wid,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [3:0]S_AXI_arlen;
  input [1:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [3:0]S_AXI_awlen;
  input [1:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input [11:0]S_AXI_wid;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_s00_couplers_ARADDR;
  wire [2:0]auto_pc_to_s00_couplers_ARPROT;
  wire auto_pc_to_s00_couplers_ARREADY;
  wire auto_pc_to_s00_couplers_ARVALID;
  wire [31:0]auto_pc_to_s00_couplers_AWADDR;
  wire [2:0]auto_pc_to_s00_couplers_AWPROT;
  wire auto_pc_to_s00_couplers_AWREADY;
  wire auto_pc_to_s00_couplers_AWVALID;
  wire auto_pc_to_s00_couplers_BREADY;
  wire [1:0]auto_pc_to_s00_couplers_BRESP;
  wire auto_pc_to_s00_couplers_BVALID;
  wire [31:0]auto_pc_to_s00_couplers_RDATA;
  wire auto_pc_to_s00_couplers_RREADY;
  wire [1:0]auto_pc_to_s00_couplers_RRESP;
  wire auto_pc_to_s00_couplers_RVALID;
  wire [31:0]auto_pc_to_s00_couplers_WDATA;
  wire auto_pc_to_s00_couplers_WREADY;
  wire [3:0]auto_pc_to_s00_couplers_WSTRB;
  wire auto_pc_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_auto_pc_ARADDR;
  wire [1:0]s00_couplers_to_auto_pc_ARBURST;
  wire [3:0]s00_couplers_to_auto_pc_ARCACHE;
  wire [11:0]s00_couplers_to_auto_pc_ARID;
  wire [3:0]s00_couplers_to_auto_pc_ARLEN;
  wire [1:0]s00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]s00_couplers_to_auto_pc_ARPROT;
  wire [3:0]s00_couplers_to_auto_pc_ARQOS;
  wire s00_couplers_to_auto_pc_ARREADY;
  wire [2:0]s00_couplers_to_auto_pc_ARSIZE;
  wire s00_couplers_to_auto_pc_ARVALID;
  wire [31:0]s00_couplers_to_auto_pc_AWADDR;
  wire [1:0]s00_couplers_to_auto_pc_AWBURST;
  wire [3:0]s00_couplers_to_auto_pc_AWCACHE;
  wire [11:0]s00_couplers_to_auto_pc_AWID;
  wire [3:0]s00_couplers_to_auto_pc_AWLEN;
  wire [1:0]s00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]s00_couplers_to_auto_pc_AWPROT;
  wire [3:0]s00_couplers_to_auto_pc_AWQOS;
  wire s00_couplers_to_auto_pc_AWREADY;
  wire [2:0]s00_couplers_to_auto_pc_AWSIZE;
  wire s00_couplers_to_auto_pc_AWVALID;
  wire [11:0]s00_couplers_to_auto_pc_BID;
  wire s00_couplers_to_auto_pc_BREADY;
  wire [1:0]s00_couplers_to_auto_pc_BRESP;
  wire s00_couplers_to_auto_pc_BVALID;
  wire [31:0]s00_couplers_to_auto_pc_RDATA;
  wire [11:0]s00_couplers_to_auto_pc_RID;
  wire s00_couplers_to_auto_pc_RLAST;
  wire s00_couplers_to_auto_pc_RREADY;
  wire [1:0]s00_couplers_to_auto_pc_RRESP;
  wire s00_couplers_to_auto_pc_RVALID;
  wire [31:0]s00_couplers_to_auto_pc_WDATA;
  wire [11:0]s00_couplers_to_auto_pc_WID;
  wire s00_couplers_to_auto_pc_WLAST;
  wire s00_couplers_to_auto_pc_WREADY;
  wire [3:0]s00_couplers_to_auto_pc_WSTRB;
  wire s00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = auto_pc_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid = auto_pc_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = auto_pc_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid = auto_pc_to_s00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = s00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[11:0] = s00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[11:0] = s00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = s00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = s00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_pc_ARID = S_AXI_arid[11:0];
  assign s00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[3:0];
  assign s00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[1:0];
  assign s00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_pc_AWID = S_AXI_awid[11:0];
  assign s00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[3:0];
  assign s00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[1:0];
  assign s00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign s00_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_auto_pc_WID = S_AXI_wid[11:0];
  assign s00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign s00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  design_1_auto_pc_1 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s00_couplers_ARADDR),
        .m_axi_arprot(auto_pc_to_s00_couplers_ARPROT),
        .m_axi_arready(auto_pc_to_s00_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_s00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_s00_couplers_AWADDR),
        .m_axi_awprot(auto_pc_to_s00_couplers_AWPROT),
        .m_axi_awready(auto_pc_to_s00_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_s00_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_s00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_s00_couplers_RDATA),
        .m_axi_rready(auto_pc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_s00_couplers_WDATA),
        .m_axi_wready(auto_pc_to_s00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s00_couplers_WVALID),
        .s_axi_araddr(s00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(s00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(s00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(s00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(s00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(s00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(s00_couplers_to_auto_pc_ARREADY),
        .s_axi_arsize(s00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(s00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(s00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(s00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(s00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(s00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(s00_couplers_to_auto_pc_AWREADY),
        .s_axi_awsize(s00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(s00_couplers_to_auto_pc_BID),
        .s_axi_bready(s00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(s00_couplers_to_auto_pc_RID),
        .s_axi_rlast(s00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_pc_WDATA),
        .s_axi_wid(s00_couplers_to_auto_pc_WID),
        .s_axi_wlast(s00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(s00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_pc_WVALID));
endmodule

module s01_couplers_imp_U3CHFF
   (M_ACLK,
    M_ARESETN,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awlen,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awlen,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [7:0]M_AXI_awlen;
  output [2:0]M_AXI_awprot;
  input [0:0]M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  output [63:0]M_AXI_wdata;
  output [0:0]M_AXI_wlast;
  input [0:0]M_AXI_wready;
  output [7:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [7:0]S_AXI_awlen;
  input [2:0]S_AXI_awprot;
  output [0:0]S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  input [63:0]S_AXI_wdata;
  input [0:0]S_AXI_wlast;
  output [0:0]S_AXI_wready;
  input [7:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]s01_couplers_to_s01_couplers_AWADDR;
  wire [1:0]s01_couplers_to_s01_couplers_AWBURST;
  wire [3:0]s01_couplers_to_s01_couplers_AWCACHE;
  wire [7:0]s01_couplers_to_s01_couplers_AWLEN;
  wire [2:0]s01_couplers_to_s01_couplers_AWPROT;
  wire [0:0]s01_couplers_to_s01_couplers_AWREADY;
  wire [2:0]s01_couplers_to_s01_couplers_AWSIZE;
  wire [0:0]s01_couplers_to_s01_couplers_AWVALID;
  wire [0:0]s01_couplers_to_s01_couplers_BREADY;
  wire [1:0]s01_couplers_to_s01_couplers_BRESP;
  wire [0:0]s01_couplers_to_s01_couplers_BVALID;
  wire [63:0]s01_couplers_to_s01_couplers_WDATA;
  wire [0:0]s01_couplers_to_s01_couplers_WLAST;
  wire [0:0]s01_couplers_to_s01_couplers_WREADY;
  wire [7:0]s01_couplers_to_s01_couplers_WSTRB;
  wire [0:0]s01_couplers_to_s01_couplers_WVALID;

  assign M_AXI_awaddr[31:0] = s01_couplers_to_s01_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = s01_couplers_to_s01_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = s01_couplers_to_s01_couplers_AWCACHE;
  assign M_AXI_awlen[7:0] = s01_couplers_to_s01_couplers_AWLEN;
  assign M_AXI_awprot[2:0] = s01_couplers_to_s01_couplers_AWPROT;
  assign M_AXI_awsize[2:0] = s01_couplers_to_s01_couplers_AWSIZE;
  assign M_AXI_awvalid[0] = s01_couplers_to_s01_couplers_AWVALID;
  assign M_AXI_bready[0] = s01_couplers_to_s01_couplers_BREADY;
  assign M_AXI_wdata[63:0] = s01_couplers_to_s01_couplers_WDATA;
  assign M_AXI_wlast[0] = s01_couplers_to_s01_couplers_WLAST;
  assign M_AXI_wstrb[7:0] = s01_couplers_to_s01_couplers_WSTRB;
  assign M_AXI_wvalid[0] = s01_couplers_to_s01_couplers_WVALID;
  assign S_AXI_awready[0] = s01_couplers_to_s01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = s01_couplers_to_s01_couplers_BRESP;
  assign S_AXI_bvalid[0] = s01_couplers_to_s01_couplers_BVALID;
  assign S_AXI_wready[0] = s01_couplers_to_s01_couplers_WREADY;
  assign s01_couplers_to_s01_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s01_couplers_to_s01_couplers_AWBURST = S_AXI_awburst[1:0];
  assign s01_couplers_to_s01_couplers_AWCACHE = S_AXI_awcache[3:0];
  assign s01_couplers_to_s01_couplers_AWLEN = S_AXI_awlen[7:0];
  assign s01_couplers_to_s01_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s01_couplers_to_s01_couplers_AWREADY = M_AXI_awready[0];
  assign s01_couplers_to_s01_couplers_AWSIZE = S_AXI_awsize[2:0];
  assign s01_couplers_to_s01_couplers_AWVALID = S_AXI_awvalid[0];
  assign s01_couplers_to_s01_couplers_BREADY = S_AXI_bready[0];
  assign s01_couplers_to_s01_couplers_BRESP = M_AXI_bresp[1:0];
  assign s01_couplers_to_s01_couplers_BVALID = M_AXI_bvalid[0];
  assign s01_couplers_to_s01_couplers_WDATA = S_AXI_wdata[63:0];
  assign s01_couplers_to_s01_couplers_WLAST = S_AXI_wlast[0];
  assign s01_couplers_to_s01_couplers_WREADY = M_AXI_wready[0];
  assign s01_couplers_to_s01_couplers_WSTRB = S_AXI_wstrb[7:0];
  assign s01_couplers_to_s01_couplers_WVALID = S_AXI_wvalid[0];
endmodule
