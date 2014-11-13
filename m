Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XotLW-0007Ro-EL
	for mharc-qemu-trivial@gnu.org; Thu, 13 Nov 2014 07:17:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XotLP-0007F8-MF
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 07:17:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XotLK-0001vE-NF
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 07:17:47 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:24251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XotL9-0001qp-VR; Thu, 13 Nov 2014 07:17:32 -0500
Received: from 172.24.2.119 (EHLO szxeml418-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CEJ67669; Thu, 13 Nov 2014 20:17:20 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml418-hub.china.huawei.com
	(10.82.67.157) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 13 Nov 2014 20:17:10 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 13 Nov 2014 20:17:06 +0800
Message-ID: <1415881027-8112-2-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1415881027-8112-1-git-send-email-arei.gonglei@huawei.com>
References: <1415881027-8112-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	aneesh.kumar@linux.vnet.ibm.com, peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH 1/2] virtfs-proxy-helper: Fix possible socket
	leak.
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
X-List-Received-Date: Thu, 13 Nov 2014 12:17:52 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 fsdev/virtfs-proxy-helper.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index cd291d3..c1da2d7 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -749,24 +749,29 @@ static int proxy_socket(const char *path, uid_t uid, gid_t gid)
     if (bind(sock, (struct sockaddr *)&proxy,
             sizeof(struct sockaddr_un)) < 0) {
         do_perror("bind");
-        return -1;
+        goto error;
     }
     if (chown(proxy.sun_path, uid, gid) < 0) {
         do_perror("chown");
-        return -1;
+        goto error;
     }
     if (listen(sock, 1) < 0) {
         do_perror("listen");
-        return -1;
+        goto error;
     }
 
     size = sizeof(qemu);
     client = accept(sock, (struct sockaddr *)&qemu, &size);
     if (client < 0) {
         do_perror("accept");
-        return -1;
+        goto error;
     }
+    close(sock);
     return client;
+
+error:
+    close(sock);
+    return -1;
 }
 
 static void usage(char *prog)
-- 
1.7.12.4



