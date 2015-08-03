Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMBpz-0005Xb-DX
	for mharc-qemu-trivial@gnu.org; Mon, 03 Aug 2015 05:15:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpr-0005Ld-7G
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpo-00038K-0l
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:07 -0400
Received: from mail-wi0-f180.google.com ([209.85.212.180]:32780)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpn-00037N-Ox
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:03 -0400
Received: by wicmv11 with SMTP id mv11so127063879wic.0
	for <qemu-trivial@nongnu.org>; Mon, 03 Aug 2015 02:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=mZQRBJA3B9ThEtmNX0TiCc1rLD7yYiGnVpSinP36iEk=;
	b=ODZDGp7mg8ma2jDHOdZul1pLuzMvfpMX6bOoc4s14/X1XjzYnzXAMmrWBJkaWdrQQq
	lpDRYpuNc7y1fXJsfKdCAfPyd1YljU15v6eu9AYFQdr9sXGrLwmpVxPq3OPXXpEZ/Qg5
	JE/o51VTBUPPQz/NkzjvDtAVO4Mvy/SYsKROGDozNXJNr1Q1BZ4afPEWx9hPZvv3wGmR
	Uc1jOgMVKMVdL/PtBSn7Y4lHMM5YHA31U78+zw3dTYcjNMYbHchqwC3B1MR04CisUg5p
	J55YnKEaTlM/Urcf+CrKeCSCECDjsioYlHOg4dOykbt3fTivoIlkmTLcEzMYF0BWEn4j
	o55g==
X-Gm-Message-State: ALoCoQkNEUdKoZlsHnKsiwqLIJlYvwjOMgRndD+gB8aTFN0309SCnvPADTVIhI0tKoWmdo53DDOw
X-Received: by 10.181.13.195 with SMTP id fa3mr31539971wid.7.1438593303018;
	Mon, 03 Aug 2015 02:15:03 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	mc4sm12536267wic.6.2015.08.03.02.15.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Aug 2015 02:15:01 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 4F2943E0713;
	Mon,  3 Aug 2015 10:15:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  3 Aug 2015 10:14:42 +0100
Message-Id: <1438593291-27109-3-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.180
Cc: qemu-trivial@nongnu.org, crosthwaitepeter@gmail.com, pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v4 02/11] tcg: light re-factor and pass down
	TranslationBlock
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
X-List-Received-Date: Mon, 03 Aug 2015 09:15:10 -0000

My later debugging patches need access to the origin PC. At the same
time we have a slightly clumsy pass-by-reference access to the size of
the translated block again for debugging purposes.

To simplify the code I have expanded the TranslationBlock structure to
include a tc_size variable to compliment the tc_ptr (and the subject pc,
block size). This is set on code generation and then accessed directly
by all the people that need it.

I've also cleaned up some comments and removed un-used return variables.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v1
 - checkpatch fixes
---
 include/exec/exec-all.h |  4 ++--
 tcg/tcg.c               | 22 +++++++++++++---------
 tcg/tcg.h               |  5 ++---
 translate-all.c         | 43 ++++++++++++++++++-------------------------
 4 files changed, 35 insertions(+), 39 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index a6fce04..7ac8e7e 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -78,8 +78,7 @@ void restore_state_to_opc(CPUArchState *env, struct TranslationBlock *tb,
                           int pc_pos);
 
 void cpu_gen_init(void);
-int cpu_gen_code(CPUArchState *env, struct TranslationBlock *tb,
-                 int *gen_code_size_ptr);
+void cpu_gen_code(CPUArchState *env, struct TranslationBlock *tb);
 bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc);
 void page_size_init(void);
 
