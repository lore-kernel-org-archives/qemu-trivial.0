Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMBq8-0005nH-GA
	for mharc-qemu-trivial@gnu.org; Mon, 03 Aug 2015 05:15:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpu-0005Og-0a
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpr-0003LC-SS
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:09 -0400
Received: from mail-wi0-f171.google.com ([209.85.212.171]:35870)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpr-0003Kc-Hz
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:07 -0400
Received: by wicgj17 with SMTP id gj17so95863569wic.1
	for <qemu-trivial@nongnu.org>; Mon, 03 Aug 2015 02:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=w/5386+OjfX4GHNF/VHsixP336JSAx/RVWMWnvoRd+c=;
	b=fdztmVU95S20F3oQ4y2IjtBrdhMQEaLMU4gTfReey0WUvFz8hcj9DcnkvkAe+cQThX
	OKYwnDLR1PpeXOSshRW0fWvv4wKY0Nu6ewrj5HDtTgxXEsfOzf/0KuWt/UhNd7BtgDLp
	LMgEHx4CDkIXIWaqVSj6ztO7UQkuoARSzCEBXUqmSQnXqnUYwQmFPx3zg/uJDyaGqcEF
	a1L8aapkXcX/cP0Gy6S0ZqNiOUKicLLhASUzYOpngUNcDEh1aW/snRT6BZmImCbBPTKH
	W93sYiLkWtNyExxs4Go3mvuwNDBZESx+CpK1xZf0+M0WQZrqR2uU4ehU3B0YJCxlj7jG
	oaow==
X-Gm-Message-State: ALoCoQlusJfCFXsTJV0CNGqu/WkRzjBnCg8ILxe18KU+ZQN39+HwtdOSDzq3L48aDaKzrKi/LGPj
X-Received: by 10.194.236.161 with SMTP id uv1mr34078880wjc.158.1438593307100; 
	Mon, 03 Aug 2015 02:15:07 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	q19sm12519557wik.16.2015.08.03.02.15.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Aug 2015 02:15:04 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 880693E0805;
	Mon,  3 Aug 2015 10:15:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  3 Aug 2015 10:14:45 +0100
Message-Id: <1438593291-27109-6-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.171
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	crosthwaitepeter@gmail.com, pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v4 05/11] qemu-log: Improve the "exec" TB
	execution logging
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
X-List-Received-Date: Mon, 03 Aug 2015 09:15:12 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Improve the TB execution logging so that it is easier to identify
what is happening from trace logs:
 * move the "Trace" logging of executed TBs into cpu_tb_exec()
   so that it is emitted if and only if we actually execute a TB,
   and for consistency for the CPU state logging
 * log when we link two TBs together via tb_add_jump()
 * log when cpu_tb_exec() returns early from a chain of TBs

The new style logging looks like this:

Trace 0x7fb7cc822ca0 [ffffffc0000dce00]
Linking TBs 0x7fb7cc822ca0 [ffffffc0000dce00] index 0 -> 0x7fb7cc823110 [ffffffc0000dce10]
Trace 0x7fb7cc823110 [ffffffc0000dce10]
Trace 0x7fb7cc823420 [ffffffc000302688]
Trace 0x7fb7cc8234a0 [ffffffc000302698]
Trace 0x7fb7cc823520 [ffffffc0003026a4]
Trace 0x7fb7cc823560 [ffffffc0000dce44]
Linking TBs 0x7fb7cc823560 [ffffffc0000dce44] index 1 -> 0x7fb7cc8235d0 [ffffffc0000dce70]
Trace 0x7fb7cc8235d0 [ffffffc0000dce70]
Abandoned execution of TB chain before 0x7fb7cc8235d0 [ffffffc0000dce70]
Trace 0x7fb7cc8235d0 [ffffffc0000dce70]
Trace 0x7fb7cc822fd0 [ffffffc0000dd52c]

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
[AJB: reword patch title]
---
 cpu-exec.c              | 20 +++++++++++---------
 include/exec/exec-all.h |  3 +++
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/cpu-exec.c b/cpu-exec.c
index 75694f3..a039f1a 100644
--- a/cpu-exec.c
+++ b/cpu-exec.c
@@ -175,10 +175,14 @@ void cpu_reload_memory_map(CPUState *cpu)
 #endif
 
 /* Execute a TB, and fix up the CPU state afterwards if necessary */
