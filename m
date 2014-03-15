Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOlSF-0004JR-Ov
	for mharc-qemu-trivial@gnu.org; Sat, 15 Mar 2014 06:04:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlS9-00046j-6i
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 06:04:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlS5-0007BW-1B
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 06:04:29 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOlRv-00077s-4k; Sat, 15 Mar 2014 06:04:15 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0B80241D9C;
	Sat, 15 Mar 2014 14:04:13 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C9682668;
	Sat, 15 Mar 2014 13:57:04 +0400 (MSK)
Received: (nullmailer pid 20021 invoked by uid 1000);
	Sat, 15 Mar 2014 09:57:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Mar 2014 13:56:54 +0400
Message-Id: <1394877419-19949-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 08/13] misc: Fix typos in comments
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
X-List-Received-Date: Sat, 15 Mar 2014 10:04:33 -0000

From: Stefan Weil <sw@weilnetz.de>

Codespell found and fixed these new typos:

* doesnt -> doesn't
* funtion -> function
* perfomance -> performance
* remaing -> remaining

A coding style issue (line too long) was fixed manually.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
@@ -148,7 +148,7 @@ typedef void (*vgic_translate_fn)(GICState *s, int ir=
q, int cpu,
                                   uint32_t *field, bool to_kernel);
=20
 /* synthetic translate function used for clear/set registers to complete=
ly
- * clear a setting using a clear-register before setting the remaing bit=
s
+ * clear a setting using a clear-register before setting the remaining b=
its
  * using a set-register */
 static void translate_clear(GICState *s, int irq, int cpu,
                             uint32_t *field, bool to_kernel)
diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
index 7760272..26b71f6 100644
--- a/hw/net/fsl_etsec/rings.c
+++ b/hw/net/fsl_etsec/rings.c
@@ -195,8 +195,8 @@ static void process_tx_fcb(eTSEC *etsec)
=20
     /* if packet is IP4 and IP checksum is requested */
     if (flags & FCB_TX_IP && flags & FCB_TX_CIP) {
-        /* do IP4 checksum (TODO This funtion does TCP/UDP checksum but =
not sure
-         * if it also does IP4 checksum. */
+        /* do IP4 checksum (TODO This function does TCP/UDP checksum
+         * but not sure if it also does IP4 checksum.) */
         net_checksum_calculate(etsec->tx_buffer + 8,
                 etsec->tx_buffer_len - 8);
     }
diff --git a/target-arm/helper.c b/target-arm/helper.c
index aa5f22d..f0a1fd4 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -488,7 +488,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] =3D {
=20
 static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo =
*ri)
 {
-    /* Perfomance monitor registers user accessibility is controlled
+    /* Performance monitor registers user accessibility is controlled
      * by PMUSERENR.
      */
     if (arm_current_pl(env) =3D=3D 0 && !env->cp15.c9_pmuserenr) {
diff --git a/target-ppc/int_helper.c b/target-ppc/int_helper.c
index 63dde94..e14e304 100644
--- a/target-ppc/int_helper.c
+++ b/target-ppc/int_helper.c
@@ -2216,7 +2216,7 @@ static int bcd_cmp_mag(ppc_avr_t *a, ppc_avr_t *b)
         uint8_t dig_a =3D bcd_get_digit(a, i, &invalid);
         uint8_t dig_b =3D bcd_get_digit(b, i, &invalid);
         if (unlikely(invalid)) {
-            return 0; /* doesnt matter */
+            return 0; /* doesn't matter */
         } else if (dig_a > dig_b) {
             return 1;
         } else if (dig_a < dig_b) {
--=20
1.7.10.4


