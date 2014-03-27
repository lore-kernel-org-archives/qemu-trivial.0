Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTCqw-00067E-5R
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 12:08:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45607)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCqp-0005uY-MX
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 12:08:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCql-0000zJ-7s
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 12:08:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58233)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTCqZ-0000uP-Me; Thu, 27 Mar 2014 12:08:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B17F043734;
	Thu, 27 Mar 2014 20:08:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4C2E1693;
	Thu, 27 Mar 2014 19:28:36 +0400 (MSK)
Received: (nullmailer pid 1802 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:22 +0400
Message-Id: <1395934108-1694-18-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 17/23] hw/ppc: Avoid shifting left into sign
	bit
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
X-List-Received-Date: Thu, 27 Mar 2014 16:08:24 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Add U suffix to various places where we were doing "1 << 31",
which is undefined behaviour, and also to other constant
definitions in the same groups, for consistency.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/ppc/ppc.c           |    2 +-
 hw/ppc/ppc440_bamboo.c |    4 ++--
 hw/ppc/ppc4xx_devs.c   |    2 +-
 hw/ppc/ppc_booke.c     |   24 ++++++++++++------------
 hw/ppc/virtex_ml507.c  |    4 ++--
 5 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 0e82719..9c2a132 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1002,7 +1002,7 @@ static void cpu_4xx_wdt_cb (void *opaque)
     case 0x1:
         timer_mod(ppc40x_timer->wdt_timer, next);
         ppc40x_timer->wdt_next = next;
