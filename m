Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SKNRu-00024W-3y
	for mharc-qemu-trivial@gnu.org; Wed, 18 Apr 2012 01:29:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SKNRo-0001mv-Er
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2012 01:29:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SKNRj-0004Rj-P7
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2012 01:28:56 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:46595)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SKNRZ-0004Qf-PZ; Wed, 18 Apr 2012 01:28:41 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	12C1372800B3; Wed, 18 Apr 2012 07:28:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 3+v2FuA41G8V; Wed, 18 Apr 2012 07:28:35 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 189DE72800B5; Wed, 18 Apr 2012 07:28:35 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Wed, 18 Apr 2012 07:28:34 +0200
Message-Id: <1334726914-27870-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] e1000: Fix spelling (segmentaion ->
	segmentation) in debug output
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
X-List-Received-Date: Wed, 18 Apr 2012 05:29:00 -0000

This was reported by https://bugs.launchpad.net/qemu/+bug/984476.

I also changed the case for 'error'.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/e1000.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/e1000.c b/hw/e1000.c
index 7babc0b..9c76462 100644
--- a/hw/e1000.c
+++ b/hw/e1000.c
@@ -481,7 +481,7 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
         } while (split_size -= bytes);
     } else if (!tp->tse && tp->cptse) {
         // context descriptor TSE is not set, while data descriptor TSE is set
-        DBGOUT(TXERR, "TCP segmentaion Error\n");
+        DBGOUT(TXERR, "TCP segmentation error\n");
     } else {
         split_size = MIN(sizeof(tp->data) - tp->size, split_size);
         pci_dma_read(&s->dev, addr, tp->data + tp->size, split_size);
-- 
1.7.9


