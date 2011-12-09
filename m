Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RZ9l1-0005Cx-5r
	for mharc-qemu-trivial@gnu.org; Fri, 09 Dec 2011 18:21:35 -0500
Received: from eggs.gnu.org ([140.186.70.92]:48257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RZ9kv-0004t1-P8
	for qemu-trivial@nongnu.org; Fri, 09 Dec 2011 18:21:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RZ9ku-0000gA-6P
	for qemu-trivial@nongnu.org; Fri, 09 Dec 2011 18:21:29 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:46738)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RZ9kq-0000f1-3f; Fri, 09 Dec 2011 18:21:24 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	B4509728188B; Sat, 10 Dec 2011 00:21:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id QFPxXMUHIT-G; Sat, 10 Dec 2011 00:20:53 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 026B17281C24; Sat, 10 Dec 2011 00:19:59 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 10 Dec 2011 00:19:44 +0100
Message-Id: <1323472786-26821-5-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1323472786-26821-1-git-send-email-sw@weilnetz.de>
References: <1323472786-26821-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 4/6] hw: Fix spelling in comments
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
X-List-Received-Date: Fri, 09 Dec 2011 23:21:31 -0000

adress->address
advertisment->advertisement
begining->beginning
bondary->boundary
controler->controller
controll->control
convertion->conversion
doesnt->doesn't
existant->existent
instuction->instruction
loosing->losing
managment->management
multipled->multiplied
negotation->negotiation
runing->running
teh->the
unchangable->unchangeable
writen->written
yeild->yield

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/9pfs/virtio-9p-coth.h   |    2 +-
 hw/9pfs/virtio-9p-handle.c |    2 +-
 hw/alpha_dp264.c           |    2 +-
 hw/arm_gic.c               |    2 +-
 hw/bt-hci-csr.c            |    2 +-
 hw/e1000_hw.h              |    2 +-
 hw/etraxfs_dma.c           |    2 +-
 hw/etraxfs_pic.c           |    2 +-
 hw/fmopl.c                 |    8 ++++----
 hw/gusemu.h                |    2 +-
 hw/gusemu_hal.c            |    2 +-
 hw/ide/core.c              |    2 +-
 hw/lan9118.c               |    4 ++--
 hw/pcie_aer.c              |    2 +-
 hw/pl110.c                 |    2 +-
 hw/rtl8139.c               |    2 +-
 hw/sh7750_regs.h           |    2 +-
 hw/spapr.h                 |    2 +-
 hw/ssd0303.c               |    2 +-
 hw/wdt_ib700.c             |    2 +-
 20 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/hw/9pfs/virtio-9p-coth.h b/hw/9pfs/virtio-9p-coth.h
index c4b74b0..c31c965 100644
--- a/hw/9pfs/virtio-9p-coth.h
+++ b/hw/9pfs/virtio-9p-coth.h
@@ -44,7 +44,7 @@ typedef struct V9fsThPool {
                             qemu_coroutine_self());                     \
         qemu_bh_schedule(co_bh);                                        \
         /*                                                              \
-         * yeild in qemu thread and re-enter back                       \
+         * yield in qemu thread and re-enter back                       \
          * in glib worker thread                                        \
          */                                                             \
         qemu_coroutine_yield();                                         \
diff --git a/hw/9pfs/virtio-9p-handle.c b/hw/9pfs/virtio-9p-handle.c
index f97d898..9518bfe 100644
--- a/hw/9pfs/virtio-9p-handle.c
+++ b/hw/9pfs/virtio-9p-handle.c
@@ -520,7 +520,7 @@ static int handle_name_to_path(FsContext *ctx, V9fsPath *dir_path,
     }
     fh = g_malloc(sizeof(struct file_handle) + data->handle_bytes);
     fh->handle_bytes = data->handle_bytes;
-    /* add a "./" at the begining of the path */
+    /* add a "./" at the beginning of the path */
     snprintf(buffer, PATH_MAX, "./%s", name);
     /* flag = 0 imply don't follow symlink */
     ret = name_to_handle(dirfd, buffer, fh, &mnt_id, 0);
diff --git a/hw/alpha_dp264.c b/hw/alpha_dp264.c
index fcc20e9..598b830 100644
--- a/hw/alpha_dp264.c
+++ b/hw/alpha_dp264.c
@@ -2,7 +2,7 @@
  * QEMU Alpha DP264/CLIPPER hardware system emulator.
  *
  * Choose CLIPPER IRQ mappings over, say, DP264, MONET, or WEBBRICK