-        env->spr[SPR_40x_TSR] |= 1 << 31;
+        env->spr[SPR_40x_TSR] |= 1U << 31;
         break;
     case 0x2:
         timer_mod(ppc40x_timer->wdt_timer, next);
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index ec15bab..2ddc2ed 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -128,7 +128,7 @@ static void mmubooke_create_initial_mapping(CPUPPCState *env,
 
     tlb->attr = 0;
     tlb->prot = PAGE_VALID | ((PAGE_READ | PAGE_WRITE | PAGE_EXEC) << 4);
-    tlb->size = 1 << 31; /* up to 0x80000000  */
+    tlb->size = 1U << 31; /* up to 0x80000000  */
     tlb->EPN = va & TARGET_PAGE_MASK;
     tlb->RPN = pa & TARGET_PAGE_MASK;
     tlb->PID = 0;
@@ -136,7 +136,7 @@ static void mmubooke_create_initial_mapping(CPUPPCState *env,
     tlb = &env->tlb.tlbe[1];
     tlb->attr = 0;
     tlb->prot = PAGE_VALID | ((PAGE_READ | PAGE_WRITE | PAGE_EXEC) << 4);
-    tlb->size = 1 << 31; /* up to 0xffffffff  */
+    tlb->size = 1U << 31; /* up to 0xffffffff  */
     tlb->EPN = 0x80000000 & TARGET_PAGE_MASK;
     tlb->RPN = 0x80000000 & TARGET_PAGE_MASK;
     tlb->PID = 0;
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 9160ee7..8a43111 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -161,7 +161,7 @@ static void ppcuic_set_irq (void *opaque, int irq_num, int level)
     uint32_t mask, sr;
 
     uic = opaque;
-    mask = 1 << (31-irq_num);
+    mask = 1U << (31-irq_num);
     LOG_UIC("%s: irq %d level %d uicsr %08" PRIx32
                 " mask %08" PRIx32 " => %08" PRIx32 " %08" PRIx32 "\n",
                 __func__, irq_num, level,
diff --git a/hw/ppc/ppc_booke.c b/hw/ppc/ppc_booke.c
index d839960..8b94da6 100644
--- a/hw/ppc/ppc_booke.c
+++ b/hw/ppc/ppc_booke.c
@@ -34,15 +34,15 @@
 /* Timer Control Register */
 
 #define TCR_WP_SHIFT  30        /* Watchdog Timer Period */
-#define TCR_WP_MASK   (0x3 << TCR_WP_SHIFT)
+#define TCR_WP_MASK   (0x3U << TCR_WP_SHIFT)
 #define TCR_WRC_SHIFT 28        /* Watchdog Timer Reset Control */
-#define TCR_WRC_MASK  (0x3 << TCR_WRC_SHIFT)
-#define TCR_WIE       (1 << 27) /* Watchdog Timer Interrupt Enable */
-#define TCR_DIE       (1 << 26) /* Decrementer Interrupt Enable */
+#define TCR_WRC_MASK  (0x3U << TCR_WRC_SHIFT)
+#define TCR_WIE       (1U << 27) /* Watchdog Timer Interrupt Enable */
+#define TCR_DIE       (1U << 26) /* Decrementer Interrupt Enable */
 #define TCR_FP_SHIFT  24        /* Fixed-Interval Timer Period */
-#define TCR_FP_MASK   (0x3 << TCR_FP_SHIFT)
-#define TCR_FIE       (1 << 23) /* Fixed-Interval Timer Interrupt Enable */
-#define TCR_ARE       (1 << 22) /* Auto-Reload Enable */
+#define TCR_FP_MASK   (0x3U << TCR_FP_SHIFT)
+#define TCR_FIE       (1U << 23) /* Fixed-Interval Timer Interrupt Enable */
+#define TCR_ARE       (1U << 22) /* Auto-Reload Enable */
 
 /* Timer Control Register (e500 specific fields) */
 
@@ -53,12 +53,12 @@
 
 /* Timer Status Register  */
 
-#define TSR_FIS       (1 << 26) /* Fixed-Interval Timer Interrupt Status */
-#define TSR_DIS       (1 << 27) /* Decrementer Interrupt Status */
+#define TSR_FIS       (1U << 26) /* Fixed-Interval Timer Interrupt Status */
+#define TSR_DIS       (1U << 27) /* Decrementer Interrupt Status */
 #define TSR_WRS_SHIFT 28        /* Watchdog Timer Reset Status */
-#define TSR_WRS_MASK  (0x3 << TSR_WRS_SHIFT)
-#define TSR_WIS       (1 << 30) /* Watchdog Timer Interrupt Status */
-#define TSR_ENW       (1 << 31) /* Enable Next Watchdog Timer */
+#define TSR_WRS_MASK  (0x3U << TSR_WRS_SHIFT)
+#define TSR_WIS       (1U << 30) /* Watchdog Timer Interrupt Status */
+#define TSR_ENW       (1U << 31) /* Enable Next Watchdog Timer */
 
 typedef struct booke_timer_t booke_timer_t;
 struct booke_timer_t {
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index ce8ea91..3e3569d 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -71,7 +71,7 @@ static void mmubooke_create_initial_mapping(CPUPPCState *env,
 
     tlb->attr = 0;
     tlb->prot = PAGE_VALID | ((PAGE_READ | PAGE_WRITE | PAGE_EXEC) << 4);
-    tlb->size = 1 << 31; /* up to 0x80000000  */
+    tlb->size = 1U << 31; /* up to 0x80000000  */
     tlb->EPN = va & TARGET_PAGE_MASK;
     tlb->RPN = pa & TARGET_PAGE_MASK;
     tlb->PID = 0;
@@ -79,7 +79,7 @@ static void mmubooke_create_initial_mapping(CPUPPCState *env,
     tlb = &env->tlb.tlbe[1];
     tlb->attr = 0;
     tlb->prot = PAGE_VALID | ((PAGE_READ | PAGE_WRITE | PAGE_EXEC) << 4);
-    tlb->size = 1 << 31; /* up to 0xffffffff  */
+    tlb->size = 1U << 31; /* up to 0xffffffff  */
     tlb->EPN = 0x80000000 & TARGET_PAGE_MASK;
     tlb->RPN = 0x80000000 & TARGET_PAGE_MASK;
     tlb->PID = 0;
-- 
1.7.10.4


