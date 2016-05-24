Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b5EDf-0001TV-94
	for mharc-qemu-trivial@gnu.org; Tue, 24 May 2016 11:26:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5EDc-0001Nm-H5
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 11:26:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5EDY-0004yL-Br
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 11:26:03 -0400
Received: from orth.archaic.org.uk ([81.2.115.148]:49463)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5EDY-0004xQ-6V
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 11:26:00 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5EDW-0002z2-HP; Tue, 24 May 2016 16:25:58 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Date: Tue, 24 May 2016 16:25:58 +0100
Message-Id: <1464103558-27051-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 81.2.115.148
Subject: [Qemu-trivial] [PATCH] replay: Clean up includes
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
X-List-Received-Date: Tue, 24 May 2016 15:26:05 -0000

Clean up includes so that osdep.h is included first and headers
which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
1.9.1


