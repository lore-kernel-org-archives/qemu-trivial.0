Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RAPIl-0000Te-55
	for mharc-qemu-trivial@gnu.org; Sun, 02 Oct 2011 12:54:07 -0400
Received: from eggs.gnu.org ([140.186.70.92]:41002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RAPIi-0000LQ-6U
	for qemu-trivial@nongnu.org; Sun, 02 Oct 2011 12:54:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RAPIh-0006ah-IG
	for qemu-trivial@nongnu.org; Sun, 02 Oct 2011 12:54:04 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:46024)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RAPIf-0006Y1-EH; Sun, 02 Oct 2011 12:54:01 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	D4FFA728327C; Sun,  2 Oct 2011 18:53:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id h+p0VmgtBMOr; Sun,  2 Oct 2011 18:53:09 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 713ED7283278; Sun,  2 Oct 2011 18:53:09 +0200 (CEST)
From: Stefan Weil <weil@mail.berlios.de>
To: qemu-devel@nongnu.org
Date: Sun,  2 Oct 2011 18:53:09 +0200
Message-Id: <1317574389-15007-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH] Fix mismatching allocation and deallocation
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
X-List-Received-Date: Sun, 02 Oct 2011 16:54:05 -0000

This error was reported by cppcheck.

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 console.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/console.c b/console.c
index 6dfcc47..e43de92 100644
--- a/console.c
+++ b/console.c
@@ -1538,7 +1538,7 @@ int text_console_init(QemuOpts *opts, CharDriverState **_chr)
     }
 
     if (!s) {
-        free(chr);
+        g_free(chr);
         return -EBUSY;
     }
 
-- 
1.7.2.5


