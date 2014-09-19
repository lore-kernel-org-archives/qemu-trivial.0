Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XUp2z-0005Ot-01
	for mharc-qemu-trivial@gnu.org; Thu, 18 Sep 2014 23:39:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XUp2s-0005OQ-F6
	for qemu-trivial@nongnu.org; Thu, 18 Sep 2014 23:39:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XUp2n-00075M-KV
	for qemu-trivial@nongnu.org; Thu, 18 Sep 2014 23:39:42 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:27115)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XUp2m-00074S-TD; Thu, 18 Sep 2014 23:39:37 -0400
Received: from 172.24.2.119 (EHLO szxeml403-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BZQ95494; Fri, 19 Sep 2014 11:39:24 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml403-hub.china.huawei.com
	(10.82.67.35) with Microsoft SMTP Server id 14.3.158.1; Fri, 19 Sep 2014
	11:38:46 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 19 Sep 2014 11:37:28 +0800
Message-ID: <1411097848-3900-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com, peter.huangpeng@huawei.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PATCH v1] vl: Fix possible freed memory accessing
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
X-List-Received-Date: Fri, 19 Sep 2014 03:39:47 -0000

The logic of pcmcia_socket_unregister is wrong,
which will cause a freed memory accessing

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
Hi,

The function pcmcia_socket_unregister seemes to be unused,
Should it be removed? Thanks.
---
 vl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index dc792fe..bf659b7 100644
--- a/vl.c
+++ b/vl.c
@@ -1545,11 +1545,13 @@ void pcmcia_socket_unregister(PCMCIASocket *socket)
     struct pcmcia_socket_entry_s *entry, **ptr;
 
     ptr = &pcmcia_sockets;
-    for (entry = *ptr; entry; ptr = &entry->next, entry = *ptr)
+    for (entry = *ptr; entry; ptr = &entry->next, entry = *ptr) {
         if (entry->socket == socket) {
             *ptr = entry->next;
             g_free(entry);
+            break;
         }
+    }
 }
 
 void pcmcia_info(Monitor *mon, const QDict *qdict)
-- 
1.7.12.4



