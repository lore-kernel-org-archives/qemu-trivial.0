Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMBqC-0005xg-TV
	for mharc-qemu-trivial@gnu.org; Mon, 03 Aug 2015 05:15:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpw-0005Sb-Dn
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBps-0003Lo-Dt
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:12 -0400
Received: from mail-wi0-f176.google.com ([209.85.212.176]:35882)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBps-0003L9-45
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:08 -0400
Received: by wicgj17 with SMTP id gj17so95863889wic.1
	for <qemu-trivial@nongnu.org>; Mon, 03 Aug 2015 02:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=IDrKhnTd7javnVeOzDNmdLUcQ7j76/ikUttDmU3XP1o=;
	b=RAlWKwyEXTzGt5Vq0+HjSX8KJGhq7bakPIiUP2YfBmy3CBdQGJFXen2Sj5zMUU2WaL
	bc8sP95lhbGWHkwKkDG6a231Ur4RIX2yQUS8mlgci/Q+/stQK7iXVizE9YVxPoYwp23N
	akswc0cKojbSozejLgIxqKl4iVq6iI69vUTAJk7LlCG+8jisGjm3L6ZXzGM4JRenfS+e
	Db5HlLych19TKdoim1xIKtfY5vr1MwffOHmM1o9uTUU7KaQfpxPDYYhRIqA7lSipuwmY
	vIVJUsUPG2Cpho8wgc+r/zojkf53WAy+UARFf7Bf3+5VvlCcOyJIgV598+Y+GcjExIqY
	Gndw==
X-Gm-Message-State: ALoCoQnoBZxFx7EwndmX/fYAJnpta4fc0hRUtnr22BSCwGTIgrdBctw8fhPvyt5RaszTS3GKwsDE
X-Received: by 10.194.184.82 with SMTP id es18mr33958201wjc.79.1438593307471; 
	Mon, 03 Aug 2015 02:15:07 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	ej5sm21836328wjd.22.2015.08.03.02.15.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Aug 2015 02:15:04 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id C4C3C3E086F;
	Mon,  3 Aug 2015 10:15:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  3 Aug 2015 10:14:48 +0100
Message-Id: <1438593291-27109-9-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.176
Cc: qemu-trivial@nongnu.org, crosthwaitepeter@gmail.com, pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v4 08/11] qemu-log: dfilter-ise exec, out_asm,
	and op_opt
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
X-List-Received-Date: Mon, 03 Aug 2015 09:15:15 -0000

This ensures the code generation debug code will honour -dfilter if set.
For the "exec" tracing I've added a new inline macro for efficiency's
sake. I've not touched CPU_LOG_TB_OP as this is buried in each
individual target.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

----

v2
   - checkpatch updates
   - add qemu_log_mask_and_addr macro for inline dump for traces
   - re-base on re-factored tcg layout
   - include new Trace & Link lines
---
 cpu-exec.c              | 13 +++++++------
 include/exec/exec-all.h |  8 +++++---
 include/qemu/log.h      | 15 +++++++++++++++
 tcg/tcg.c               |  6 ++++--
 translate-all.c         |  3 ++-
 5 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/cpu-exec.c b/cpu-exec.c
index a039f1a..d01d08e 100644
--- a/cpu-exec.c
+++ b/cpu-exec.c
@@ -181,8 +181,9 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
     uintptr_t next_tb;
     uint8_t *tb_ptr = itb->tc_ptr;
 
