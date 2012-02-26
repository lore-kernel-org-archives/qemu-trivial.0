Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1eGo-00084Q-3d
	for mharc-qemu-trivial@gnu.org; Sun, 26 Feb 2012 08:36:10 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1eGf-0007cv-8g
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 08:36:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1eGa-0004tc-AP
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 08:36:01 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:56066)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1S1eGQ-0004sl-2q; Sun, 26 Feb 2012 08:35:46 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	375947280013; Sun, 26 Feb 2012 14:35:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Aphu8eYIJklk; Sun, 26 Feb 2012 14:35:44 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 56B9D728009A; Sun, 26 Feb 2012 14:35:44 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sun, 26 Feb 2012 14:35:43 +0100
Message-Id: <1330263343-21307-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] Spelling fixes in comments (it's -> its)
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
X-List-Received-Date: Sun, 26 Feb 2012 13:36:08 -0000

* it's -> its (fixed for all files)
* dont -> don't (only fixed in a line which was touched by the previous fix)

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure               |    2 +-
 hw/exynos4210_mct.c     |    2 +-
 hw/usb-ccid.c           |    2 +-
 include/qemu/object.h   |    4 ++--
 kvm-all.c               |    2 +-
 libcacard/vscclient.c   |    2 +-
 linux-user/signal.c     |    2 +-
 qemu-file.h             |    2 +-
 target-mips/op_helper.c |    2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index c6c863a..5c46f1c 100755
--- a/configure
+++ b/configure
@@ -231,7 +231,7 @@ for opt do
 done
 # OS specific
 # Using uname is really, really broken.  Once we have the right set of checks
-# we can eliminate it's usage altogether
+# we can eliminate its usage altogether.
 
 cc="${CC-${cross_prefix}gcc}"
 ar="${AR-${cross_prefix}ar}"
diff --git a/hw/exynos4210_mct.c b/hw/exynos4210_mct.c
index 01e3fb8..7474fcf 100644
--- a/hw/exynos4210_mct.c
+++ b/hw/exynos4210_mct.c
@@ -888,7 +888,7 @@ static void exynos4210_ltick_event(void *opaque)
     static uint64_t time2[2] = {0};
 #endif
 
-    /* Call tick_timer event handler, it will update it's tcntb and icntb */
+    /* Call tick_timer event handler, it will update its tcntb and icntb. */
     exynos4210_ltick_timer_event(&s->tick_timer);
 
     /* get tick_timer cnt */
diff --git a/hw/usb-ccid.c b/hw/usb-ccid.c
index 0b2ac80..6ddcba7 100644
--- a/hw/usb-ccid.c
+++ b/hw/usb-ccid.c
@@ -5,7 +5,7 @@
  *
  * Written by Alon Levy, with contributions from Robert Relyea.
  *
- * Based on usb-serial.c, see it's copyright and attributions below.
+ * Based on usb-serial.c, see its copyright and attributions below.
  *
  * This work is licensed under the terms of the GNU GPL, version 2.1 or later.
  * See the COPYING file in the top-level directory.
diff --git a/include/qemu/object.h b/include/qemu/object.h
index dd7f3c0..ec2d294 100644
--- a/include/qemu/object.h
+++ b/include/qemu/object.h
@@ -124,7 +124,7 @@ typedef struct InterfaceInfo InterfaceInfo;
  *
  * Once all of the parent classes have been initialized, #TypeInfo::class_init
  * is called to let the class being instantiated provide default initialize for
- * it's virtual functions.  Here is how the above example might be modified
+ * its virtual functions.  Here is how the above example might be modified
  * to introduce an overridden virtual function:
  *
  * <example>
@@ -527,7 +527,7 @@ Type type_register_static(const TypeInfo *info);
  * type_register:
  * @info: The #TypeInfo of the new type
  *
- * Unlike type_register_static(), this call does not require @info or it's
+ * Unlike type_register_static(), this call does not require @info or its
  * string members to continue to exist after the call returns.
  *
  * Returns: 0 on failure, the new #Type on success.
diff --git a/kvm-all.c b/kvm-all.c
index c4babda..0729020 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -34,7 +34,7 @@
 #include <sys/eventfd.h>
 #endif
 
-/* KVM uses PAGE_SIZE in it's definition of COALESCED_MMIO_MAX */
+/* KVM uses PAGE_SIZE in its definition of COALESCED_MMIO_MAX */
 #define PAGE_SIZE TARGET_PAGE_SIZE
 
 //#define DEBUG_KVM
diff --git a/libcacard/vscclient.c b/libcacard/vscclient.c
index e317a25..4fbcc89 100644
--- a/libcacard/vscclient.c
+++ b/libcacard/vscclient.c
@@ -129,7 +129,7 @@ event_thread(void *arg)
                 vevent_delete(event);
                 continue;
             }
-            /* this reader hasn't been told it's status from qemu yet, wait for
+            /* this reader hasn't been told its status from qemu yet, wait for
              * that status */
             while (pending_reader != NULL) {
                 qemu_cond_wait(&pending_reader_condition, &pending_reader_lock);
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 79a39dc..cefd2ff 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -2700,7 +2700,7 @@ get_sigframe(struct target_sigaction *ka, CPUState *regs, size_t frame_size)
     sp = regs->active_tc.gpr[29];
 
     /*
-     * FPU emulator may have it's own trampoline active just
+     * FPU emulator may have its own trampoline active just
      * above the user stack, 16-bytes before the next lowest
      * 16 byte boundary.  Try to avoid trashing it.
      */
diff --git a/qemu-file.h b/qemu-file.h
index 8da1021..31b83f6 100644
--- a/qemu-file.h
+++ b/qemu-file.h
@@ -47,7 +47,7 @@ typedef int (QEMUFileGetBufferFunc)(void *opaque, uint8_t *buf,
  */
 typedef int (QEMUFileCloseFunc)(void *opaque);
 
-/* Called to determine if the file has exceeded it's bandwidth allocation.  The
+/* Called to determine if the file has exceeded its bandwidth allocation.  The
  * bandwidth capping is a soft limit, not a hard limit.
  */
 typedef int (QEMUFileRateLimit)(void *opaque);
diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
index c51b9cb..7d6773d 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -1930,7 +1930,7 @@ target_ulong helper_evpe(void)
 
     do {
         if (other_cpu != env
-           /* If the VPE is WFI, dont distrub it's sleep.  */
+           /* If the VPE is WFI, don't distrub its sleep.  */
            && !mips_vpe_is_wfi(other_cpu)) {
             /* Enable the VPE.  */
             other_cpu->mvp->CP0_MVPControl |= (1 << CP0MVPCo_EVP);
-- 
1.7.9


