Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WNj9Z-0000Xx-9m
	for mharc-qemu-trivial@gnu.org; Wed, 12 Mar 2014 09:25:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WNj9W-0000O1-0E
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 09:24:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WNj9S-0004SX-1g
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 09:24:57 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:46677)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WNj9P-0004Rj-Cq; Wed, 12 Mar 2014 09:24:51 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WNj9N-00036c-E8; Wed, 12 Mar 2014 13:24:49 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 12 Mar 2014 13:24:49 +0000
Message-Id: <1394630689-11913-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] target-m68k: Remove custom qemu_assert()
	function
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
X-List-Received-Date: Wed, 12 Mar 2014 13:24:59 -0000

Remove the custom qemu_assert() function defined by target-m68k/translate.c
in favour of either using glib g_assert_not_reached() (for the genuinely
can't-happen cases) or cpu_abort() (for the "this isn't implemented",
in line with other unimplemented cases in the target).

This has the benefit of silencing some clang warnings about
variables used while uninitialized (which are emitted because
clang can't figure out that qemu_assert(0, something) never
returns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Since target-m68k is orphan it seems reasonable to just do the
minimal amount to at least get it to compile without warnings
(even if the warnings are spurious), rather than for instance
trying to convert all the unimplemented-behaviour aborts into
LOG_UNIMP-and-continue-somehow.

 target-m68k/translate.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/target-m68k/translate.c b/target-m68k/translate.c
index f54b94a..f747c13 100644
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
+        g_assert_not_reached();
     }
     gen_throws_exception = gen_last_qop;
     return tmp;
@@ -233,7 +225,7 @@ static inline void gen_store(DisasContext *s, int opsize, TCGv addr, TCGv val)
         tcg_gen_qemu_st32(val, addr, index);
         break;
     default:
-        qemu_assert(0, "bad store size");
+        g_assert_not_reached();
     }
     gen_throws_exception = gen_last_qop;
 }
@@ -437,8 +429,7 @@ static inline int opsize_bytes(int opsize)
     case OS_SINGLE: return 4;
     case OS_DOUBLE: return 8;
     default:
-        qemu_assert(0, "bad operand size");
-        return 0;
+        g_assert_not_reached();
     }
 }
 
@@ -465,8 +456,7 @@ static void gen_partset_reg(int opsize, TCGv reg, TCGv val)
         tcg_gen_mov_i32(reg, val);
         break;
     default:
-        qemu_assert(0, "Bad operand size");
-        break;
+        g_assert_not_reached();
     }
 }
 
@@ -495,7 +485,7 @@ static inline TCGv gen_extend(TCGv val, int opsize, int sign)
         tmp = val;
         break;
     default:
-        qemu_assert(0, "Bad operand size");
+        g_assert_not_reached();
     }
     return tmp;
 }
@@ -669,7 +659,7 @@ static TCGv gen_ea(CPUM68KState *env, DisasContext *s, uint16_t insn,
                 offset = read_im32(env, s);
                 break;
             default:
-                qemu_assert(0, "Bad immediate operand");
+                g_assert_not_reached();
             }
             return tcg_const_i32(offset);
         default:
@@ -2092,7 +2082,7 @@ DISAS_INSN(wdebug)
         return;
     }
     /* TODO: Implement wdebug.  */
-    qemu_assert(0, "WDEBUG not implemented");
+    cpu_abort(env, "WDEBUG not implemented");
 }
 
 DISAS_INSN(trap)
@@ -2467,13 +2457,13 @@ DISAS_INSN(fbcc)
 DISAS_INSN(frestore)
 {
     /* TODO: Implement frestore.  */
-    qemu_assert(0, "FRESTORE not implemented");
+    cpu_abort(env, "FRESTORE not implemented");
 }
 
 DISAS_INSN(fsave)
 {
     /* TODO: Implement fsave.  */
-    qemu_assert(0, "FSAVE not implemented");
+    cpu_abort(env, "FSAVE not implemented");
 }
 
 static inline TCGv gen_mac_extract_word(DisasContext *s, TCGv val, int upper)
-- 
1.9.0


