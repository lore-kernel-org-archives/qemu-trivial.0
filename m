Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bjqFf-0000dO-JA
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2016 12:08:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqFa-0000XK-B8
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:08:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqFW-0004Oj-8c
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:07:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44162)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bjqFM-0003z9-PQ; Tue, 13 Sep 2016 12:07:44 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6098A416DD;
	Tue, 13 Sep 2016 19:07:41 +0300 (MSK)
Received: from gandalf (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id D2E41AFF;
	Tue, 13 Sep 2016 19:07:39 +0300 (MSK)
Received: (nullmailer pid 31890 invoked by uid 1000);
	Tue, 13 Sep 2016 16:07:39 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Tue, 13 Sep 2016 19:04:42 +0300
Message-Id: <0aadb5a15f00c9170ca81915987d7d3a5858e815.1473782118.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 03/16] hw/dma/omap: spelling fix: endianness
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
X-List-Received-Date: Tue, 13 Sep 2016 16:08:02 -0000

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


