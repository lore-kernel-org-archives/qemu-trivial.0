Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN5bM-0004x9-Kc
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 15:11:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WN5bF-0004jB-R1
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 15:10:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WN5bE-0003Mi-Qb
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 15:10:57 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:46636)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WN5bB-0003JG-LZ; Mon, 10 Mar 2014 15:10:53 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WN5b7-0002TR-BN; Mon, 10 Mar 2014 19:10:49 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 10 Mar 2014 19:10:44 +0000
Message-Id: <1394478649-9453-9-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
References: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH 08/12] hw/ppc: Avoid shifting left into sign
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
X-List-Received-Date: Mon, 10 Mar 2014 19:10:59 -0000

Add U suffix to various places where we were doing "1 << 31",
which is undefined behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ppc/ppc.c           | 2 +-
 hw/ppc/ppc440_bamboo.c | 4 ++--
 hw/ppc/ppc4xx_devs.c   | 2 +-
 hw/ppc/ppc_booke.c     | 4 ++--
 hw/ppc/virtex_ml507.c  | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

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
index d839960..773c4ea 100644
--- a/hw/ppc/ppc_booke.c
+++ b/hw/ppc/ppc_booke.c
@@ -34,7 +34,7 @@
 /* Timer Control Register */
 
 #define TCR_WP_SHIFT  30        /* Watchdog Timer Period */
-#define TCR_WP_MASK   (0x3 << TCR_WP_SHIFT)
+#define TCR_WP_MASK   (0x3U << TCR_WP_SHIFT)
 #define TCR_WRC_SHIFT 28        /* Watchdog Timer Reset Control */
 #define TCR_WRC_MASK  (0x3 << TCR_WRC_SHIFT)
 #define TCR_WIE       (1 << 27) /* Watchdog Timer Interrupt Enable */
@@ -58,7 +58,7 @@
 #define TSR_WRS_SHIFT 28        /* Watchdog Timer Reset Status */
 #define TSR_WRS_MASK  (0x3 << TSR_WRS_SHIFT)
 #define TSR_WIS       (1 << 30) /* Watchdog Timer Interrupt Status */
-#define TSR_ENW       (1 << 31) /* Enable Next Watchdog Timer */
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
1.9.0


