Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9V1y-0007XJ-I1
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 06:11:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9V1w-0007Ua-BG
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 06:11:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9V1u-0003F6-Dl
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 06:11:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52681)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9V1n-0003Dh-PL; Sun, 05 Jun 2016 06:11:31 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 444664091C;
	Sun,  5 Jun 2016 13:11:28 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 632F1B3A;
	Sun,  5 Jun 2016 10:43:40 +0300 (MSK)
Received: (nullmailer pid 1182 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:22 +0300
Message-Id: <7b997903c784649c128fdc97dda26b0072201b4e.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 45/52] SPICE: Use DIV_ROUND_UP
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
X-List-Received-Date: Sun, 05 Jun 2016 10:11:41 -0000

From: Laurent Vivier <lvivier@redhat.com>

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 ui/spice-display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/spice-display.c b/ui/spice-display.c
index 0553c5e..34095fb 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -197,7 +197,7 @@ static void qemu_spice_create_one_update(SimpleSpiceDisplay *ssd,
 static void qemu_spice_create_update(SimpleSpiceDisplay *ssd)
 {
     static const int blksize = 32;
-    int blocks = (surface_width(ssd->ds) + blksize - 1) / blksize;
+    int blocks = DIV_ROUND_UP(surface_width(ssd->ds), blksize);
     int dirty_top[blocks];
     int y, yoff1, yoff2, x, xoff, blk, bw;
     int bpp = surface_bytes_per_pixel(ssd->ds);
-- 
2.1.4


