Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZpRe-000197-QO
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jun 2011 15:20:07 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QZpRb-00017G-0y
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 15:20:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QZpRZ-0001iw-Iw
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 15:20:02 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:57923)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QZpRV-0001hu-Km; Thu, 23 Jun 2011 15:19:57 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	DCB5C72818A5; Thu, 23 Jun 2011 21:19:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 3jSy3V-mkCsJ; Thu, 23 Jun 2011 21:19:55 +0200 (CEST)
Received: from flocke.weilnetz.de (p5086FB6F.dip.t-dialin.net [80.134.251.111])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	5756172818A4; Thu, 23 Jun 2011 21:19:55 +0200 (CEST)
Received: from stefan by flocke.weilnetz.de with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QZpRS-0007jw-IH; Thu, 23 Jun 2011 21:19:54 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 23 Jun 2011 21:19:53 +0200
Message-Id: <1308856793-29724-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH] Fix compilation for non-POSIX system (w64)
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
X-List-Received-Date: Thu, 23 Jun 2011 19:20:04 -0000

compatfd.h is only needed with CONFIG_POSIX.
Compilation fails in compatfd.h for at least one non-POSIX systems (w64).

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 cpus.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/cpus.c b/cpus.c
index 0699f37..8501254 100644
--- a/cpus.c
+++ b/cpus.c
@@ -34,7 +34,9 @@
 
 #include "qemu-thread.h"
 #include "cpus.h"
+#ifdef CONFIG_POSIX
 #include "compatfd.h"
+#endif
 
 #ifdef SIGRTMIN
 #define SIG_IPI (SIGRTMIN+4)
-- 
1.7.2.5


