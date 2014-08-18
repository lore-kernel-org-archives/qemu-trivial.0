Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJN9I-0007TT-9j
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 09:39:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1XJGmj-0002X3-FW
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 02:51:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1XJGmf-0001ZU-0c
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 02:51:17 -0400
Received: from [59.151.112.132] (port=9104 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>)
	id 1XJGmV-0001SV-KL; Mon, 18 Aug 2014 02:51:03 -0400
X-IronPort-AV: E=Sophos;i="5.04,348,1406563200"; d="scan'208";a="34726263"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Aug 2014 14:48:06 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id s7I6ou8N031649;
	Mon, 18 Aug 2014 14:50:56 +0800
Received: from G08FNSTD131468.fnst.cn.fujitsu.com (10.167.226.78) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 18 Aug 2014 14:51:00 +0800
From: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Date: Mon, 18 Aug 2014 14:46:35 +0800
Message-ID: <8e7cdfc57dade4af0c82e5dbb98b7202ad51db13.1408344055.git.chen.fan.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1408344055.git.chen.fan.fnst@cn.fujitsu.com>
References: <cover.1408344055.git.chen.fan.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.78]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
X-Mailman-Approved-At: Mon, 18 Aug 2014 09:38:58 -0400
Subject: [Qemu-trivial] [RESEND v2 3/3] hmp: fix MemdevList memory leak
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
X-List-Received-Date: Mon, 18 Aug 2014 06:51:22 -0000

the memdev_list in hmp_info_memdev() is never freed.
so we use existent method qapi_free_MemdevList() to free it.
and also we can use qapi_free_MemdevList() to replace list loops
to clean up the memdev list in error path.

Signed-off-by: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Reviewed-by: Hu Tao <hutao@cn.fujitsu.com>

---
 hmp.c  | 2 ++
 numa.c | 9 ++-------
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
1.9.3


