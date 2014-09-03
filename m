Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XP4Gz-00083u-DS
	for mharc-qemu-trivial@gnu.org; Wed, 03 Sep 2014 02:42:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4Gs-0007ph-UI
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:42:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4Go-0007E7-S1
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:42:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41945)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XP4Gd-0007Bm-Ij; Wed, 03 Sep 2014 02:42:07 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0AD5740768;
	Wed,  3 Sep 2014 10:42:06 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4369B6F0;
	Wed,  3 Sep 2014 10:35:37 +0400 (MSK)
Received: (nullmailer pid 1620 invoked by uid 1000);
	Wed, 03 Sep 2014 06:35:36 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Sep 2014 10:35:34 +0400
Message-Id: <1409726135-1547-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1409726135-1547-1-git-send-email-mjt@tls.msk.ru>
References: <1409726135-1547-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Chen Fan <chen.fan.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 09/10] hmp: fix MemdevList memory leak
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
X-List-Received-Date: Wed, 03 Sep 2014 06:42:27 -0000

From: Chen Fan <chen.fan.fnst@cn.fujitsu.com>

the memdev_list in hmp_info_memdev() is never freed.
so we use existent method qapi_free_MemdevList() to free it.
and also we can use qapi_free_MemdevList() to replace list loops
to clean up the memdev list in error path.

Signed-off-by: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Reviewed-by: Hu Tao <hutao@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hmp.c  |    2 ++
 numa.c |    9 ++-------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/hmp.c b/hmp.c
index ba40c75..40a90da 100644
--- a/hmp.c
+++ b/hmp.c
@@ -1715,4 +1715,6 @@ void hmp_info_memdev(Monitor *mon, const QDict *qdict)
     }
 
     monitor_printf(mon, "\n");
+
+    qapi_free_MemdevList(memdev_list);
 }
diff --git a/numa.c b/numa.c
index aa772aa..f07149b 100644
--- a/numa.c
+++ b/numa.c
@@ -379,7 +379,7 @@ error:
 MemdevList *qmp_query_memdev(Error **errp)
 {
     Object *obj;
-    MemdevList *list = NULL, *m;
+    MemdevList *list = NULL;
 
     obj = object_resolve_path("/objects", NULL);
     if (obj == NULL) {
@@ -393,11 +393,6 @@ MemdevList *qmp_query_memdev(Error **errp)
     return list;
 
 error:
-    while (list) {
-        m = list;
-        list = list->next;
-        g_free(m->value);
-        g_free(m);
-    }
+    qapi_free_MemdevList(list);
     return NULL;
 }
-- 
1.7.10.4


