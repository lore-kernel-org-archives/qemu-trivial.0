Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XFqws-0005Jr-B6
	for mharc-qemu-trivial@gnu.org; Fri, 08 Aug 2014 16:39:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFqwk-00057E-D1
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:39:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFqwf-0000zh-FD
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:39:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48218)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XFqwO-0000os-KD; Fri, 08 Aug 2014 16:39:08 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0781641A17;
	Sat,  9 Aug 2014 00:39:06 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E204D6EE;
	Sat,  9 Aug 2014 00:39:05 +0400 (MSK)
Received: (nullmailer pid 10322 invoked by uid 1000);
	Fri, 08 Aug 2014 20:39:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  9 Aug 2014 00:39:00 +0400
Message-Id: <1407530342-10259-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chen Gang <gang.chen.5i5j@gmail.com>
Subject: [Qemu-trivial] [PULL 7/9] qemu-img: Check getchar() return value in
	read_password() for WIN32
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
X-List-Received-Date: Fri, 08 Aug 2014 20:39:35 -0000

From: Chen Gang <gang.chen.5i5j@gmail.com>

getchar() is a standard c library function which may return with failure
(e.g. -1), so like another platforms, also need check it under WIN32.

And make the related code match current qemu code styles, too.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-img.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index d4518e7..19495bb 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -185,15 +185,20 @@ static int GCC_FMT_ATTR(2, 3) qprintf(bool quiet, const char *fmt, ...)
 static int read_password(char *buf, int buf_size)
 {
     int c, i;
+
     printf("Password: ");
     fflush(stdout);
     i = 0;
     for(;;) {
         c = getchar();
-        if (c == '\n')
+        if (c < 0) {
+            buf[i] = '\0';
+            return -1;
+        } else if (c == '\n') {
             break;
-        if (i < (buf_size - 1))
+        } else if (i < (buf_size - 1)) {
             buf[i++] = c;
+        }
     }
     buf[i] = '\0';
     return 0;
-- 
1.7.10.4


