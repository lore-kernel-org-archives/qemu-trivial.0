Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJN9H-0007Ss-S1
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 09:38:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1XJGmc-0002KQ-TB
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 02:51:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1XJGmY-0001Uo-Fg
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 02:51:10 -0400
Received: from [59.151.112.132] (port=20603 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>)
	id 1XJGmO-0001OR-OP; Mon, 18 Aug 2014 02:50:57 -0400
X-IronPort-AV: E=Sophos;i="5.04,348,1406563200"; d="scan'208";a="34726260"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Aug 2014 14:48:02 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id s7I6oqBx031641;
	Mon, 18 Aug 2014 14:50:52 +0800
Received: from G08FNSTD131468.fnst.cn.fujitsu.com (10.167.226.78) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 18 Aug 2014 14:50:57 +0800
From: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Date: Mon, 18 Aug 2014 14:46:33 +0800
Message-ID: <b76a43ae5a14b8edc7daa3db38daec99d538ac14.1408344055.git.chen.fan.fnst@cn.fujitsu.com>
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
Subject: [Qemu-trivial] [RESEND v2 1/3] query-memdev: fix potential memory
	leaks
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
X-List-Received-Date: Mon, 18 Aug 2014 06:51:18 -0000

Signed-off-by: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Reviewed-by: Hu Tao <hutao@cn.fujitsu.com>

---
 numa.c | 6 +++++-
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
1.9.3


