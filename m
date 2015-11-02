Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zt3hY-0006EZ-QH
	for mharc-qemu-trivial@gnu.org; Sun, 01 Nov 2015 20:14:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Zt3hU-000699-Nx
	for qemu-trivial@nongnu.org; Sun, 01 Nov 2015 20:14:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Zt3hT-0003PD-Ue
	for qemu-trivial@nongnu.org; Sun, 01 Nov 2015 20:14:20 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:53749)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Zt3hP-0003NU-7M; Sun, 01 Nov 2015 20:14:15 -0500
Received: from 172.24.1.49 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CVM40999; Mon, 02 Nov 2015 09:14:07 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml426-hub.china.huawei.com
	(10.82.67.181) with Microsoft SMTP Server id 14.3.235.1; Mon, 2 Nov 2015
	09:13:58 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 2 Nov 2015 09:13:48 +0800
Message-ID: <1446426828-18084-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com,
	Gonglei <arei.gonglei@huawei.com>
Subject: [Qemu-trivial] [PATCH] ivshmem-server: fix possible OVERRUN
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
X-List-Received-Date: Mon, 02 Nov 2015 01:14:21 -0000

From: Gonglei <arei.gonglei@huawei.com>

>>>     CID 1337991:  Memory - illegal accesses  (OVERRUN)
>>>     Decrementing "i". The value of "i" is now 65534.
218         while (i--) {
219             event_notifier_cleanup(&peer->vectors[i]);
220         }

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 contrib/ivshmem-server/ivshmem-server.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/contrib/ivshmem-server/ivshmem-server.c b/contrib/ivshmem-server/ivshmem-server.c
index 5e5239c..d9e26b0 100644
--- a/contrib/ivshmem-server/ivshmem-server.c
+++ b/contrib/ivshmem-server/ivshmem-server.c
@@ -168,7 +168,9 @@ ivshmem_server_handle_new_conn(IvshmemServer *server)
     }
     if (i == G_MAXUINT16) {
         IVSHMEM_SERVER_DEBUG(server, "cannot allocate new client id\n");
-        goto fail;
+        close(newfd);
+        g_free(peer);
+        return -1;
     }
     peer->id = server->cur_id++;
 
-- 
1.7.12.4