-static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, uint8_t *tb_ptr)
+static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
 {
     CPUArchState *env = cpu->env_ptr;
     uintptr_t next_tb;
+    uint8_t *tb_ptr = itb->tc_ptr;
+
+    qemu_log_mask(CPU_LOG_EXEC, "Trace %p [" TARGET_FMT_lx "] %s\n",
+                  itb->tc_ptr, itb->pc, lookup_symbol(itb->pc));
 
 #if defined(DEBUG_DISAS)
     if (qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
@@ -209,6 +213,10 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, uint8_t *tb_ptr)
          */
         CPUClass *cc = CPU_GET_CLASS(cpu);
         TranslationBlock *tb = (TranslationBlock *)(next_tb & ~TB_EXIT_MASK);
+        qemu_log_mask(CPU_LOG_EXEC,
+                      "Abandoned execution of TB chain before %p ["
+                      TARGET_FMT_lx "] %s\n",
+                      itb->tc_ptr, itb->pc, lookup_symbol(itb->pc));
         if (cc->synchronize_from_tb) {
             cc->synchronize_from_tb(cpu, tb);
         } else {
@@ -247,7 +255,7 @@ static void cpu_exec_nocache(CPUState *cpu, int max_cycles,
     cpu->current_tb = tb;
     /* execute the generated code */
     trace_exec_tb_nocache(tb, tb->pc);
-    cpu_tb_exec(cpu, tb->tc_ptr);
+    cpu_tb_exec(cpu, tb);
     cpu->current_tb = NULL;
     tb_phys_invalidate(tb, -1);
     tb_free(tb);
@@ -356,7 +364,6 @@ int cpu_exec(CPUState *cpu)
 #endif
     int ret, interrupt_request;
     TranslationBlock *tb;
-    uint8_t *tc_ptr;
     uintptr_t next_tb;
     SyncClocks sc;
 
@@ -491,10 +498,6 @@ int cpu_exec(CPUState *cpu)
                     next_tb = 0;
                     tcg_ctx.tb_ctx.tb_invalidated_flag = 0;
                 }
-                if (qemu_loglevel_mask(CPU_LOG_EXEC)) {
-                    qemu_log("Trace %p [" TARGET_FMT_lx "] %s\n",
-                             tb->tc_ptr, tb->pc, lookup_symbol(tb->pc));
-                }
                 /* see if we can patch the calling TB. When the TB
                    spans two pages, we cannot safely do a direct
                    jump. */
@@ -513,9 +516,8 @@ int cpu_exec(CPUState *cpu)
                 barrier();
                 if (likely(!cpu->exit_request)) {
                     trace_exec_tb(tb, tb->pc);
-                    tc_ptr = tb->tc_ptr;
                     /* execute the generated code */
-                    next_tb = cpu_tb_exec(cpu, tc_ptr);
+                    next_tb = cpu_tb_exec(cpu, tb);
                     switch (next_tb & TB_EXIT_MASK) {
                     case TB_EXIT_REQUESTED:
                         /* Something asked us to stop executing
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 7ac8e7e..361d3d2 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -282,6 +282,9 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
 {
     /* NOTE: this test is only needed for thread safety */
     if (!tb->jmp_next[n]) {
+        qemu_log_mask(CPU_LOG_EXEC, "Linking TBs %p [" TARGET_FMT_lx
+                      "] index %d -> %p [" TARGET_FMT_lx "]\n",
+                      tb->tc_ptr, tb->pc, n, tb_next->tc_ptr, tb_next->pc);
         /* patch the native jump address */
         tb_set_jmp_target(tb, n, (uintptr_t)tb_next->tc_ptr);
 
-- 
2.5.0


