Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9BYD-0007Hg-6e
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 05:05:33 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <i.mitsyanko@samsung.com>) id 1T9BY4-0006sy-3X
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 05:05:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <i.mitsyanko@samsung.com>) id 1T9BY3-0001GV-96
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 05:05:24 -0400
Received: from mailout3.w1.samsung.com ([210.118.77.13]:55202)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <i.mitsyanko@samsung.com>)
	id 1T9BXr-0000tQ-20; Wed, 05 Sep 2012 05:05:11 -0400
Received: from eusync1.samsung.com (mailout3.w1.samsung.com [210.118.77.13])
	by mailout3.w1.samsung.com
	(Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit
	(built Nov
	17 2011)) with ESMTP id <0M9V00HQAD9CXIB0@mailout3.w1.samsung.com>; Wed,
	05 Sep 2012 10:05:36 +0100 (BST)
Received: from idodo.rnd.samsung.ru ([106.109.128.43])
	by eusync1.samsung.com (Oracle Communications Messaging Server
	7u4-23.01 (7.0.4.23.0) 64bit (built Aug 10 2011))
	with ESMTPA id <0M9V00EUZD885A60@eusync1.samsung.com>; Wed,
	05 Sep 2012 10:05:04 +0100 (BST)
From: Igor Mitsyanko <i.mitsyanko@samsung.com>
To: qemu-trivial@nongnu.org
Date: Wed, 05 Sep 2012 13:04:56 +0400
Message-id: <1346835896-25319-1-git-send-email-i.mitsyanko@samsung.com>
X-Mailer: git-send-email 1.7.5.4
X-TM-AS-MML: No
X-detected-operating-system: by eggs.gnu.org: Solaris 10 (1203?)
X-Received-From: 210.118.77.13
Cc: Igor Mitsyanko <i.mitsyanko@samsung.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] arch_init.c: add missing '%' symbols before
 PRIu64 in debug printfs
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
X-List-Received-Date: Wed, 05 Sep 2012 09:05:30 -0000

'%' symbols were missing in front of PRIu64 macros in DPRINTF() messages in
arch_init.c, this caused compilation warnings when compiled with DEBUG_ARCH_INIT defined.

Signed-off-by: Igor Mitsyanko <i.mitsyanko@samsung.com>
---
 arch_init.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch_init.c b/arch_init.c
index 5a1173e..47977de 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -562,7 +562,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
         if ((i & 63) == 0) {
             uint64_t t1 = (qemu_get_clock_ns(rt_clock) - bwidth) / 1000000;
             if (t1 > MAX_WAIT) {
-                DPRINTF("big wait: " PRIu64 " milliseconds, %d iterations\n",
+                DPRINTF("big wait: %" PRIu64 " milliseconds, %d iterations\n",
                         t1, i);
                 break;
             }
@@ -587,7 +587,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
 
     expected_time = ram_save_remaining() * TARGET_PAGE_SIZE / bwidth;
 
-    DPRINTF("ram_save_live: expected(" PRIu64 ") <= max(" PRIu64 ")?\n",
+    DPRINTF("ram_save_live: expected(%" PRIu64 ") <= max(%" PRIu64 ")?\n",
             expected_time, migrate_max_downtime());
 
     if (expected_time <= migrate_max_downtime()) {
@@ -799,8 +799,8 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
     } while (!(flags & RAM_SAVE_FLAG_EOS));
 
 done:
-    DPRINTF("Completed load of VM with exit code %d seq iteration " PRIu64 "\n",
-            ret, seq_iter);
+    DPRINTF("Completed load of VM with exit code %d seq iteration "
+            "%" PRIu64 "\n", ret, seq_iter);
     return ret;
 }
 
-- 
1.7.5.4


