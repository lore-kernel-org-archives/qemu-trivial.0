Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W9zpZ-0002zq-M0
	for mharc-qemu-trivial@gnu.org; Sun, 02 Feb 2014 11:23:37 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9zo9-0002pI-Bq
	for qemu-trivial@nongnu.org; Sun, 02 Feb 2014 11:23:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9zmc-0000NH-Is
	for qemu-trivial@nongnu.org; Sun, 02 Feb 2014 11:22:09 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:51290)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W9zlU-00083S-8t; Sun, 02 Feb 2014 11:19:24 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 23D1340229;
	Sun,  2 Feb 2014 20:12:46 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 078E85FC;
	Sun,  2 Feb 2014 20:12:46 +0400 (MSK)
Received: (nullmailer pid 1642 invoked by uid 1000);
	Sun, 02 Feb 2014 16:12:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sun,  2 Feb 2014 20:12:38 +0400
Message-Id: <1391357563-1592-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1391357563-1592-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1391357563-1592-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PULL 2/7] osdep: drop unused #include "trace.h"
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
X-List-Received-Date: Sun, 02 Feb 2014 16:23:35 -0000

From: Stefan Hajnoczi <stefanha@redhat.com>

osdep.c does not use trace_*() so we can just drop the include.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Benoit Canet <benoit@irqsave.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/osdep.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/util/osdep.c b/util/osdep.c
index 62072b4..bd4f530 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -46,7 +46,6 @@ extern int madvise(caddr_t, size_t, int);
 #endif
 
 #include "qemu-common.h"
-#include "trace.h"
 #include "qemu/sockets.h"
 #include "monitor/monitor.h"
 
-- 
1.7.10.4


