Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZB1nd-0005GK-3r
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2015 10:18:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ZB1na-0005BF-89
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 10:18:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ZB1nV-0002XW-Er
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 10:18:38 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:57091)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ZB1nV-0002XQ-6w
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 10:18:33 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZB1nM-0003xt-N9; Fri, 03 Jul 2015 15:18:24 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  3 Jul 2015 15:18:24 +0100
Message-Id: <1435933104-15216-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] Stop including qemu-common.h in memory.h
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
X-List-Received-Date: Fri, 03 Jul 2015 14:18:39 -0000

Including qemu-common.h from other header files is generally a bad
idea, because it means it's very easy to end up with a circular
dependency. For instance, if we wanted to include memory.h from
qom/cpu.h we'd end up with this loop:
 memory.h -> qemu-common.h -> cpu.h -> cpu-qom.h -> qom/cpu.h -> memory.h

Remove the include from memory.h. This requires us to fix up a few
other files which were inadvertently getting declarations indirectly
through memory.h.

The biggest change is splitting the fprintf_function typedef out
into its own header so other headers can get at it without having
to include qemu-common.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I originally wrote this because I thought I was going to need to
include memory.h in qom/cpu.h. In fact I managed to avoid that in
the end, but this still seems like useful cleanup.


 include/exec/cpu-common.h |  2 ++
 include/exec/memory.h     |  1 -
 include/hw/arm/arm.h      |  1 +
 include/qemu-common.h     |  4 +---
 include/qemu/fprintf-fn.h | 16 ++++++++++++++++
 target-s390x/mmu_helper.c |  2 +-
 6 files changed, 21 insertions(+), 5 deletions(-)
 create mode 100644 include/qemu/fprintf-fn.h

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index de8a720..9fb1d54 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -13,6 +13,8 @@
 
 #include "qemu/bswap.h"
 #include "qemu/queue.h"
+#include "qemu/fprintf-fn.h"
+#include "qemu/typedefs.h"
 
 /**
  * CPUListState:
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 8ae004e..1881320 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -23,7 +23,6 @@
 
 #include <stdint.h>
 #include <stdbool.h>
-#include "qemu-common.h"
 #include "exec/cpu-common.h"
 #ifndef CONFIG_USER_ONLY
 #include "exec/hwaddr.h"
diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
index 760804c..4dcd4f9 100644
--- a/include/hw/arm/arm.h
+++ b/include/hw/arm/arm.h
@@ -14,6 +14,7 @@
 #include "exec/memory.h"
 #include "hw/irq.h"
 #include "qemu/notify.h"
+#include "cpu.h"
 
 /* armv7m.c */
 qemu_irq *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
diff --git a/include/qemu-common.h b/include/qemu-common.h
index d52d09c..09b8c06 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -15,6 +15,7 @@
 #include "qemu/compiler.h"
 #include "config-host.h"
 #include "qemu/typedefs.h"
+#include "qemu/fprintf-fn.h"
 
 #if defined(__arm__) || defined(__sparc__) || defined(__mips__) || defined(__hppa__) || defined(__ia64__)
 #define WORDS_ALIGNED
@@ -85,9 +86,6 @@
 # error Unknown pointer size
 #endif
 
-typedef int (*fprintf_function)(FILE *f, const char *fmt, ...)
-    GCC_FMT_ATTR(2, 3);
-
 #ifdef _WIN32
 #define fsync _commit
 #if !defined(lseek)
diff --git a/include/qemu/fprintf-fn.h b/include/qemu/fprintf-fn.h
new file mode 100644
index 0000000..4f66d45
--- /dev/null
+++ b/include/qemu/fprintf-fn.h
@@ -0,0 +1,16 @@
+/*
+ * Typedef for fprintf-alike function pointers.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef FPRINTF_FN_H
+
+#include "qemu/compiler.h"
+#include <stdio.h>
+
+typedef int (*fprintf_function)(FILE *f, const char *fmt, ...)
+    GCC_FMT_ATTR(2, 3);
+
+#endif
diff --git a/target-s390x/mmu_helper.c b/target-s390x/mmu_helper.c
index 815ff42..1ea6d81 100644
--- a/target-s390x/mmu_helper.c
+++ b/target-s390x/mmu_helper.c
@@ -17,8 +17,8 @@
 
 #include "qemu/error-report.h"
 #include "exec/address-spaces.h"
-#include "sysemu/kvm.h"
 #include "cpu.h"
+#include "sysemu/kvm.h"
 
 /* #define DEBUG_S390 */
 /* #define DEBUG_S390_PTE */
-- 
1.9.1


