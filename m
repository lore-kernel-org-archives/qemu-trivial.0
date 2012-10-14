Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNUMl-0002pG-4f
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 16:00:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUMe-0002WS-8E
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:00:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUMc-0003Dy-6T
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:00:44 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:50005)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TNUMW-0002B9-Gc; Sun, 14 Oct 2012 16:00:36 -0400
Received: by mail-lb0-f173.google.com with SMTP id gj3so2850165lbb.4
	for <multiple recipients>; Sun, 14 Oct 2012 13:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=WzTb8wph7F+lKE7u8I3eQ0MHKf7eP14bnPFwwXU+Ou8=;
	b=OxK9MMsnLtcn9CdLTDuUN5iwGNAFudDZ2iWydAZOWzW/f+Oxy83DeoSNjB6Q4KMsa+
	mJIPf3p86mSG4rxupx+uXPL1gMqdS8ZmZy/f4ouTjI3suUrWyEqwzml/uoOpBjgSkoDN
	EfEmcdb90gxIM4RieFEqZFNXDbzj9VtAj//jxf72wIAWq+5pkaE061bCpnhIwzKj4UlP
	KIeOtpzv/nxALNCR6aJKvTLEJpXOfJanhTiex78S1XwE0YSVSCyUAUw5ShNNbRxqZHx+
	hjFZPynpkOhz3za2hCQkStZdcE+gxHlvaJRKa/V2/B6ybLtW9IapjNTOmnI1mrUqHFjX
	it6g==
Received: by 10.112.38.65 with SMTP id e1mr3681572lbk.15.1350244835487;
	Sun, 14 Oct 2012 13:00:35 -0700 (PDT)
Received: from localhost.localdomain (blueswirl.broker.freenet6.net.
	[2001:5c0:1000:b::b867])
	by mx.google.com with ESMTPS id r8sm3941759lba.15.2012.10.14.13.00.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 14 Oct 2012 13:00:34 -0700 (PDT)
From: Blue Swirl <blauwirbel@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 14 Oct 2012 19:58:56 +0000
Message-Id: <25a3bb42727abd0c0f57fee6a7d90ba10d17001a.1350244587.git.blauwirbel@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com, qemu-ppc@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] [PATCH 08/11] ppc: add missing static and remove
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
X-List-Received-Date: Sun, 14 Oct 2012 20:00:47 -0000

Add missing 'static' qualifiers and remove unused functions.

This removes 405cr model entirely but it was not accessible
before.

Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
---
 hw/adb.c         |    8 +-
 hw/adb.h         |    4 -
 hw/mac_nvram.c   |   24 ----
 hw/nvram.h       |   11 --
 hw/ppc.c         |   54 ++-------
 hw/ppc405.h      |    6 -
 hw/ppc405_uc.c   |  342 ------------------------------------------------------
 hw/ppc_mac.h     |    2 -
 target-ppc/cpu.h |    3 -
 9 files changed, 12 insertions(+), 442 deletions(-)

diff --git a/hw/adb.c b/hw/adb.c
index aa15f55..3b547f0 100644
--- a/hw/adb.c
+++ b/hw/adb.c
@@ -108,10 +108,10 @@ int adb_poll(ADBBusState *s, uint8_t *obuf)
     return olen;
 }
 
