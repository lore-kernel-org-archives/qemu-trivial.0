Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b8TGE-00082C-UT
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jun 2016 10:06:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b8TGC-00080t-II
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2016 10:06:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b8TGB-0003Ss-Hx
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2016 10:06:08 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57475)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b8TG9-0003Qy-7V; Thu, 02 Jun 2016 10:06:05 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b8TG0-0008HM-D0; Thu, 02 Jun 2016 15:05:56 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Thu,  2 Jun 2016 15:05:55 +0100
Message-Id: <1464876355-21050-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH] qemu-common.h: Drop WORDS_ALIGNED define
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
X-List-Received-Date: Thu, 02 Jun 2016 14:06:09 -0000

The WORDS_ALIGNED #define is not used anywhere, and hasn't been since
2013 when commit 612d590ebc6cef rewrote the various ld<type>_<endian>_p
functions to not use it. Remove the #define and the comment describing it.
Also remove the line in the comment about TARGET_WORDS_ALIGNED, since
it has never actually existed.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu-all.h | 5 -----
 include/qemu-common.h  | 4 ----
 2 files changed, 9 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 3911576..9f38edf 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -34,14 +34,9 @@
 
 /* some important defines:
  *
- * WORDS_ALIGNED : if defined, the host cpu can only make word aligned
- * memory accesses.
- *
  * HOST_WORDS_BIGENDIAN : if defined, the host cpu is big endian and
  * otherwise little endian.
  *
- * (TARGET_WORDS_ALIGNED : same for target cpu (not supported yet))
- *
  * TARGET_WORDS_BIGENDIAN : same for target cpu
  */
 
diff --git a/include/qemu-common.h b/include/qemu-common.h
index 835cbc6..1f2cb94 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -14,10 +14,6 @@
 
 #include "qemu/fprintf-fn.h"
 
-#if defined(__arm__) || defined(__sparc__) || defined(__mips__) || defined(__hppa__) || defined(__ia64__)
-#define WORDS_ALIGNED
-#endif
-
 #define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
 
 #include "qemu/option.h"
-- 
1.9.1