@@ -153,6 +152,7 @@ struct TranslationBlock {
 #define CF_USE_ICOUNT  0x20000
 
     void *tc_ptr;    /* pointer to the translated code */
+    uint32_t tc_size;/* size of translated code */
     /* next matching tb for physical address. */
     struct TranslationBlock *phys_hash_next;
     /* first and second physical page containing code. The lower bit
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0892a9b..587bd89 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2295,12 +2295,15 @@ void tcg_dump_op_count(FILE *f, fprintf_function cpu_fprintf)
 #endif
 
 
-static inline int tcg_gen_code_common(TCGContext *s,
-                                      tcg_insn_unit *gen_code_buf,
+static inline int tcg_gen_code_common(TCGContext *s, TranslationBlock *tb,
                                       long search_pc)
 {
     int oi, oi_next;
 
+    /* if we are coming via cpu_restore_state we already have a
+       generated block */
+     g_assert(tb->tc_size == 0 || search_pc > 0);
+
 #ifdef DEBUG_DISAS
     if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP))) {
         qemu_log("OP:\n");
@@ -2338,8 +2341,8 @@ static inline int tcg_gen_code_common(TCGContext *s,
 
     tcg_reg_alloc_start(s);
 
-    s->code_buf = gen_code_buf;
-    s->code_ptr = gen_code_buf;
+    s->code_buf = tb->tc_ptr;
+    s->code_ptr = tb->tc_ptr;
 
     tcg_out_tb_init(s);
 
@@ -2402,7 +2405,7 @@ static inline int tcg_gen_code_common(TCGContext *s,
     return -1;
 }
 
-int tcg_gen_code(TCGContext *s, tcg_insn_unit *gen_code_buf)
+void tcg_gen_code(TCGContext *s, TranslationBlock *tb)
 {
 #ifdef CONFIG_PROFILER
     {
@@ -2422,22 +2425,23 @@ int tcg_gen_code(TCGContext *s, tcg_insn_unit *gen_code_buf)
     }
 #endif
 
-    tcg_gen_code_common(s, gen_code_buf, -1);
+    tcg_gen_code_common(s, tb, -1);
 
     /* flush instruction cache */
     flush_icache_range((uintptr_t)s->code_buf, (uintptr_t)s->code_ptr);
 
-    return tcg_current_code_size(s);
+    tb->tc_size = tcg_current_code_size(s);
+    return;
 }
 
 /* Return the index of the micro operation such as the pc after is <
    offset bytes from the start of the TB.  The contents of gen_code_buf must
    not be changed, though writing the same values is ok.
    Return -1 if not found. */
-int tcg_gen_code_search_pc(TCGContext *s, tcg_insn_unit *gen_code_buf,
+int tcg_gen_code_search_pc(TCGContext *s, TranslationBlock *tb,
                            long offset)
 {
-    return tcg_gen_code_common(s, gen_code_buf, offset);
+    return tcg_gen_code_common(s, tb, offset);
 }
 
 #ifdef CONFIG_PROFILER
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 231a781..e4f9f97 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -613,9 +613,8 @@ void tcg_context_init(TCGContext *s);
 void tcg_prologue_init(TCGContext *s);
 void tcg_func_start(TCGContext *s);
 
-int tcg_gen_code(TCGContext *s, tcg_insn_unit *gen_code_buf);
-int tcg_gen_code_search_pc(TCGContext *s, tcg_insn_unit *gen_code_buf,
-                           long offset);
+void tcg_gen_code(TCGContext *s, TranslationBlock *tb);
+int  tcg_gen_code_search_pc(TCGContext *s, TranslationBlock *tb, long offset);
 
 void tcg_set_frame(TCGContext *s, int reg, intptr_t start, intptr_t size);
 
diff --git a/translate-all.c b/translate-all.c
index c05e2a5..e8072d8 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -157,17 +157,12 @@ void cpu_gen_init(void)
     tcg_context_init(&tcg_ctx); 
 }
 
-/* return non zero if the very first instruction is invalid so that
-   the virtual CPU can trigger an exception.
-
-   '*gen_code_size_ptr' contains the size of the generated code (host
-   code).
+/* code generation. On return tb->tc_size will reflect the size of
+ * generated code.
 */
-int cpu_gen_code(CPUArchState *env, TranslationBlock *tb, int *gen_code_size_ptr)
+void cpu_gen_code(CPUArchState *env, TranslationBlock *tb)
 {
     TCGContext *s = &tcg_ctx;
-    tcg_insn_unit *gen_code_buf;
-    int gen_code_size;
 #ifdef CONFIG_PROFILER
     int64_t ti;
 #endif
@@ -184,7 +179,6 @@ int cpu_gen_code(CPUArchState *env, TranslationBlock *tb, int *gen_code_size_ptr
     trace_translate_block(tb, tb->pc, tb->tc_ptr);
 
     /* generate machine code */
-    gen_code_buf = tb->tc_ptr;
     tb->tb_next_offset[0] = 0xffff;
     tb->tb_next_offset[1] = 0xffff;
     s->tb_next_offset = tb->tb_next_offset;
@@ -201,24 +195,23 @@ int cpu_gen_code(CPUArchState *env, TranslationBlock *tb, int *gen_code_size_ptr
     s->interm_time += profile_getclock() - ti;
     s->code_time -= profile_getclock();
 #endif
-    gen_code_size = tcg_gen_code(s, gen_code_buf);
-    *gen_code_size_ptr = gen_code_size;
+   tcg_gen_code(s, tb);
+
 #ifdef CONFIG_PROFILER
     s->code_time += profile_getclock();
     s->code_in_len += tb->size;
-    s->code_out_len += gen_code_size;
+    s->code_out_len += tb->tc_size;
 #endif
 
-    tb_write_perfmap(gen_code_buf, gen_code_size, tb->pc);
+    tb_write_perfmap(tb->tc_ptr, tb->tc_size, tb->pc);
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM)) {
-        qemu_log("OUT: [size=%d]\n", gen_code_size);
-        log_disas(tb->tc_ptr, gen_code_size);
+        qemu_log("OUT: [size=%d]\n", tb->tc_size);
+        log_disas(tb->tc_ptr, tb->tc_size);
         qemu_log("\n");
         qemu_log_flush();
     }
 #endif
-    return 0;
 }
 
 /* The cpu state corresponding to 'searched_pc' is restored.
@@ -229,7 +222,6 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
     CPUArchState *env = cpu->env_ptr;
     TCGContext *s = &tcg_ctx;
     int j;
-    uintptr_t tc_ptr;
 #ifdef CONFIG_PROFILER
     int64_t ti;
 #endif
@@ -249,9 +241,9 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
     }
 
     /* find opc index corresponding to search_pc */
-    tc_ptr = (uintptr_t)tb->tc_ptr;
-    if (searched_pc < tc_ptr)
+    if (searched_pc < (uintptr_t) tb->tc_ptr) {
         return -1;
+    }
 
     s->tb_next_offset = tb->tb_next_offset;
 #ifdef USE_DIRECT_JUMP
@@ -261,8 +253,8 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
     s->tb_jmp_offset = NULL;
     s->tb_next = tb->tb_next;
 #endif
-    j = tcg_gen_code_search_pc(s, (tcg_insn_unit *)tc_ptr,
-                               searched_pc - tc_ptr);
+    j = tcg_gen_code_search_pc(s, tb,
+                               searched_pc - (uintptr_t) tb->tc_ptr);
     if (j < 0)
         return -1;
     /* now find start of instruction before */
@@ -1029,7 +1021,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     TranslationBlock *tb;
     tb_page_addr_t phys_pc, phys_page2;
     target_ulong virt_page2;
-    int code_gen_size;
 
     phys_pc = get_page_addr_code(env, pc);
     if (use_icount) {
@@ -1045,12 +1036,14 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         tcg_ctx.tb_ctx.tb_invalidated_flag = 1;
     }
     tb->tc_ptr = tcg_ctx.code_gen_ptr;
+    tb->tc_size = 0;
     tb->cs_base = cs_base;
     tb->flags = flags;
     tb->cflags = cflags;
-    cpu_gen_code(env, tb, &code_gen_size);
-    tcg_ctx.code_gen_ptr = (void *)(((uintptr_t)tcg_ctx.code_gen_ptr +
-            code_gen_size + CODE_GEN_ALIGN - 1) & ~(CODE_GEN_ALIGN - 1));
+    cpu_gen_code(env, tb);
+    tcg_ctx.code_gen_ptr = (void *) (
+        ((uintptr_t) tcg_ctx.code_gen_ptr + tb->tc_size + CODE_GEN_ALIGN - 1)
+        & ~(CODE_GEN_ALIGN - 1));
 
     /* check next page if needed */
     virt_page2 = (pc + tb->size - 1) & TARGET_PAGE_MASK;
-- 
2.5.0


