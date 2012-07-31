Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sw5Qx-0005p4-Ts
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 01:55:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Sw5Qv-0005hB-8n
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 01:55:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Sw5Qu-0008Sk-G0
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 01:55:53 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:60921)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Sw5Qs-0008Jl-9W; Tue, 31 Jul 2012 01:55:50 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	66EF6728001F; Tue, 31 Jul 2012 07:55:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id hBVWMhHsyj+4; Tue, 31 Jul 2012 07:54:57 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id E3E637280020; Tue, 31 Jul 2012 07:54:57 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Tue, 31 Jul 2012 07:54:57 +0200
Message-Id: <1343714097-545-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] megasas: Update function megasys_scsi_uninit
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
X-List-Received-Date: Tue, 31 Jul 2012 05:55:54 -0000

Commit f90c2bcdbc69e41e575f868b984c3e2de8f51bac changed
PCIUnregisterFunc, therefore the function prototype
needs an update.

megasas.o is currently not linked, so this bug was not
detected by the buildbots.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/megasas.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/megasas.c b/hw/megasas.c
index 833f313..5235c50 100644
--- a/hw/megasas.c
+++ b/hw/megasas.c
@@ -2041,7 +2041,7 @@ static const VMStateDescription vmstate_megasas = {
     }
 };
 
-static int megasas_scsi_uninit(PCIDevice *d)
+static void megasas_scsi_uninit(PCIDevice *d)
 {
     MegasasState *s = DO_UPCAST(MegasasState, dev, d);
 
@@ -2051,7 +2051,6 @@ static int megasas_scsi_uninit(PCIDevice *d)
     memory_region_destroy(&s->mmio_io);
     memory_region_destroy(&s->port_io);
     memory_region_destroy(&s->queue_io);
-    return 0;
 }
 
 static const struct SCSIBusInfo megasas_scsi_info = {
-- 
1.7.10


