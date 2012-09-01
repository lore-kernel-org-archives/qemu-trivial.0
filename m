Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7jkl-0003ui-6U
	for mharc-qemu-trivial@gnu.org; Sat, 01 Sep 2012 05:12:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T7jkj-0003qQ-By
	for qemu-trivial@nongnu.org; Sat, 01 Sep 2012 05:12:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T7jki-0000Yd-DC
	for qemu-trivial@nongnu.org; Sat, 01 Sep 2012 05:12:29 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:41535)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1T7jkf-0000Xf-PT; Sat, 01 Sep 2012 05:12:25 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	766587280021; Sat,  1 Sep 2012 11:12:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id P-1cSnZ36DEw; Sat,  1 Sep 2012 11:12:23 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id BE11D728002B; Sat,  1 Sep 2012 11:12:23 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
Date: Sat,  1 Sep 2012 11:12:23 +0200
Message-Id: <1346490743-9652-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] cadence_uart: Fix buffer overflow
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
X-List-Received-Date: Sat, 01 Sep 2012 09:12:30 -0000

Report from smatch:
hw/cadence_uart.c:413 uart_read(13) error: buffer overflow 's->r' 18 <= 18

This fixes read access to s->r[R_MAX] which is behind the limits of s->r.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/cadence_uart.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/cadence_uart.c b/hw/cadence_uart.c
index d98e531..f8afc4e 100644
--- a/hw/cadence_uart.c
+++ b/hw/cadence_uart.c
@@ -404,7 +404,7 @@ static uint64_t uart_read(void *opaque, target_phys_addr_t offset,
     uint32_t c = 0;
 
     offset >>= 2;
-    if (offset > R_MAX) {
+    if (offset >= R_MAX) {
         return 0;
     } else if (offset == R_TX_RX) {
         uart_read_rx_fifo(s, &c);
-- 
1.7.10