-ADBDevice *adb_register_device(ADBBusState *s, int devaddr,
-                               ADBDeviceRequest *devreq,
-                               ADBDeviceReset *devreset,
-                               void *opaque)
+static ADBDevice *adb_register_device(ADBBusState *s, int devaddr,
+                                      ADBDeviceRequest *devreq,
+                                      ADBDeviceReset *devreset,
+                                      void *opaque)
 {
     ADBDevice *d;
     if (s->nb_devices >= MAX_ADB_DEVICES)
diff --git a/hw/adb.h b/hw/adb.h
index b2a591c..5b27da2 100644
--- a/hw/adb.h
+++ b/hw/adb.h
@@ -56,10 +56,6 @@ int adb_request(ADBBusState *s, uint8_t *buf_out,
                 const uint8_t *buf, int len);
 int adb_poll(ADBBusState *s, uint8_t *buf_out);
 
-ADBDevice *adb_register_device(ADBBusState *s, int devaddr,
-                               ADBDeviceRequest *devreq,
-                               ADBDeviceReset *devreset,
-                               void *opaque);
 void adb_kbd_init(ADBBusState *bus);
 void adb_mouse_init(ADBBusState *bus);
 
diff --git a/hw/mac_nvram.c b/hw/mac_nvram.c
index ed0a2b7..75f8162 100644
--- a/hw/mac_nvram.c
+++ b/hw/mac_nvram.c
@@ -46,30 +46,6 @@ struct MacIONVRAMState {
 
 #define DEF_SYSTEM_SIZE 0xc10
 
-/* Direct access to NVRAM */
-uint32_t macio_nvram_read (void *opaque, uint32_t addr)
-{
-    MacIONVRAMState *s = opaque;
-    uint32_t ret;
-
-    if (addr < s->size)
-        ret = s->data[addr];
-    else
-        ret = -1;
-    NVR_DPRINTF("read addr %04x val %x\n", addr, ret);
-
-    return ret;
-}
-
-void macio_nvram_write (void *opaque, uint32_t addr, uint32_t val)
-{
-    MacIONVRAMState *s = opaque;
-
-    NVR_DPRINTF("write addr %04x val %x\n", addr, val);
-    if (addr < s->size)
-        s->data[addr] = val;
-}
-
 /* macio style NVRAM device */
 static void macio_nvram_writeb(void *opaque, target_phys_addr_t addr,
                                uint64_t value, unsigned size)
diff --git a/hw/nvram.h b/hw/nvram.h
index b6953d5..67c464d 100644
--- a/hw/nvram.h
+++ b/hw/nvram.h
@@ -10,17 +10,6 @@ typedef struct nvram_t {
     nvram_write_t write_fn;
 } nvram_t;
 
-void NVRAM_set_byte (nvram_t *nvram, uint32_t addr, uint8_t value);
-uint8_t NVRAM_get_byte (nvram_t *nvram, uint32_t addr);
-void NVRAM_set_word (nvram_t *nvram, uint32_t addr, uint16_t value);
-uint16_t NVRAM_get_word (nvram_t *nvram, uint32_t addr);
-void NVRAM_set_lword (nvram_t *nvram, uint32_t addr, uint32_t value);
-uint32_t NVRAM_get_lword (nvram_t *nvram, uint32_t addr);
-void NVRAM_set_string (nvram_t *nvram, uint32_t addr,
-                       const char *str, uint32_t max);
-int NVRAM_get_string (nvram_t *nvram, uint8_t *dst, uint16_t addr, int max);
-void NVRAM_set_crc (nvram_t *nvram, uint32_t addr,
-                    uint32_t start, uint32_t count);
 int PPC_NVRAM_set_params (nvram_t *nvram, uint16_t NVRAM_size,
                           const char *arch,
                           uint32_t RAM_size, int boot_device,
diff --git a/hw/ppc.c b/hw/ppc.c
index 98546de..dd4949e 100644
--- a/hw/ppc.c
+++ b/hw/ppc.c
@@ -608,13 +608,6 @@ uint32_t cpu_ppc_load_decr (CPUPPCState *env)
     return _cpu_ppc_load_decr(env, tb_env->decr_next);
 }
 
-uint32_t cpu_ppc_load_hdecr (CPUPPCState *env)
-{
-    ppc_tb_t *tb_env = env->tb_env;
-
-    return _cpu_ppc_load_decr(env, tb_env->hdecr_next);
-}
-
 uint64_t cpu_ppc_load_purr (CPUPPCState *env)
 {
     ppc_tb_t *tb_env = env->tb_env;
@@ -711,17 +704,12 @@ static inline void _cpu_ppc_store_hdecr(CPUPPCState *env, uint32_t hdecr,
     }
 }
 
-void cpu_ppc_store_hdecr (CPUPPCState *env, uint32_t value)
-{
-    _cpu_ppc_store_hdecr(env, cpu_ppc_load_hdecr(env), value, 0);
-}
-
 static void cpu_ppc_hdecr_cb (void *opaque)
 {
     _cpu_ppc_store_hdecr(opaque, 0x00000000, 0xFFFFFFFF, 1);
 }
 
-void cpu_ppc_store_purr (CPUPPCState *env, uint64_t value)
+static void cpu_ppc_store_purr(CPUPPCState *env, uint64_t value)
 {
     ppc_tb_t *tb_env = env->tb_env;
 
@@ -1152,23 +1140,23 @@ static inline void nvram_write (nvram_t *nvram, uint32_t addr, uint32_t val)
     (*nvram->write_fn)(nvram->opaque, addr, val);
 }
 
-void NVRAM_set_byte (nvram_t *nvram, uint32_t addr, uint8_t value)
+static void NVRAM_set_byte(nvram_t *nvram, uint32_t addr, uint8_t value)
 {
     nvram_write(nvram, addr, value);
 }
 
-uint8_t NVRAM_get_byte (nvram_t *nvram, uint32_t addr)
+static uint8_t NVRAM_get_byte(nvram_t *nvram, uint32_t addr)
 {
     return nvram_read(nvram, addr);
 }
 
-void NVRAM_set_word (nvram_t *nvram, uint32_t addr, uint16_t value)
+static void NVRAM_set_word(nvram_t *nvram, uint32_t addr, uint16_t value)
 {
     nvram_write(nvram, addr, value >> 8);
     nvram_write(nvram, addr + 1, value & 0xFF);
 }
 
-uint16_t NVRAM_get_word (nvram_t *nvram, uint32_t addr)
+static uint16_t NVRAM_get_word(nvram_t *nvram, uint32_t addr)
 {
     uint16_t tmp;
 
@@ -1178,7 +1166,7 @@ uint16_t NVRAM_get_word (nvram_t *nvram, uint32_t addr)
     return tmp;
 }
 
-void NVRAM_set_lword (nvram_t *nvram, uint32_t addr, uint32_t value)
+static void NVRAM_set_lword(nvram_t *nvram, uint32_t addr, uint32_t value)
 {
     nvram_write(nvram, addr, value >> 24);
     nvram_write(nvram, addr + 1, (value >> 16) & 0xFF);
@@ -1186,20 +1174,8 @@ void NVRAM_set_lword (nvram_t *nvram, uint32_t addr, uint32_t value)
     nvram_write(nvram, addr + 3, value & 0xFF);
 }
 
-uint32_t NVRAM_get_lword (nvram_t *nvram, uint32_t addr)
-{
-    uint32_t tmp;
-
-    tmp = nvram_read(nvram, addr) << 24;
-    tmp |= nvram_read(nvram, addr + 1) << 16;
-    tmp |= nvram_read(nvram, addr + 2) << 8;
-    tmp |= nvram_read(nvram, addr + 3);
-
-    return tmp;
-}
-
-void NVRAM_set_string (nvram_t *nvram, uint32_t addr,
-                       const char *str, uint32_t max)
+static void NVRAM_set_string(nvram_t *nvram, uint32_t addr, const char *str,
+                             uint32_t max)
 {
     int i;
 
@@ -1210,20 +1186,6 @@ void NVRAM_set_string (nvram_t *nvram, uint32_t addr,
     nvram_write(nvram, addr + max - 1, '\0');
 }
 
-int NVRAM_get_string (nvram_t *nvram, uint8_t *dst, uint16_t addr, int max)
-{
-    int i;
-
-    memset(dst, 0, max);
-    for (i = 0; i < max; i++) {
-        dst[i] = NVRAM_get_byte(nvram, addr + i);
-        if (dst[i] == '\0')
-            break;
-    }
-
-    return i;
-}
-
 static uint16_t NVRAM_crc_update (uint16_t prev, uint16_t value)
 {
     uint16_t tmp;
diff --git a/hw/ppc405.h b/hw/ppc405.h
index 1f5dc5f..54f0e00 100644
--- a/hw/ppc405.h
+++ b/hw/ppc405.h
@@ -59,12 +59,6 @@ struct ppc4xx_bd_info_t {
 ram_addr_t ppc405_set_bootinfo (CPUPPCState *env, ppc4xx_bd_info_t *bd,
                                 uint32_t flags);
 
-CPUPPCState *ppc405cr_init(MemoryRegion *address_space_mem,
-                        MemoryRegion ram_memories[4],
-                        target_phys_addr_t ram_bases[4],
-                        target_phys_addr_t ram_sizes[4],
-                        uint32_t sysclk, qemu_irq **picp,
-                        int do_init);
 CPUPPCState *ppc405ep_init(MemoryRegion *address_space_mem,
                         MemoryRegion ram_memories[2],
                         target_phys_addr_t ram_bases[2],
diff --git a/hw/ppc405_uc.c b/hw/ppc405_uc.c
index b52ab2f..a30ac7a 100644
--- a/hw/ppc405_uc.c
+++ b/hw/ppc405_uc.c
@@ -1823,348 +1823,6 @@ void store_40x_dbcr0 (CPUPPCState *env, uint32_t val)
 }
 
 /*****************************************************************************/
-/* PowerPC 405CR */
-enum {
-    PPC405CR_CPC0_PLLMR  = 0x0B0,
-    PPC405CR_CPC0_CR0    = 0x0B1,
-    PPC405CR_CPC0_CR1    = 0x0B2,
-    PPC405CR_CPC0_PSR    = 0x0B4,
-    PPC405CR_CPC0_JTAGID = 0x0B5,
-    PPC405CR_CPC0_ER     = 0x0B9,
-    PPC405CR_CPC0_FR     = 0x0BA,
-    PPC405CR_CPC0_SR     = 0x0BB,
-};
-
-enum {
-    PPC405CR_CPU_CLK   = 0,
-    PPC405CR_TMR_CLK   = 1,
-    PPC405CR_PLB_CLK   = 2,
-    PPC405CR_SDRAM_CLK = 3,
-    PPC405CR_OPB_CLK   = 4,
-    PPC405CR_EXT_CLK   = 5,
-    PPC405CR_UART_CLK  = 6,
-    PPC405CR_CLK_NB    = 7,
-};
-
-typedef struct ppc405cr_cpc_t ppc405cr_cpc_t;
-struct ppc405cr_cpc_t {
-    clk_setup_t clk_setup[PPC405CR_CLK_NB];
-    uint32_t sysclk;
-    uint32_t psr;
-    uint32_t cr0;
-    uint32_t cr1;
-    uint32_t jtagid;
-    uint32_t pllmr;
-    uint32_t er;
-    uint32_t fr;
-};
-
-static void ppc405cr_clk_setup (ppc405cr_cpc_t *cpc)
-{
-    uint64_t VCO_out, PLL_out;
-    uint32_t CPU_clk, TMR_clk, SDRAM_clk, PLB_clk, OPB_clk, EXT_clk, UART_clk;
-    int M, D0, D1, D2;
-
-    D0 = ((cpc->pllmr >> 26) & 0x3) + 1; /* CBDV */
-    if (cpc->pllmr & 0x80000000) {
-        D1 = (((cpc->pllmr >> 20) - 1) & 0xF) + 1; /* FBDV */
-        D2 = 8 - ((cpc->pllmr >> 16) & 0x7); /* FWDVA */
-        M = D0 * D1 * D2;
-        VCO_out = cpc->sysclk * M;
-        if (VCO_out < 400000000 || VCO_out > 800000000) {
-            /* PLL cannot lock */
-            cpc->pllmr &= ~0x80000000;
-            goto bypass_pll;
-        }
-        PLL_out = VCO_out / D2;
-    } else {
-        /* Bypass PLL */
-    bypass_pll:
-        M = D0;
-        PLL_out = cpc->sysclk * M;
-    }
-    CPU_clk = PLL_out;
-    if (cpc->cr1 & 0x00800000)
-        TMR_clk = cpc->sysclk; /* Should have a separate clock */
-    else
-        TMR_clk = CPU_clk;
-    PLB_clk = CPU_clk / D0;
-    SDRAM_clk = PLB_clk;
-    D0 = ((cpc->pllmr >> 10) & 0x3) + 1;
-    OPB_clk = PLB_clk / D0;
-    D0 = ((cpc->pllmr >> 24) & 0x3) + 2;
-    EXT_clk = PLB_clk / D0;
-    D0 = ((cpc->cr0 >> 1) & 0x1F) + 1;
-    UART_clk = CPU_clk / D0;
-    /* Setup CPU clocks */
-    clk_setup(&cpc->clk_setup[PPC405CR_CPU_CLK], CPU_clk);
-    /* Setup time-base clock */
-    clk_setup(&cpc->clk_setup[PPC405CR_TMR_CLK], TMR_clk);
-    /* Setup PLB clock */
-    clk_setup(&cpc->clk_setup[PPC405CR_PLB_CLK], PLB_clk);
-    /* Setup SDRAM clock */
-    clk_setup(&cpc->clk_setup[PPC405CR_SDRAM_CLK], SDRAM_clk);
-    /* Setup OPB clock */
-    clk_setup(&cpc->clk_setup[PPC405CR_OPB_CLK], OPB_clk);
-    /* Setup external clock */
-    clk_setup(&cpc->clk_setup[PPC405CR_EXT_CLK], EXT_clk);
-    /* Setup UART clock */
-    clk_setup(&cpc->clk_setup[PPC405CR_UART_CLK], UART_clk);
-}
-
-static uint32_t dcr_read_crcpc (void *opaque, int dcrn)
-{
-    ppc405cr_cpc_t *cpc;
-    uint32_t ret;
-
-    cpc = opaque;
-    switch (dcrn) {
-    case PPC405CR_CPC0_PLLMR:
-        ret = cpc->pllmr;
-        break;
-    case PPC405CR_CPC0_CR0:
-        ret = cpc->cr0;
-        break;
-    case PPC405CR_CPC0_CR1:
-        ret = cpc->cr1;
-        break;
-    case PPC405CR_CPC0_PSR:
-        ret = cpc->psr;
-        break;
-    case PPC405CR_CPC0_JTAGID:
-        ret = cpc->jtagid;
-        break;
-    case PPC405CR_CPC0_ER:
-        ret = cpc->er;
-        break;
-    case PPC405CR_CPC0_FR:
-        ret = cpc->fr;
-        break;
-    case PPC405CR_CPC0_SR:
-        ret = ~(cpc->er | cpc->fr) & 0xFFFF0000;
-        break;
-    default:
-        /* Avoid gcc warning */
-        ret = 0;
-        break;
-    }
-
-    return ret;
-}
-
-static void dcr_write_crcpc (void *opaque, int dcrn, uint32_t val)
-{
-    ppc405cr_cpc_t *cpc;
-
-    cpc = opaque;
-    switch (dcrn) {
-    case PPC405CR_CPC0_PLLMR:
-        cpc->pllmr = val & 0xFFF77C3F;
-        break;
-    case PPC405CR_CPC0_CR0:
-        cpc->cr0 = val & 0x0FFFFFFE;
-        break;
-    case PPC405CR_CPC0_CR1:
-        cpc->cr1 = val & 0x00800000;
-        break;
-    case PPC405CR_CPC0_PSR:
-        /* Read-only */
-        break;
-    case PPC405CR_CPC0_JTAGID:
-        /* Read-only */
-        break;
-    case PPC405CR_CPC0_ER:
-        cpc->er = val & 0xBFFC0000;
-        break;
-    case PPC405CR_CPC0_FR:
-        cpc->fr = val & 0xBFFC0000;
-        break;
-    case PPC405CR_CPC0_SR:
-        /* Read-only */
-        break;
-    }
-}
-
-static void ppc405cr_cpc_reset (void *opaque)
-{
-    ppc405cr_cpc_t *cpc;
-    int D;
-
-    cpc = opaque;
-    /* Compute PLLMR value from PSR settings */
-    cpc->pllmr = 0x80000000;
-    /* PFWD */
-    switch ((cpc->psr >> 30) & 3) {
-    case 0:
-        /* Bypass */
-        cpc->pllmr &= ~0x80000000;
-        break;
-    case 1:
-        /* Divide by 3 */
-        cpc->pllmr |= 5 << 16;
-        break;
-    case 2:
-        /* Divide by 4 */
-        cpc->pllmr |= 4 << 16;
-        break;
-    case 3:
-        /* Divide by 6 */
-        cpc->pllmr |= 2 << 16;
-        break;
-    }
-    /* PFBD */
-    D = (cpc->psr >> 28) & 3;
-    cpc->pllmr |= (D + 1) << 20;
-    /* PT   */
-    D = (cpc->psr >> 25) & 7;
-    switch (D) {
-    case 0x2:
-        cpc->pllmr |= 0x13;
-        break;
-    case 0x4:
-        cpc->pllmr |= 0x15;
-        break;
-    case 0x5:
-        cpc->pllmr |= 0x16;
-        break;
-    default:
-        break;
-    }
-    /* PDC  */
-    D = (cpc->psr >> 23) & 3;
-    cpc->pllmr |= D << 26;
-    /* ODP  */
-    D = (cpc->psr >> 21) & 3;
-    cpc->pllmr |= D << 10;
-    /* EBPD */
-    D = (cpc->psr >> 17) & 3;
-    cpc->pllmr |= D << 24;
-    cpc->cr0 = 0x0000003C;
-    cpc->cr1 = 0x2B0D8800;
-    cpc->er = 0x00000000;
-    cpc->fr = 0x00000000;
-    ppc405cr_clk_setup(cpc);
-}
-
-static void ppc405cr_clk_init (ppc405cr_cpc_t *cpc)
-{
-    int D;
-
-    /* XXX: this should be read from IO pins */
-    cpc->psr = 0x00000000; /* 8 bits ROM */
-    /* PFWD */
-    D = 0x2; /* Divide by 4 */
-    cpc->psr |= D << 30;
-    /* PFBD */
-    D = 0x1; /* Divide by 2 */
-    cpc->psr |= D << 28;
-    /* PDC */
-    D = 0x1; /* Divide by 2 */
-    cpc->psr |= D << 23;
-    /* PT */
-    D = 0x5; /* M = 16 */
-    cpc->psr |= D << 25;
-    /* ODP */
-    D = 0x1; /* Divide by 2 */
-    cpc->psr |= D << 21;
-    /* EBDP */
-    D = 0x2; /* Divide by 4 */
-    cpc->psr |= D << 17;
-}
-
-static void ppc405cr_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[7],
-                               uint32_t sysclk)
-{
-    ppc405cr_cpc_t *cpc;
-
-    cpc = g_malloc0(sizeof(ppc405cr_cpc_t));
-    memcpy(cpc->clk_setup, clk_setup,
-           PPC405CR_CLK_NB * sizeof(clk_setup_t));
-    cpc->sysclk = sysclk;
-    cpc->jtagid = 0x42051049;
-    ppc_dcr_register(env, PPC405CR_CPC0_PSR, cpc,
-                     &dcr_read_crcpc, &dcr_write_crcpc);
-    ppc_dcr_register(env, PPC405CR_CPC0_CR0, cpc,
-                     &dcr_read_crcpc, &dcr_write_crcpc);
-    ppc_dcr_register(env, PPC405CR_CPC0_CR1, cpc,
-                     &dcr_read_crcpc, &dcr_write_crcpc);
-    ppc_dcr_register(env, PPC405CR_CPC0_JTAGID, cpc,
-                     &dcr_read_crcpc, &dcr_write_crcpc);
-    ppc_dcr_register(env, PPC405CR_CPC0_PLLMR, cpc,
-                     &dcr_read_crcpc, &dcr_write_crcpc);
-    ppc_dcr_register(env, PPC405CR_CPC0_ER, cpc,
-                     &dcr_read_crcpc, &dcr_write_crcpc);
-    ppc_dcr_register(env, PPC405CR_CPC0_FR, cpc,
-                     &dcr_read_crcpc, &dcr_write_crcpc);
-    ppc_dcr_register(env, PPC405CR_CPC0_SR, cpc,
-                     &dcr_read_crcpc, &dcr_write_crcpc);
-    ppc405cr_clk_init(cpc);
-    qemu_register_reset(ppc405cr_cpc_reset, cpc);
-}
-
-CPUPPCState *ppc405cr_init(MemoryRegion *address_space_mem,
-                        MemoryRegion ram_memories[4],
-                        target_phys_addr_t ram_bases[4],
-                        target_phys_addr_t ram_sizes[4],
-                        uint32_t sysclk, qemu_irq **picp,
-                        int do_init)
-{
-    clk_setup_t clk_setup[PPC405CR_CLK_NB];
-    qemu_irq dma_irqs[4];
-    CPUPPCState *env;
-    qemu_irq *pic, *irqs;
-
-    memset(clk_setup, 0, sizeof(clk_setup));
-    env = ppc4xx_init("405cr", &clk_setup[PPC405CR_CPU_CLK],
-                      &clk_setup[PPC405CR_TMR_CLK], sysclk);
-    /* Memory mapped devices registers */
-    /* PLB arbitrer */
-    ppc4xx_plb_init(env);
-    /* PLB to OPB bridge */
-    ppc4xx_pob_init(env);
-    /* OBP arbitrer */
-    ppc4xx_opba_init(0xef600600);
-    /* Universal interrupt controller */
-    irqs = g_malloc0(sizeof(qemu_irq) * PPCUIC_OUTPUT_NB);
-    irqs[PPCUIC_OUTPUT_INT] =
-        ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT];
-    irqs[PPCUIC_OUTPUT_CINT] =
-        ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT];
-    pic = ppcuic_init(env, irqs, 0x0C0, 0, 1);
-    *picp = pic;
-    /* SDRAM controller */
-    ppc4xx_sdram_init(env, pic[14], 1, ram_memories,
-                      ram_bases, ram_sizes, do_init);
-    /* External bus controller */
-    ppc405_ebc_init(env);
-    /* DMA controller */
-    dma_irqs[0] = pic[26];
-    dma_irqs[1] = pic[25];
-    dma_irqs[2] = pic[24];
-    dma_irqs[3] = pic[23];
-    ppc405_dma_init(env, dma_irqs);
-    /* Serial ports */
-    if (serial_hds[0] != NULL) {
-        serial_mm_init(address_space_mem, 0xef600300, 0, pic[0],
-                       PPC_SERIAL_MM_BAUDBASE, serial_hds[0],
-                       DEVICE_BIG_ENDIAN);
-    }
-    if (serial_hds[1] != NULL) {
-        serial_mm_init(address_space_mem, 0xef600400, 0, pic[1],
-                       PPC_SERIAL_MM_BAUDBASE, serial_hds[1],
-                       DEVICE_BIG_ENDIAN);
-    }
-    /* IIC controller */
-    ppc405_i2c_init(0xef600500, pic[2]);
-    /* GPIO */
-    ppc405_gpio_init(0xef600700);
-    /* CPU control */
-    ppc405cr_cpc_init(env, clk_setup, sysclk);
-
-    return env;
-}
-
-/*****************************************************************************/
 /* PowerPC 405EP */
 /* CPU control */
 enum {
diff --git a/hw/ppc_mac.h b/hw/ppc_mac.h
index 7d08418..46adecc 100644
--- a/hw/ppc_mac.h
+++ b/hw/ppc_mac.h
@@ -76,6 +76,4 @@ MacIONVRAMState *macio_nvram_init (target_phys_addr_t size,
 void macio_nvram_setup_bar(MacIONVRAMState *s, MemoryRegion *bar,
                            target_phys_addr_t mem_base);
 void pmac_format_nvram_partition (MacIONVRAMState *nvr, int len);
-uint32_t macio_nvram_read (void *opaque, uint32_t addr);
-void macio_nvram_write (void *opaque, uint32_t addr, uint32_t val);
 #endif /* !defined(__PPC_MAC_H__) */
diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
index faf4404..d3ada54 100644
--- a/target-ppc/cpu.h
+++ b/target-ppc/cpu.h
@@ -1175,10 +1175,7 @@ void cpu_ppc_store_atbl (CPUPPCState *env, uint32_t value);
 void cpu_ppc_store_atbu (CPUPPCState *env, uint32_t value);
 uint32_t cpu_ppc_load_decr (CPUPPCState *env);
 void cpu_ppc_store_decr (CPUPPCState *env, uint32_t value);
-uint32_t cpu_ppc_load_hdecr (CPUPPCState *env);
-void cpu_ppc_store_hdecr (CPUPPCState *env, uint32_t value);
 uint64_t cpu_ppc_load_purr (CPUPPCState *env);
-void cpu_ppc_store_purr (CPUPPCState *env, uint64_t value);
 uint32_t cpu_ppc601_load_rtcl (CPUPPCState *env);
 uint32_t cpu_ppc601_load_rtcu (CPUPPCState *env);
 #if !defined(CONFIG_USER_ONLY)
-- 
1.7.2.5


