Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xjkkh-0004XU-9e
	for mharc-qemu-trivial@gnu.org; Thu, 30 Oct 2014 04:06:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xjkkb-0004Oi-VE
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 04:06:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XjkkX-0004TJ-2t
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 04:06:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:32831)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XjkkM-0004SX-VW; Thu, 30 Oct 2014 04:06:19 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5882546E98;
	Thu, 30 Oct 2014 11:06:18 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 42777701;
	Thu, 30 Oct 2014 11:06:18 +0300 (MSK)
Received: (nullmailer pid 10100 invoked by uid 1000);
	Thu, 30 Oct 2014 08:06:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Oct 2014 11:06:18 +0300
Message-Id: <1414656378-10064-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, arei.gonglei@huawei.com,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH] virtio-9p-proxy: improve error messages in
	connect_namedsocket()
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
X-List-Received-Date: Thu, 30 Oct 2014 08:06:38 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/9pfs/virtio-9p-proxy.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
index 2ec211b..59c7445 100644
--- a/hw/9pfs/virtio-9p-proxy.c
+++ b/hw/9pfs/virtio-9p-proxy.c
@@ -1104,14 +1104,14 @@ static int connect_namedsocket(const char *path)
 
     sockfd = socket(AF_UNIX, SOCK_STREAM, 0);
     if (sockfd < 0) {
-        fprintf(stderr, "socket %s\n", strerror(errno));
+        fprintf(stderr, "failed to create socket: %s\n", strerror(errno));
         return -1;
     }
     strcpy(helper.sun_path, path);
     helper.sun_family = AF_UNIX;
     size = strlen(helper.sun_path) + sizeof(helper.sun_family);
     if (connect(sockfd, (struct sockaddr *)&helper, size) < 0) {
-        fprintf(stderr, "socket error\n");
+        fprintf(stderr, "failed to connect to %s: %s\n", path, strerror(errno));
         close(sockfd);
         return -1;
     }
-- 
1.7.10.4


