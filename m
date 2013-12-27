Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vwfqx-0000Sh-48
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2013 17:25:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfqp-0000BK-P7
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:25:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfql-0000OE-9u
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:25:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50565)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VwfqW-0000LF-Kn; Fri, 27 Dec 2013 17:25:33 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9081A438A9;
	Sat, 28 Dec 2013 02:25:32 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C954560A;
	Sat, 28 Dec 2013 02:07:35 +0400 (MSK)
Received: (nullmailer pid 10346 invoked by uid 1000);
	Fri, 27 Dec 2013 22:07:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sat, 28 Dec 2013 02:07:23 +0400
Message-Id: <1388182050-10270-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 10/17] target-m68k: Replace qemu_assert by
	hw_error
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
X-List-Received-Date: Fri, 27 Dec 2013 22:25:56 -0000

From: Stefan Weil <sw@weilnetz.de>

hw_error is already used for target-arm and target-s390x.
Using it for target-m68k fixes this compiler warning with Darwin because
hw_error is declared with QEMU_NORETURN:

target-m68k/translate.c:671:13: warning:
 variable 'offset' is used uninitialized whenever switch default is taken
 [-Wsometimes-uninitialized]

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-m68k/translate.c |   28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/target-m68k/translate.c b/target-m68k/translate.c
index f54b94a..259788e 100644
--- a/target-m68k/translate.c
+++ b/target-m68k/translate.c
@@ -110,14 +110,6 @@ void m68k_tcg_init(void)
     store_dummy = tcg_global_mem_new(TCG_AREG0, -8, "NULL");
 }
 
-static inline void qemu_assert(int cond, const char *msg)
-{
-    if (!cond) {
-        fprintf (stderr, "badness: %s\n", msg);
-        abort();
-    }
-}
-
 /* internal defines */
 typedef struct DisasContext {
     CPUM68KState *env;
@@ -199,7 +191,7 @@ static inline TCGv gen_load(DisasContext * s, int opsize, TCGv addr, int sign)
         tcg_gen_qemu_ld32u(tmp, addr, index);
         break;
     default:
-        qemu_assert(0, "bad load size");
+        hw_error("%s: Bad load size\n", __func__);
     }
     gen_throws_exception = gen_last_qop;
     return tmp;
@@ -233,7 +225,7 @@ static inline void gen_store(DisasContext *s, int opsize, TCGv addr, TCGv val)
         tcg_gen_qemu_st32(val, addr, index);
         break;
     default:
-        qemu_assert(0, "bad store size");
+        hw_error("%s: Bad store size\n", __func__);
     }
     gen_throws_exception = gen_last_qop;
 }
@@ -437,8 +429,7 @@ static inline int opsize_bytes(int opsize)
     case OS_SINGLE: return 4;
     case OS_DOUBLE: return 8;
     default:
-        qemu_assert(0, "bad operand size");
-        return 0;
+        hw_error("%s: Bad operand size\n", __func__);
     }
 }
 
@@ -465,8 +456,7 @@ static void gen_partset_reg(int opsize, TCGv reg, TCGv val)
         tcg_gen_mov_i32(reg, val);
         break;
     default:
-        qemu_assert(0, "Bad operand size");
-        break;
+        hw_error("%s: Bad operand size\n", __func__);
     }
 }
 
@@ -495,7 +485,7 @@ static inline TCGv gen_extend(TCGv val, int opsize, int sign)
         tmp = val;
         break;
     default:
-        qemu_assert(0, "Bad operand size");
+        hw_error("%s: Bad operand size\n", __func__);
     }
     return tmp;
 }
@@ -669,7 +659,7 @@ static TCGv gen_ea(CPUM68KState *env, DisasContext *s, uint16_t insn,
                 offset = read_im32(env, s);
                 break;
             default:
-                qemu_assert(0, "Bad immediate operand");
+                hw_error("%s: Bad immediate operand\n", __func__);
             }
             return tcg_const_i32(offset);
         default:
@@ -2092,7 +2082,7 @@ DISAS_INSN(wdebug)
         return;
     }
     /* TODO: Implement wdebug.  */
-    qemu_assert(0, "WDEBUG not implemented");
+    hw_error("%s: Not implemented\n", __func__);
 }
 
 DISAS_INSN(trap)
@@ -2467,13 +2457,13 @@ DISAS_INSN(fbcc)
 DISAS_INSN(frestore)
 {
     /* TODO: Implement frestore.  */
-    qemu_assert(0, "FRESTORE not implemented");
+    hw_error("%s: Not implemented\n", __func__);
 }
 
 DISAS_INSN(fsave)
 {
     /* TODO: Implement fsave.  */
-    qemu_assert(0, "FSAVE not implemented");
+    hw_error("%s: Not implemented\n", __func__);
 }
 
 static inline TCGv gen_mac_extract_word(DisasContext *s, TCGv val, int upper)
-- 
1.7.10.4


