Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TwKjh-0006X8-MP
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jan 2013 17:48:33 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TwKjd-0006LS-Sp
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 17:48:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TwKjb-00038L-At
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 17:48:29 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:35031)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TwKjV-00037H-2Z; Fri, 18 Jan 2013 17:48:21 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	E95A07280056; Fri, 18 Jan 2013 23:48:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id B2yDxNb6nHr0; Fri, 18 Jan 2013 23:48:13 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 70E687280057; Fri, 18 Jan 2013 23:48:13 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 18 Jan 2013 23:48:10 +0100
Message-Id: <1358549290-23228-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, Luiz Capitulino <lcapitulino@redhat.com>,
	qemu-devel@nongnu.org, Wenchao Xia <xiawenc@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] usb: Fix compilation for MinGW (regression)
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
X-List-Received-Date: Fri, 18 Jan 2013 22:48:32 -0000

84f2d0ea added an argument to function usb_host_info.
The stub function must match the declaration in usb.h.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/usb/host-stub.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/host-stub.c b/hw/usb/host-stub.c
index 58423a0..8affba7 100644
--- a/hw/usb/host-stub.c
+++ b/hw/usb/host-stub.c
@@ -35,7 +35,7 @@
 #include "hw/usb.h"
 #include "monitor/monitor.h"
 
-void usb_host_info(Monitor *mon)
+void usb_host_info(Monitor *mon, const QDict *qdict)
 {
     monitor_printf(mon, "USB host devices not supported\n");
 }
-- 
1.7.10.4


