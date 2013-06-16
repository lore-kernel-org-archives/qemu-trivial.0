Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UoFPm-0006EG-VQ
	for mharc-qemu-trivial@gnu.org; Sun, 16 Jun 2013 12:02:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1UoBCp-00022A-QN
	for qemu-trivial@nongnu.org; Sun, 16 Jun 2013 07:33:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1UoBCp-0001yQ-0Z
	for qemu-trivial@nongnu.org; Sun, 16 Jun 2013 07:33:11 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:32893
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1UoBCm-0001xv-Va; Sun, 16 Jun 2013 07:33:09 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id E07F3182F78; Sun, 16 Jun 2013 13:33:05 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Sun, 16 Jun 2013 13:33:05 +0200
Message-Id: <1371382385-20415-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
X-Mailman-Approved-At: Sun, 16 Jun 2013 12:02:49 -0400
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] savevm: Fix potential memory leak
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
X-List-Received-Date: Sun, 16 Jun 2013 11:33:12 -0000

The leak was reported by cppcheck. Fix it by moving the g_malloc0 after
the argument validity check.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 savevm.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/savevm.c b/savevm.c
index 2ce439f..b883714 100644
--- a/savevm.c
+++ b/savevm.c
@@ -479,7 +479,7 @@ static const QEMUFileOps socket_write_ops = {
 
 QEMUFile *qemu_fopen_socket(int fd, const char *mode)
 {
-    QEMUFileSocket *s = g_malloc0(sizeof(QEMUFileSocket));
+    QEMUFileSocket *s;
 
     if (mode == NULL ||
         (mode[0] != 'r' && mode[0] != 'w') ||
@@ -488,6 +488,7 @@ QEMUFile *qemu_fopen_socket(int fd, const char *mode)
         return NULL;
     }
 
+    s = g_malloc0(sizeof(QEMUFileSocket));
     s->fd = fd;
     if (mode[0] == 'w') {
         qemu_set_block(s->fd);
-- 
1.7.10.4


