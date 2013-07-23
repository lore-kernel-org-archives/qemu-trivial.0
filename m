Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1UVJ-0006bT-9n
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jul 2013 00:47:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1V1UVF-0006Wh-Eb
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 00:47:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1V1UVD-0000l9-6y
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 00:47:13 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:46385)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1V1UV7-0000iy-Dy; Tue, 23 Jul 2013 00:47:05 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	893F67280A00; Tue, 23 Jul 2013 06:47:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id fKVzuwFuHZwn; Tue, 23 Jul 2013 06:46:51 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id CBB257280A01; Tue, 23 Jul 2013 06:46:51 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Tue, 23 Jul 2013 06:46:49 +0200
Message-Id: <1374554809-31848-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] watchdog: Remove break after exit
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
X-List-Received-Date: Tue, 23 Jul 2013 04:47:16 -0000

This was dead code.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/watchdog/watchdog.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/watchdog/watchdog.c b/hw/watchdog/watchdog.c
index cb4e1f9..387962e 100644
--- a/hw/watchdog/watchdog.c
+++ b/hw/watchdog/watchdog.c
@@ -128,7 +128,6 @@ void watchdog_perform_action(void)
     case WDT_POWEROFF:          /* same as 'quit' command in monitor */
         watchdog_mon_event("poweroff");
         exit(0);
-        break;
 
     case WDT_PAUSE:             /* same as 'stop' command in monitor */
         watchdog_mon_event("pause");
-- 
1.7.10.4


