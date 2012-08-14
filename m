Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1Hs9-0005pY-1y
	for mharc-qemu-trivial@gnu.org; Tue, 14 Aug 2012 10:13:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@securiforest.com>) id 1T1Hs2-0005XT-Is
	for qemu-trivial@nongnu.org; Tue, 14 Aug 2012 10:13:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex@securiforest.com>) id 1T1Hs0-0004Et-G2
	for qemu-trivial@nongnu.org; Tue, 14 Aug 2012 10:13:22 -0400
Received: from vps146.softec-internet.com ([188.95.114.51]:40401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@securiforest.com>)
	id 1T1Hrs-0004ED-Sg; Tue, 14 Aug 2012 10:13:13 -0400
Received: from vps146.softec-internet.com (unknown [127.0.0.1])
	by vps146.softec-internet.com (Postfix) with ESMTP id 1D23D61C0012;
	Tue, 14 Aug 2012 16:13:10 +0200 (CEST)
Received: from subzero.securiforest.com (unknown [83.54.203.89])
	by vps146.softec-internet.com (Postfix) with ESMTP;
	Tue, 14 Aug 2012 16:13:10 +0200 (CEST)
From: Alejandro Martinez Ruiz <alex@securiforest.com>
To: qemu-devel@nongnu.org
Date: Tue, 14 Aug 2012 16:13:02 +0200
Message-Id: <1344953582-24303-1-git-send-email-alex@securiforest.com>
X-Mailer: git-send-email 1.7.12.rc2.18.g61b472e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 188.95.114.51
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] ehci: fix assertion typo
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
X-List-Received-Date: Tue, 14 Aug 2012 14:13:28 -0000

Signed-off-by: Alejandro Martinez Ruiz <alex@securiforest.com>
---
 hw/usb/hcd-ehci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index b043e7c..104c21d 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -2010,7 +2010,7 @@ static void ehci_fill_queue(EHCIPacket *p)
         p->qtdaddr = qtdaddr;
         p->qtd = qtd;
         p->usb_status = ehci_execute(p, "queue");
-        assert(p->usb_status = USB_RET_ASYNC);
+        assert(p->usb_status == USB_RET_ASYNC);
         p->async = EHCI_ASYNC_INFLIGHT;
     }
 }
-- 
1.7.12.rc2.18.g61b472e


