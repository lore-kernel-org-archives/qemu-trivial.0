Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNUl1-00026r-Mm
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 16:25:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUMr-0002tT-JV
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:00:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUMp-0003Hh-PG
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:00:57 -0400
Received: from mail-la0-f45.google.com ([209.85.215.45]:37016)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TNUMl-0002LR-BY; Sun, 14 Oct 2012 16:00:51 -0400
Received: by mail-la0-f45.google.com with SMTP id m13so2786709lah.4
	for <multiple recipients>; Sun, 14 Oct 2012 13:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=PxakQXK00LbNQKPXbhpn0jVkB6KeLBbPfMcZnXTFxds=;
	b=qacyjPmXordt7PUStbKYo35uDi7CsVSxRV0h7iT95llyHXbJo3MXzg8iRjN1qgTW+f
	9fxl64j3pzUBlSHSYTD522LMOe0DZPpLtwDHqB7J1GZFXHiIQOGIw+Wlk5U7K/BCLgsk
	tr7zGlewKHiUOS12tr64ZUNP1iQ+c//3RGFjTKK165BF62Bwty0OspjYHyT5WkEcxcuG
	SRfdkMEA5su7o0NFvRW73n87/V1XLKiAHb/ulv1+TB6EPXR0cLYwsZuxfGdtQAFur+r4
	tZdg7W27c+46MFjAGc9VIFGiQiDf162UgxCPm8IW/L97nzK69MZXw312lvXCR1eVy7DJ
	Jyow==
Received: by 10.152.146.101 with SMTP id tb5mr4864615lab.44.1350244850593;
	Sun, 14 Oct 2012 13:00:50 -0700 (PDT)
Received: from localhost.localdomain (blueswirl.broker.freenet6.net.
	[2001:5c0:1000:b::b867])
	by mx.google.com with ESMTPS id r8sm3941759lba.15.2012.10.14.13.00.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 14 Oct 2012 13:00:49 -0700 (PDT)
From: Blue Swirl <blauwirbel@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 14 Oct 2012 19:58:58 +0000
Message-Id: <9b4ee7a47d8bc116e20f236a1ad9ed73a695123e.1350244587.git.blauwirbel@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com,
	Riku Voipio <riku.voipio@iki.fi>, Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-trivial] [PATCH 10/11] arm: add missing static and remove
	unused functions
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
X-List-Received-Date: Sun, 14 Oct 2012 20:25:54 -0000

Add missing 'static' qualifiers and remove unused functions.

Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
---
 hw/devices.h                      |    3 --
 hw/i2c.h                          |    3 --
 hw/omap.h                         |    1 -
 hw/omap_gpmc.c                    |   21 ---------------
 hw/pxa.h                          |    3 --
 hw/pxa2xx.c                       |    4 +-
 hw/pxa2xx_pcmcia.c                |   21 ---------------
 hw/soc_dma.c                      |   52 -------------------------------------
 hw/soc_dma.h                      |   16 +----------
 hw/tc6393xb.c                     |   16 -----------
 hw/tmp105.c                       |   16 -----------
 linux-user/arm/nwfpe/fpa11.c      |    4 +-
 linux-user/arm/nwfpe/fpa11.h      |    2 -
 linux-user/arm/nwfpe/fpa11_cprt.c |    8 +++---
 14 files changed, 9 insertions(+), 161 deletions(-)

diff --git a/hw/devices.h b/hw/devices.h
index 1a55c1e..b01af84 100644
--- a/hw/devices.h
+++ b/hw/devices.h
@@ -55,9 +55,6 @@ typedef struct TC6393xbState TC6393xbState;
 #define TC6393XB_RAM	0x110000 /* amount of ram for Video and USB */
 TC6393xbState *tc6393xb_init(struct MemoryRegion *sysmem,
                              uint32_t base, qemu_irq irq);
