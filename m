Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SDzxu-0004Ma-Pu
	for mharc-qemu-trivial@gnu.org; Sat, 31 Mar 2012 11:11:42 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SDzxr-0004Bm-Ng
	for qemu-trivial@nongnu.org; Sat, 31 Mar 2012 11:11:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SDzxq-0000ww-6t
	for qemu-trivial@nongnu.org; Sat, 31 Mar 2012 11:11:39 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:44385)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SDzxn-0000vw-3o; Sat, 31 Mar 2012 11:11:35 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	C5B8472800AF; Sat, 31 Mar 2012 17:11:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id mJwYvuI55zVj; Sat, 31 Mar 2012 17:11:32 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 1962272800B0; Sat, 31 Mar 2012 17:11:32 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 31 Mar 2012 17:11:31 +0200
Message-Id: <1333206691-8459-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] qtest: Add missing GCC_FMT_ATTR
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
X-List-Received-Date: Sat, 31 Mar 2012 15:11:41 -0000

gcc reports an error when the code is compiled with -Wmissing-format-attribute.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 qtest.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/qtest.c b/qtest.c
index cd7186c..53e2ed6 100644
--- a/qtest.c
+++ b/qtest.c
@@ -156,7 +156,8 @@ static void qtest_send_prefix(CharDriverState *chr)
             tv.tv_sec, tv.tv_usec);
 }
 
-static void qtest_send(CharDriverState *chr, const char *fmt, ...)
+static void GCC_FMT_ATTR(2, 3) qtest_send(CharDriverState *chr,
+                                          const char *fmt, ...)
 {
     va_list ap;
     char buffer[1024];
-- 
1.7.9


