Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xku6L-0005Da-A9
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 07:17:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xku6E-00050C-65
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:17:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xku69-0007KV-R8
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:17:38 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46346)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xku60-0007E4-JT; Sun, 02 Nov 2014 07:17:24 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 51C28402C3;
	Sun,  2 Nov 2014 15:17:23 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 91224709;
	Sun,  2 Nov 2014 14:58:48 +0300 (MSK)
Received: (nullmailer pid 14976 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:25 +0300
Message-Id: <7d5a8435baed70f03bbe791aba12f5586ba17d75.1414929285.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 13/23] virtio-9p-proxy: improve error messages
	in connect_namedsocket()
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
X-List-Received-Date: Sun, 02 Nov 2014 12:17:42 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
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


