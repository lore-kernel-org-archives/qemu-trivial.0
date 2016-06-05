Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9W7w-0001jJ-13
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 07:21:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9W7m-0001U7-RJ
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 07:21:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9W7k-0003mb-SX
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 07:21:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36801)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9W7b-0003jk-2v; Sun, 05 Jun 2016 07:21:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A434840920;
	Sun,  5 Jun 2016 14:21:29 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 4B1D5B28;
	Sun,  5 Jun 2016 10:43:39 +0300 (MSK)
Received: (nullmailer pid 1186 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:24 +0300
Message-Id: <0ff8cd2acb8dfbf5673ab6863ac0205ed5463a6d.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 47/52] usb: Use DIV_ROUND_UP
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
X-List-Received-Date: Sun, 05 Jun 2016 11:21:51 -0000

From: Laurent Vivier <lvivier@redhat.com>

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/usb/redirect.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 8d80540..8ec8484 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -542,9 +542,9 @@ static void usbredir_handle_iso_data(USBRedirDevice *dev, USBPacket *p,
             start_iso.pkts_per_urb = 32;
         }
 
-        start_iso.no_urbs = (dev->endpoint[EP2I(ep)].bufpq_target_size +
-                             start_iso.pkts_per_urb - 1) /
-                            start_iso.pkts_per_urb;
+        start_iso.no_urbs = DIV_ROUND_UP(
+                                     dev->endpoint[EP2I(ep)].bufpq_target_size,
+                                     start_iso.pkts_per_urb);
         /* Output endpoints pre-fill only 1/2 of the packets, keeping the rest
            as overflow buffer. Also see the usbredir protocol documentation */
         if (!(ep & USB_DIR_IN)) {
-- 
2.1.4


