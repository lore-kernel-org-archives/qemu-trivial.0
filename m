Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TH6r9-0000GP-23
	for mharc-qemu-trivial@gnu.org; Thu, 27 Sep 2012 01:41:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TH6r5-00006s-US
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2012 01:41:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TH6r5-0005IH-4l
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2012 01:41:47 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:60137)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TH6r3-0005Hr-7t; Thu, 27 Sep 2012 01:41:45 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	DA713728003A; Thu, 27 Sep 2012 07:41:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id ontDRbAFqwUd; Thu, 27 Sep 2012 07:41:43 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 8CAD8728003B; Thu, 27 Sep 2012 07:41:43 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Thu, 27 Sep 2012 07:41:42 +0200
Message-Id: <1348724502-22542-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] cpu: Add missing 'static' attribute to
	qemu_global_mutex
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
X-List-Received-Date: Thu, 27 Sep 2012 05:41:49 -0000

Contrary to its name, 'qemu_global_mutex' is only used locally
in cpus.c.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 cpus.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cpus.c b/cpus.c
index 33da623..348b414 100644
--- a/cpus.c
+++ b/cpus.c
@@ -613,7 +613,7 @@ static void qemu_tcg_init_cpu_signals(void)
 }
 #endif /* _WIN32 */
 
-QemuMutex qemu_global_mutex;
+static QemuMutex qemu_global_mutex;
 static QemuCond qemu_io_proceeded_cond;
 static bool iothread_requesting_mutex;
 
-- 
1.7.10


