Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YqqJh-0006hO-Qx
	for mharc-qemu-trivial@gnu.org; Fri, 08 May 2015 18:00:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YqqJb-0006VT-Mk
	for qemu-trivial@nongnu.org; Fri, 08 May 2015 18:00:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YqqJa-0005lw-Uy
	for qemu-trivial@nongnu.org; Fri, 08 May 2015 18:00:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52927)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YqqJU-0005XY-By; Fri, 08 May 2015 18:00:08 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 44FA640781;
	Sat,  9 May 2015 01:00:07 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 240F794D;
	Sat,  9 May 2015 01:00:07 +0300 (MSK)
Received: (nullmailer pid 10313 invoked by uid 1000);
	Fri, 08 May 2015 22:00:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  9 May 2015 01:00:01 +0300
Message-Id: <e5a88b0cf3c902d6e9b342a90f0a4a4d5d954f7a.1431122325.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1431122325.git.mjt@msgid.tls.msk.ru>
References: <cover.1431122325.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PULL 1/5] xhci: remove unused code
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
X-List-Received-Date: Fri, 08 May 2015 22:00:16 -0000

From: Gonglei <arei.gonglei@huawei.com>

Value from xfer->packet.ep is assigned to ep here, but that
stored value is not used before it is overwritten. Remove it.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/usb/hcd-xhci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index ba15ae0..99f11fc 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -2204,7 +2204,6 @@ static void xhci_kick_ep(XHCIState *xhci, unsigned int slotid,
         if (epid == 1) {
             if (xhci_fire_ctl_transfer(xhci, xfer) >= 0) {
                 epctx->next_xfer = (epctx->next_xfer + 1) % TD_QUEUE;
-                ep = xfer->packet.ep;
             } else {
                 DPRINTF("xhci: error firing CTL transfer\n");
             }
-- 
2.1.4


