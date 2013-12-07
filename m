Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpMfY-00084U-1d
	for mharc-qemu-trivial@gnu.org; Sat, 07 Dec 2013 13:32:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VpMfV-0007zm-Ce
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 13:31:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VpMfQ-0004te-Qa
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 13:31:57 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40539)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VpMfB-0004oc-Fb; Sat, 07 Dec 2013 13:31:37 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D282C40E99;
	Sat,  7 Dec 2013 22:31:36 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BC90552D;
	Sat,  7 Dec 2013 22:31:36 +0400 (MSK)
Received: (nullmailer pid 10012 invoked by uid 1000);
	Sat, 07 Dec 2013 18:31:36 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sat,  7 Dec 2013 22:31:34 +0400
Message-Id: <1386441094-9971-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386441094-9971-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1386441094-9971-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL] qxl: Add missing trace.h (fix broken build)
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
X-List-Received-Date: Sat, 07 Dec 2013 18:31:58 -0000

From: Stefan Weil <sw@weilnetz.de>

Commit ac86048bcd41129b18702ba63395f222871804de removed trace.h from
console.h and ignored the fact that qxl-render.c needs this file
(it includes qxl.h which includes console.h which included trace.h).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/qxl-render.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
index d34b0c4..84f1367 100644
--- a/hw/display/qxl-render.c
+++ b/hw/display/qxl-render.c
@@ -20,6 +20,7 @@
  */
 
 #include "qxl.h"
+#include "trace.h"
 
 static void qxl_blit(PCIQXLDevice *qxl, QXLRect *rect)
 {
-- 
1.7.10.4


