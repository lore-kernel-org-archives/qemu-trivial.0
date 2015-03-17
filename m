Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXrlt-0000Gv-1U
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 09:43:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <visweshn92@gmail.com>) id 1YXper-0002Rt-Bx
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 07:27:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <visweshn92@gmail.com>) id 1YXpeq-0001ny-3D
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 07:27:37 -0400
Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b]:36131)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <visweshn92@gmail.com>)
	id 1YXpek-0001mu-KT; Tue, 17 Mar 2015 07:27:30 -0400
Received: by padcy3 with SMTP id cy3so7206941pad.3;
	Tue, 17 Mar 2015 04:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ugidjjibekuIxGv6hSsDissZAuON4dNDJTj0xhTBzIc=;
	b=w6o008o7zBrQxLQkgyNgsXFuvjxpe9K3YQFrhXhMA1BgZCeyedb83gK8vneyr0sfrE
	OUPT4Wji4iLtj4fpEinsXlvYtrZeWixhoouolL00S1B919+X9mwCk2GpGZ5yIt+gFeWX
	LeiUo/fSr4XovA8DpX4fGtF3Kz/ZlPjOdbZaackpdDrJmxBs33JgvPstogiMksf+4vB3
	+r/3v929VsdbLhdFxkelMF+0n+NAVGUsrYQmtGaZglzttC4P+DGYb00Lor+PsXNVm21p
	jQJ2wPNcpoHj740/JPOyrCkFaT5Sie7+wjEDm//s/1lnBp3CU9zBg2t7uEZZV8eTgUYO
	prAg==
X-Received: by 10.66.148.165 with SMTP id tt5mr140868400pab.38.1426591648956; 
	Tue, 17 Mar 2015 04:27:28 -0700 (PDT)
Received: from loi.comp.nus.edu.sg ([137.132.252.75])
	by mx.google.com with ESMTPSA id e4sm21945327pdm.70.2015.03.17.04.27.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Mar 2015 04:27:27 -0700 (PDT)
From: Viswesh <visweshn92@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 17 Mar 2015 19:27:16 +0800
Message-Id: <1426591636-30212-1-git-send-email-visweshn92@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22b
X-Mailman-Approved-At: Tue, 17 Mar 2015 09:42:59 -0400
Cc: qemu-trivial@nongnu.org, kbastian@mail.uni-paderborn.de,
	aneesh.kumar@linux.vnet.ibm.com, Viswesh <visweshn92@gmail.com>
Subject: [Qemu-trivial] [PATCH] Cleaning up the documentation
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
X-List-Received-Date: Tue, 17 Mar 2015 11:27:38 -0000

This commit corrects typo in the documentation.
Please consider this as trivial commit patch.

Signed-off-by: Viswesh <visweshn92@gmail.com>
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
1.9.1


