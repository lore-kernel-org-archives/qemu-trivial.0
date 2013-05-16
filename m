Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ud2WY-00022t-6e
	for mharc-qemu-trivial@gnu.org; Thu, 16 May 2013 14:03:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@joule>) id 1Ud2WR-0001s2-Ei
	for qemu-trivial@nongnu.org; Thu, 16 May 2013 14:03:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@joule>) id 1Ud2WM-0006KZ-Em
	for qemu-trivial@nongnu.org; Thu, 16 May 2013 14:03:23 -0400
Received: from [137.122.64.71] (port=28416 helo=joule)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <emaste@joule>)
	id 1Ud2WB-00065t-7l; Thu, 16 May 2013 14:03:07 -0400
Received: from joule (localhost [127.0.0.1])
	by joule (8.14.7/8.14.5) with ESMTP id r4GFWUtM015232;
	Thu, 16 May 2013 11:32:30 -0400 (EDT) (envelope-from emaste@joule)
Received: (from emaste@localhost)
	by joule (8.14.7/8.14.5/Submit) id r4GFWTV5015231;
	Thu, 16 May 2013 11:32:29 -0400 (EDT) (envelope-from emaste)
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel@nongnu.org
Date: Thu, 16 May 2013 11:32:28 -0400
Message-Id: <1368718348-15199-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 1.7.10.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 137.122.64.71
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH v2] Rename hexdump to avoid FreeBSD libutil
	conflict
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
X-List-Received-Date: Thu, 16 May 2013 18:03:28 -0000

On FreeBSD libutil is used for openpty(), but it also provides a hexdump()
which conflicts with QEMU's.

Signed-off-by: Ed Maste <emaste@freebsd.org>
---
v1->v2: Add hexdump() use in iov.c

If desired I can workaround this via #define hacks in qemu-common.h
instead; please let me know and I will submit that patch.  This is needed
to build on FreeBSD.

 hw/dma/pl330.c        |    4 ++--
 include/qemu-common.h |    2 +-
 util/hexdump.c        |    2 +-
 util/iov.c            |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index 8b33138..60f5299 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -1157,7 +1157,7 @@ static int pl330_exec_cycle(PL330Chan *channel)
         if (PL330_ERR_DEBUG > 1) {
             DB_PRINT("PL330 read from memory @%08x (size = %08x):\n",
                       q->addr, len);
-            hexdump((char *)buf, stderr, "", len);
+            qemu_hexdump((char *)buf, stderr, "", len);
         }
         fifo_res = pl330_fifo_push(&s->fifo, buf, len, q->tag);
         if (fifo_res == PL330_FIFO_OK) {
@@ -1189,7 +1189,7 @@ static int pl330_exec_cycle(PL330Chan *channel)
             if (PL330_ERR_DEBUG > 1) {
                 DB_PRINT("PL330 read from memory @%08x (size = %08x):\n",
                          q->addr, len);
-                hexdump((char *)buf, stderr, "", len);
+                qemu_hexdump((char *)buf, stderr, "", len);
             }
             if (q->inc) {
                 q->addr += len;
diff --git a/include/qemu-common.h b/include/qemu-common.h
index 7f18b8e..b9057d1 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -443,7 +443,7 @@ int mod_utf8_codepoint(const char *s, size_t n, char **end);
  * Hexdump a buffer to a file. An optional string prefix is added to every line
  */
 
-void hexdump(const char *buf, FILE *fp, const char *prefix, size_t size);
+void qemu_hexdump(const char *buf, FILE *fp, const char *prefix, size_t size);
 
 /* vector definitions */
 #ifdef __ALTIVEC__
diff --git a/util/hexdump.c b/util/hexdump.c
index 0d0efc8..969b340 100644
--- a/util/hexdump.c
+++ b/util/hexdump.c
@@ -15,7 +15,7 @@
 
 #include "qemu-common.h"
 
-void hexdump(const char *buf, FILE *fp, const char *prefix, size_t size)
+void qemu_hexdump(const char *buf, FILE *fp, const char *prefix, size_t size)
 {
     unsigned int b;
 
diff --git a/util/iov.c b/util/iov.c
index 78bbbe1..cc6e837 100644
--- a/util/iov.c
+++ b/util/iov.c
@@ -225,7 +225,7 @@ void iov_hexdump(const struct iovec *iov, const unsigned int iov_cnt,
     size = size > limit ? limit : size;
     buf = g_malloc(size);
     iov_to_buf(iov, iov_cnt, 0, buf, size);
-    hexdump(buf, fp, prefix, size);
+    qemu_hexdump(buf, fp, prefix, size);
     g_free(buf);
 }
 
-- 
1.7.10.3


