Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Srt25-0000yt-Q4
	for mharc-qemu-trivial@gnu.org; Thu, 19 Jul 2012 11:52:53 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Srt20-0000hl-CQ
	for qemu-trivial@nongnu.org; Thu, 19 Jul 2012 11:52:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Srt1u-0006vl-Hj
	for qemu-trivial@nongnu.org; Thu, 19 Jul 2012 11:52:48 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:58786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Srt1o-0006uo-ID; Thu, 19 Jul 2012 11:52:36 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Srt1f-0003q0-3u; Thu, 19 Jul 2012 16:52:27 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 19 Jul 2012 16:52:27 +0100
Message-Id: <1342713147-14729-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] cpus.c: Make all_cpu_threads_idle() static
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
X-List-Received-Date: Thu, 19 Jul 2012 15:52:52 -0000

Commit 946fb27c1 moved all the uses of all_cpu_threads_idle()
into cpus.c. This means we can mark the function 'static'
(again), if we shuffle it a bit earlier in the source file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 cpus.c        |   52 ++++++++++++++++++++++++++--------------------------
 qemu-common.h |    1 -
 2 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/cpus.c b/cpus.c
index b182b3d..756e624 100644
--- a/cpus.c
+++ b/cpus.c
@@ -61,6 +61,32 @@
 
 static CPUArchState *next_cpu;
 
+static bool cpu_thread_is_idle(CPUArchState *env)
+{
+    if (env->stop || env->queued_work_first) {
+        return false;
+    }
+    if (env->stopped || !runstate_is_running()) {
+        return true;
+    }
+    if (!env->halted || qemu_cpu_has_work(env) || kvm_irqchip_in_kernel()) {
+        return false;
+    }
+    return true;
+}
+
+static bool all_cpu_threads_idle(void)
+{
+    CPUArchState *env;
+
+    for (env = first_cpu; env != NULL; env = env->next_cpu) {
+        if (!cpu_thread_is_idle(env)) {
+            return false;
+        }
+    }
+    return true;
+}
+
 /***********************************************************/
 /* guest cycle counter */
 
@@ -433,32 +459,6 @@ static int cpu_can_run(CPUArchState *env)
     return 1;
 }
 
-static bool cpu_thread_is_idle(CPUArchState *env)
-{
-    if (env->stop || env->queued_work_first) {
-        return false;
-    }
-    if (env->stopped || !runstate_is_running()) {
-        return true;
-    }
-    if (!env->halted || qemu_cpu_has_work(env) || kvm_irqchip_in_kernel()) {
-        return false;
-    }
-    return true;
-}
-
-bool all_cpu_threads_idle(void)
-{
-    CPUArchState *env;
-
-    for (env = first_cpu; env != NULL; env = env->next_cpu) {
-        if (!cpu_thread_is_idle(env)) {
-            return false;
-        }
-    }
-    return true;
-}
-
 static void cpu_handle_guest_debug(CPUArchState *env)
 {
     gdb_set_stop_cpu(env);
diff --git a/qemu-common.h b/qemu-common.h
index 09676f5..7c8dac8 100644
--- a/qemu-common.h
+++ b/qemu-common.h
@@ -293,7 +293,6 @@ int cpu_load(QEMUFile *f, void *opaque, int version_id);
 void qemu_cpu_kick(void *env);
 void qemu_cpu_kick_self(void);
 int qemu_cpu_is_self(void *env);
-bool all_cpu_threads_idle(void);
 
 /* work queue */
 struct qemu_work_item {
-- 
1.7.5.4


