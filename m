Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMBpz-0005YC-Of
	for mharc-qemu-trivial@gnu.org; Mon, 03 Aug 2015 05:15:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBps-0005Nk-HY
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpo-0003AD-Mw
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:08 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:36812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpo-00038h-Et
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:04 -0400
Received: by wicgj17 with SMTP id gj17so95861508wic.1
	for <qemu-trivial@nongnu.org>; Mon, 03 Aug 2015 02:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=FeRRCchCSktWB2gvObXrJd7QxNAOfoOZ9GCCuEjOlZ8=;
	b=dVHg12dx9UCpZdi5CWFepY4eTlhg7M60KlQk62GZ/H47riP65YF45lsiw9Z/AXQzHs
	4qUWweDXNxNrYUihZxtTuDv+l0LJ6P4PR78U9LwJU7zm6hhufQUfAhit5Pa8VM4POq+y
	QpHADEFXj+hfknH5szdGxY4Z0LzoOq/NF6Jxh7nS02VUwhkKdLvIHPULdgfvQor/AKa2
	gl2t3lX+Ivtzzc76XZto/2iZOfOl75u0l9lNZ0jCb8hf10xdNoeTu1Jhn1HU0xV1W7Wn
	xMpaclT5S8Cj51s3ItPJVIxmqAPNeRa5Sb4WHr6KDtktSBfOFZN5Ngmbivcfi/vjqk4f
	7URw==
X-Gm-Message-State: ALoCoQlPgXox1JFRT8zCRKt1l7+AnMg8sgTj36XCa99j16oMaINww9SF8UGloWZyrFxw6Jv3G+F9
X-Received: by 10.180.20.71 with SMTP id l7mr32614450wie.32.1438593303860;
	Mon, 03 Aug 2015 02:15:03 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	ed10sm12549872wic.0.2015.08.03.02.15.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Aug 2015 02:15:02 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 3BC733E0456;
	Mon,  3 Aug 2015 10:15:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  3 Aug 2015 10:14:41 +0100
Message-Id: <1438593291-27109-2-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.175
Cc: qemu-trivial@nongnu.org, crosthwaitepeter@gmail.com, pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v4 01/11] tcg: add ability to dump
	/tmp/perf-<pid>.map files
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
X-List-Received-Date: Mon, 03 Aug 2015 09:15:11 -0000

This allows the perf tool to map samples to each individual translation
block. This could be expanded for user space but currently it gives
enough information to find any hotblocks by other means.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---

v2:
  - hoist up into translate-all.c
  - don't use pointless glib wrappers
  - use proper format types for portability
  - mark prologue/epilog area
  - rebase

v3:
  - fix bracket for perf-map
  - find an include for the tb_enable_perfmap() declaration
  - checkpatch clean-ups
---
 include/qemu-common.h |  2 ++
 qemu-options.hx       |  9 +++++++++
 translate-all.c       | 26 ++++++++++++++++++++++++++
 vl.c                  |  4 ++++
 4 files changed, 41 insertions(+)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index fb3da6c..60b87d0 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -382,6 +382,8 @@ typedef struct PCIHostDeviceAddress {
 void tcg_exec_init(unsigned long tb_size);
 bool tcg_enabled(void);
 
+void tb_enable_perfmap(void);
+
 void cpu_exec_init_all(void);
 
 /* CPU save/load.  */
diff --git a/qemu-options.hx b/qemu-options.hx
index 77f5853..ae53346 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3572,6 +3572,15 @@ to the RNG daemon.
 
 ETEXI
 
+DEF("perfmap", 0, QEMU_OPTION_PERFMAP, \
+    "-perfmap        generate a /tmp/perf-${pid}.map file for perf\n",
+    QEMU_ARCH_ALL)
+STEXI
+@item -perfmap
+@findex -perfmap
+This will cause QEMU to generate a map file for Linux perf tools that will allow
+basic profiling information to be broken down into basic blocks.
+ETEXI
 
 HXCOMM This is the last statement. Insert new options before this line!
 STEXI
diff --git a/translate-all.c b/translate-all.c
index 60a3d8b..c05e2a5 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -27,6 +27,7 @@
 #include <stdio.h>
 #include <string.h>
 #include <inttypes.h>
+#include <glib.h>
 
 #include "config.h"
 
@@ -133,6 +134,24 @@ static void tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
                          tb_page_addr_t phys_page2);
 static TranslationBlock *tb_find_pc(uintptr_t tc_ptr);
 
+static FILE *tb_perfmap;
+
+void tb_enable_perfmap(void)
+{
+    gchar *map_file = g_strdup_printf("/tmp/perf-%d.map", getpid());
+    tb_perfmap = fopen(map_file, "w");
+    g_free(map_file);
+}
+
+static void tb_write_perfmap(tcg_insn_unit *start, int size, target_ulong pc)
+{
+    if (tb_perfmap) {
+        fprintf(tb_perfmap,
+                "%"PRIxPTR" %x subject-"TARGET_FMT_lx"\n",
+                (uintptr_t) start, size, pc);
+    }
+}
+
 void cpu_gen_init(void)
 {
     tcg_context_init(&tcg_ctx); 
@@ -190,6 +209,7 @@ int cpu_gen_code(CPUArchState *env, TranslationBlock *tb, int *gen_code_size_ptr
     s->code_out_len += gen_code_size;
 #endif
 
+    tb_write_perfmap(gen_code_buf, gen_code_size, tb->pc);
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM)) {
         qemu_log("OUT: [size=%d]\n", gen_code_size);
@@ -669,6 +689,12 @@ static inline void code_gen_alloc(size_t tb_size)
             tcg_ctx.code_gen_buffer_size - 1024;
     tcg_ctx.code_gen_buffer_size -= 1024;
 
+    if (tb_perfmap) {
+        fprintf(tb_perfmap,
+                "%"PRIxPTR" %x tcg-prologue-buffer\n",
+                (uintptr_t) tcg_ctx.code_gen_prologue, 1024);
+    }
+
     tcg_ctx.code_gen_buffer_max_size = tcg_ctx.code_gen_buffer_size -
         (TCG_MAX_OP_SIZE * OPC_BUF_SIZE);
     tcg_ctx.code_gen_max_blocks = tcg_ctx.code_gen_buffer_size /
diff --git a/vl.c b/vl.c
index 0adbbd6..1d2de4f 100644
--- a/vl.c
+++ b/vl.c
@@ -122,6 +122,7 @@ int main(int argc, char **argv)
 #include "qapi-event.h"
 #include "exec/semihost.h"
 #include "crypto/init.h"
+#include "qemu-common.h"
 
 #define MAX_VIRTIO_CONSOLES 1
 #define MAX_SCLP_CONSOLES 1
@@ -3348,6 +3349,9 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_D:
                 log_file = optarg;
                 break;
+            case QEMU_OPTION_PERFMAP:
+                tb_enable_perfmap();
+                break;
             case QEMU_OPTION_s:
                 add_device_config(DEV_GDB, "tcp::" DEFAULT_GDBSTUB_PORT);
                 break;
-- 
2.5.0


