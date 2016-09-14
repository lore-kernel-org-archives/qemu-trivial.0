Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk6HQ-00014l-Py
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 05:14:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk6HI-0000xa-JK
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 05:14:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk6HE-0003ng-So
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 05:14:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52554)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk6H7-0003iO-MO; Wed, 14 Sep 2016 05:14:38 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D8D934183E;
	Wed, 14 Sep 2016 12:14:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 28AB3AF9;
	Wed, 14 Sep 2016 10:58:59 +0300 (MSK)
Received: (nullmailer pid 17345 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Ladi Prosek <lprosek@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:43 +0300
Message-Id: <6d945c74f9d851391f0cfcc5ef294d3b11708ebc.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 17/27] Remove unused function declarations
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2016 09:14:55 -0000

From: Ladi Prosek <lprosek@redhat.com>

Unused function declarations were found using a simple gcc plugin and
manually verified by grepping the sources.

Signed-off-by: Ladi Prosek <lprosek@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/qcow2.h                  | 1 -
 disas/sh4.c                    | 6 ------
 hw/ppc/ppc405.h                | 6 ------
 hw/s390x/virtio-ccw.h          | 1 -
 include/block/block.h          | 6 ------
 include/block/block_int.h      | 9 ---------
 include/hw/arm/pxa.h           | 1 -
 include/hw/bt.h                | 2 --
 include/hw/i386/pc.h           | 2 --
 include/hw/pci-host/spapr.h    | 2 --
 include/hw/pci/pci_bridge.h    | 1 -
 include/hw/pci/pcie_port.h     | 1 -
 include/hw/ppc/ppc4xx.h        | 6 ------
 include/hw/ppc/spapr.h         | 3 ---
 include/hw/ppc/spapr_vio.h     | 4 ----
 include/hw/scsi/scsi.h         | 1 -
 include/hw/virtio/virtio-bus.h | 3 ---
 include/migration/migration.h  | 2 --
 include/net/net.h              | 2 --
 include/qemu/bitmap.h          | 4 ----
 include/qemu/uri.h             | 2 --
 include/sysemu/kvm.h           | 2 --
 include/ui/console.h           | 2 --
 include/ui/input.h             | 2 --
 include/ui/spice-display.h     | 2 --
 target-alpha/cpu.h             | 1 -
 target-m68k/cpu.h              | 1 -
 target-ppc/cpu.h               | 2 --
 target-ppc/mmu-hash64.h        | 1 -
 target-s390x/cpu.h             | 2 --
 tcg/tcg.h                      | 2 --
 31 files changed, 82 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index b36a7bf..9ce5a37 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -530,7 +530,6 @@ int qcow2_change_refcount_order(BlockDriverState *bs, int refcount_order,
 int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
                         bool exact_size);
 int qcow2_write_l1_entry(BlockDriverState *bs, int l1_index);
