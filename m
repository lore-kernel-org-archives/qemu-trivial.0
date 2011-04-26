Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QEdeW-0006Xc-P1
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2011 04:29:48 -0400
Received: from eggs.gnu.org ([140.186.70.92]:39227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QEdeU-0006TE-Cw
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2011 04:29:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QEdeT-0000vc-1M
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2011 04:29:46 -0400
Received: from moutng.kundenserver.de ([212.227.126.171]:61107)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QEdeP-0000v2-Gd; Tue, 26 Apr 2011 04:29:41 -0400
Received: from flocke.fritz.box (p5086E89C.dip.t-dialin.net [80.134.232.156])
	by mrelayeu.kundenserver.de (node=mreu2) with ESMTP (Nemesis)
	id 0MCMWT-1Q69K71FC5-009AX1; Tue, 26 Apr 2011 10:29:38 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QEdeL-0002gQ-Gv; Tue, 26 Apr 2011 10:29:37 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Tue, 26 Apr 2011 10:29:36 +0200
Message-Id: <1303806576-10286-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-Provags-ID: V02:K0:1785qXZlbk3l2dP7QLPpHfiY8dmXf3xiMb77Nt1NATH
	QPYjm4M2EOLm+KGQMnaWf5ioIKHTmkk8J7E/+LOjlbSzbnUY7v
	eaFMVQwV6MSVX9Vni0XvcLTf0nMgqtrw5O00Mn+Sn0KADvmmL1
	n/aswmhLsTkN62zXfo2VkAch6g02X4uatBkUXwd5Cd3cvtKQI8
	CDmfTyPVSdTC5MHMuLvBoKroisFCy9At8Cir1Na8qpZ2VncK58 zzCqRyG4OS0Rz
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.126.171
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH] Fix typo in code and comments
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Apr 2011 08:29:47 -0000

Replace writeable -> writable

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 block.c                      |    2 +-
 block/sheepdog.c             |    4 +-
 hw/eepro100.c                |    2 +-
 hw/eeprom93xx.c              |   10 ++++----
 hw/msi.c                     |    2 +-
 hw/msix.c                    |    2 +-
 hw/pci.c                     |    6 ++--
 hw/pci.h                     |    2 +-
 hw/rtl8139.c                 |   44 ++++++++++++++++++++++-------------------
 hw/sun4m_iommu.c             |    2 +-
 target-mips/translate_init.c |    2 +-
 11 files changed, 41 insertions(+), 37 deletions(-)

