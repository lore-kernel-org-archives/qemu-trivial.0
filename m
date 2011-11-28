Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RUx56-0002Bm-98
	for mharc-qemu-trivial@gnu.org; Mon, 28 Nov 2011 04:00:56 -0500
Received: from eggs.gnu.org ([140.186.70.92]:51420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <donald.open@gmail.com>) id 1RUx4w-0001en-6u
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2011 04:00:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <donald.open@gmail.com>) id 1RUx4p-0003Oc-Pq
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2011 04:00:46 -0500
Received: from mail-ey0-f173.google.com ([209.85.215.173]:51254)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <donald.open@gmail.com>)
	id 1RUx4b-0003Md-Np; Mon, 28 Nov 2011 04:00:26 -0500
Received: by mail-ey0-f173.google.com with SMTP id i10so1688544eaa.4
	for <multiple recipients>; Mon, 28 Nov 2011 01:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=1+dY7YJ9RmMXL0+j+1Imf3RKFKbCSMveeZHQZE21ItE=;
	b=T4NIzhXK5I7BfnNf4s/r6woPbSqtDcods2DdXG+usIAMXBH8617P4rEe3Wm9ELkIeR
	Hh2pq/GNfoIUDNgpmJAhvBfLhKk+0XIr6HitLln6At5rC9S0srpnm1Nxd/Y+E/8zMsuE
	6AH43PEKzkKbUnOjOMSDDQCJTdH6eRnKzxZB4=
Received: by 10.180.19.42 with SMTP id b10mr53381772wie.39.1322470825119; Mon,
	28 Nov 2011 01:00:25 -0800 (PST)
MIME-Version: 1.0
Sender: donald.open@gmail.com
Received: by 10.216.86.130 with HTTP; Mon, 28 Nov 2011 00:59:44 -0800 (PST)
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
Date: Mon, 28 Nov 2011 16:59:44 +0800
X-Google-Sender-Auth: nuSwo3XUsobW1PbVsGFOXfONHjc
Message-ID: <CAGrFBsgesVnGKiiMZ366N3H09po-RRF4=y=XaYoP_smZCyGRhQ@mail.gmail.com>
To: qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.173
Cc: qemu-devel <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 2/2] fix spelling in hw directory
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
X-List-Received-Date: Mon, 28 Nov 2011 09:00:54 -0000

Correct obvious spelling errors in qemu/hw direcotry.

Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
---
 hw/9pfs/virtio-9p-coth.h   |    2 +-
 hw/9pfs/virtio-9p-handle.c |    2 +-
 hw/alpha_dp264.c           |    2 +-
 hw/arm_gic.c               |    2 +-
 hw/bt-hci-csr.c            |    2 +-
 hw/cirrus_vga.c            |    2 +-
 hw/e1000_hw.h              |    2 +-
 hw/etraxfs_dma.c           |    2 +-
 hw/etraxfs_pic.c           |    2 +-
 hw/fmopl.c                 |    8 ++++----
 hw/gusemu.h                |    2 +-
 hw/gusemu_hal.c            |    4 ++--
 hw/ide/core.c              |    2 +-
 hw/lan9118.c               |    4 ++--
 hw/omap2.c                 |    6 +++---
 hw/pc.c                    |    2 +-
 hw/pcie_aer.c              |    2 +-
 hw/pl110.c                 |    2 +-
 hw/pl181.c                 |    4 ++--
 hw/sh7750_regs.h           |    2 +-
 hw/spapr.h                 |    2 +-
 hw/wdt_ib700.c             |    2 +-
 22 files changed, 30 insertions(+), 30 deletions(-)

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
index f443da6..6683754 100644
--- a/hw/9pfs/virtio-9p-handle.c
+++ b/hw/9pfs/virtio-9p-handle.c
@@ -537,7 +537,7 @@ static int handle_name_to_path(FsContext *ctx,
V9fsPath *dir_path,
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
index f3f3516..bbbaf92 100644
--- a/hw/arm_gic.c
+++ b/hw/arm_gic.c
@@ -593,7 +593,7 @@ static uint32_t gic_cpu_read(gic_state *s, int
cpu, int offset)
         return 0;
     case 0x0c: /* Acknowledge */
         return gic_acknowledge_irq(s, cpu);
-    case 0x14: /* Runing Priority */
+    case 0x14: /* Running Priority */
         return s->running_priority[cpu];
     case 0x18: /* Highest Pending Interrupt */
         return s->current_pending[cpu];
diff --git a/hw/bt-hci-csr.c b/hw/bt-hci-csr.c
index 0dcf897..7dd99ea 100644
--- a/hw/bt-hci-csr.c
+++ b/hw/bt-hci-csr.c
@@ -222,7 +222,7 @@ static void csrhci_in_packet(struct csrhci_s *s,
uint8_t *pkt)

         rpkt = csrhci_out_packet_csr(s, H4_NEG_PKT, 10);

-        *rpkt ++ = 0x20;	/* Operational settings negotation Ok */
+        *rpkt ++ = 0x20;    /* Operational settings negotiation Ok */
         memcpy(rpkt, pkt, 7); rpkt += 7;
         *rpkt ++ = 0xff;
         *rpkt = 0xff;
diff --git a/hw/cirrus_vga.c b/hw/cirrus_vga.c
index c7e365b..1b216e8 100644
--- a/hw/cirrus_vga.c
+++ b/hw/cirrus_vga.c
@@ -783,7 +783,7 @@ static void
cirrus_bitblt_cputovideo_next(CirrusVGAState * s)
                 s->cirrus_srccounter -= s->cirrus_blt_srcpitch;
                 if (s->cirrus_srccounter <= 0)
                     goto the_end;
-                /* more bytes than needed can be transfered because of
+                /* more bytes than needed can be transferred because of
                    word alignment, so we keep them for the next line */
                 /* XXX: keep alignment to speed up transfer */
                 end_ptr = s->cirrus_bltbuf + s->cirrus_blt_srcpitch;
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
index 02d0183..48159be 100644
--- a/hw/etraxfs_dma.c
+++ b/hw/etraxfs_dma.c
@@ -180,7 +180,7 @@ struct fs_dma_channel
 	struct dma_descr_context current_c;
 	struct dma_descr_data current_d;

-	/* Controll registers.  */
+    /* Control registers.  */
 	uint32_t regs[DMA_REG_MAX];
 };