-void qcow2_l2_cache_reset(BlockDriverState *bs);
 int qcow2_decompress_cluster(BlockDriverState *bs, uint64_t cluster_offset);
 int qcow2_encrypt_sectors(BDRVQcow2State *s, int64_t sector_num,
                           uint8_t *out_buf, const uint8_t *in_buf,
diff --git a/disas/sh4.c b/disas/sh4.c
index 8b0415d..6b66176 100644
--- a/disas/sh4.c
+++ b/disas/sh4.c
@@ -264,12 +264,6 @@ sh_dsp_reg_nums;
    be some confusion between DSP and FPU etc.  */
 #define SH_ARCH_UNKNOWN_ARCH 0xffffffff
 
-/* These are defined in bfd/cpu-sh.c .  */
-unsigned int sh_get_arch_from_bfd_mach (unsigned long mach);
-unsigned int sh_get_arch_up_from_bfd_mach (unsigned long mach);
-unsigned long sh_get_bfd_mach_from_arch_set (unsigned int arch_set);
-/* bfd_boolean sh_merge_bfd_arch (bfd *ibfd, bfd *obfd); */
-
 /* Below are the 'architecture sets'.
    They describe the following inheritance graph:
 
diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index c67febc..a9ffc87 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -71,11 +71,5 @@ CPUPPCState *ppc405ep_init(MemoryRegion *address_space_mem,
                         hwaddr ram_sizes[2],
                         uint32_t sysclk, qemu_irq **picp,
                         int do_init);
-/* IBM STBxxx microcontrollers */
-CPUPPCState *ppc_stb025_init (MemoryRegion ram_memories[2],
-                           hwaddr ram_bases[2],
-                           hwaddr ram_sizes[2],
-                           uint32_t sysclk, qemu_irq **picp,
-                           ram_addr_t *offsetp);
 
 #endif /* PPC405_H */
diff --git a/hw/s390x/virtio-ccw.h b/hw/s390x/virtio-ccw.h
index 904e357..b58ab21 100644
--- a/hw/s390x/virtio-ccw.h
+++ b/hw/s390x/virtio-ccw.h
@@ -183,7 +183,6 @@ typedef struct VirtIORNGCcw {
     VirtIORNG vdev;
 } VirtIORNGCcw;
 
-void virtio_ccw_device_update_status(SubchDev *sch);
 VirtIODevice *virtio_ccw_get_vdev(SubchDev *sch);
 
 #ifdef CONFIG_VIRTFS
diff --git a/include/block/block.h b/include/block/block.h
index 7edce5c..ffecebf 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -185,11 +185,6 @@ typedef enum BlockOpType {
     BLOCK_OP_TYPE_MAX,
 } BlockOpType;
 
-void bdrv_info_print(Monitor *mon, const QObject *data);
-void bdrv_info(Monitor *mon, QObject **ret_data);
-void bdrv_stats_print(Monitor *mon, const QObject *data);
-void bdrv_info_stats(Monitor *mon, QObject **ret_data);
-
 /* disk I/O throttling */
 void bdrv_init(void);
 void bdrv_init_with_whitelist(void);
@@ -393,7 +388,6 @@ bool bdrv_is_encrypted(BlockDriverState *bs);
 bool bdrv_key_required(BlockDriverState *bs);
 int bdrv_set_key(BlockDriverState *bs, const char *key);
 void bdrv_add_key(BlockDriverState *bs, const char *key, Error **errp);
-int bdrv_query_missing_keys(void);
 void bdrv_iterate_format(void (*it)(void *opaque, const char *name),
                          void *opaque);
 const char *bdrv_get_node_name(const BlockDriverState *bs);
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 713cea6..ef3c047 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -562,15 +562,6 @@ extern BlockDriver bdrv_file;
 extern BlockDriver bdrv_raw;
 extern BlockDriver bdrv_qcow2;
 
-/**
- * bdrv_setup_io_funcs:
- *
- * Prepare a #BlockDriver for I/O request processing by populating
- * unimplemented coroutine and AIO interfaces with generic wrapper functions
- * that fall back to implemented interfaces.
- */
-void bdrv_setup_io_funcs(BlockDriver *bdrv);
-
 int coroutine_fn bdrv_co_preadv(BdrvChild *child,
     int64_t offset, unsigned int bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags);
diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index dd1a48b..191e068 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -83,7 +83,6 @@ typedef struct PXA2xxLCDState PXA2xxLCDState;
 PXA2xxLCDState *pxa2xx_lcdc_init(MemoryRegion *sysmem,
                 hwaddr base, qemu_irq irq);
 void pxa2xx_lcd_vsync_notifier(PXA2xxLCDState *s, qemu_irq handler);
-void pxa2xx_lcdc_oritentation(void *opaque, int angle);
 
 /* pxa2xx_mmci.c */
 typedef struct PXA2xxMMCIState PXA2xxMMCIState;
diff --git a/include/hw/bt.h b/include/hw/bt.h
index 185e79d..963f330 100644
--- a/include/hw/bt.h
+++ b/include/hw/bt.h
@@ -174,8 +174,6 @@ enum bt_l2cap_psm_predef {
 void bt_l2cap_sdp_init(struct bt_l2cap_device_s *dev);
 
 /* bt-hid.c */
-struct bt_device_s *bt_mouse_init(struct bt_scatternet_s *net);
-struct bt_device_s *bt_tablet_init(struct bt_scatternet_s *net);
 struct bt_device_s *bt_keyboard_init(struct bt_scatternet_s *net);
 
 /* Link Management Protocol layer defines */
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index ebba151..ab8e319 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -216,7 +216,6 @@ void vmmouse_set_data(const uint32_t *data);
 /* pckbd.c */
 #define I8042_A20_LINE "a20"
 
-void i8042_init(qemu_irq kbd_irq, qemu_irq mouse_irq, uint32_t io_base);
 void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
                    MemoryRegion *region, ram_addr_t size,
                    hwaddr mask);
@@ -284,7 +283,6 @@ int cmos_get_fd_drive_type(FloppyDriveType fd0);
 I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
                       qemu_irq sci_irq, qemu_irq smi_irq,
                       int smm_enabled, DeviceState **piix4_pm);
