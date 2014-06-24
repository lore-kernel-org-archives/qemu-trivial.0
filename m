Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzTRi-00086H-6L
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 12:19:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTRa-0007r0-UO
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:19:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTRW-0001Z7-0N
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:19:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44117)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WzTRG-0001Nv-IU; Tue, 24 Jun 2014 12:19:18 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EE30844084;
	Tue, 24 Jun 2014 20:19:16 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 51BA46BB;
	Tue, 24 Jun 2014 20:09:23 +0400 (MSK)
Received: (nullmailer pid 15630 invoked by uid 1000);
	Tue, 24 Jun 2014 16:09:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jun 2014 20:09:16 +0400
Message-Id: <1403626160-15546-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 10/14] target-unicore: Remove unused functions
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
X-List-Received-Date: Tue, 24 Jun 2014 16:19:44 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The functions gen_st64, gen_ld64, gen_mulxy, ucf64_itod and
ucf64_dtoi are all unused; remove them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-unicore32/translate.c    |   28 ----------------------------
 target-unicore32/ucf64_helper.c |   22 ----------------------
 2 files changed, 50 deletions(-)

diff --git a/target-unicore32/translate.c b/target-unicore32/translate.c
index 5a8c7c8..e3643c2 100644
--- a/target-unicore32/translate.c
+++ b/target-unicore32/translate.c
@@ -576,13 +576,6 @@ static inline TCGv gen_ld32(TCGv addr, int index)
     return tmp;
 }
 
-static inline TCGv_i64 gen_ld64(TCGv addr, int index)
-{
-    TCGv_i64 tmp = tcg_temp_new_i64();
-    tcg_gen_qemu_ld64(tmp, addr, index);
-    return tmp;
-}
-
 static inline void gen_st8(TCGv val, TCGv addr, int index)
 {
     tcg_gen_qemu_st8(val, addr, index);
@@ -601,12 +594,6 @@ static inline void gen_st32(TCGv val, TCGv addr, int index)
     dead_tmp(val);
 }
 
-static inline void gen_st64(TCGv_i64 val, TCGv addr, int index)
-{
-    tcg_gen_qemu_st64(val, addr, index);
-    tcg_temp_free_i64(val);
-}
-
 static inline void gen_set_pc_im(uint32_t val)
 {
     tcg_gen_movi_i32(cpu_R[31], val);
@@ -1128,21 +1115,6 @@ static inline void gen_jmp(DisasContext *s, uint32_t dest)
     }
 }
 
-static inline void gen_mulxy(TCGv t0, TCGv t1, int x, int y)
-{
-    if (x) {
-        tcg_gen_sari_i32(t0, t0, 16);
-    } else {
-        gen_sxth(t0);
-    }
-    if (y) {
-        tcg_gen_sari_i32(t1, t1, 16);
-    } else {
-        gen_sxth(t1);
-    }
-    tcg_gen_mul_i32(t0, t0, t1);
-}
-
 /* Returns nonzero if access to the PSR is not permitted. Marks t0 as dead. */
 static int gen_set_psr(DisasContext *s, uint32_t mask, int bsr, TCGv t0)
 {
diff --git a/target-unicore32/ucf64_helper.c b/target-unicore32/ucf64_helper.c
index 0c7ea26..5af008f 100644
--- a/target-unicore32/ucf64_helper.c
+++ b/target-unicore32/ucf64_helper.c
@@ -290,28 +290,6 @@ static inline uint32_t ucf64_stoi(float32 s)
     return v.i;
 }
 
-static inline float64 ucf64_itod(uint64_t i)
-{
-    union {
-        uint64_t i;
-        float64 d;
-    } v;
-
-    v.i = i;
-    return v.d;
-}
-
-static inline uint64_t ucf64_dtoi(float64 d)
-{
-    union {
-        uint64_t i;
-        float64 d;
-    } v;
-
-    v.d = d;
-    return v.i;
-}
-
 /* Integer to float conversion.  */
 float32 HELPER(ucf64_si2sf)(float32 x, CPUUniCore32State *env)
 {
-- 
1.7.10.4


