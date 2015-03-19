Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWfI-0004oM-HG
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:22:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWfC-0004bV-54
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:22:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWf7-00031V-Q3
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:22:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42006)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWf1-0002ug-3g; Thu, 19 Mar 2015 05:22:39 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9B15941E49;
	Thu, 19 Mar 2015 12:22:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 96F54949;
	Thu, 19 Mar 2015 12:05:48 +0300 (MSK)
Received: (nullmailer pid 365 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:38 +0300
Message-Id: <de7ad4ce1f13ea59dfb35fc9985a1c90966646a8.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Viswesh <visweshn92@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 20/24] Fix typos in comments
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
X-List-Received-Date: Thu, 19 Mar 2015 09:22:54 -0000

From: Viswesh <visweshn92@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Viswesh <visweshn92@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 fsdev/virtfs-proxy-helper.c |  2 +-
 target-tricore/translate.c  | 22 +++++++++++-----------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index 13fe032..a698e2d 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -117,7 +117,7 @@ error:
 
 static int init_capabilities(void)
 {
-    /* helper needs following capbabilities only */
+    /* helper needs following capabilities only */
     cap_value_t cap_list[] = {
         CAP_CHOWN,
         CAP_DAC_OVERRIDE,
diff --git a/target-tricore/translate.c b/target-tricore/translate.c
index 15a24f7..0b7cf06 100644
--- a/target-tricore/translate.c
+++ b/target-tricore/translate.c
@@ -1111,7 +1111,7 @@ gen_m16add32_q(TCGv ret, TCGv arg1, TCGv arg2, TCGv arg3, uint32_t n)
     TCGv temp2 = tcg_temp_new();
     if (n == 0) {
         tcg_gen_mul_tl(temp, arg2, arg3);
-    } else { /* n is exspected to be 1 */
+    } else { /* n is expected to be 1 */
         tcg_gen_mul_tl(temp, arg2, arg3);
         tcg_gen_shli_tl(temp, temp, 1);
         /* catch special case r1 = r2 = 0x8000 */
@@ -1131,7 +1131,7 @@ gen_m16adds32_q(TCGv ret, TCGv arg1, TCGv arg2, TCGv arg3, uint32_t n)
     TCGv temp2 = tcg_temp_new();
     if (n == 0) {
         tcg_gen_mul_tl(temp, arg2, arg3);
-    } else { /* n is exspected to be 1 */
+    } else { /* n is expected to be 1 */
         tcg_gen_mul_tl(temp, arg2, arg3);
         tcg_gen_shli_tl(temp, temp, 1);
         /* catch special case r1 = r2 = 0x8000 */
@@ -1156,7 +1156,7 @@ gen_m16add64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
 
     if (n == 0) {
         tcg_gen_mul_tl(temp, arg2, arg3);
-    } else { /* n is exspected to be 1 */
+    } else { /* n is expected to be 1 */
         tcg_gen_mul_tl(temp, arg2, arg3);
         tcg_gen_shli_tl(temp, temp, 1);
         /* catch special case r1 = r2 = 0x8000 */
@@ -1188,7 +1188,7 @@ gen_m16adds64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
 
     if (n == 0) {
         tcg_gen_mul_tl(temp, arg2, arg3);
-    } else { /* n is exspected to be 1 */
+    } else { /* n is expected to be 1 */
         tcg_gen_mul_tl(temp, arg2, arg3);
         tcg_gen_shli_tl(temp, temp, 1);
         /* catch special case r1 = r2 = 0x8000 */
@@ -1975,7 +1975,7 @@ gen_m16sub32_q(TCGv ret, TCGv arg1, TCGv arg2, TCGv arg3, uint32_t n)
     TCGv temp2 = tcg_temp_new();
     if (n == 0) {
         tcg_gen_mul_tl(temp, arg2, arg3);
-    } else { /* n is exspected to be 1 */
+    } else { /* n is expected to be 1 */
         tcg_gen_mul_tl(temp, arg2, arg3);
         tcg_gen_shli_tl(temp, temp, 1);
         /* catch special case r1 = r2 = 0x8000 */
@@ -1995,7 +1995,7 @@ gen_m16subs32_q(TCGv ret, TCGv arg1, TCGv arg2, TCGv arg3, uint32_t n)
     TCGv temp2 = tcg_temp_new();
     if (n == 0) {
         tcg_gen_mul_tl(temp, arg2, arg3);
-    } else { /* n is exspected to be 1 */
+    } else { /* n is expected to be 1 */
         tcg_gen_mul_tl(temp, arg2, arg3);
         tcg_gen_shli_tl(temp, temp, 1);
         /* catch special case r1 = r2 = 0x8000 */
@@ -2020,7 +2020,7 @@ gen_m16sub64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
 
     if (n == 0) {
         tcg_gen_mul_tl(temp, arg2, arg3);
-    } else { /* n is exspected to be 1 */
+    } else { /* n is expected to be 1 */
         tcg_gen_mul_tl(temp, arg2, arg3);
         tcg_gen_shli_tl(temp, temp, 1);
         /* catch special case r1 = r2 = 0x8000 */
@@ -2052,7 +2052,7 @@ gen_m16subs64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
 
     if (n == 0) {
         tcg_gen_mul_tl(temp, arg2, arg3);
-    } else { /* n is exspected to be 1 */
+    } else { /* n is expected to be 1 */
         tcg_gen_mul_tl(temp, arg2, arg3);
         tcg_gen_shli_tl(temp, temp, 1);
         /* catch special case r1 = r2 = 0x8000 */
@@ -2560,7 +2560,7 @@ gen_mul_q(TCGv rl, TCGv rh, TCGv arg1, TCGv arg2, uint32_t n, uint32_t up_shift)
         }
         /* reset v bit */
         tcg_gen_movi_tl(cpu_PSW_V, 0);
-    } else { /* n is exspected to be 1 */
+    } else { /* n is expected to be 1 */
         tcg_gen_ext_i32_i64(temp_64, arg1);
         tcg_gen_ext_i32_i64(temp2_64, arg2);
 
@@ -2572,7 +2572,7 @@ gen_mul_q(TCGv rl, TCGv rh, TCGv arg1, TCGv arg2, uint32_t n, uint32_t up_shift)
             tcg_gen_shri_i64(temp_64, temp_64, up_shift - 1);
         }
         tcg_gen_extr_i64_i32(rl, rh, temp_64);
-        /* overflow only occours if r1 = r2 = 0x8000 */
+        /* overflow only occurs if r1 = r2 = 0x8000 */
         if (up_shift == 0) {/* result is 64 bit */
             tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_PSW_V, rh,
                                 0x80000000);
@@ -2605,7 +2605,7 @@ gen_mul_q_16(TCGv ret, TCGv arg1, TCGv arg2, uint32_t n)
     TCGv temp = tcg_temp_new();
     if (n == 0) {
         tcg_gen_mul_tl(ret, arg1, arg2);
-    } else { /* n is exspected to be 1 */
+    } else { /* n is expected to be 1 */
         tcg_gen_mul_tl(ret, arg1, arg2);
         tcg_gen_shli_tl(ret, ret, 1);
         /* catch special case r1 = r2 = 0x8000 */
-- 
2.1.4


