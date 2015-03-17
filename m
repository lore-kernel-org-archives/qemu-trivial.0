Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXssI-0005oi-3k
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 10:53:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <visweshn92@gmail.com>) id 1YXssD-0005hB-HW
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 10:53:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <visweshn92@gmail.com>) id 1YXss7-0006f2-Jd
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 10:53:37 -0400
Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230]:35007)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <visweshn92@gmail.com>)
	id 1YXss2-0006do-Ip; Tue, 17 Mar 2015 10:53:26 -0400
Received: by pdbop1 with SMTP id op1so11740037pdb.2;
	Tue, 17 Mar 2015 07:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TyH2KbjT9ZJyg53iSAr2YHFWAoeiVaIqonAoiBIgW4A=;
	b=pQdOZ9XDz46qbBaBHJC9BjDYv0EVyvMCM1exFFa65SzcTJGHbZ3BnnFdWlbNHWQchw
	l9fhL/EA9jJq97eDUPjo4vmgR59liN+MXgyIpa5ciyyNONt238YWfBkIg8cgsZXPZJsq
	zep3Ou1lLyTIS0xJq/7TLCvMG1ptcCIlVKWy+1GirhIXa2xF36TQGm61h6AMVDnOGcGi
	UQUrNVbMuo2fkfqyrtCb4PapYf7P/DE59YwzL6+LQahSsAQ87WfQpuMduUv9Jj3aZ6dh
	NFczzaoUzXMwnNO1GYjzuWO4zsk2ClBwlb90K53OkHRYuHO1ITWEKWi1o1axBAbEpK9T
	6p8A==
X-Received: by 10.70.101.226 with SMTP id fj2mr110304597pdb.23.1426604005689; 
	Tue, 17 Mar 2015 07:53:25 -0700 (PDT)
Received: from localhost.localdomain ([59.189.207.205])
	by mx.google.com with ESMTPSA id
	xx7sm22919320pab.21.2015.03.17.07.53.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Mar 2015 07:53:24 -0700 (PDT)
From: Viswesh <visweshn92@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 17 Mar 2015 22:53:08 +0800
Message-Id: <1426603988-3541-1-git-send-email-visweshn92@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::230
Cc: qemu-trivial@nongnu.org, kbastian@mail.uni-paderborn.de,
	Viswesh <visweshn92@gmail.com>, aneesh.kumar@linux.vnet.ibm.com,
	peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH v2] Fix typos in comments
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
X-List-Received-Date: Tue, 17 Mar 2015 14:53:40 -0000

The commit message is changed per review comments of Peter Maydell.
This should be good now.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


