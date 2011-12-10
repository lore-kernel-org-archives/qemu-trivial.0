Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RZPtu-0002m4-KM
	for mharc-qemu-trivial@gnu.org; Sat, 10 Dec 2011 11:35:50 -0500
Received: from eggs.gnu.org ([140.186.70.92]:37879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RZPtq-0002Xc-KX
	for qemu-trivial@nongnu.org; Sat, 10 Dec 2011 11:35:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RZPtp-0000gr-2S
	for qemu-trivial@nongnu.org; Sat, 10 Dec 2011 11:35:46 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:57253)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RZPtk-0000en-U9; Sat, 10 Dec 2011 11:35:41 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RZPtb-0002pU-QG; Sat, 10 Dec 2011 16:35:31 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 10 Dec 2011 16:35:31 +0000
Message-Id: <1323534931-10853-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] tcg: make tcg_const_ptr actually accept a
	pointer argument
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
X-List-Received-Date: Sat, 10 Dec 2011 16:35:48 -0000

Make tcg_const_ptr() include a cast so that you can pass it a
pointer. This allows us to drop the casts we had in all the places
that use this macro.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Minor cleanup; I have a patchset cooking that wants to use
tcg_const_ptr(), which is why I noticed this infelicity.

 tcg/tcg-op.h |    6 +++---
 tcg/tcg.h    |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
index 82e04e7..169d3b2 100644
--- a/tcg/tcg-op.h
+++ b/tcg/tcg-op.h
@@ -389,7 +389,7 @@ static inline void tcg_gen_helperN(void *func, int flags, int sizemask,
                                    TCGArg ret, int nargs, TCGArg *args)
 {
     TCGv_ptr fn;
-    fn = tcg_const_ptr((tcg_target_long)func);
+    fn = tcg_const_ptr(func);
     tcg_gen_callN(&tcg_ctx, fn, flags, sizemask, ret,
                   nargs, args);
     tcg_temp_free_ptr(fn);
@@ -405,7 +405,7 @@ static inline void tcg_gen_helper32(void *func, int sizemask, TCGv_i32 ret,
 {
     TCGv_ptr fn;
     TCGArg args[2];
-    fn = tcg_const_ptr((tcg_target_long)func);
+    fn = tcg_const_ptr(func);
     args[0] = GET_TCGV_I32(a);
     args[1] = GET_TCGV_I32(b);
     tcg_gen_callN(&tcg_ctx, fn, TCG_CALL_CONST | TCG_CALL_PURE, sizemask,
@@ -418,7 +418,7 @@ static inline void tcg_gen_helper64(void *func, int sizemask, TCGv_i64 ret,
 {
     TCGv_ptr fn;
     TCGArg args[2];
-    fn = tcg_const_ptr((tcg_target_long)func);
+    fn = tcg_const_ptr(func);
     args[0] = GET_TCGV_I64(a);
     args[1] = GET_TCGV_I64(b);
     tcg_gen_callN(&tcg_ctx, fn, TCG_CALL_CONST | TCG_CALL_PURE, sizemask,
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 175000f..5c28239 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -544,7 +544,7 @@ void tcg_add_target_add_op_defs(const TCGTargetOpDef *tdefs);
 #define TCGV_NAT_TO_PTR(n) MAKE_TCGV_PTR(GET_TCGV_I32(n))
 #define TCGV_PTR_TO_NAT(n) MAKE_TCGV_I32(GET_TCGV_PTR(n))
 
-#define tcg_const_ptr(V) TCGV_NAT_TO_PTR(tcg_const_i32(V))
+#define tcg_const_ptr(V) TCGV_NAT_TO_PTR(tcg_const_i32((tcg_target_long)(V)))
 #define tcg_global_reg_new_ptr(R, N) \
     TCGV_NAT_TO_PTR(tcg_global_reg_new_i32((R), (N)))
 #define tcg_global_mem_new_ptr(R, O, N) \
@@ -555,7 +555,7 @@ void tcg_add_target_add_op_defs(const TCGTargetOpDef *tdefs);
 #define TCGV_NAT_TO_PTR(n) MAKE_TCGV_PTR(GET_TCGV_I64(n))
 #define TCGV_PTR_TO_NAT(n) MAKE_TCGV_I64(GET_TCGV_PTR(n))
 
-#define tcg_const_ptr(V) TCGV_NAT_TO_PTR(tcg_const_i64(V))
+#define tcg_const_ptr(V) TCGV_NAT_TO_PTR(tcg_const_i64((tcg_target_long)(V)))
 #define tcg_global_reg_new_ptr(R, N) \
     TCGV_NAT_TO_PTR(tcg_global_reg_new_i64((R), (N)))
 #define tcg_global_mem_new_ptr(R, O, N) \
-- 
1.7.1