-void piix4_smbus_register_device(SMBusDevice *dev, uint8_t addr);
 
 /* hpet.c */
 extern int no_hpet;
diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
index 5adc603..1a2b11b 100644
--- a/include/hw/pci-host/spapr.h
+++ b/include/hw/pci-host/spapr.h
@@ -106,8 +106,6 @@ int spapr_populate_pci_dt(sPAPRPHBState *phb,
                           uint32_t xics_phandle,
                           void *fdt);
 
-void spapr_pci_msi_init(sPAPRMachineState *spapr, hwaddr addr);
-
 void spapr_pci_rtas_init(void);
 
 sPAPRPHBState *spapr_pci_find_phb(sPAPRMachineState *spapr, uint64_t buid);
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index 847fd7d..d5891cd 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -45,7 +45,6 @@ void pci_bridge_update_mappings(PCIBridge *br);
 void pci_bridge_write_config(PCIDevice *d,
                              uint32_t address, uint32_t val, int len);
 void pci_bridge_disable_base_limit(PCIDevice *dev);
-void pci_bridge_reset_reg(PCIDevice *dev);
 void pci_bridge_reset(DeviceState *qdev);
 
 void pci_bridge_initfn(PCIDevice *pci_dev, const char *typename);
diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
index e167bf7..f7b64db 100644
--- a/include/hw/pci/pcie_port.h
+++ b/include/hw/pci/pcie_port.h
@@ -53,7 +53,6 @@ struct PCIESlot {
 };
 
 void pcie_chassis_create(uint8_t chassis_number);
-void pcie_main_chassis_create(void);
 PCIESlot *pcie_chassis_find_slot(uint8_t chassis, uint16_t slot);
 int pcie_chassis_add_slot(struct PCIESlot *slot);
 void pcie_chassis_del_slot(PCIESlot *s);
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 3b01ae8..66e57a5 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -55,10 +55,4 @@ void ppc4xx_sdram_init (CPUPPCState *env, qemu_irq irq, int nbanks,
 
 #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
 
-PCIBus *ppc4xx_pci_init(CPUPPCState *env, qemu_irq pci_irqs[4],
-                        hwaddr config_space,
-                        hwaddr int_ack,
-                        hwaddr special_cycle,
-                        hwaddr registers);
-
 #endif /* PPC4XX_H */
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index caf7be9..6289d50 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -368,9 +368,6 @@ void spapr_register_hypercall(target_ulong opcode, spapr_hcall_fn fn);
 target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
                              target_ulong *args);
 
