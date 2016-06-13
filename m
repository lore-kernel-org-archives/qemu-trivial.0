Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bCOR4-0000L5-6W
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jun 2016 05:45:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bCOR1-0000H3-9q
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 05:45:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bCOQz-0002zc-GU
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 05:45:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35100)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bCOQh-0002pB-0n; Mon, 13 Jun 2016 05:45:11 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A9E7B41137;
	Mon, 13 Jun 2016 12:44:59 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 18E62AAB;
	Mon, 13 Jun 2016 12:44:59 +0300 (MSK)
Received: (nullmailer pid 29400 invoked by uid 1000);
	Mon, 13 Jun 2016 09:44:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-trivial@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jun 2016 12:44:58 +0300
Message-Id: <1465811098-29354-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465811098-29354-1-git-send-email-mjt@tls.msk.ru>
References: <1465811098-29354-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PATCH trivial 2/2] hw/dma/omap: spelling fix:
 endianness
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
X-List-Received-Date: Mon, 13 Jun 2016 09:45:32 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/dma/omap_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index 700cd6b..f6f86f9 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -1975,7 +1975,7 @@ static void omap_dma4_write(void *opaque, hwaddr addr,
         ch->endian[1] =(value >> 19) & 1;
         ch->endian_lock[1] =(value >> 18) & 1;
         if (ch->endian[0] != ch->endian[1])
-            fprintf(stderr, "%s: DMA endiannes conversion enable attempt\n",
+            fprintf(stderr, "%s: DMA endianness conversion enable attempt\n",
                             __FUNCTION__);
         ch->write_mode = (value >> 16) & 3;
         ch->burst[1] = (value & 0xc000) >> 14;
-- 
2.1.4