-void tc6393xb_gpio_out_set(TC6393xbState *s, int line,
-                    qemu_irq handler);
-qemu_irq *tc6393xb_gpio_in_get(TC6393xbState *s);
 qemu_irq tc6393xb_l3v_get(TC6393xbState *s);
 
 /* sm501.c */
diff --git a/hw/i2c.h b/hw/i2c.h
index 0f5682b..883b5c5 100644
--- a/hw/i2c.h
+++ b/hw/i2c.h
@@ -73,9 +73,6 @@ void *wm8750_dac_buffer(void *opaque, int samples);
 void wm8750_dac_commit(void *opaque);
 void wm8750_set_bclk_in(void *opaque, int new_hz);
 
-/* tmp105.c */
-void tmp105_set(I2CSlave *i2c, int temp);
-
 /* lm832x.c */
 void lm832x_key_event(DeviceState *dev, int key, int state);
 
diff --git a/hw/omap.h b/hw/omap.h
index 413851b..7aaf98c 100644
--- a/hw/omap.h
+++ b/hw/omap.h
@@ -114,7 +114,6 @@ struct omap_gpmc_s *omap_gpmc_init(struct omap_mpu_state_s *mpu,
                                    qemu_irq irq, qemu_irq drq);
 void omap_gpmc_reset(struct omap_gpmc_s *s);
 void omap_gpmc_attach(struct omap_gpmc_s *s, int cs, MemoryRegion *iomem);
-void omap_gpmc_attach_nand(struct omap_gpmc_s *s, int cs, DeviceState *nand);
 
 /*
  * Common IRQ numbers for level 1 interrupt handler
diff --git a/hw/omap_gpmc.c b/hw/omap_gpmc.c
index 2fc4137..2c02a83 100644
--- a/hw/omap_gpmc.c
+++ b/hw/omap_gpmc.c
@@ -871,24 +871,3 @@ void omap_gpmc_attach(struct omap_gpmc_s *s, int cs, MemoryRegion *iomem)
     f->iomem = iomem;
     omap_gpmc_cs_map(s, cs);
 }
-
-void omap_gpmc_attach_nand(struct omap_gpmc_s *s, int cs, DeviceState *nand)
-{
-    struct omap_gpmc_cs_file_s *f;
-    assert(nand);
-
-    if (cs < 0 || cs >= 8) {
-        fprintf(stderr, "%s: bad chip-select %i\n", __func__, cs);
-        exit(-1);
-    }
-    f = &s->cs_file[cs];
-
-    omap_gpmc_cs_unmap(s, cs);
-    f->config[0] &= ~(0xf << 10);
-    f->config[0] |= (OMAP_GPMC_NAND << 10);
-    f->dev = nand;
-    if (nand_getbuswidth(f->dev) == 16) {
-        f->config[0] |= OMAP_GPMC_16BIT << 12;
-    }
-    omap_gpmc_cs_map(s, cs);
-}
diff --git a/hw/pxa.h b/hw/pxa.h
index 6a21205..19891d8 100644
--- a/hw/pxa.h
+++ b/hw/pxa.h
@@ -97,7 +97,6 @@ typedef struct PXA2xxPCMCIAState PXA2xxPCMCIAState;
 PXA2xxPCMCIAState *pxa2xx_pcmcia_init(MemoryRegion *sysmem,
                                       target_phys_addr_t base);
 int pxa2xx_pcmcia_attach(void *opaque, PCMCIACardState *card);
-int pxa2xx_pcmcia_dettach(void *opaque);
 void pxa2xx_pcmcia_set_irq_cb(void *opaque, qemu_irq irq, qemu_irq cd_irq);
 
 /* pxa2xx_keypad.c */
