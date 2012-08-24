Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4m39-0003dg-TU
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 01:03:15 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T4m33-0003Ll-Dy
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 01:03:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T4m32-0001T5-JY
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 01:03:09 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:55486)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1T4m30-0001Rq-8U; Fri, 24 Aug 2012 01:03:06 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	F36197280028; Fri, 24 Aug 2012 07:03:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id MyFaMp2riu61; Fri, 24 Aug 2012 07:03:04 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 75CEC728002B; Fri, 24 Aug 2012 07:03:04 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 24 Aug 2012 07:03:03 +0200
Message-Id: <1345784583-25640-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH for 1.2] qemu-ga: Fix null pointer passed to
	unlink in failure branch
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
X-List-Received-Date: Fri, 24 Aug 2012 05:03:15 -0000

Clang reports this warning:

Null pointer passed as an argument to a 'nonnull' parameter

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 qemu-ga.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/qemu-ga.c b/qemu-ga.c
index 26671fe..7623079 100644
--- a/qemu-ga.c
+++ b/qemu-ga.c
@@ -438,7 +438,9 @@ static void become_daemon(const char *pidfile)
     return;
 
 fail:
-    unlink(pidfile);
+    if (pidfile) {
+        unlink(pidfile);
+    }
     g_critical("failed to daemonize");
     exit(EXIT_FAILURE);
 #endif
-- 
1.7.10


