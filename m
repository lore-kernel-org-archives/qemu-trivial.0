Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xp6Ge-000579-MU
	for mharc-qemu-trivial@gnu.org; Thu, 13 Nov 2014 21:05:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xp6GY-00056Y-9R
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 21:05:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xp6GT-0008Re-FG
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 21:05:38 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:39207)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1Xp6GR-0008R9-PZ; Thu, 13 Nov 2014 21:05:33 -0500
Received: from 172.24.2.119 (EHLO szxeml456-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CEK29589; Fri, 14 Nov 2014 10:05:26 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml456-hub.china.huawei.com
	(10.82.67.199) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 14 Nov 2014 10:05:16 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Fri, 14 Nov 2014 10:04:24 +0800
Message-ID: <1415930664-11876-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH] libcacard: fix resource lead
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
X-List-Received-Date: Fri, 14 Nov 2014 02:05:43 -0000

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 libcacard/vscclient.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/libcacard/vscclient.c b/libcacard/vscclient.c
index 80111df..fa6041d 100644
--- a/libcacard/vscclient.c
+++ b/libcacard/vscclient.c
@@ -597,7 +597,7 @@ connect_to_qemu(
     const char *port
 ) {
     struct addrinfo hints;
-    struct addrinfo *server;
+    struct addrinfo *server = NULL;
     int ret, sock;
 
     sock = socket(AF_INET, SOCK_STREAM, 0);
@@ -629,9 +629,14 @@ connect_to_qemu(
     if (verbose) {
         printf("Connected (sizeof Header=%zd)!\n", sizeof(VSCMsgHeader));
     }
+
+    freeaddrinfo(server);
     return sock;
 
 cleanup_socket:
+    if (server) {
+        freeaddrinfo(server);
+    }
     closesocket(sock);
     return -1;
 }
-- 
1.7.12.4