-int spapr_allocate_irq(int hint, bool lsi);
-int spapr_allocate_irq_block(int num, bool lsi, bool msi);
-
 /* ibm,set-eeh-option */
 #define RTAS_EEH_DISABLE                 0
 #define RTAS_EEH_ENABLE                  1
diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index d4a1e2c..40d0e5f 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -85,8 +85,6 @@ extern VIOsPAPRDevice *spapr_vio_find_by_reg(VIOsPAPRBus *bus, uint32_t reg);
 extern int spapr_populate_vdevice(VIOsPAPRBus *bus, void *fdt);
 extern int spapr_populate_chosen_stdout(void *fdt, VIOsPAPRBus *bus);
 
-extern int spapr_vio_signal(VIOsPAPRDevice *dev, target_ulong mode);
-
 static inline qemu_irq spapr_vio_qirq(VIOsPAPRDevice *dev)
 {
     sPAPRMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
@@ -137,8 +135,6 @@ void spapr_vscsi_create(VIOsPAPRBus *bus);
 
 VIOsPAPRDevice *spapr_vty_get_default(VIOsPAPRBus *bus);
 
-void spapr_vio_quiesce(void);
-
 extern const VMStateDescription vmstate_spapr_vio;
 
 #define VMSTATE_SPAPR_VIO(_f, _s) \
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 94d7868..9bad49e 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -243,7 +243,6 @@ extern const struct SCSISense sense_code_SPACE_ALLOC_FAILED;
 uint32_t scsi_data_cdb_xfer(uint8_t *buf);
 uint32_t scsi_cdb_xfer(uint8_t *buf);
 int scsi_cdb_length(uint8_t *buf);
-int scsi_sense_valid(SCSISense sense);
 int scsi_build_sense(uint8_t *in_buf, int in_len,
                      uint8_t *buf, int len, bool fixed);
 
diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bus.h
index f3e5ef3..c98aa52 100644
--- a/include/hw/virtio/virtio-bus.h
+++ b/include/hw/virtio/virtio-bus.h
@@ -111,9 +111,6 @@ void virtio_bus_device_unplugged(VirtIODevice *bus);
 uint16_t virtio_bus_get_vdev_id(VirtioBusState *bus);
 /* Get the config_len field of the plugged device. */
 size_t virtio_bus_get_vdev_config_len(VirtioBusState *bus);
-/* Get the features of the plugged device. */
-uint32_t virtio_bus_get_vdev_features(VirtioBusState *bus,
-                                    uint32_t requested_features);
 /* Get bad features of the plugged device. */
 uint32_t virtio_bus_get_vdev_bad_features(VirtioBusState *bus);
 /* Get config of the plugged device. */
diff --git a/include/migration/migration.h b/include/migration/migration.h
index 3c96623..d4acc72 100644
--- a/include/migration/migration.h
+++ b/include/migration/migration.h
@@ -229,8 +229,6 @@ void migrate_fd_error(MigrationState *s, const Error *error);
 
 void migrate_fd_connect(MigrationState *s);
 
-int migrate_fd_close(MigrationState *s);
-
 void add_migration_state_change_notifier(Notifier *notify);
 void remove_migration_state_change_notifier(Notifier *notify);
 MigrationState *migrate_init(const MigrationParams *params);
diff --git a/include/net/net.h b/include/net/net.h
index e8d9e9e..99b28d5 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -138,8 +138,6 @@ NetClientState *qemu_get_queue(NICState *nic);
 NICState *qemu_get_nic(NetClientState *nc);
 void *qemu_get_nic_opaque(NetClientState *nc);
 void qemu_del_net_client(NetClientState *nc);
-NetClientState *qemu_find_vlan_client_by_name(Monitor *mon, int vlan_id,
-                                              const char *client_str);
 typedef void (*qemu_nic_foreach)(NICState *nic, void *opaque);
 void qemu_foreach_nic(qemu_nic_foreach func, void *opaque);
 int qemu_can_send_packet(NetClientState *nc);
diff --git a/include/qemu/bitmap.h b/include/qemu/bitmap.h
index ec5146f..7247f14 100644
--- a/include/qemu/bitmap.h
+++ b/include/qemu/bitmap.h
@@ -75,10 +75,6 @@ int slow_bitmap_equal(const unsigned long *bitmap1,
                       const unsigned long *bitmap2, long bits);
 void slow_bitmap_complement(unsigned long *dst, const unsigned long *src,
                             long bits);
-void slow_bitmap_shift_right(unsigned long *dst,
-                             const unsigned long *src, int shift, long bits);
-void slow_bitmap_shift_left(unsigned long *dst,
-                            const unsigned long *src, int shift, long bits);
 int slow_bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
                     const unsigned long *bitmap2, long bits);
 void slow_bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
