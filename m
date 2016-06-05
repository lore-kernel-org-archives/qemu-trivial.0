Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9XDf-0007V2-Ch
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 08:31:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9XDc-0007Qe-Pt
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 08:31:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9XDa-00021a-Ol
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 08:31:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59660)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9XDJ-0001wb-VT; Sun, 05 Jun 2016 08:31:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A3CFF408D7;
	Sun,  5 Jun 2016 15:31:30 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 2300FAF7;
	Sun,  5 Jun 2016 10:43:36 +0300 (MSK)
Received: (nullmailer pid 1160 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:11 +0300
Message-Id: <9acb90e482e86dd56831cc5850a932bac271b76a.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 34/52] qemu-common.h: Drop WORDS_ALIGNED define
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
X-List-Received-Date: Sun, 05 Jun 2016 12:31:53 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The WORDS_ALIGNED #define is not used anywhere, and hasn't been since
2013 when commit 612d590ebc6cef rewrote the various ld<type>_<endian>_p
functions to not use it. Remove the #define and the comment describing it.
Also remove the line in the comment about TARGET_WORDS_ALIGNED, since
it has never actually existed.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


