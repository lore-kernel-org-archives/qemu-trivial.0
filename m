Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RZ9l1-0005DU-9r
	for mharc-qemu-trivial@gnu.org; Fri, 09 Dec 2011 18:21:35 -0500
Received: from eggs.gnu.org ([140.186.70.92]:48253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RZ9kv-0004rS-B3
	for qemu-trivial@nongnu.org; Fri, 09 Dec 2011 18:21:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RZ9kt-0000ft-NO
	for qemu-trivial@nongnu.org; Fri, 09 Dec 2011 18:21:29 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:46737)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RZ9kq-0000ey-3T; Fri, 09 Dec 2011 18:21:24 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	AD21A728188A; Sat, 10 Dec 2011 00:21:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id gKJFSL-g6ymz; Sat, 10 Dec 2011 00:20:53 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 50A337281C25; Sat, 10 Dec 2011 00:20:00 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 10 Dec 2011 00:19:45 +0100
Message-Id: <1323472786-26821-6-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1323472786-26821-1-git-send-email-sw@weilnetz.de>
References: <1323472786-26821-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 5/6] hw: Fix spelling in comments and code
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
X-List-Received-Date: Fri, 09 Dec 2011 23:21:32 -0000

compatiblity->compatibility
transfered->transferred
transfering->transferring

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/cirrus_vga.c |    2 +-
 hw/es1370.c     |   14 +++++++-------
 hw/gusemu.h     |    2 +-
 hw/gusemu_hal.c |    2 +-
 hw/omap2.c      |    6 +++---
 hw/pc.c         |    2 +-
 hw/pl181.c      |    4 ++--
 7 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/cirrus_vga.c b/hw/cirrus_vga.c
index c7e365b..1b216e8 100644
--- a/hw/cirrus_vga.c
+++ b/hw/cirrus_vga.c
@@ -783,7 +783,7 @@ static void cirrus_bitblt_cputovideo_next(CirrusVGAState * s)
                 s->cirrus_srccounter -= s->cirrus_blt_srcpitch;
                 if (s->cirrus_srccounter <= 0)
                     goto the_end;
-                /* more bytes than needed can be transfered because of
+                /* more bytes than needed can be transferred because of
                    word alignment, so we keep them for the next line */
                 /* XXX: keep alignment to speed up transfer */
                 end_ptr = s->cirrus_bltbuf + s->cirrus_blt_srcpitch;
diff --git a/hw/es1370.c b/hw/es1370.c
index c5c16b0..6a3ba55 100644
--- a/hw/es1370.c
+++ b/hw/es1370.c
@@ -788,7 +788,7 @@ static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loop_sel,
     int cnt = d->frame_cnt >> 16;
     int size = d->frame_cnt & 0xffff;
     int left = ((size - cnt + 1) << 2) + d->leftover;
-    int transfered = 0;
+    int transferred = 0;
     int temp = audio_MIN (max, audio_MIN (left, csc_bytes));
     int index = d - &s->chan[0];
 
@@ -807,7 +807,7 @@ static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loop_sel,
 
             temp -= acquired;
             addr += acquired;
-            transfered += acquired;
+            transferred += acquired;
         }
     }
     else {
@@ -823,11 +823,11 @@ static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loop_sel,
                 break;
             temp -= copied;
             addr += copied;
-            transfered += copied;
+            transferred += copied;
         }
     }
 
