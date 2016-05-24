Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b5EFg-0003Sl-8T
	for mharc-qemu-trivial@gnu.org; Tue, 24 May 2016 11:28:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5EFd-0003Py-NS
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 11:28:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5EFa-0005Pk-Iu
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 11:28:09 -0400
Received: from orth.archaic.org.uk ([81.2.115.148]:49471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5EFa-0005PL-BK
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 11:28:06 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5EFZ-0002zV-1F; Tue, 24 May 2016 16:28:05 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Tue, 24 May 2016 16:28:04 +0100
Message-Id: <1464103684-27230-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 81.2.115.148
Subject: [Qemu-trivial] [PATCH] hw: Clean up includes
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
X-List-Received-Date: Tue, 24 May 2016 15:28:10 -0000

Clean up includes so that osdep.h is included first and headers
which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/aspeed_vic.c   | 1 -
 hw/timer/mc146818rtc.c | 1 -
 include/exec/hwaddr.h  | 1 -
 include/qemu/fifo32.h  | 1 -
 4 files changed, 4 deletions(-)

diff --git a/hw/intc/aspeed_vic.c b/hw/intc/aspeed_vic.c
index 725d5b6..2370e74 100644
--- a/hw/intc/aspeed_vic.c
+++ b/hw/intc/aspeed_vic.c
@@ -28,7 +28,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <inttypes.h>
 #include "hw/intc/aspeed_vic.h"
 #include "qemu/bitops.h"
 #include "qemu/log.h"
diff --git a/hw/timer/mc146818rtc.c b/hw/timer/mc146818rtc.c
index 2ac0fd3..a11b8b4 100644
--- a/hw/timer/mc146818rtc.c
+++ b/hw/timer/mc146818rtc.c
@@ -22,7 +22,6 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
-#include "config-target.h"
 #include "qemu/cutils.h"
 #include "qemu/bcd.h"
 #include "hw/hw.h"
diff --git a/include/exec/hwaddr.h b/include/exec/hwaddr.h
index bb41588..a71c93c 100644
--- a/include/exec/hwaddr.h
+++ b/include/exec/hwaddr.h
@@ -3,7 +3,6 @@
 #ifndef HWADDR_H
 #define HWADDR_H
 
-#include <inttypes.h>
 
 #define HWADDR_BITS 64
 /* hwaddr is the type of a physical address (its size can
diff --git a/include/qemu/fifo32.h b/include/qemu/fifo32.h
index 2e5a0cc..4e9fd1b 100644
--- a/include/qemu/fifo32.h
+++ b/include/qemu/fifo32.h
@@ -15,7 +15,6 @@
 #ifndef FIFO32_H
 #define FIFO32_H
 
-#include "qemu/osdep.h"
 #include "qemu/fifo8.h"
 
 typedef struct {
-- 
1.9.1


