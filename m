Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkEiZ-0002Av-OY
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 13:10:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEdD-0007lI-63
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:05:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEcO-00010S-4q
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:05:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33222)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZkEZn-0002r7-RF; Thu, 08 Oct 2015 13:01:56 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8FFD640A5D;
	Thu,  8 Oct 2015 20:01:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 9D567A83;
	Thu,  8 Oct 2015 19:52:31 +0300 (MSK)
Received: (nullmailer pid 11982 invoked by uid 1000);
	Thu, 08 Oct 2015 16:52:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 19:52:12 +0300
Message-Id: <7af0fc994e85c0ff16eda6d7e328427b02a01008.1444323071.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
References: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, qemu-trivial@nongnu.org,
	Sai Pavan Boddu <saipava@xilinx.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 03/19] sdhci: Change debug prints to compile
	unconditionally
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
X-List-Received-Date: Thu, 08 Oct 2015 17:10:58 -0000

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Conditional compilation hides few type mismatch warnings, fix it to
compile unconditionally.

Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
Suggested-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/sd/sdhci.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 436448c..8b0f9f0 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -37,24 +37,24 @@
 #define SDHC_DEBUG                        0
 #endif
 
-#if SDHC_DEBUG == 0
-    #define DPRINT_L1(fmt, args...)       do { } while (0)
-    #define DPRINT_L2(fmt, args...)       do { } while (0)
-    #define ERRPRINT(fmt, args...)        do { } while (0)
-#elif SDHC_DEBUG == 1
-    #define DPRINT_L1(fmt, args...)       \
-        do {fprintf(stderr, "QEMU SDHC: "fmt, ## args); } while (0)
-    #define DPRINT_L2(fmt, args...)       do { } while (0)
-    #define ERRPRINT(fmt, args...)        \
-        do {fprintf(stderr, "QEMU SDHC ERROR: "fmt, ## args); } while (0)
-#else
-    #define DPRINT_L1(fmt, args...)       \
-        do {fprintf(stderr, "QEMU SDHC: "fmt, ## args); } while (0)
-    #define DPRINT_L2(fmt, args...)       \
-        do {fprintf(stderr, "QEMU SDHC: "fmt, ## args); } while (0)
-    #define ERRPRINT(fmt, args...)        \
-        do {fprintf(stderr, "QEMU SDHC ERROR: "fmt, ## args); } while (0)
-#endif
+#define DPRINT_L1(fmt, args...) \
+    do { \
+        if (SDHC_DEBUG) { \
+            fprintf(stderr, "QEMU SDHC: " fmt, ## args); \
+        } \
+    } while (0)
+#define DPRINT_L2(fmt, args...) \
+    do { \
+        if (SDHC_DEBUG > 1) { \
+            fprintf(stderr, "QEMU SDHC: " fmt, ## args); \
+        } \
+    } while (0)
+#define ERRPRINT(fmt, args...) \
+    do { \
+        if (SDHC_DEBUG) { \
+            fprintf(stderr, "QEMU SDHC ERROR: " fmt, ## args); \
+        } \
+    } while (0)
 
 /* Default SD/MMC host controller features information, which will be
  * presented in CAPABILITIES register of generic SD host controller at reset.
-- 
2.1.4