- * variants because CLIPPER doesn't have an SMC669 SuperIO controler
+ * variants because CLIPPER doesn't have an SMC669 SuperIO controller
  * that we need to emulate as well.
  */
 
diff --git a/hw/arm_gic.c b/hw/arm_gic.c
index 527c9ce..1a896fb 100644
--- a/hw/arm_gic.c
+++ b/hw/arm_gic.c
@@ -602,7 +602,7 @@ static uint32_t gic_cpu_read(gic_state *s, int cpu, int offset)
         return 0;
     case 0x0c: /* Acknowledge */
         return gic_acknowledge_irq(s, cpu);
-    case 0x14: /* Runing Priority */
+    case 0x14: /* Running Priority */
         return s->running_priority[cpu];
     case 0x18: /* Highest Pending Interrupt */
         return s->current_pending[cpu];
diff --git a/hw/bt-hci-csr.c b/hw/bt-hci-csr.c
index 0dcf897..772b677 100644
--- a/hw/bt-hci-csr.c
+++ b/hw/bt-hci-csr.c
@@ -222,7 +222,7 @@ static void csrhci_in_packet(struct csrhci_s *s, uint8_t *pkt)
 
         rpkt = csrhci_out_packet_csr(s, H4_NEG_PKT, 10);
 
-        *rpkt ++ = 0x20;	/* Operational settings negotation Ok */
+        *rpkt ++ = 0x20;	/* Operational settings negotiation Ok */
         memcpy(rpkt, pkt, 7); rpkt += 7;
         *rpkt ++ = 0xff;
         *rpkt = 0xff;
diff --git a/hw/e1000_hw.h b/hw/e1000_hw.h
index 2e341ac..9e29af8 100644
--- a/hw/e1000_hw.h
+++ b/hw/e1000_hw.h
@@ -295,7 +295,7 @@
 
 #define E1000_KUMCTRLSTA 0x00034 /* MAC-PHY interface - RW */
 #define E1000_MDPHYA     0x0003C  /* PHY address - RW */
-#define E1000_MANC2H     0x05860  /* Managment Control To Host - RW */
+#define E1000_MANC2H     0x05860  /* Management Control To Host - RW */
 #define E1000_SW_FW_SYNC 0x05B5C /* Software-Firmware Synchronization - RW */
 
 #define E1000_GCR       0x05B00 /* PCI-Ex Control */
diff --git a/hw/etraxfs_dma.c b/hw/etraxfs_dma.c
index 02d0183..d2bd584 100644
--- a/hw/etraxfs_dma.c
+++ b/hw/etraxfs_dma.c
@@ -180,7 +180,7 @@ struct fs_dma_channel
 	struct dma_descr_context current_c;
 	struct dma_descr_data current_d;
 
-	/* Controll registers.  */
+	/* Control registers.  */
 	uint32_t regs[DMA_REG_MAX];
 };
 
diff --git a/hw/etraxfs_pic.c b/hw/etraxfs_pic.c
index 72cbdb8..993d6a8 100644
--- a/hw/etraxfs_pic.c
+++ b/hw/etraxfs_pic.c
@@ -53,7 +53,7 @@ static void pic_update(struct etrax_pic *fs)
 
     fs->regs[R_R_MASKED_VECT] = fs->regs[R_R_VECT] & fs->regs[R_RW_MASK];
 
-    /* The ETRAX interrupt controller signals interrupts to teh core
+    /* The ETRAX interrupt controller signals interrupts to the core
        through an interrupt request wire and an irq vector bus. If 
        multiple interrupts are simultaneously active it chooses vector 
        0x30 and lets the sw choose the priorities.  */
diff --git a/hw/fmopl.c b/hw/fmopl.c
index 431f736..734d2f4 100644
--- a/hw/fmopl.c
+++ b/hw/fmopl.c
@@ -715,7 +715,7 @@ static void OPLCloseTable( void )
 	free(VIB_TABLE);
 }
 
