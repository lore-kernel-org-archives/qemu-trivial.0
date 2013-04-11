Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UQO0Z-00074T-7P
	for mharc-qemu-trivial@gnu.org; Thu, 11 Apr 2013 16:22:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54023)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1UQO0U-0006z3-VF
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2013 16:22:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1UQO0Q-0000DK-Pm
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2013 16:22:06 -0400
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:33720 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1UQO0L-0000Ap-Iz; Thu, 11 Apr 2013 16:21:57 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1UQO0A-0006Et-F4; Thu, 11 Apr 2013 21:21:46 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 11 Apr 2013 21:21:46 +0100
Message-Id: <1365711706-23960-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] cpu-exec: Allow "-d exec" in non-debug
	builds (drop CONFIG_DEBUG_EXEC)
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
X-List-Received-Date: Thu, 11 Apr 2013 20:22:10 -0000

The CONFIG_DEBUG_EXEC define compiles out a single qemu_log_mask()
call, which is a pretty trivial cost even for something in the main
cpu_exec() loop.  Having this be conditionally defined means that
'-d exec' on a non-debug build will silently do nothing.  Drop the
define and the configure machinery that sets it, in favour of just
always allowing this log option to be enabled at runtime.  As a
concession to the mainloopiness, we use qemu_loglevel_mask()+qemu_log()
rather than qemu_log_mask() to avoid the function call overhead.

Note that DEBUG_DISAS is always defined, so removing the
'|| defined(CONFIG_DEBUG_EXEC)' from those conditionals makes
no behavioural change for that logging.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I've been burnt at least once by asking a user to do a '-d exec'
log only to find it didn't actually log anything...

 configure  |  3 ---
 cpu-exec.c | 15 ++++++---------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/configure b/configure
index 1ed939a..73df181 100755
--- a/configure
+++ b/configure
@@ -3471,9 +3471,6 @@ echo "ARCH=$ARCH" >> $config_host_mak
 if test "$debug_tcg" = "yes" ; then
   echo "CONFIG_DEBUG_TCG=y" >> $config_host_mak
 fi
-if test "$debug" = "yes" ; then
-  echo "CONFIG_DEBUG_EXEC=y" >> $config_host_mak
-fi
 if test "$strip_opt" = "yes" ; then
   echo "STRIP=${strip}" >> $config_host_mak
 fi
diff --git a/cpu-exec.c b/cpu-exec.c
index e74e556..235ddee 100644
--- a/cpu-exec.c
+++ b/cpu-exec.c
@@ -23,8 +23,6 @@
 #include "qemu/atomic.h"
 #include "sysemu/qtest.h"
 
-//#define CONFIG_DEBUG_EXEC
-
 bool qemu_cpu_has_work(CPUState *cpu)
 {
     return cpu_has_work(cpu);
@@ -567,7 +565,7 @@ int cpu_exec(CPUArchState *env)
                     env->exception_index = EXCP_INTERRUPT;
                     cpu_loop_exit(env);
                 }
-#if defined(DEBUG_DISAS) || defined(CONFIG_DEBUG_EXEC)
+#if defined(DEBUG_DISAS)
                 if (qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
                     /* restore flags in standard format */
 #if defined(TARGET_I386)
@@ -582,7 +580,7 @@ int cpu_exec(CPUArchState *env)
                     log_cpu_state(env, 0);
 #endif
                 }
-#endif /* DEBUG_DISAS || CONFIG_DEBUG_EXEC */
+#endif /* DEBUG_DISAS */
                 spin_lock(&tcg_ctx.tb_ctx.tb_lock);
                 tb = tb_find_fast(env);
                 /* Note: we do it here to avoid a gcc bug on Mac OS X when
@@ -594,11 +592,10 @@ int cpu_exec(CPUArchState *env)
                     next_tb = 0;
                     tcg_ctx.tb_ctx.tb_invalidated_flag = 0;
                 }
-#ifdef CONFIG_DEBUG_EXEC
-                qemu_log_mask(CPU_LOG_EXEC, "Trace %p [" TARGET_FMT_lx "] %s\n",
-                             tb->tc_ptr, tb->pc,
-                             lookup_symbol(tb->pc));
-#endif
+                if (qemu_loglevel_mask(CPU_LOG_EXEC)) {
+                    qemu_log("Trace %p [" TARGET_FMT_lx "] %s\n",
+                             tb->tc_ptr, tb->pc, lookup_symbol(tb->pc));
+                }
                 /* see if we can patch the calling TB. When the TB
                    spans two pages, we cannot safely do a direct
                    jump. */
-- 
1.7.11.4


