Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJJE-0001hU-7r
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:20:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJJ6-0001aa-IG
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:20:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJJ1-0007O8-ML
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:20:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39258)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJIs-0007JW-9Y; Fri, 15 Aug 2014 11:20:30 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 102D74307D;
	Fri, 15 Aug 2014 19:20:29 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0E4BC6EA;
	Fri, 15 Aug 2014 19:15:15 +0400 (MSK)
Received: (nullmailer pid 17935 invoked by uid 1000);
	Fri, 15 Aug 2014 15:15:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 19:15:07 +0400
Message-Id: <1408115711-17836-17-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 16/20] ssi: xilinx_spi: Initialise CS GPIOs as
	NULL
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
X-List-Received-Date: Fri, 15 Aug 2014 15:20:49 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

To properly indicate they are unconnected.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/ssi/xilinx_spi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index 207f47a..620573c 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -329,7 +329,7 @@ static int xilinx_spi_init(SysBusDevice *sbd)
     s->spi = ssi_create_bus(dev, "spi");
 
     sysbus_init_irq(sbd, &s->irq);
-    s->cs_lines = g_new(qemu_irq, s->num_cs);
+    s->cs_lines = g_new0(qemu_irq, s->num_cs);
     ssi_auto_connect_slaves(dev, s->cs_lines, s->spi);
     for (i = 0; i < s->num_cs; ++i) {
         sysbus_init_irq(sbd, &s->cs_lines[i]);
-- 
1.7.10.4


