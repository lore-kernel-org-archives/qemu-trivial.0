Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UsdFB-00016b-0U
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 14:18:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdF4-0000tR-Ju
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:17:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdF2-000576-BI
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:17:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44730)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UsdEz-000554-Hp; Fri, 28 Jun 2013 14:17:49 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id F399B42BCC;
	Fri, 28 Jun 2013 22:17:46 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 3D35D1A3; Fri, 28 Jun 2013 22:17:45 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 28 Jun 2013 22:17:32 +0400
Message-Id: <1372443465-22384-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 01/14] qemu-socket: zero-initialize
	SocketAddress
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
 util/qemu-sockets.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 96eca2a..86fb09c 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -848,9 +848,9 @@ int unix_nonblocking_connect(const char *path,
 
 SocketAddress *socket_parse(const char *str, Error **errp)
 {
-    SocketAddress *addr = NULL;
+    SocketAddress *addr;
 
-    addr = g_new(SocketAddress, 1);
+    addr = g_new0(SocketAddress, 1);
     if (strstart(str, "unix:", NULL)) {
         if (str[5] == '\0') {
             error_setg(errp, "invalid Unix socket address");
-- 
1.7.10.4


