Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SzvKK-0000xr-RT
	for mharc-qemu-trivial@gnu.org; Fri, 10 Aug 2012 15:56:56 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SzvKH-0000lx-HQ
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 15:56:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SzvKG-0006qC-HT
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 15:56:53 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:50908)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SzvKC-0006mB-0R; Fri, 10 Aug 2012 15:56:48 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	67C4B7280031; Fri, 10 Aug 2012 21:56:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 3y6cJqlyjRgU; Fri, 10 Aug 2012 21:56:46 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id E3CA472800CC; Fri, 10 Aug 2012 21:56:46 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 10 Aug 2012 21:56:46 +0200
Message-Id: <1344628606-26620-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] Spelling fix in comment (peripherans ->
	peripherals)
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
X-List-Received-Date: Fri, 10 Aug 2012 19:56:55 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/versatilepb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/versatilepb.c b/hw/versatilepb.c
index 4fd5d9b..7a92034 100644
--- a/hw/versatilepb.c
+++ b/hw/versatilepb.c
@@ -162,7 +162,7 @@ static int vpb_sic_init(SysBusDevice *dev)
 /* Board init.  */
 
 /* The AB and PB boards both use the same core, just with different
-   peripherans and expansion busses.  For now we emulate a subset of the
+   peripherals and expansion busses.  For now we emulate a subset of the
    PB peripherals and just change the board ID.  */
 
 static struct arm_boot_info versatile_binfo;
-- 
1.7.10