-/* CSM Key Controll */
+/* CSM Key Control */
 INLINE void CSMKeyControll(OPL_CH *CH)
 {
 	OPL_SLOT *slot1 = &CH->SLOT[SLOT1];
@@ -762,7 +762,7 @@ static void OPLWriteReg(FM_OPL *OPL, int r, int v)
 
 	switch(r&0xe0)
 	{
-	case 0x00: /* 00-1f:controll */
+	case 0x00: /* 00-1f:control */
 		switch(r&0x1f)
 		{
 		case 0x01:
@@ -826,7 +826,7 @@ static void OPLWriteReg(FM_OPL *OPL, int r, int v)
 					LOG(LOG_WAR,("OPL:write unmapped KEYBOARD port\n"));
 			}
 			return;
-		case 0x07:	/* DELTA-T controll : START,REC,MEMDATA,REPT,SPOFF,x,x,RST */
+		case 0x07:	/* DELTA-T control : START,REC,MEMDATA,REPT,SPOFF,x,x,RST */
 			if(OPL->type&OPL_TYPE_ADPCM)
 				YM_DELTAT_ADPCM_Write(OPL->deltat,r-0x07,v);
 			return;
@@ -1380,7 +1380,7 @@ int OPLTimerOver(FM_OPL *OPL,int c)
 	else
 	{	/* Timer A */
 		OPL_STATUS_SET(OPL,0x40);
-		/* CSM mode key,TL controll */
+		/* CSM mode key,TL control */
 		if( OPL->mode & 0x80 )
 		{	/* CSM mode total level latch and auto key on */
 			int ch;
diff --git a/hw/gusemu.h b/hw/gusemu.h
index 5093767..27877c0 100644
--- a/hw/gusemu.h
+++ b/hw/gusemu.h
@@ -27,7 +27,7 @@
 
 /* data types (need to be adjusted if neither a VC6 nor a C99 compatible compiler is used) */
 
-#if defined _WIN32 && defined _MSC_VER /* doesnt support other win32 compilers yet, do it yourself... */
+#if defined _WIN32 && defined _MSC_VER /* doesn't support other win32 compilers yet, do it yourself... */
  typedef unsigned char GUSbyte;
  typedef unsigned short GUSword;
  typedef unsigned int GUSdword;
diff --git a/hw/gusemu_hal.c b/hw/gusemu_hal.c
index c6f9537..582779f 100644
--- a/hw/gusemu_hal.c
+++ b/hw/gusemu_hal.c
@@ -517,7 +517,7 @@ void gus_dma_transferdata(GUSEmuState * state, char *dma_addr, unsigned int coun
         int             offset = (GUSregw(GUS42DMAStart) << 4) + (GUSregb(GUS50DMAHigh) & 0xf);
         if (state->gusdma >= 4)
             offset = (offset & 0xc0000) + (2 * (offset & 0x1fff0)); /* 16 bit address translation */
-        destaddr = (char *) state->himemaddr + offset; /* wavetable RAM adress */
+        destaddr = (char *) state->himemaddr + offset; /* wavetable RAM address */
     }
 
     GUSregw(GUS42DMAStart) += (GUSword)  (count >> 4);                           /* ToDo: add 16bit GUS page limit? */
diff --git a/hw/ide/core.c b/hw/ide/core.c
index 93a1a68..49847bd 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1000,7 +1000,7 @@ void ide_exec_cmd(IDEBus *bus, uint32_t val)
     printf("ide: CMD=%02x\n", val);
 #endif
     s = idebus_active_if(bus);
-    /* ignore commands to non existant slave */
+    /* ignore commands to non existent slave */
     if (s != bus->ifs && !s->bs)
         return;
 
diff --git a/hw/lan9118.c b/hw/lan9118.c
index ee8b2ea..7e64c5d 100644
--- a/hw/lan9118.c
+++ b/hw/lan9118.c
@@ -697,7 +697,7 @@ static uint32_t do_phy_read(lan9118_state *s, int reg)
         return 0x0007;
     case 3: /* ID2 */
         return 0xc0d1;
-    case 4: /* Auto-neg advertisment */
+    case 4: /* Auto-neg advertisement */
         return s->phy_advertise;
     case 5: /* Auto-neg Link Partner Ability */
         return 0x0f71;
@@ -731,7 +731,7 @@ static void do_phy_write(lan9118_state *s, int reg, uint32_t val)
             s->phy_status |= 0x0020;
         }
         break;
-    case 4: /* Auto-neg advertisment */
+    case 4: /* Auto-neg advertisement */
         s->phy_advertise = (val & 0x2d7f) | 0x80;
         break;
         /* TODO 17, 18, 27, 31 */
diff --git a/hw/pcie_aer.c b/hw/pcie_aer.c
index 62c06ea..b9d1097 100644
--- a/hw/pcie_aer.c
+++ b/hw/pcie_aer.c
@@ -826,7 +826,7 @@ typedef struct PCIEAERErrorName {
 } PCIEAERErrorName;
 
 /*
- * AER error name -> value convertion table
+ * AER error name -> value conversion table
  * This naming scheme is same to linux aer-injection tool.
  */
 static const struct PCIEAERErrorName pcie_aer_error_list[] = {
diff --git a/hw/pl110.c b/hw/pl110.c
index 7aef8a4..cc1eb6d 100644
--- a/hw/pl110.c
+++ b/hw/pl110.c
@@ -358,7 +358,7 @@ static void pl110_write(void *opaque, target_phys_addr_t offset,
     int n;
 
     /* For simplicity invalidate the display whenever a control register
-       is writen to.  */
+       is written to.  */
     s->invalidate = 1;
     if (offset >= 0x200 && offset < 0x400) {
         /* Pallette.  */
diff --git a/hw/rtl8139.c b/hw/rtl8139.c
index aa8ed0a..8aace9a 100644
--- a/hw/rtl8139.c
+++ b/hw/rtl8139.c
@@ -2662,7 +2662,7 @@ static void rtl8139_IntrStatus_write(RTL8139State *s, uint32_t val)
      * Computing if we miss an interrupt here is not that correct but
      * considered that we should have had already an interrupt
      * and probably emulated is slower is better to assume this resetting was
-     * done before testing on previous rtl8139_update_irq lead to IRQ loosing
+     * done before testing on previous rtl8139_update_irq lead to IRQ losing
      */
     rtl8139_set_next_tctr_time(s, qemu_get_clock_ns(vm_clock));
     rtl8139_update_irq(s);
diff --git a/hw/sh7750_regs.h b/hw/sh7750_regs.h
index 6ec13ab..534aa48 100644
--- a/hw/sh7750_regs.h
+++ b/hw/sh7750_regs.h
@@ -157,7 +157,7 @@
  * Exeption-related registers
  */
 
-/* Immediate data for TRAPA instuction - TRA */
+/* Immediate data for TRAPA instruction - TRA */
 #define SH7750_TRA_REGOFS     0x000020	/* offset */
 #define SH7750_TRA            SH7750_P4_REG32(SH7750_TRA_REGOFS)
 #define SH7750_TRA_A7         SH7750_A7_REG32(SH7750_TRA_REGOFS)
diff --git a/hw/spapr.h b/hw/spapr.h
index df88f6a..d624841 100644
--- a/hw/spapr.h
+++ b/hw/spapr.h
@@ -141,7 +141,7 @@ typedef struct sPAPREnvironment {
 #define H_DABRX_KERNEL     (1ULL<<(63-62))
 #define H_DABRX_USER       (1ULL<<(63-63))
 
-/* Each control block has to be on a 4K bondary */
+/* Each control block has to be on a 4K boundary */
 #define H_CB_ALIGNMENT     4096
 
 /* pSeries hypervisor opcodes */
diff --git a/hw/ssd0303.c b/hw/ssd0303.c
index 401fdf5..bcad7bf 100644
--- a/hw/ssd0303.c
+++ b/hw/ssd0303.c
@@ -123,7 +123,7 @@ static int ssd0303_send(i2c_slave *i2c, uint8_t data)
             case 0xa7: /* Inverse on.  */
                 s->inverse = 1;
                 break;
-            case 0xa8: /* Set multipled ratio (Ignored).  */
+            case 0xa8: /* Set multiplied ratio (Ignored).  */
                 s->cmd_state = SSD0303_CMD_SKIP1;
                 break;
             case 0xad: /* DC-DC power control.  */
diff --git a/hw/wdt_ib700.c b/hw/wdt_ib700.c
index 81f22d0..ba1d92d 100644
--- a/hw/wdt_ib700.c
+++ b/hw/wdt_ib700.c
@@ -42,7 +42,7 @@ typedef struct IB700state {
 
 /* This is the timer.  We use a global here because the watchdog
  * code ensures there is only one watchdog (it is located at a fixed,
- * unchangable IO port, so there could only ever be one anyway).
+ * unchangeable IO port, so there could only ever be one anyway).
  */
 
 /* A write to this register enables the timer. */
-- 
1.7.2.5