diff --git a/hw/etraxfs_pic.c b/hw/etraxfs_pic.c
index 47a56d7..1887084 100644
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
index 5ad52ab..69a21c1 100644
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
+    case 0x00: /* 00-1f:control */
 		switch(r&0x1f)
 		{
 		case 0x01:
@@ -826,7 +826,7 @@ static void OPLWriteReg(FM_OPL *OPL, int r, int v)
 					LOG(LOG_WAR,("OPL:write unmapped KEYBOARD port\n"));
 			}
 			return;
-		case 0x07:	/* DELTA-T controll : START,REC,MEMDATA,REPT,SPOFF,x,x,RST */
+        case 0x07:    /* DELTA-T control :
START,REC,MEMDATA,REPT,SPOFF,x,x,RST */
 			if(OPL->type&OPL_TYPE_ADPCM)
 				YM_DELTAT_ADPCM_Write(OPL->deltat,r-0x07,v);
 			return;
@@ -1380,7 +1380,7 @@ int OPLTimerOver(FM_OPL *OPL,int c)
 	else
 	{	/* Timer A */
 		OPL_STATUS_SET(OPL,0x40);
-		/* CSM mode key,TL controll */
+        /* CSM mode key,TL control */
 		if( OPL->mode & 0x80 )
 		{	/* CSM mode total level latch and auto key on */
 			int ch;
diff --git a/hw/gusemu.h b/hw/gusemu.h
index 5093767..34872aa 100644
--- a/hw/gusemu.h
+++ b/hw/gusemu.h
@@ -83,7 +83,7 @@ void gus_dma_transferdata(GUSEmuState *state, char
*dma_addr, unsigned int count
 /* it is possible to break down a single transfer into multiple ones,
but take care that: */
 /* -dma_count is actually count-1 */
 /* -before and during a transfer, DREQ is set and TC cleared */
-/* -when calling gus_dma_transferdata(), TC is only set true for call
transfering the last byte */
+/* -when calling gus_dma_transferdata(), TC is only set true for call
transferring the last byte */
 /* -after the last transfer, DREQ is cleared and TC is set */

 /* ** GF1 mixer emulation functions: */
diff --git a/hw/gusemu_hal.c b/hw/gusemu_hal.c
index c6f9537..6096690 100644
--- a/hw/gusemu_hal.c
+++ b/hw/gusemu_hal.c
@@ -502,7 +502,7 @@ void gus_dma_transferdata(GUSEmuState * state,
char *dma_addr, unsigned int coun
     /* this function gets called by the callback function as soon as
a DMA transfer is about to start
      * dma_addr is a translated address within accessible memory, not
the physical one,
      * count is (real dma count register)+1
-     * note that the amount of bytes transfered is fully determined
by values in the DMA registers
+     * note that the amount of bytes transferred is fully determined
by values in the DMA registers
      * do not forget to update DMA states after transferring the entire block:
      * DREQ cleared & TC asserted after the _whole_ transfer */

@@ -517,7 +517,7 @@ void gus_dma_transferdata(GUSEmuState * state,
char *dma_addr, unsigned int coun
         int             offset = (GUSregw(GUS42DMAStart) << 4) +
(GUSregb(GUS50DMAHigh) & 0xf);
         if (state->gusdma >= 4)
             offset = (offset & 0xc0000) + (2 * (offset & 0x1fff0));
/* 16 bit address translation */
-        destaddr = (char *) state->himemaddr + offset; /* wavetable
RAM adress */
+        destaddr = (char *) state->himemaddr + offset; /* wavetable
RAM address */
     }

     GUSregw(GUS42DMAStart) += (GUSword)  (count >> 4);
           /* ToDo: add 16bit GUS page limit? */
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
index f8149e6..6b6806d 100644
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
@@ -731,7 +731,7 @@ static void do_phy_write(lan9118_state *s, int
reg, uint32_t val)
             s->phy_status |= 0x0020;
         }
         break;
-    case 4: /* Auto-neg advertisment */
+    case 4: /* Auto-neg advertisement */
         s->phy_advertise = (val & 0x2d7f) | 0x80;
         break;
         /* TODO 17, 18, 27, 31 */
diff --git a/hw/omap2.c b/hw/omap2.c
index 5197fef..8a0d45e 100644
--- a/hw/omap2.c
+++ b/hw/omap2.c
@@ -1598,7 +1598,7 @@ static void omap_prcm_write(void *opaque,
target_phys_addr_t addr,
     case 0x500:	/* CM_CLKEN_PLL */
         if (value & 0xffffff30)
             fprintf(stderr, "%s: write 0s in CM_CLKEN_PLL for "
-                            "future compatiblity\n", __FUNCTION__);
+                            "future compatibility\n", __FUNCTION__);
         if ((s->clken[9] ^ value) & 0xcc) {
             s->clken[9] &= ~0xcc;
             s->clken[9] |= value & 0xcc;
@@ -1617,7 +1617,7 @@ static void omap_prcm_write(void *opaque,
target_phys_addr_t addr,
     case 0x540:	/* CM_CLKSEL1_PLL */
         if (value & 0xfc4000d7)
             fprintf(stderr, "%s: write 0s in CM_CLKSEL1_PLL for "
-                            "future compatiblity\n", __FUNCTION__);
+                            "future compatibility\n", __FUNCTION__);
         if ((s->clksel[5] ^ value) & 0x003fff00) {
             s->clksel[5] = value & 0x03bfff28;
             omap_prcm_dpll_update(s);
@@ -1629,7 +1629,7 @@ static void omap_prcm_write(void *opaque,
target_phys_addr_t addr,
     case 0x544:	/* CM_CLKSEL2_PLL */
         if (value & ~3)
             fprintf(stderr, "%s: write 0s in CM_CLKSEL2_PLL[31:2] for "
-                            "future compatiblity\n", __FUNCTION__);
+                            "future compatibility\n", __FUNCTION__);
         if (s->clksel[6] != (value & 3)) {
             s->clksel[6] = value & 3;
             omap_prcm_dpll_update(s);
diff --git a/hw/pc.c b/hw/pc.c
index 33778fe..b6dcba2 100644
--- a/hw/pc.c
+++ b/hw/pc.c
@@ -983,7 +983,7 @@ void pc_memory_init(MemoryRegion *system_memory,
     linux_boot = (kernel_filename != NULL);

     /* Allocate RAM.  We allocate it as a single memory region and use
-     * aliases to address portions of it, mostly for backwards compatiblity
+     * aliases to address portions of it, mostly for backwards compatibility
      * with older qemus that used qemu_ram_alloc().
      */
     ram = g_malloc(sizeof(*ram));
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
index 4ac710a..9eb3e9e 100644
--- a/hw/pl110.c
+++ b/hw/pl110.c
@@ -356,7 +356,7 @@ static void pl110_write(void *opaque,
target_phys_addr_t offset,
     int n;

     /* For simplicity invalidate the display whenever a control register
-       is writen to.  */
+       is written to.  */
     s->invalidate = 1;
     if (offset >= 0x200 && offset < 0x400) {
         /* Pallette.  */
diff --git a/hw/pl181.c b/hw/pl181.c
index 0943c09..26ba8bc 100644
--- a/hw/pl181.c
+++ b/hw/pl181.c
@@ -309,9 +309,9 @@ static uint32_t pl181_read(void *opaque,
target_phys_addr_t offset)
     case 0x48: /* FifoCnt */
         /* The documentation is somewhat vague about exactly what FifoCnt
            does.  On real hardware it appears to be when decrememnted
-           when a word is transfered between the FIFO and the serial
+           when a word is transferred between the FIFO and the serial
            data engine.  DataCnt is decremented after each byte is
-           transfered between the serial engine and the card.
+           transferred between the serial engine and the card.
            We don't emulate this level of detail, so both can be the same.  */
         tmp = (s->datacnt + 3) >> 2;
         if (s->linux_hack) {
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
1.7.5.4