diff --git a/block.c b/block.c
index f731c7a..8767d31 100644
--- a/block.c
+++ b/block.c
@@ -455,7 +455,7 @@ static int bdrv_open_common(BlockDriverState *bs, const char *filename,
     open_flags = flags & ~(BDRV_O_SNAPSHOT | BDRV_O_NO_BACKING);
 
     /*
-     * Snapshots should be writeable.
+     * Snapshots should be writable.
      */
     if (bs->is_temporary) {
         open_flags |= BDRV_O_RDWR;
diff --git a/block/sheepdog.c b/block/sheepdog.c
index 98946d7..0392ca8 100644
--- a/block/sheepdog.c
+++ b/block/sheepdog.c
@@ -196,7 +196,7 @@ static inline uint64_t fnv_64a_buf(void *buf, size_t len, uint64_t hval)
     return hval;
 }
 
-static inline int is_data_obj_writeable(SheepdogInode *inode, unsigned int idx)
+static inline int is_data_obj_writable(SheepdogInode *inode, unsigned int idx)
 {
     return inode->vdi_id == inode->data_vdi_id[idx];
 }
@@ -1577,7 +1577,7 @@ static void sd_readv_writev_bh_cb(void *p)
 
             create = 1;
         } else if (acb->aiocb_type == AIOCB_WRITE_UDATA
-                   && !is_data_obj_writeable(inode, idx)) {
+                   && !is_data_obj_writable(inode, idx)) {
             /* Copy-On-Write */
             create = 1;
             old_oid = oid;
diff --git a/hw/eepro100.c b/hw/eepro100.c
index ffcbc3d..dabb64a 100644
--- a/hw/eepro100.c
+++ b/hw/eepro100.c
@@ -1125,7 +1125,7 @@ static void eepro100_write_eeprom(eeprom_t * eeprom, uint8_t val)
 {
     TRACE(EEPROM, logout("val=0x%02x\n", val));
 
-    /* mask unwriteable bits */
+    /* mask unwritable bits */
 #if 0
     val = SET_MASKED(val, 0x31, eeprom->value);
 #endif
diff --git a/hw/eeprom93xx.c b/hw/eeprom93xx.c
index 660b28f..7b21f98 100644
--- a/hw/eeprom93xx.c
+++ b/hw/eeprom93xx.c
@@ -75,7 +75,7 @@ struct _eeprom_t {
     uint8_t  tick;
     uint8_t  address;
     uint8_t  command;
-    uint8_t  writeable;
+    uint8_t  writable;
 
     uint8_t eecs;
     uint8_t eesk;
@@ -130,7 +130,7 @@ static const VMStateDescription vmstate_eeprom = {
         VMSTATE_UINT8(tick, eeprom_t),
         VMSTATE_UINT8(address, eeprom_t),
         VMSTATE_UINT8(command, eeprom_t),
-        VMSTATE_UINT8(writeable, eeprom_t),
+        VMSTATE_UINT8(writable, eeprom_t),
 
         VMSTATE_UINT8(eecs, eeprom_t),
         VMSTATE_UINT8(eesk, eeprom_t),
@@ -165,7 +165,7 @@ void eeprom93xx_write(eeprom_t *eeprom, int eecs, int eesk, int eedi)
         address = 0x0;
     } else if (eeprom->eecs && ! eecs) {
         /* End chip select cycle. This triggers write / erase. */
-        if (eeprom->writeable) {
+        if (eeprom->writable) {
             uint8_t subcommand = address >> (eeprom->addrbits - 2);
             if (command == 0 && subcommand == 2) {
                 /* Erase all. */
@@ -232,7 +232,7 @@ void eeprom93xx_write(eeprom_t *eeprom, int eecs, int eesk, int eedi)
                     switch (address >> (eeprom->addrbits - 2)) {
                         case 0:
                             logout("write disable command\n");
-                            eeprom->writeable = 0;
+                            eeprom->writable = 0;
                             break;
                         case 1:
                             logout("write all command\n");
@@ -242,7 +242,7 @@ void eeprom93xx_write(eeprom_t *eeprom, int eecs, int eesk, int eedi)
                             break;
                         case 3:
                             logout("write enable command\n");
-                            eeprom->writeable = 1;
+                            eeprom->writable = 1;
                             break;
                     }
                 } else {
diff --git a/hw/msi.c b/hw/msi.c
index 3dc3a24..b81ac79 100644
--- a/hw/msi.c
+++ b/hw/msi.c
@@ -155,7 +155,7 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
     pci_set_word(dev->wmask + msi_data_off(dev, msi64bit), 0xffff);
 
     if (msi_per_vector_mask) {
-        /* Make mask bits 0 to nr_vectors - 1 writeable. */
+        /* Make mask bits 0 to nr_vectors - 1 writable. */
         pci_set_long(dev->wmask + msi_mask_off(dev, msi64bit),
                      0xffffffff >> (PCI_MSI_VECTORS_MAX - nr_vectors));
     }
diff --git a/hw/msix.c b/hw/msix.c
index daaf9b7..af40e26 100644
--- a/hw/msix.c
+++ b/hw/msix.c
@@ -87,7 +87,7 @@ static int msix_add_config(struct PCIDevice *pdev, unsigned short nentries,
     pci_set_long(config + MSIX_PBA_OFFSET, (bar_size + MSIX_PAGE_PENDING) |
                  bar_nr);
     pdev->msix_cap = config_offset;
-    /* Make flags bit writeable. */
+    /* Make flags bit writable. */
     pdev->wmask[config_offset + MSIX_CONTROL_OFFSET] |= MSIX_ENABLE_MASK |
 	    MSIX_MASKALL_MASK;
     return 0;
diff --git a/hw/pci.c b/hw/pci.c
index 6b577e1..5026303 100644
--- a/hw/pci.c
+++ b/hw/pci.c
@@ -161,7 +161,7 @@ void pci_device_reset(PCIDevice *dev)
     dev->irq_state = 0;
     pci_update_irq_status(dev);
     pci_device_deassert_intx(dev);
-    /* Clear all writeable bits */
+    /* Clear all writable bits */
     pci_word_test_and_clear_mask(dev->config + PCI_COMMAND,
                                  pci_get_word(dev->wmask + PCI_COMMAND) |
                                  pci_get_word(dev->w1cmask + PCI_COMMAND));
@@ -863,7 +863,7 @@ void pci_register_bar(PCIDevice *pci_dev, int region_num,
     wmask = ~(size - 1);
     addr = pci_bar(pci_dev, region_num);
     if (region_num == PCI_ROM_SLOT) {
-        /* ROM enable bit is writeable */
+        /* ROM enable bit is writable */
         wmask |= PCI_ROM_ADDRESS_ENABLE;
     }
     pci_set_long(pci_dev->config + addr, type);
@@ -1950,7 +1950,7 @@ void pci_del_capability(PCIDevice *pdev, uint8_t cap_id, uint8_t size)
     if (!offset)
         return;
     pdev->config[prev] = pdev->config[offset + PCI_CAP_LIST_NEXT];
-    /* Make capability writeable again */
+    /* Make capability writable again */
     memset(pdev->wmask + offset, 0xff, size);
     memset(pdev->w1cmask + offset, 0, size);
     /* Clear cmask as device-specific registers can't be checked */
diff --git a/hw/pci.h b/hw/pci.h
index 52ee8c9..90121ca 100644
--- a/hw/pci.h
+++ b/hw/pci.h
@@ -131,7 +131,7 @@ struct PCIDevice {
     /* PCI config space */
     uint8_t *config;
 
-    /* Used to enable config checks on load. Note that writeable bits are
+    /* Used to enable config checks on load. Note that writable bits are
      * never checked even if set in cmask. */
     uint8_t *cmask;
 
diff --git a/hw/rtl8139.c b/hw/rtl8139.c
index 515652f..a97029f 100644
--- a/hw/rtl8139.c
+++ b/hw/rtl8139.c
@@ -1399,7 +1399,7 @@ static void rtl8139_ChipCmd_write(RTL8139State *s, uint32_t val)
         s->currCPlusTxDesc = 0;
     }
 
-    /* mask unwriteable bits */
+    /* mask unwritable bits */
     val = SET_MASKED(val, 0xe3, s->bChipCmdState);
 
     /* Deassert reset pin before next read */
@@ -1443,7 +1443,7 @@ static void rtl8139_CpCmd_write(RTL8139State *s, uint32_t val)
 
     s->cplus_enabled = 1;
 
-    /* mask unwriteable bits */
+    /* mask unwritable bits */
     val = SET_MASKED(val, 0xff84, s->CpCmd);
 
     s->CpCmd = val;
@@ -1472,7 +1472,7 @@ static uint32_t rtl8139_IntrMitigate_read(RTL8139State *s)
     return ret;
 }
 
-static int rtl8139_config_writeable(RTL8139State *s)
+static int rtl8139_config_writable(RTL8139State *s)
 {
     if (s->Cfg9346 & Cfg9346_Unlock)
     {
@@ -1490,10 +1490,10 @@ static void rtl8139_BasicModeCtrl_write(RTL8139State *s, uint32_t val)
 
     DPRINTF("BasicModeCtrl register write(w) val=0x%04x\n", val);
 
-    /* mask unwriteable bits */
+    /* mask unwritable bits */
     uint32_t mask = 0x4cff;
 
-    if (1 || !rtl8139_config_writeable(s))
+    if (1 || !rtl8139_config_writable(s))
     {
         /* Speed setting and autonegotiation enable bits are read-only */
         mask |= 0x3000;
@@ -1521,7 +1521,7 @@ static void rtl8139_BasicModeStatus_write(RTL8139State *s, uint32_t val)
 
     DPRINTF("BasicModeStatus register write(w) val=0x%04x\n", val);
 
-    /* mask unwriteable bits */
+    /* mask unwritable bits */
     val = SET_MASKED(val, 0xff3f, s->BasicModeStatus);
 
     s->BasicModeStatus = val;
@@ -1542,7 +1542,7 @@ static void rtl8139_Cfg9346_write(RTL8139State *s, uint32_t val)
 
     DPRINTF("Cfg9346 write val=0x%02x\n", val);
 
-    /* mask unwriteable bits */
+    /* mask unwritable bits */
     val = SET_MASKED(val, 0x31, s->Cfg9346);
 
     uint32_t opmode = val & 0xc0;
@@ -1594,10 +1594,11 @@ static void rtl8139_Config0_write(RTL8139State *s, uint32_t val)
 
     DPRINTF("Config0 write val=0x%02x\n", val);
 
-    if (!rtl8139_config_writeable(s))
+    if (!rtl8139_config_writable(s)) {
         return;
+    }
 
-    /* mask unwriteable bits */
+    /* mask unwritable bits */
     val = SET_MASKED(val, 0xf8, s->Config0);
 
     s->Config0 = val;
@@ -1618,10 +1619,11 @@ static void rtl8139_Config1_write(RTL8139State *s, uint32_t val)
 
     DPRINTF("Config1 write val=0x%02x\n", val);
 
-    if (!rtl8139_config_writeable(s))
+    if (!rtl8139_config_writable(s)) {
         return;
+    }
 
-    /* mask unwriteable bits */
+    /* mask unwritable bits */
     val = SET_MASKED(val, 0xC, s->Config1);
 
     s->Config1 = val;
@@ -1642,10 +1644,11 @@ static void rtl8139_Config3_write(RTL8139State *s, uint32_t val)
 
     DPRINTF("Config3 write val=0x%02x\n", val);
 
-    if (!rtl8139_config_writeable(s))
+    if (!rtl8139_config_writable(s)) {
         return;
+    }
 
-    /* mask unwriteable bits */
+    /* mask unwritable bits */
     val = SET_MASKED(val, 0x8F, s->Config3);
 
     s->Config3 = val;
@@ -1666,10 +1669,11 @@ static void rtl8139_Config4_write(RTL8139State *s, uint32_t val)
 
     DPRINTF("Config4 write val=0x%02x\n", val);
 
-    if (!rtl8139_config_writeable(s))
+    if (!rtl8139_config_writable(s)) {
         return;
+    }
 
-    /* mask unwriteable bits */
+    /* mask unwritable bits */
     val = SET_MASKED(val, 0x0a, s->Config4);
 
     s->Config4 = val;
@@ -1690,7 +1694,7 @@ static void rtl8139_Config5_write(RTL8139State *s, uint32_t val)
 
     DPRINTF("Config5 write val=0x%02x\n", val);
 
-    /* mask unwriteable bits */
+    /* mask unwritable bits */
     val = SET_MASKED(val, 0x80, s->Config5);
 
     s->Config5 = val;
@@ -1743,7 +1747,7 @@ static void rtl8139_RxConfig_write(RTL8139State *s, uint32_t val)
 {
     DPRINTF("RxConfig write val=0x%08x\n", val);
 
-    /* mask unwriteable bits */
+    /* mask unwritable bits */
     val = SET_MASKED(val, 0xf0fc0040, s->RxConfig);
 
     s->RxConfig = val;
@@ -2610,7 +2614,7 @@ static void rtl8139_IntrMask_write(RTL8139State *s, uint32_t val)
 {
     DPRINTF("IntrMask write(w) val=0x%04x\n", val);
 
-    /* mask unwriteable bits */
+    /* mask unwritable bits */
     val = SET_MASKED(val, 0x1e00, s->IntrMask);
 
     s->IntrMask = val;
@@ -2642,7 +2646,7 @@ static void rtl8139_IntrStatus_write(RTL8139State *s, uint32_t val)
 #else
     uint16_t newStatus = s->IntrStatus & ~val;
 
-    /* mask unwriteable bits */
+    /* mask unwritable bits */
     newStatus = SET_MASKED(newStatus, 0x1e00, s->IntrStatus);
 
     /* writing 1 to interrupt status register bit clears it */
@@ -2686,7 +2690,7 @@ static void rtl8139_MultiIntr_write(RTL8139State *s, uint32_t val)
 {
     DPRINTF("MultiIntr write(w) val=0x%04x\n", val);
 
-    /* mask unwriteable bits */
+    /* mask unwritable bits */
     val = SET_MASKED(val, 0xf000, s->MultiIntr);
 
     s->MultiIntr = val;
diff --git a/hw/sun4m_iommu.c b/hw/sun4m_iommu.c
index bba69ee..7f5dad5 100644
--- a/hw/sun4m_iommu.c
+++ b/hw/sun4m_iommu.c
@@ -118,7 +118,7 @@
 #define IOPTE_PAGE          0xffffff00 /* Physical page number (PA[35:12]) */
 #define IOPTE_CACHE         0x00000080 /* Cached (in vme IOCACHE or
                                           Viking/MXCC) */
-#define IOPTE_WRITE         0x00000004 /* Writeable */
+#define IOPTE_WRITE         0x00000004 /* Writable */
 #define IOPTE_VALID         0x00000002 /* IOPTE is valid */
 #define IOPTE_WAZ           0x00000001 /* Write as zeros */
 
diff --git a/target-mips/translate_init.c b/target-mips/translate_init.c
index 590e092..8d9b5b9 100644
--- a/target-mips/translate_init.c
+++ b/target-mips/translate_init.c
@@ -477,7 +477,7 @@ static const mips_def_t mips_defs[] =
       .CP0_Config1 = (1 << CP0C1_FP) | (47 << CP0C1_MMU),
       .SYNCI_Step = 16,
       .CCRes = 2,
-      .CP0_Status_rw_bitmask = 0xF5D0FF1F,   /*bit5:7 not writeable*/
+      .CP0_Status_rw_bitmask = 0xF5D0FF1F,   /*bit5:7 not writable*/
       .CP1_fcr0 = (0x5 << FCR0_PRID) | (0x1 << FCR0_REV),
       .SEGBITS = 40,
       .PABITS = 40,
-- 
1.7.2.5


