Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9V1x-0007WJ-C5
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 06:11:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9V1v-0007Tj-3c
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 06:11:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9V1t-0003Eq-6i
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 06:11:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58329)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9V1n-0003Di-PR; Sun, 05 Jun 2016 06:11:31 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3C4294091B;
	Sun,  5 Jun 2016 13:11:28 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 6A40BAF1;
	Sun,  5 Jun 2016 10:43:35 +0300 (MSK)
Received: (nullmailer pid 1134 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:42:59 +0300
Message-Id: <3423bacc0f63772dfc9c6a73e17ef703d887705f.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 22/52] replay: Clean up includes
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Jun 2016 10:11:40 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Clean up includes so that osdep.h is included first and headers
which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 replay/replay-char.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/replay/replay-char.c b/replay/replay-char.c
index 23b6922..edf46ab 100755
--- a/replay/replay-char.c
+++ b/replay/replay-char.c
@@ -9,10 +9,6 @@
  *
  */
 
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "sysemu/replay.h"
-- 
2.1.4


