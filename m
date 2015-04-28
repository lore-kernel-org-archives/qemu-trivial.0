Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yn1Y5-0003Uz-QF
	for mharc-qemu-trivial@gnu.org; Tue, 28 Apr 2015 05:11:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Yn1Y2-0003Oy-M1
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 05:11:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Yn1Y1-0000Go-LA
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 05:11:22 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:37630)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Yn1Y1-0000Fa-5y; Tue, 28 Apr 2015 05:11:21 -0400
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMW64237; Tue, 28 Apr 2015 17:11:11 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 28 Apr 2015 17:11:01 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 28 Apr 2015 17:11:03 +0800
Message-ID: <1430212264-9672-3-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1430212264-9672-1-git-send-email-arei.gonglei@huawei.com>
References: <1430212264-9672-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>, Gerd
	Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH 2/3] xhci: remove unused code
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
X-List-Received-Date: Tue, 28 Apr 2015 09:11:23 -0000

From: Gonglei <arei.gonglei@huawei.com>

Value from xfer->packet.ep is assigned to ep here, but that
stored value is not used before it is overwritten. Remove it.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
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
1.7.12.4