diff --git a/include/qemu/uri.h b/include/qemu/uri.h
index de99b3b..d201c61 100644
--- a/include/qemu/uri.h
+++ b/include/qemu/uri.h
@@ -102,8 +102,6 @@ typedef struct QueryParams {
 } QueryParams;
 
 struct QueryParams *query_params_new (int init_alloc);
-int query_param_append (QueryParams *ps, const char *name, const char *value);
-extern char *query_param_to_string (const QueryParams *ps);
 extern QueryParams *query_params_parse (const char *query);
 extern void query_params_free (QueryParams *ps);
 
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index c9c2436..e6157d4 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -327,8 +327,6 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run);
 
 int kvm_arch_handle_exit(CPUState *cpu, struct kvm_run *run);
 
-int kvm_arch_handle_ioapic_eoi(CPUState *cpu, struct kvm_run *run);
-
 int kvm_arch_process_async_events(CPUState *cpu);
 
 int kvm_arch_get_registers(CPUState *cpu);
diff --git a/include/ui/console.h b/include/ui/console.h
index 2703a3a..d9c13d2 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -394,9 +394,7 @@ QemuUIInfo *qemu_console_get_ui_info(QemuConsole *con);
 int qemu_console_get_width(QemuConsole *con, int fallback);
 int qemu_console_get_height(QemuConsole *con, int fallback);
 
-void text_consoles_set_display(DisplayState *ds);
 void console_select(unsigned int index);
-void console_color_init(DisplayState *ds);
 void qemu_console_resize(QemuConsole *con, int width, int height);
 void qemu_console_copy(QemuConsole *con, int src_x, int src_y,
                        int dst_x, int dst_y, int w, int h);
diff --git a/include/ui/input.h b/include/ui/input.h
index 102d8a3..d06a12d 100644
--- a/include/ui/input.h
+++ b/include/ui/input.h
@@ -65,6 +65,4 @@ void qemu_input_check_mode_change(void);
 void qemu_add_mouse_mode_change_notifier(Notifier *notify);
 void qemu_remove_mouse_mode_change_notifier(Notifier *notify);
 
-int input_linux_init(void *opaque, QemuOpts *opts, Error **errp);
-
 #endif /* INPUT_H */
