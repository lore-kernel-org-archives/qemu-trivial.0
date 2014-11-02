Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XktoL-0005up-UN
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 06:59:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktoF-0005k3-RJ
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 06:59:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktoA-0002TM-U7
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 06:59:03 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53456)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xkto0-0002RK-VS; Sun, 02 Nov 2014 06:58:49 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 334FF402BD;
	Sun,  2 Nov 2014 14:58:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1222E6FC;
	Sun,  2 Nov 2014 14:58:48 +0300 (MSK)
Received: (nullmailer pid 14972 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:23 +0300
Message-Id: <660edd4eda903e32811a4929d1434cceda3284aa.1414929285.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 11/23] virtio-9p-proxy: Fix sockfd leak
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
X-List-Received-Date: Sun, 02 Nov 2014 11:59:08 -0000

If connect() in connect_namedsocket() return false, the sockfd will leak.
Plug it.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/9pfs/virtio-9p-proxy.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
index b57966d..e6bbb06 100644
--- a/hw/9pfs/virtio-9p-proxy.c
+++ b/hw/9pfs/virtio-9p-proxy.c
@@ -1112,6 +1112,7 @@ static int connect_namedsocket(const char *path)
     size = strlen(helper.sun_path) + sizeof(helper.sun_family);
     if (connect(sockfd, (struct sockaddr *)&helper, size) < 0) {
         fprintf(stderr, "socket error\n");
+        close(sockfd);
         return -1;
     }
 
-- 
1.7.10.4