-    qemu_log_mask(CPU_LOG_EXEC, "Trace %p [" TARGET_FMT_lx "] %s\n",
-                  itb->tc_ptr, itb->pc, lookup_symbol(itb->pc));
+    qemu_log_mask_and_addr(CPU_LOG_EXEC, itb->pc,
+                           "Trace %p [" TARGET_FMT_lx "] %s\n",
+                           itb->tc_ptr, itb->pc, lookup_symbol(itb->pc));
 
 #if defined(DEBUG_DISAS)
     if (qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
@@ -213,10 +214,10 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
          */
         CPUClass *cc = CPU_GET_CLASS(cpu);
         TranslationBlock *tb = (TranslationBlock *)(next_tb & ~TB_EXIT_MASK);
-        qemu_log_mask(CPU_LOG_EXEC,
-                      "Abandoned execution of TB chain before %p ["
-                      TARGET_FMT_lx "] %s\n",
-                      itb->tc_ptr, itb->pc, lookup_symbol(itb->pc));
+        qemu_log_mask_and_addr(CPU_LOG_EXEC, itb->pc,
+                               "Abandoned execution of TB chain before %p ["
+                               TARGET_FMT_lx "] %s\n",
+                               itb->tc_ptr, itb->pc, lookup_symbol(itb->pc));
         if (cc->synchronize_from_tb) {
             cc->synchronize_from_tb(cpu, tb);
         } else {
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 361d3d2..51276ab 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -282,9 +282,11 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
 {
     /* NOTE: this test is only needed for thread safety */
     if (!tb->jmp_next[n]) {
-        qemu_log_mask(CPU_LOG_EXEC, "Linking TBs %p [" TARGET_FMT_lx
-                      "] index %d -> %p [" TARGET_FMT_lx "]\n",
-                      tb->tc_ptr, tb->pc, n, tb_next->tc_ptr, tb_next->pc);
+        qemu_log_mask_and_addr(CPU_LOG_EXEC, tb->pc,
+                               "Linking TBs %p [" TARGET_FMT_lx
+                               "] index %d -> %p [" TARGET_FMT_lx "]\n",
+                               tb->tc_ptr, tb->pc, n,
+                               tb_next->tc_ptr, tb_next->pc);
         /* patch the native jump address */
         tb_set_jmp_target(tb, n, (uintptr_t)tb_next->tc_ptr);
 
diff --git a/include/qemu/log.h b/include/qemu/log.h
index ade1f76..0b0eef5 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -77,6 +77,21 @@ qemu_log_vprintf(const char *fmt, va_list va)
         }                                               \
     } while (0)
 
+/* log only if a bit is set on the current loglevel mask
+ * and we are in the address range we care about:
+ * @mask: bit to check in the mask
+ * @addr: address to check in dfilter
+ * @fmt: printf-style format string
+ * @args: optional arguments for format string
+ */
+#define qemu_log_mask_and_addr(MASK, ADDR, FMT, ...)    \
+    do {                                                \
+        if (unlikely(qemu_loglevel_mask(MASK)) &&       \
+                     qemu_log_in_addr_range(ADDR)) {    \
+            qemu_log(FMT, ## __VA_ARGS__);              \
+        }                                               \
+    } while (0)
+
 /* Special cases: */
 
 /* cpu_dump_state() logging functions: */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 587bd89..ed42204 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2305,7 +2305,8 @@ static inline int tcg_gen_code_common(TCGContext *s, TranslationBlock *tb,
      g_assert(tb->tc_size == 0 || search_pc > 0);
 
 #ifdef DEBUG_DISAS
-    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP))) {
+    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP)
+                 && qemu_log_in_addr_range(tb->pc))) {
         qemu_log("OP:\n");
         tcg_dump_ops(s);
         qemu_log("\n");
@@ -2332,7 +2333,8 @@ static inline int tcg_gen_code_common(TCGContext *s, TranslationBlock *tb,
 #endif
 
 #ifdef DEBUG_DISAS
-    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP_OPT))) {
+    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP_OPT)
+                 && qemu_log_in_addr_range(tb->pc))) {
         qemu_log("OP after optimization and liveness analysis:\n");
         tcg_dump_ops(s);
         qemu_log("\n");
diff --git a/translate-all.c b/translate-all.c
index e8072d8..facd516 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -205,7 +205,8 @@ void cpu_gen_code(CPUArchState *env, TranslationBlock *tb)
 
     tb_write_perfmap(tb->tc_ptr, tb->tc_size, tb->pc);
 #ifdef DEBUG_DISAS
-    if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM)) {
+    if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM) &&
+        qemu_log_in_addr_range(tb->pc)) {
         qemu_log("OUT: [size=%d]\n", tb->tc_size);
         log_disas(tb->tc_ptr, tb->tc_size);
         qemu_log("\n");
-- 
2.5.0


