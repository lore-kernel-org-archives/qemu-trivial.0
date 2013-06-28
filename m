Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UsdFC-00019n-6s
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 14:18:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdF7-0000yX-54
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:17:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdF5-00058M-9I
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:17:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39482)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UsdF0-000567-90; Fri, 28 Jun 2013 14:17:50 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id DB19642BD1;
	Fri, 28 Jun 2013 22:17:48 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 2645156B; Fri, 28 Jun 2013 22:17:48 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 28 Jun 2013 22:17:36 +0400
Message-Id: <1372443465-22384-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 05/14] qemu-char: use more specific
	error_setg_* variants
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
X-List-Received-Date: Fri, 28 Jun 2013 18:17:59 -0000

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-char.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index a538217..e3b3224 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -2604,7 +2604,7 @@ static CharDriverState *qemu_chr_open_socket_fd(int fd, bool do_nodelay,
 
     memset(&ss, 0, ss_len);
     if (getsockname(fd, (struct sockaddr *) &ss, &ss_len) != 0) {
-        error_setg(errp, "getsockname: %s", strerror(errno));
+        error_setg_errno(errp, errno, "getsockname");
         return NULL;
     }
 
@@ -3529,7 +3529,7 @@ static int qmp_chardev_open_file_source(char *src, int flags,
 
     TFR(fd = qemu_open(src, flags, 0666));
     if (fd == -1) {
-        error_setg(errp, "open %s: %s", src, strerror(errno));
+        error_setg_file_open(errp, errno, src);
     }
     return fd;
 }
-- 
1.7.10.4