@@ -114,8 +113,6 @@ void pxa27x_register_keypad(PXA2xxKeyPadState *kp, struct keymap *map,
 
 /* pxa2xx.c */
 typedef struct PXA2xxI2CState PXA2xxI2CState;
-PXA2xxI2CState *pxa2xx_i2c_init(target_phys_addr_t base,
-                qemu_irq irq, uint32_t page_size);
 i2c_bus *pxa2xx_i2c_bus(PXA2xxI2CState *s);
 
 typedef struct PXA2xxI2SState PXA2xxI2SState;
diff --git a/hw/pxa2xx.c b/hw/pxa2xx.c
index d5f1420..8f7051b 100644
--- a/hw/pxa2xx.c
+++ b/hw/pxa2xx.c
@@ -1449,8 +1449,8 @@ static TypeInfo pxa2xx_i2c_slave_info = {
     .class_init    = pxa2xx_i2c_slave_class_init,
 };
 
-PXA2xxI2CState *pxa2xx_i2c_init(target_phys_addr_t base,
-                qemu_irq irq, uint32_t region_size)
+static PXA2xxI2CState *pxa2xx_i2c_init(target_phys_addr_t base, qemu_irq irq,
+                                       uint32_t region_size)
 {
     DeviceState *dev;
     SysBusDevice *i2c_dev;
diff --git a/hw/pxa2xx_pcmcia.c b/hw/pxa2xx_pcmcia.c
index b15872a..209d0f9 100644
--- a/hw/pxa2xx_pcmcia.c
+++ b/hw/pxa2xx_pcmcia.c
@@ -177,27 +177,6 @@ int pxa2xx_pcmcia_attach(void *opaque, PCMCIACardState *card)
     return 0;
 }
 
-/* Eject card from the slot */
-int pxa2xx_pcmcia_dettach(void *opaque)
-{
-    PXA2xxPCMCIAState *s = (PXA2xxPCMCIAState *) opaque;
-    if (!s->slot.attached)
-        return -ENOENT;
-
-    s->card->detach(s->card->state);
-    s->card->slot = NULL;
-    s->card = NULL;
-
-    s->slot.attached = 0;
-
-    if (s->irq)
-        qemu_irq_lower(s->irq);
-    if (s->cd_irq)
-        qemu_irq_lower(s->cd_irq);
-
-    return 0;
-}
-
 /* Who to notify on card events */
 void pxa2xx_pcmcia_set_irq_cb(void *opaque, qemu_irq irq, qemu_irq cd_irq)
 {
diff --git a/hw/soc_dma.c b/hw/soc_dma.c
index 03bc846..fe9d0f4 100644
--- a/hw/soc_dma.c
+++ b/hw/soc_dma.c
@@ -255,58 +255,6 @@ struct soc_dma_s *soc_dma_init(int n)
     return &s->soc;
 }
 
-void soc_dma_port_add_fifo(struct soc_dma_s *soc, target_phys_addr_t virt_base,
-                soc_dma_io_t fn, void *opaque, int out)
-{
-    struct memmap_entry_s *entry;
-    struct dma_s *dma = (struct dma_s *) soc;
-
-    dma->memmap = g_realloc(dma->memmap, sizeof(*entry) *
-                    (dma->memmap_size + 1));
-    entry = soc_dma_lookup(dma, virt_base);
-
-    if (dma->memmap_size) {
-        if (entry->type == soc_dma_port_mem) {
-            if (entry->addr <= virt_base &&
-                            entry->addr + entry->u.mem.size > virt_base) {
-                fprintf(stderr, "%s: FIFO at " TARGET_FMT_lx
-                                " collides with RAM region at " TARGET_FMT_lx
-                                "-" TARGET_FMT_lx "\n", __FUNCTION__,
-                                (target_ulong) virt_base,
-                                (target_ulong) entry->addr, (target_ulong)
-                                (entry->addr + entry->u.mem.size));
-                exit(-1);
-            }
-
-            if (entry->addr <= virt_base)
-                entry ++;
-        } else
-            while (entry < dma->memmap + dma->memmap_size &&
-                            entry->addr <= virt_base) {
-                if (entry->addr == virt_base && entry->u.fifo.out == out) {
-                    fprintf(stderr, "%s: FIFO at " TARGET_FMT_lx
-                                    " collides FIFO at " TARGET_FMT_lx "\n",
-                                    __FUNCTION__, (target_ulong) virt_base,
-                                    (target_ulong) entry->addr);
-                    exit(-1);
-                }
-
-                entry ++;
-            }
-
-        memmove(entry + 1, entry,
-                        (uint8_t *) (dma->memmap + dma->memmap_size ++) -
-                        (uint8_t *) entry);
-    } else
-        dma->memmap_size ++;
-
-    entry->addr          = virt_base;
-    entry->type          = soc_dma_port_fifo;
-    entry->u.fifo.fn     = fn;
-    entry->u.fifo.opaque = opaque;
-    entry->u.fifo.out    = out;
-}
-
 void soc_dma_port_add_mem(struct soc_dma_s *soc, uint8_t *phys_base,
                 target_phys_addr_t virt_base, size_t size)
 {
diff --git a/hw/soc_dma.h b/hw/soc_dma.h
index 904b26c..3ad7f9c 100644
--- a/hw/soc_dma.h
+++ b/hw/soc_dma.h
@@ -84,26 +84,12 @@ void soc_dma_set_request(struct soc_dma_ch_s *ch, int level);
  *   ch->type[0...1],
  *   ch->vaddr[0...1],
  *   ch->paddr[0...1],
- * or after a soc_dma_port_add_fifo() or soc_dma_port_add_mem().  */
+ * or after a soc_dma_port_add_mem().  */
 void soc_dma_ch_update(struct soc_dma_ch_s *ch);
 
 /* The SoC should call this when the DMA module is being reset.  */
 void soc_dma_reset(struct soc_dma_s *s);
 struct soc_dma_s *soc_dma_init(int n);
 
-void soc_dma_port_add_fifo(struct soc_dma_s *dma, target_phys_addr_t virt_base,
-                soc_dma_io_t fn, void *opaque, int out);
 void soc_dma_port_add_mem(struct soc_dma_s *dma, uint8_t *phys_base,
                 target_phys_addr_t virt_base, size_t size);
-
-static inline void soc_dma_port_add_fifo_in(struct soc_dma_s *dma,
-                target_phys_addr_t virt_base, soc_dma_io_t fn, void *opaque)
-{
-    return soc_dma_port_add_fifo(dma, virt_base, fn, opaque, 0);
-}
-
-static inline void soc_dma_port_add_fifo_out(struct soc_dma_s *dma,
-                target_phys_addr_t virt_base, soc_dma_io_t fn, void *opaque)
-{
-    return soc_dma_port_add_fifo(dma, virt_base, fn, opaque, 1);
-}
diff --git a/hw/tc6393xb.c b/hw/tc6393xb.c
index 420925c..5526077 100644
--- a/hw/tc6393xb.c
+++ b/hw/tc6393xb.c
@@ -134,11 +134,6 @@ struct TC6393xbState {
              blanked : 1;
 };
 
-qemu_irq *tc6393xb_gpio_in_get(TC6393xbState *s)
-{
-    return s->gpio_in;
-}
-
 static void tc6393xb_gpio_set(void *opaque, int line, int level)
 {
 //    TC6393xbState *s = opaque;
@@ -151,17 +146,6 @@ static void tc6393xb_gpio_set(void *opaque, int line, int level)
     // FIXME: how does the chip reflect the GPIO input level change?
 }
 
-void tc6393xb_gpio_out_set(TC6393xbState *s, int line,
-                    qemu_irq handler)
-{
-    if (line >= TC6393XB_GPIOS) {
-        fprintf(stderr, "TC6393xb: no GPIO pin %d\n", line);
-        return;
-    }
-
-    s->handler[line] = handler;
-}
-
 static void tc6393xb_gpio_handler_update(TC6393xbState *s)
 {
     uint32_t level, diff;
diff --git a/hw/tmp105.c b/hw/tmp105.c
index 8e8dbd9..dbc3354 100644
--- a/hw/tmp105.c
+++ b/hw/tmp105.c
@@ -64,22 +64,6 @@ static void tmp105_alarm_update(TMP105State *s)
     tmp105_interrupt_update(s);
 }
 
-/* Units are 0.001 centigrades relative to 0 C.  */
-void tmp105_set(I2CSlave *i2c, int temp)
-{
-    TMP105State *s = (TMP105State *) i2c;
-
-    if (temp >= 128000 || temp < -128000) {
-        fprintf(stderr, "%s: values is out of range (%i.%03i C)\n",
-                        __FUNCTION__, temp / 1000, temp % 1000);
-        exit(-1);
-    }
-
-    s->temperature = ((int16_t) (temp * 0x800 / 128000)) << 4;
-
-    tmp105_alarm_update(s);
-}
-
 static const int tmp105_faultq[4] = { 1, 2, 4, 6 };
 
 static void tmp105_read(TMP105State *s)
diff --git a/linux-user/arm/nwfpe/fpa11.c b/linux-user/arm/nwfpe/fpa11.c
index eebd93f..3434036 100644
--- a/linux-user/arm/nwfpe/fpa11.c
+++ b/linux-user/arm/nwfpe/fpa11.c
@@ -33,7 +33,7 @@ FPA11* qemufpa = NULL;
 CPUARMState* user_registers;
 
 /* Reset the FPA11 chip.  Called to initialize and reset the emulator. */
-void resetFPA11(void)
+static void resetFPA11(void)
 {
   int i;
   FPA11 *fpa11 = GET_FPA11();
@@ -95,7 +95,7 @@ void SetRoundingMode(const unsigned int opcode)
    set_float_rounding_mode(rounding_mode, &fpa11->fp_status);
 }
 
-void SetRoundingPrecision(const unsigned int opcode)
+static void SetRoundingPrecision(const unsigned int opcode)
 {
     int rounding_precision;
    FPA11 *fpa11 = GET_FPA11();
diff --git a/linux-user/arm/nwfpe/fpa11.h b/linux-user/arm/nwfpe/fpa11.h
index 002b3cb..9afe981 100644
--- a/linux-user/arm/nwfpe/fpa11.h
+++ b/linux-user/arm/nwfpe/fpa11.h
@@ -89,9 +89,7 @@ typedef struct tagFPA11 {
 
 extern FPA11* qemufpa;
 
-void resetFPA11(void);
 void SetRoundingMode(const unsigned int);
-void SetRoundingPrecision(const unsigned int);
 
 static inline unsigned int readRegister(unsigned int reg)
 {
diff --git a/linux-user/arm/nwfpe/fpa11_cprt.c b/linux-user/arm/nwfpe/fpa11_cprt.c
index 8011897..b53e345 100644
--- a/linux-user/arm/nwfpe/fpa11_cprt.c
+++ b/linux-user/arm/nwfpe/fpa11_cprt.c
@@ -26,8 +26,8 @@
 //#include "fpmodule.h"
 //#include "fpmodule.inl"
 
-unsigned int PerformFLT(const unsigned int opcode);
-unsigned int PerformFIX(const unsigned int opcode);
+static unsigned int PerformFLT(const unsigned int opcode);
+static unsigned int PerformFIX(const unsigned int opcode);
 
 static unsigned int
 PerformComparison(const unsigned int opcode);
@@ -68,7 +68,7 @@ unsigned int EmulateCPRT(const unsigned int opcode)
   return nRc;
 }
 
-unsigned int PerformFLT(const unsigned int opcode)
+static unsigned int PerformFLT(const unsigned int opcode)
 {
    FPA11 *fpa11 = GET_FPA11();
 
@@ -107,7 +107,7 @@ unsigned int PerformFLT(const unsigned int opcode)
   return nRc;
 }
 
-unsigned int PerformFIX(const unsigned int opcode)
+static unsigned int PerformFIX(const unsigned int opcode)
 {
    FPA11 *fpa11 = GET_FPA11();
    unsigned int nRc = 1;
-- 
1.7.2.5


