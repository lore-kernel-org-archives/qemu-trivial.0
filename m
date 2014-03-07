Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLzpp-0008Oi-L0
	for mharc-qemu-trivial@gnu.org; Fri, 07 Mar 2014 13:49:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WLzpi-0008E3-Pq
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 13:49:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WLzpd-0005KD-Q3
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 13:49:22 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:46006
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WLzpT-0005JK-SC; Fri, 07 Mar 2014 13:49:07 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 804AB17FC70; Fri,  7 Mar 2014 19:49:04 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri,  7 Mar 2014 19:48:59 +0100
Message-Id: <1394218139-24915-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] [PATCH] misc: Fix typos in comments
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
X-List-Received-Date: Fri, 07 Mar 2014 18:49:28 -0000

Codespell found and fixed these new typos:

* doesnt -> doesn't
* funtion -> function
* perfomance -> performance
* remaing -> remaining

A code style issue (line too long) was fixed manually.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/intc/arm_gic_kvm.c    |    2 +-
 hw/net/fsl_etsec/rings.c |    4 ++--
 target-arm/helper.c      |    2 +-
 target-ppc/int_helper.c  |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index 100b6bf..719d227 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -148,7 +148,7 @@ typedef void (*vgic_translate_fn)(GICState *s, int irq, int cpu,
                                   uint32_t *field, bool to_kernel);
 
 /* synthetic translate function used for clear/set registers to completely
- * clear a setting using a clear-register before setting the remaing bits
+ * clear a setting using a clear-register before setting the remaining bits
  * using a set-register */
 static void translate_clear(GICState *s, int irq, int cpu,
                             uint32_t *field, bool to_kernel)
diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
index 7760272..d7c38fa 100644
--- a/hw/net/fsl_etsec/rings.c
+++ b/hw/net/fsl_etsec/rings.c
@@ -195,8 +195,8 @@ static void process_tx_fcb(eTSEC *etsec)
 
     /* if packet is IP4 and IP checksum is requested */
     if (flags & FCB_TX_IP && flags & FCB_TX_CIP) {
-        /* do IP4 checksum (TODO This funtion does TCP/UDP checksum but not sure
-         * if it also does IP4 checksum. */
+        /* do IP4 checksum (TODO This function does TCP/UDP checksum
+         * but not sure if it also does IP4 checksum. */
         net_checksum_calculate(etsec->tx_buffer + 8,
                 etsec->tx_buffer_len - 8);
     }
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 90f85f1..3495220 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -469,7 +469,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 
 static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    /* Perfomance monitor registers user accessibility is controlled
+    /* Performance monitor registers user accessibility is controlled
      * by PMUSERENR.
      */
     if (arm_current_pl(env) == 0 && !env->cp15.c9_pmuserenr) {
diff --git a/target-ppc/int_helper.c b/target-ppc/int_helper.c
index 63dde94..e14e304 100644
--- a/target-ppc/int_helper.c
+++ b/target-ppc/int_helper.c
@@ -2216,7 +2216,7 @@ static int bcd_cmp_mag(ppc_avr_t *a, ppc_avr_t *b)
         uint8_t dig_a = bcd_get_digit(a, i, &invalid);
         uint8_t dig_b = bcd_get_digit(b, i, &invalid);
         if (unlikely(invalid)) {
-            return 0; /* doesnt matter */
+            return 0; /* doesn't matter */
         } else if (dig_a > dig_b) {
             return 1;
         } else if (dig_a < dig_b) {
-- 
1.7.10.4


