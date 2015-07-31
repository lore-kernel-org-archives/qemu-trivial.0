Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZLFjt-0003rK-EX
	for mharc-qemu-trivial@gnu.org; Fri, 31 Jul 2015 15:13:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56330)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrey@xdel.ru>) id 1ZLFjq-0003ql-VC
	for qemu-trivial@nongnu.org; Fri, 31 Jul 2015 15:13:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrey@xdel.ru>) id 1ZLFjl-0003TR-0y
	for qemu-trivial@nongnu.org; Fri, 31 Jul 2015 15:13:02 -0400
Received: from ns2.flops.ru ([91.239.27.205]:58694 helo=mail.adserve.ru)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrey@xdel.ru>) id 1ZLFjk-0003TM-Ow
	for qemu-trivial@nongnu.org; Fri, 31 Jul 2015 15:12:56 -0400
Received: from mail.adserve.ru (localhost [127.0.0.1])
	by mail.adserve.ru (Postfix) with ESMTP id 7F81F180C67
	for <qemu-trivial@nongnu.org>; Fri, 31 Jul 2015 22:12:54 +0300 (MSK)
From: Andrey Korolyov <andrey@xdel.ru>
To: qemu-trivial@nongnu.org
Date: Fri, 31 Jul 2015 22:12:54 +0300
Message-Id: <1438369974-3315-1-git-send-email-andrey@xdel.ru>
X-Mailer: git-send-email 2.0.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 91.239.27.205
Subject: [Qemu-trivial] [PATCH] Trivial: fix commandline help message
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
X-List-Received-Date: Fri, 31 Jul 2015 19:13:04 -0000

Fix obvious typo in printed help for qemu-nbd.

Signed-off-by: Andrey Korolyov <andrey@xdel.ru>
---
 qemu-nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-nbd.c b/qemu-nbd.c
index 5106b80..6256a2e 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -102,7 +102,7 @@ static void usage(const char *name)
 "      --aio=MODE            set AIO mode (native or threads)\n"
 #endif
 "      --discard=MODE        set discard mode (ignore, unmap)\n"
-"      --detect-zeroes=MODE  set detect-zeroes mode (off, on, discard)\n"
+"      --detect-zeroes=MODE  set detect-zeroes mode (off, on, unmap)\n"
 "\n"
 "Report bugs to <qemu-devel@nongnu.org>\n"
     , name, NBD_DEFAULT_PORT, "DEVICE");
-- 
2.0.5


