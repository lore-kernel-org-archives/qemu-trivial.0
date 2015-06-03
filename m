Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z08h2-0008Ms-8C
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:26:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08gw-0008Bn-Md
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:26:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08gv-0005zy-PW
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:26:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60097)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z08gk-0005rW-Uk; Wed, 03 Jun 2015 09:26:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EDAD8407AC;
	Wed,  3 Jun 2015 16:26:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 048A0A5D;
	Wed,  3 Jun 2015 16:08:54 +0300 (MSK)
Received: (nullmailer pid 27472 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:49 +0300
Message-Id: <2801339f2fb2534ccf01561d274398328bdd446d.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, qemu-trivial@nongnu.org,
	Sai Pavan Boddu <saipava@xilinx.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 29/30] cadence_gem: Fix Rx buffer size field
	mask
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
X-List-Received-Date: Wed, 03 Jun 2015 13:26:51 -0000

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

This patch corrects the Rx buffer size field mask to mask bits 23 to 16
to match Xilinx UG585 documentation.

Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/cadence_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index dafe914..494a346 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -155,7 +155,7 @@
 #define GEM_NWCFG_BCAST_REJ    0x00000020 /* Reject broadcast packets */
 #define GEM_NWCFG_PROMISC      0x00000010 /* Accept all packets */
 
-#define GEM_DMACFG_RBUFSZ_M    0x007F0000 /* DMA RX Buffer Size mask */
+#define GEM_DMACFG_RBUFSZ_M    0x00FF0000 /* DMA RX Buffer Size mask */
 #define GEM_DMACFG_RBUFSZ_S    16         /* DMA RX Buffer Size shift */
 #define GEM_DMACFG_RBUFSZ_MUL  64         /* DMA RX Buffer Size multiplier */
 #define GEM_DMACFG_TXCSUM_OFFL 0x00000800 /* Transmit checksum offload */
-- 
2.1.4


