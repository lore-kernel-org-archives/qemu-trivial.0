Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T3JrT-0004uZ-Pj
	for mharc-qemu-trivial@gnu.org; Mon, 20 Aug 2012 00:45:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T3JrQ-0004lI-Mo
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2012 00:45:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T3JrP-0002mQ-Tl
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2012 00:45:08 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:35588)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1T3JrL-0002cd-Hc; Mon, 20 Aug 2012 00:45:03 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	6B4A97280028; Mon, 20 Aug 2012 06:45:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id HKsfEKtqvwc5; Mon, 20 Aug 2012 06:45:01 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id CE258728002A; Mon, 20 Aug 2012 06:45:01 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Mon, 20 Aug 2012 06:45:00 +0200
Message-Id: <1345437900-8001-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: imammedo@redhat.com, qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] qemu-common: Declare qemu_irq earlier
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
X-List-Received-Date: Mon, 20 Aug 2012 04:45:09 -0000

This allows using qemu_irq in the target specific cpu.h.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 qemu-common.h |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/qemu-common.h b/qemu-common.h
index 74a99d3..88a515e 100644
--- a/qemu-common.h
+++ b/qemu-common.h
@@ -19,6 +19,8 @@ struct Monitor;
 typedef struct Monitor Monitor;
 typedef struct MigrationParams MigrationParams;
 
+typedef struct IRQState *qemu_irq;
+
 /* we put basic includes here to avoid repeating them in device drivers */
 #include <stdlib.h>
 #include <stdio.h>
@@ -276,7 +278,6 @@ typedef struct PCIEPort PCIEPort;
 typedef struct PCIESlot PCIESlot;
 typedef struct MSIMessage MSIMessage;
 typedef struct SerialState SerialState;
-typedef struct IRQState *qemu_irq;
 typedef struct PCMCIACardState PCMCIACardState;
 typedef struct MouseTransformInfo MouseTransformInfo;
 typedef struct uWireSlave uWireSlave;
-- 
1.7.0.4


