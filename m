Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bkten-0004Rp-Ms
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 09:58:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktek-0004Oy-Vt
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktei-00083c-Lc
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56606)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bkteY-00076i-1A; Fri, 16 Sep 2016 09:58:06 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 35F5E18DF5D;
	Fri, 16 Sep 2016 13:56:55 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHkJ024127; Fri, 16 Sep 2016 09:56:53 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Date: Fri, 16 Sep 2016 15:56:08 +0200
Message-Id: <1474034177-17663-18-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 16 Sep 2016 13:56:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 17/26] tcg: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Sep 2016 13:58:20 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
CC: Richard Henderson <rth@twiddle.net>
---
 cpus.c          | 16 ++++++++--------
 cputlb.c        |  2 +-
 exec.c          |  2 +-
 tcg/tcg.c       |  2 +-
 translate-all.c |  2 +-
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/cpus.c b/cpus.c
index e39ccb7..16898d3 100644
--- a/cpus.c
+++ b/cpus.c
@@ -159,7 +159,7 @@ int64_t cpu_get_icount_raw(void)
     if (cpu) {
         if (!cpu->can_do_io) {
             fprintf(stderr, "Bad icount read\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         icount -= (cpu->icount_decr.u16.low + cpu->icount_extra);
     }
@@ -829,7 +829,7 @@ static void qemu_kvm_eat_signals(CPUState *cpu)
         r = sigtimedwait(&waitset, &siginfo, &ts);
         if (r == -1 && !(errno == EAGAIN || errno == EINTR)) {
             perror("sigtimedwait");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         switch (r) {
@@ -845,7 +845,7 @@ static void qemu_kvm_eat_signals(CPUState *cpu)
         r = sigpending(&chkset);
         if (r == -1) {
             perror("sigpending");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     } while (sigismember(&chkset, SIG_IPI) || sigismember(&chkset, SIGBUS));
 }
@@ -882,7 +882,7 @@ static void qemu_kvm_init_cpu_signals(CPUState *cpu)
     r = kvm_set_signal_mask(cpu, &set);
     if (r) {
         fprintf(stderr, "kvm_set_signal_mask: %s\n", strerror(-r));
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
@@ -1070,7 +1070,7 @@ static void *qemu_kvm_cpu_thread_fn(void *arg)
     r = kvm_init_vcpu(cpu);
     if (r < 0) {
         fprintf(stderr, "kvm_init_vcpu failed: %s\n", strerror(-r));
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     qemu_kvm_init_cpu_signals(cpu);
@@ -1100,7 +1100,7 @@ static void *qemu_dummy_cpu_thread_fn(void *arg)
 {
 #ifdef _WIN32
     fprintf(stderr, "qtest is not supported under Windows\n");
-    exit(1);
+    exit(EXIT_FAILURE);
 #else
     CPUState *cpu = arg;
     sigset_t waitset;
@@ -1130,7 +1130,7 @@ static void *qemu_dummy_cpu_thread_fn(void *arg)
         } while (r == -1 && (errno == EAGAIN || errno == EINTR));
         if (r == -1) {
             perror("sigwait");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         qemu_mutex_lock_iothread();
         current_cpu = cpu;
@@ -1213,7 +1213,7 @@ static void qemu_cpu_kick_thread(CPUState *cpu)
     err = pthread_kill(cpu->thread->thread, SIG_IPI);
     if (err) {
         fprintf(stderr, "qemu:%s: %s", __func__, strerror(err));
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 #else /* _WIN32 */
     abort();
diff --git a/cputlb.c b/cputlb.c
index d068ee5..39cc513 100644
--- a/cputlb.c
+++ b/cputlb.c
@@ -491,7 +491,7 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env1, target_ulong addr)
             cc->do_unassigned_access(cpu, addr, false, true, 0, 4);
         } else {
             report_bad_exec(cpu, addr);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
     p = (void *)((uintptr_t)addr + env1->tlb_table[mmu_idx][page_index].addend);
diff --git a/exec.c b/exec.c
index c81d5ab..f62a54c 100644
--- a/exec.c
+++ b/exec.c
@@ -1801,7 +1801,7 @@ void qemu_ram_remap(ram_addr_t addr, ram_addr_t length)
                     fprintf(stderr, "Could not remap addr: "
                             RAM_ADDR_FMT "@" RAM_ADDR_FMT "\n",
                             length, addr);
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 memory_try_enable_merging(vaddr, length);
                 qemu_ram_setup_dump(vaddr, length);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index c450c62..0094fa5 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1269,7 +1269,7 @@ void tcg_add_target_add_op_defs(const TCGTargetOpDef *tdefs)
                         if (target_parse_constraint(&def->args_ct[i], &ct_str) < 0) {
                             fprintf(stderr, "Invalid constraint '%s' for arg %d of operation '%s'\n",
                                     ct_str, i, def->name);
-                            exit(1);
+                            exit(EXIT_FAILURE);
                         }
                     }
                 }
diff --git a/translate-all.c b/translate-all.c
index b6663dc..5f1be0f 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -720,7 +720,7 @@ static inline void code_gen_alloc(size_t tb_size)
     tcg_ctx.code_gen_buffer = alloc_code_gen_buffer();
     if (tcg_ctx.code_gen_buffer == NULL) {
         fprintf(stderr, "Could not allocate dynamic translator buffer\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* Estimate a good size for the number of TBs we can support.  We
-- 
2.5.5


