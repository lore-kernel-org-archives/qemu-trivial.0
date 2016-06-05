Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9TJb-0003pF-7c
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 04:21:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TJZ-0003nP-Kp
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:21:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TJY-0004YG-JV
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:21:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48663)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9TJK-0004Vk-0u; Sun, 05 Jun 2016 04:21:30 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D935D40910;
	Sun,  5 Jun 2016 11:21:25 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 3C1C6B01;
	Sun,  5 Jun 2016 10:43:38 +0300 (MSK)
Received: (nullmailer pid 1136 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:00 +0300
Message-Id: <54b9f92415a2b569faaa8d7d4d00457e868f2699.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 23/52] hw: Clean up includes
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
X-List-Received-Date: Sun, 05 Jun 2016 08:21:46 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Clean up includes so that osdep.h is included first and headers
which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


