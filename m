Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWyh-0003PW-IK
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:42:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWyb-0003C7-84
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:42:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWyY-0001rM-Ts
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:42:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35903)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWyL-0001kk-U0; Thu, 19 Mar 2015 05:42:38 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8758241E4D;
	Thu, 19 Mar 2015 12:42:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 63465920;
	Thu, 19 Mar 2015 12:05:45 +0300 (MSK)
Received: (nullmailer pid 330 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:22 +0300
Message-Id: <77a8257ed711dd7c2ae73c741c93a68aaf0f3391.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-trivial] [PULL 04/24] omap: Fix warnings from Sparse
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
X-List-Received-Date: Thu, 19 Mar 2015 09:42:57 -0000

From: Stefan Weil <sw@weilnetz.de>

Sparse report:

arm/omap1.c:1015:9: warning: returning void-valued expression
arm/omap1.c:1084:9: warning: returning void-valued expression
arm/omap1.c:1178:9: warning: returning void-valued expression
arm/omap1.c:1287:9: warning: returning void-valued expression
arm/omap1.c:1382:9: warning: returning void-valued expression
arm/omap1.c:1650:9: warning: returning void-valued expression
arm/omap1.c:1778:9: warning: returning void-valued expression
arm/omap1.c:1985:9: warning: returning void-valued expression
arm/omap1.c:210:9: warning: returning void-valued expression
arm/omap1.c:2213:9: warning: returning void-valued expression
arm/omap1.c:2352:9: warning: returning void-valued expression
arm/omap1.c:2447:9: warning: returning void-valued expression
arm/omap1.c:2640:9: warning: returning void-valued expression
arm/omap1.c:317:9: warning: returning void-valued expression
arm/omap1.c:3413:13: warning: returning void-valued expression
arm/omap1.c:3414:13: warning: returning void-valued expression
arm/omap1.c:3415:14: warning: returning void-valued expression
arm/omap1.c:3589:9: warning: returning void-valued expression
arm/omap1.c:443:9: warning: returning void-valued expression
arm/omap1.c:588:9: warning: returning void-valued expression
arm/omap1.c:860:9: warning: returning void-valued expression
arm/omap2.c:1362:9: warning: returning void-valued expression
arm/omap2.c:450:9: warning: returning void-valued expression
arm/omap2.c:695:9: warning: returning void-valued expression
arm/omap2.c:760:9: warning: returning void-valued expression
hw/char/omap_uart.c:115:9: warning: returning void-valued expression
hw/display/omap_dss.c:1019:9: warning: returning void-valued expression
hw/display/omap_dss.c:215:9: warning: returning void-valued expression
hw/display/omap_dss.c:380:9: warning: returning void-valued expression
hw/display/omap_dss.c:739:9: warning: returning void-valued expression
hw/display/omap_dss.c:931:9: warning: returning void-valued expression
hw/dma/omap_dma.c:139:5: warning: returning void-valued expression
hw/dma/omap_dma.c:1505:9: warning: returning void-valued expression
hw/dma/omap_dma.c:1860:9: warning: returning void-valued expression
hw/gpio/omap_gpio.c:116:9: warning: returning void-valued expression
hw/misc/omap_gpmc.c:627:9: warning: returning void-valued expression
hw/misc/omap_l4.c:85:9: warning: returning void-valued expression
hw/misc/omap_sdrc.c:95:9: warning: returning void-valued expression
hw/misc/omap_tap.c:98:9: warning: returning void-valued expression
hw/sd/omap_mmc.c:409:9: warning: returning void-valued expression
hw/ssi/omap_spi.c:229:9: warning: returning void-valued expression
hw/timer/omap_gptimer.c:447:9: warning: returning void-valued expression

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/arm/omap1.c          | 65 +++++++++++++++++++++++++++++++++----------------
 hw/arm/omap2.c          | 12 ++++++---
 hw/char/omap_uart.c     |  3 ++-
 hw/display/omap_dss.c   | 15 ++++++++----
 hw/dma/omap_dma.c       |  8 +++---
 hw/gpio/omap_gpio.c     |  3 ++-
 hw/misc/omap_gpmc.c     |  3 ++-
 hw/misc/omap_l4.c       |  3 ++-
 hw/misc/omap_sdrc.c     |  3 ++-
 hw/misc/omap_tap.c      |  3 ++-
 hw/sd/omap_mmc.c        |  3 ++-
 hw/ssi/omap_spi.c       |  3 ++-
 hw/timer/omap_gptimer.c |  2 +-
 13 files changed, 84 insertions(+), 42 deletions(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index abb183c..0615044 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -207,7 +207,8 @@ static void omap_mpu_timer_write(void *opaque, hwaddr addr,
     struct omap_mpu_timer_s *s = (struct omap_mpu_timer_s *) opaque;
 
     if (size != 4) {
-        return omap_badwidth_write32(opaque, addr, value);
+        omap_badwidth_write32(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
@@ -314,7 +315,8 @@ static void omap_wd_timer_write(void *opaque, hwaddr addr,
     struct omap_watchdog_timer_s *s = (struct omap_watchdog_timer_s *) opaque;
 
     if (size != 2) {
-        return omap_badwidth_write16(opaque, addr, value);
+        omap_badwidth_write16(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
@@ -440,7 +442,8 @@ static void omap_os_timer_write(void *opaque, hwaddr addr,
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 4) {
-        return omap_badwidth_write32(opaque, addr, value);
+        omap_badwidth_write32(opaque, addr, value);
+        return;
     }
 
     switch (offset) {
@@ -585,7 +588,8 @@ static void omap_ulpd_pm_write(void *opaque, hwaddr addr,
     uint16_t diff;
 
     if (size != 2) {
-        return omap_badwidth_write16(opaque, addr, value);
+        omap_badwidth_write16(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
@@ -857,7 +861,8 @@ static void omap_pin_cfg_write(void *opaque, hwaddr addr,
     uint32_t diff;
 
     if (size != 4) {
-        return omap_badwidth_write32(opaque, addr, value);
+        omap_badwidth_write32(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
@@ -1012,7 +1017,8 @@ static void omap_id_write(void *opaque, hwaddr addr,
                           uint64_t value, unsigned size)
 {
     if (size != 4) {
-        return omap_badwidth_write32(opaque, addr, value);
+        omap_badwidth_write32(opaque, addr, value);
+        return;
     }
 
     OMAP_BAD_REG(addr);
@@ -1081,7 +1087,8 @@ static void omap_mpui_write(void *opaque, hwaddr addr,
     struct omap_mpu_state_s *s = (struct omap_mpu_state_s *) opaque;
 
     if (size != 4) {
-        return omap_badwidth_write32(opaque, addr, value);
+        omap_badwidth_write32(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
@@ -1175,7 +1182,8 @@ static void omap_tipb_bridge_write(void *opaque, hwaddr addr,
     struct omap_tipb_bridge_s *s = (struct omap_tipb_bridge_s *) opaque;
 
     if (size < 2) {
-        return omap_badwidth_write16(opaque, addr, value);
+        omap_badwidth_write16(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
@@ -1284,7 +1292,8 @@ static void omap_tcmi_write(void *opaque, hwaddr addr,
     struct omap_mpu_state_s *s = (struct omap_mpu_state_s *) opaque;
 
     if (size != 4) {
-        return omap_badwidth_write32(opaque, addr, value);
+        omap_badwidth_write32(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
@@ -1379,7 +1388,8 @@ static void omap_dpll_write(void *opaque, hwaddr addr,
     int div, mult;
 
     if (size != 2) {
-        return omap_badwidth_write16(opaque, addr, value);
+        omap_badwidth_write16(opaque, addr, value);
+        return;
     }
 
     if (addr == 0x00) {	/* CTL_REG */
@@ -1647,7 +1657,8 @@ static void omap_clkm_write(void *opaque, hwaddr addr,
     };
 
     if (size != 2) {
-        return omap_badwidth_write16(opaque, addr, value);
+        omap_badwidth_write16(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
@@ -1775,7 +1786,8 @@ static void omap_clkdsp_write(void *opaque, hwaddr addr,
     uint16_t diff;
 
     if (size != 2) {
-        return omap_badwidth_write16(opaque, addr, value);
+        omap_badwidth_write16(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
@@ -1982,7 +1994,8 @@ static void omap_mpuio_write(void *opaque, hwaddr addr,
     int ln;
 
     if (size != 2) {
-        return omap_badwidth_write16(opaque, addr, value);
+        omap_badwidth_write16(opaque, addr, value);
+        return;
     }
 
     switch (offset) {
@@ -2210,7 +2223,8 @@ static void omap_uwire_write(void *opaque, hwaddr addr,
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 2) {
-        return omap_badwidth_write16(opaque, addr, value);
+        omap_badwidth_write16(opaque, addr, value);
+        return;
     }
 
     switch (offset) {
@@ -2349,7 +2363,8 @@ static void omap_pwl_write(void *opaque, hwaddr addr,
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 1) {
-        return omap_badwidth_write8(opaque, addr, value);
+        omap_badwidth_write8(opaque, addr, value);
+        return;
     }
 
     switch (offset) {
@@ -2444,7 +2459,8 @@ static void omap_pwt_write(void *opaque, hwaddr addr,
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 1) {
-        return omap_badwidth_write8(opaque, addr, value);
+        omap_badwidth_write8(opaque, addr, value);
+        return;
     }
 
     switch (offset) {
@@ -2637,7 +2653,8 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
     time_t ti[2];
 
     if (size != 1) {
-        return omap_badwidth_write8(opaque, addr, value);
+        omap_badwidth_write8(opaque, addr, value);
+        return;
     }
 
     switch (offset) {
@@ -3410,9 +3427,14 @@ static void omap_mcbsp_write(void *opaque, hwaddr addr,
                              uint64_t value, unsigned size)
 {
     switch (size) {
-    case 2: return omap_mcbsp_writeh(opaque, addr, value);
-    case 4: return omap_mcbsp_writew(opaque, addr, value);
-    default: return omap_badwidth_write16(opaque, addr, value);
+    case 2:
+        omap_mcbsp_writeh(opaque, addr, value);
+        break;
+    case 4:
+        omap_mcbsp_writew(opaque, addr, value);
+        break;
+    default:
+        omap_badwidth_write16(opaque, addr, value);
     }
 }
 
@@ -3586,7 +3608,8 @@ static void omap_lpg_write(void *opaque, hwaddr addr,
     int offset = addr & OMAP_MPUI_REG_MASK;
 
     if (size != 1) {
-        return omap_badwidth_write8(opaque, addr, value);
+        omap_badwidth_write8(opaque, addr, value);
+        return;
     }
 
     switch (offset) {
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index b083ebe..3239014 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -447,7 +447,8 @@ static void omap_eac_write(void *opaque, hwaddr addr,
     struct omap_eac_s *s = (struct omap_eac_s *) opaque;
 
     if (size != 2) {
-        return omap_badwidth_write16(opaque, addr, value);
+        omap_badwidth_write16(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
@@ -692,7 +693,8 @@ static void omap_sti_write(void *opaque, hwaddr addr,
     struct omap_sti_s *s = (struct omap_sti_s *) opaque;
 
     if (size != 4) {
-        return omap_badwidth_write32(opaque, addr, value);
+        omap_badwidth_write32(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
@@ -757,7 +759,8 @@ static void omap_sti_fifo_write(void *opaque, hwaddr addr,
     uint8_t byte = value;
 
     if (size != 1) {
-        return omap_badwidth_write8(opaque, addr, size);
+        omap_badwidth_write8(opaque, addr, size);
+        return;
     }
 
     if (ch == STI_TRACE_CONTROL_CHANNEL) {
@@ -1359,7 +1362,8 @@ static void omap_prcm_write(void *opaque, hwaddr addr,
     struct omap_prcm_s *s = (struct omap_prcm_s *) opaque;
 
     if (size != 4) {
-        return omap_badwidth_write32(opaque, addr, value);
+        omap_badwidth_write32(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
diff --git a/hw/char/omap_uart.c b/hw/char/omap_uart.c
index 0b91693..88f2094 100644
--- a/hw/char/omap_uart.c
+++ b/hw/char/omap_uart.c
@@ -112,7 +112,8 @@ static void omap_uart_write(void *opaque, hwaddr addr,
     struct omap_uart_s *s = (struct omap_uart_s *) opaque;
 
     if (size == 4) {
-        return omap_badwidth_write8(opaque, addr, value);
+        omap_badwidth_write8(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
diff --git a/hw/display/omap_dss.c b/hw/display/omap_dss.c
index 24ccbcc..f1fef27 100644
--- a/hw/display/omap_dss.c
+++ b/hw/display/omap_dss.c
@@ -212,7 +212,8 @@ static void omap_diss_write(void *opaque, hwaddr addr,
     struct omap_dss_s *s = (struct omap_dss_s *) opaque;
 
     if (size != 4) {
-        return omap_badwidth_write32(opaque, addr, value);
+        omap_badwidth_write32(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
@@ -377,7 +378,8 @@ static void omap_disc_write(void *opaque, hwaddr addr,
     struct omap_dss_s *s = (struct omap_dss_s *) opaque;
 
     if (size != 4) {
-        return omap_badwidth_write32(opaque, addr, value);
+        omap_badwidth_write32(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
@@ -736,7 +738,8 @@ static void omap_rfbi_write(void *opaque, hwaddr addr,
     struct omap_dss_s *s = (struct omap_dss_s *) opaque;
 
     if (size != 4) {
-        return omap_badwidth_write32(opaque, addr, value);
+        omap_badwidth_write32(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
@@ -928,7 +931,8 @@ static void omap_venc_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
     if (size != 4) {
-        return omap_badwidth_write32(opaque, addr, size);
+        omap_badwidth_write32(opaque, addr, size);
+        return;
     }
 
     switch (addr) {
@@ -1016,7 +1020,8 @@ static void omap_im3_write(void *opaque, hwaddr addr,
                            uint64_t value, unsigned size)
 {
     if (size != 4) {
-        return omap_badwidth_write32(opaque, addr, value);
+        omap_badwidth_write32(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index 756a87a..97c57a0 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -136,7 +136,7 @@ struct omap_dma_s {
 
 static inline void omap_dma_interrupts_update(struct omap_dma_s *s)
 {
-    return s->intr_update(s);
+    s->intr_update(s);
 }
 
 static void omap_dma_channel_load(struct omap_dma_channel_s *ch)
@@ -1502,7 +1502,8 @@ static void omap_dma_write(void *opaque, hwaddr addr,
     int reg, ch;
 
     if (size != 2) {
-        return omap_badwidth_write16(opaque, addr, value);
+        omap_badwidth_write16(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
@@ -1857,7 +1858,8 @@ static void omap_dma4_write(void *opaque, hwaddr addr,
     struct omap_dma_channel_s *ch;
 
     if (size == 1) {
-        return omap_badwidth_write16(opaque, addr, value);
+        omap_badwidth_write16(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index 938782a..9a43486 100644
--- a/hw/gpio/omap_gpio.c
+++ b/hw/gpio/omap_gpio.c
@@ -113,7 +113,8 @@ static void omap_gpio_write(void *opaque, hwaddr addr,
     int ln;
 
     if (size != 2) {
-        return omap_badwidth_write16(opaque, addr, value);
+        omap_badwidth_write16(opaque, addr, value);
+        return;
     }
 
     switch (offset) {
diff --git a/hw/misc/omap_gpmc.c b/hw/misc/omap_gpmc.c
index a0de52f..74fc91c 100644
--- a/hw/misc/omap_gpmc.c
+++ b/hw/misc/omap_gpmc.c
@@ -624,7 +624,8 @@ static void omap_gpmc_write(void *opaque, hwaddr addr,
     struct omap_gpmc_cs_file_s *f;
 
     if (size != 4 && gpmc_wordaccess_only(addr)) {
-        return omap_badwidth_write32(opaque, addr, value);
+        omap_badwidth_write32(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
diff --git a/hw/misc/omap_l4.c b/hw/misc/omap_l4.c
index f237250..245ceac 100644
--- a/hw/misc/omap_l4.c
+++ b/hw/misc/omap_l4.c
@@ -82,7 +82,8 @@ static void omap_l4ta_write(void *opaque, hwaddr addr,
     struct omap_target_agent_s *s = (struct omap_target_agent_s *) opaque;
 
     if (size != 4) {
-        return omap_badwidth_write32(opaque, addr, value);
+        omap_badwidth_write32(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
diff --git a/hw/misc/omap_sdrc.c b/hw/misc/omap_sdrc.c
index ed62caf..3de0c0e 100644
--- a/hw/misc/omap_sdrc.c
+++ b/hw/misc/omap_sdrc.c
@@ -92,7 +92,8 @@ static void omap_sdrc_write(void *opaque, hwaddr addr,
     struct omap_sdrc_s *s = (struct omap_sdrc_s *) opaque;
 
     if (size != 4) {
-        return omap_badwidth_write32(opaque, addr, value);
+        omap_badwidth_write32(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
diff --git a/hw/misc/omap_tap.c b/hw/misc/omap_tap.c
index 9d2b710..6f02bb9 100644
--- a/hw/misc/omap_tap.c
+++ b/hw/misc/omap_tap.c
@@ -95,7 +95,8 @@ static void omap_tap_write(void *opaque, hwaddr addr,
                            uint64_t value, unsigned size)
 {
     if (size != 4) {
-        return omap_badwidth_write32(opaque, addr, value);
+        omap_badwidth_write32(opaque, addr, value);
+        return;
     }
 
     OMAP_BAD_REG(addr);
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index 86c477d..d072dec 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -406,7 +406,8 @@ static void omap_mmc_write(void *opaque, hwaddr offset,
     struct omap_mmc_s *s = (struct omap_mmc_s *) opaque;
 
     if (size != 2) {
-        return omap_badwidth_write16(opaque, offset, value);
+        omap_badwidth_write16(opaque, offset, value);
+        return;
     }
 
     switch (offset) {
diff --git a/hw/ssi/omap_spi.c b/hw/ssi/omap_spi.c
index 0ed3b11..119e325 100644
--- a/hw/ssi/omap_spi.c
+++ b/hw/ssi/omap_spi.c
@@ -226,7 +226,8 @@ static void omap_mcspi_write(void *opaque, hwaddr addr,
     int ch = 0;
 
     if (size != 4) {
-        return omap_badwidth_write32(opaque, addr, value);
+        omap_badwidth_write32(opaque, addr, value);
+        return;
     }
 
     switch (addr) {
diff --git a/hw/timer/omap_gptimer.c b/hw/timer/omap_gptimer.c
index b7f3d49..b8c8c01 100644
--- a/hw/timer/omap_gptimer.c
+++ b/hw/timer/omap_gptimer.c
@@ -444,7 +444,7 @@ static void omap_gp_timer_writeh(void *opaque, hwaddr addr,
     struct omap_gp_timer_s *s = (struct omap_gp_timer_s *) opaque;
 
     if (addr & 2)
-        return omap_gp_timer_write(opaque, addr, (value << 16) | s->writeh);
+        omap_gp_timer_write(opaque, addr, (value << 16) | s->writeh);
     else
         s->writeh = (uint16_t) value;
 }
-- 
2.1.4