-    if (csc_bytes == transfered) {
+    if (csc_bytes == transferred) {
         *irq = 1;
         d->scount = sc | (sc << 16);
         ldebug ("sc = %d, rate = %f\n",
@@ -836,10 +836,10 @@ static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loop_sel,
     }
     else {
         *irq = 0;
-        d->scount = sc | (((csc_bytes - transfered - 1) >> d->shift) << 16);
+        d->scount = sc | (((csc_bytes - transferred - 1) >> d->shift) << 16);
     }
 
-    cnt += (transfered + d->leftover) >> 2;
+    cnt += (transferred + d->leftover) >> 2;
 
     if (s->sctl & loop_sel) {
         /* Bah, how stupid is that having a 0 represent true value?
@@ -853,7 +853,7 @@ static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loop_sel,
             d->frame_cnt |= cnt << 16;
     }
 
-    d->leftover = (transfered + d->leftover) & 3;
+    d->leftover = (transferred + d->leftover) & 3;
 }
 
 static void es1370_run_channel (ES1370State *s, size_t chan, int free_or_avail)
diff --git a/hw/gusemu.h b/hw/gusemu.h
index 27877c0..331bb6f 100644
--- a/hw/gusemu.h
+++ b/hw/gusemu.h
@@ -83,7 +83,7 @@ void gus_dma_transferdata(GUSEmuState *state, char *dma_addr, unsigned int count
 /* it is possible to break down a single transfer into multiple ones, but take care that: */
 /* -dma_count is actually count-1 */
 /* -before and during a transfer, DREQ is set and TC cleared */
-/* -when calling gus_dma_transferdata(), TC is only set true for call transfering the last byte */
+/* -when calling gus_dma_transferdata(), TC is only set true for call transferring the last byte */
 /* -after the last transfer, DREQ is cleared and TC is set */
 
 /* ** GF1 mixer emulation functions: */
diff --git a/hw/gusemu_hal.c b/hw/gusemu_hal.c
index 582779f..6096690 100644
--- a/hw/gusemu_hal.c
+++ b/hw/gusemu_hal.c
@@ -502,7 +502,7 @@ void gus_dma_transferdata(GUSEmuState * state, char *dma_addr, unsigned int coun
     /* this function gets called by the callback function as soon as a DMA transfer is about to start
      * dma_addr is a translated address within accessible memory, not the physical one,
      * count is (real dma count register)+1
-     * note that the amount of bytes transfered is fully determined by values in the DMA registers
+     * note that the amount of bytes transferred is fully determined by values in the DMA registers
      * do not forget to update DMA states after transferring the entire block:
      * DREQ cleared & TC asserted after the _whole_ transfer */
 
diff --git a/hw/omap2.c b/hw/omap2.c
index 91577ae..c09c04a 100644
--- a/hw/omap2.c
+++ b/hw/omap2.c
@@ -1616,7 +1616,7 @@ static void omap_prcm_write(void *opaque, target_phys_addr_t addr,
     case 0x500:	/* CM_CLKEN_PLL */
         if (value & 0xffffff30)
             fprintf(stderr, "%s: write 0s in CM_CLKEN_PLL for "
-                            "future compatiblity\n", __FUNCTION__);
+                            "future compatibility\n", __FUNCTION__);
         if ((s->clken[9] ^ value) & 0xcc) {
             s->clken[9] &= ~0xcc;
             s->clken[9] |= value & 0xcc;
@@ -1635,7 +1635,7 @@ static void omap_prcm_write(void *opaque, target_phys_addr_t addr,
     case 0x540:	/* CM_CLKSEL1_PLL */
         if (value & 0xfc4000d7)
             fprintf(stderr, "%s: write 0s in CM_CLKSEL1_PLL for "
-                            "future compatiblity\n", __FUNCTION__);
+                            "future compatibility\n", __FUNCTION__);
         if ((s->clksel[5] ^ value) & 0x003fff00) {
             s->clksel[5] = value & 0x03bfff28;
             omap_prcm_dpll_update(s);
@@ -1647,7 +1647,7 @@ static void omap_prcm_write(void *opaque, target_phys_addr_t addr,
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
diff --git a/hw/pl181.c b/hw/pl181.c
index 46855f6..d05bc19 100644
--- a/hw/pl181.c
+++ b/hw/pl181.c
@@ -311,9 +311,9 @@ static uint64_t pl181_read(void *opaque, target_phys_addr_t offset,
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
-- 
1.7.2.5


