Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UsdFB-00017X-CG
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 14:18:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdF5-0000ud-Ib
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:17:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdF3-00057l-O4
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:17:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55940)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UsdEz-00055M-Hg; Fri, 28 Jun 2013 14:17:49 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 797D842BCE;
	Fri, 28 Jun 2013 22:17:48 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id EF1CE56B; Fri, 28 Jun 2013 22:17:47 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 28 Jun 2013 22:17:33 +0400
Message-Id: <1372443465-22384-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 02/14] qemu-socket: drop pointless allocation
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
X-List-Received-Date: Fri, 28 Jun 2013 18:17:57 -0000

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/qemu-sockets.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 86fb09c..35023a8 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -871,7 +871,6 @@ SocketAddress *socket_parse(const char *str, Error **errp)
         }
     } else {
         addr->kind = SOCKET_ADDRESS_KIND_INET;
-        addr->inet = g_new(InetSocketAddress, 1);
         addr->inet = inet_parse(str, errp);
         if (addr->inet == NULL) {
             goto fail;
-- 
1.7.10.4


