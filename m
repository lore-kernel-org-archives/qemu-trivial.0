Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VSkrv-00048r-9y
	for mharc-qemu-trivial@gnu.org; Sun, 06 Oct 2013 05:43:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkrq-0003yT-1L
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:43:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkrl-0004ji-Ls
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:43:13 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43207)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VSkrc-0004iU-7n; Sun, 06 Oct 2013 05:43:00 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0C22840CFF;
	Sun,  6 Oct 2013 13:33:03 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E70A9501;
	Sun,  6 Oct 2013 13:33:02 +0400 (MSK)
Received: (nullmailer pid 25808 invoked by uid 1000);
	Sun, 06 Oct 2013 09:33:02 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sun,  6 Oct 2013 13:32:50 +0400
Message-Id: <1381051979-25742-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 05/14] block: Remove unused assignment (fixes
	warning from clang)
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
X-List-Received-Date: Sun, 06 Oct 2013 09:43:18 -0000

From: Stefan Weil <sw@weilnetz.de>

blockdev.c:1929:13: warning: Value stored to 'ret' is never read
            ret = 0;
            ^     ~

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 blockdev.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index 8aa66a9..8c83f6f 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1926,7 +1926,6 @@ void qmp_drive_mirror(const char *device, const char *target,
     } else {
         switch (mode) {
         case NEW_IMAGE_MODE_EXISTING:
-            ret = 0;
             break;
         case NEW_IMAGE_MODE_ABSOLUTE_PATHS:
             /* create new image with backing file */
-- 
1.7.10.4


