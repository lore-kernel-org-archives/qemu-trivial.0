Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XP4Ah-0001mY-Oy
	for mharc-qemu-trivial@gnu.org; Wed, 03 Sep 2014 02:35:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4Ac-0001aH-2N
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:35:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4AY-0005eO-1G
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:35:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41543)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XP4AL-0005bE-Ed; Wed, 03 Sep 2014 02:35:37 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7DA7840760;
	Wed,  3 Sep 2014 10:35:36 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 68E6A6E9;
	Wed,  3 Sep 2014 10:35:36 +0400 (MSK)
Received: (nullmailer pid 1616 invoked by uid 1000);
	Wed, 03 Sep 2014 06:35:36 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Sep 2014 10:35:32 +0400
Message-Id: <1409726135-1547-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1409726135-1547-1-git-send-email-mjt@tls.msk.ru>
References: <1409726135-1547-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Chen Fan <chen.fan.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 07/10] query-memdev: fix potential memory leaks
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
X-List-Received-Date: Wed, 03 Sep 2014 06:35:58 -0000

From: Chen Fan <chen.fan.fnst@cn.fujitsu.com>

Signed-off-by: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Reviewed-by: Hu Tao <hutao@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 numa.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/numa.c b/numa.c
index c78cec9..aa772aa 100644
--- a/numa.c
+++ b/numa.c
@@ -318,10 +318,11 @@ void memory_region_allocate_system_memory(MemoryRegion *mr, Object *owner,
 static int query_memdev(Object *obj, void *opaque)
 {
     MemdevList **list = opaque;
+    MemdevList *m = NULL;
     Error *err = NULL;
 
     if (object_dynamic_cast(obj, TYPE_MEMORY_BACKEND)) {
-        MemdevList *m = g_malloc0(sizeof(*m));
+        m = g_malloc0(sizeof(*m));
 
         m->value = g_malloc0(sizeof(*m->value));
 
@@ -369,6 +370,9 @@ static int query_memdev(Object *obj, void *opaque)
 
     return 0;
 error:
+    g_free(m->value);
+    g_free(m);
+
     return -1;
 }
 
-- 
1.7.10.4


