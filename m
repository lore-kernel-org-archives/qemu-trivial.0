Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UsdHb-00058m-LI
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 14:20:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdHU-0004tc-Ty
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:20:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdHS-0006Iw-Lz
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:20:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42241)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UsdHO-0006Gl-D4; Fri, 28 Jun 2013 14:20:18 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A058C42BD2;
	Fri, 28 Jun 2013 22:20:17 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 38DA056E; Fri, 28 Jun 2013 22:17:48 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 28 Jun 2013 22:17:37 +0400
Message-Id: <1372443465-22384-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 06/14] qemu-char: print notification to stderr
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
X-List-Received-Date: Fri, 28 Jun 2013 18:20:26 -0000

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-char.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index e3b3224..371f630 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -2666,8 +2666,8 @@ static CharDriverState *qemu_chr_open_socket_fd(int fd, bool do_nodelay,
     }
 
     if (is_listen && is_waitconnect) {
-        printf("QEMU waiting for connection on: %s\n",
-               chr->filename);
+        fprintf(stderr, "QEMU waiting for connection on: %s\n",
+                chr->filename);
         tcp_chr_accept(s->listen_chan, G_IO_IN, chr);
         qemu_set_nonblock(s->listen_fd);
     }
-- 
1.7.10.4


