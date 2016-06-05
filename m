Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9Sio-00030R-MO
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 03:43:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9Sin-0002ym-1P
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:43:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9Sim-0004QB-5A
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:43:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60346)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9Sij-0004Os-Sn; Sun, 05 Jun 2016 03:43:42 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 758DD40913;
	Sun,  5 Jun 2016 10:43:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id DCFD6AD6;
	Sun,  5 Jun 2016 10:43:32 +0300 (MSK)
Received: (nullmailer pid 1111 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:42:48 +0300
Message-Id: <640789e419ebc8b9850c16804d76f0351bc198be.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 11/52] remove useless muldiv64()
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
X-List-Received-Date: Sun, 05 Jun 2016 07:43:46 -0000

From: Laurent Vivier <lvivier@redhat.com>

muldiv64(a, 1, b) is like "a / b".

This patch is the result of coccinelle script
scripts/coccinelle/remove_muldiv64.cocci.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/usb/hcd-ohci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 25cc53f..fa57038 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1474,7 +1474,7 @@ static uint32_t ohci_get_frame_remaining(OHCIState *ohci)
     if (tks >= usb_frame_time)
         return (ohci->frt << 31);
 
-    tks = muldiv64(tks, 1, usb_bit_time);
+    tks = tks / usb_bit_time;
     fr = (uint16_t)(ohci->fi - tks);
 
     return (ohci->frt << 31) | fr;
-- 
2.1.4