diff --git a/include/ui/spice-display.h b/include/ui/spice-display.h
index 568b64a..42e0fdf 100644
--- a/include/ui/spice-display.h
+++ b/include/ui/spice-display.h
@@ -144,8 +144,6 @@ void qemu_spice_destroy_update(SimpleSpiceDisplay *sdpy, SimpleSpiceUpdate *upda
 void qemu_spice_create_host_memslot(SimpleSpiceDisplay *ssd);
 void qemu_spice_create_host_primary(SimpleSpiceDisplay *ssd);
 void qemu_spice_destroy_host_primary(SimpleSpiceDisplay *ssd);
-void qemu_spice_vm_change_state_handler(void *opaque, int running,
-                                        RunState state);
 void qemu_spice_display_init_common(SimpleSpiceDisplay *ssd);
 
 void qemu_spice_display_update(SimpleSpiceDisplay *ssd,
diff --git a/target-alpha/cpu.h b/target-alpha/cpu.h
index ac5e801..dcdd041 100644
--- a/target-alpha/cpu.h
+++ b/target-alpha/cpu.h
@@ -474,7 +474,6 @@ int cpu_alpha_signal_handler(int host_signum, void *pinfo,
                              void *puc);
 int alpha_cpu_handle_mmu_fault(CPUState *cpu, vaddr address, int rw,
                                int mmu_idx);
-void do_restore_state(CPUAlphaState *, uintptr_t retaddr);
 void QEMU_NORETURN dynamic_excp(CPUAlphaState *, uintptr_t, int, int);
 void QEMU_NORETURN arith_excp(CPUAlphaState *, uintptr_t, int, uint64_t);
 
diff --git a/target-m68k/cpu.h b/target-m68k/cpu.h
index b2faa6b..c2d40cb 100644
--- a/target-m68k/cpu.h
+++ b/target-m68k/cpu.h
@@ -196,7 +196,6 @@ enum {
 #define MACSR_EV    0x001
 
 void m68k_set_irq_level(M68kCPU *cpu, int level, uint8_t vector);
-void m68k_set_macsr(CPUM68KState *env, uint32_t val);
 void m68k_switch_sp(CPUM68KState *env);
 
 #define M68K_FPCR_PREC (1 << 6)
diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
index 1e808c8..9617481 100644
--- a/target-ppc/cpu.h
+++ b/target-ppc/cpu.h
@@ -1184,8 +1184,6 @@ void ppc_cpu_dump_state(CPUState *cpu, FILE *f, fprintf_function cpu_fprintf,
                         int flags);
 void ppc_cpu_dump_statistics(CPUState *cpu, FILE *f,
                              fprintf_function cpu_fprintf, int flags);
-int ppc_cpu_get_monitor_def(CPUState *cs, const char *name,
-                            uint64_t *pval);
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int ppc_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int ppc_cpu_gdb_read_register_apple(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target-ppc/mmu-hash64.h b/target-ppc/mmu-hash64.h
index db265e3..ab5d347 100644
--- a/target-ppc/mmu-hash64.h
+++ b/target-ppc/mmu-hash64.h
@@ -4,7 +4,6 @@
 #ifndef CONFIG_USER_ONLY
 
 #ifdef TARGET_PPC64
-void ppc_hash64_check_page_sizes(PowerPCCPU *cpu, Error **errp);
 void dump_slb(FILE *f, fprintf_function cpu_fprintf, PowerPCCPU *cpu);
 int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
                   target_ulong esid, target_ulong vsid);
diff --git a/target-s390x/cpu.h b/target-s390x/cpu.h
index ac75360..5645e06 100644
--- a/target-s390x/cpu.h
+++ b/target-s390x/cpu.h
@@ -624,8 +624,6 @@ static inline unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
     return 0;
 }
 #endif
-void cpu_lock(void);
-void cpu_unlock(void);
 
 extern void subsystem_reset(void);
 
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 1bcabca..9bf31bb 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -723,7 +723,6 @@ static inline bool tcg_op_buf_full(void)
 
 void *tcg_malloc_internal(TCGContext *s, int size);
 void tcg_pool_reset(TCGContext *s);
-void tcg_pool_delete(TCGContext *s);
 
 void tb_lock(void);
 void tb_unlock(void);
@@ -907,7 +906,6 @@ void tcg_optimize(TCGContext *s);
 /* only used for debugging purposes */
 void tcg_dump_ops(TCGContext *s);
 
-void dump_ops(const uint16_t *opc_buf, const TCGArg *opparam_buf);
 TCGv_i32 tcg_const_i32(int32_t val);
 TCGv_i64 tcg_const_i64(int64_t val);
 TCGv_i32 tcg_const_local_i32(int32_t val);
-- 
2.1.4


