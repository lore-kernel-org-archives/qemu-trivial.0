Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHYIj-000297-Jf
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 12:22:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHYIc-000237-Q3
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 12:22:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHYIb-0004XJ-V7
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 12:22:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47639)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHYIW-0004O6-Dd; Sun, 04 Jun 2017 12:22:36 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1D9CC404D1;
	Sun,  4 Jun 2017 19:22:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 2E62C5F6;
	Sun,  4 Jun 2017 18:45:30 +0300 (MSK)
Received: (nullmailer pid 16387 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Mao Zhongyi <maozy.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:20 +0300
Message-Id: <3975bb56a7d39ba26211fc5fe4211cef766fd838.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 16/22] scsi/lsi53c895a: Remove unused
 lsi_mem_*() return value
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
X-List-Received-Date: Sun, 04 Jun 2017 16:22:43 -0000

From: Mao Zhongyi <maozy.fnst@cn.fujitsu.com>

lsi_mem_read/write() always return 0 about which their
callers actually don't care. Change the function type
to void.

Signed-off-by: Mao Zhongyi <maozy.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/scsi/lsi53c895a.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 595c26017a..3e56ab267c 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -408,27 +408,25 @@ static void lsi_reg_writeb(LSIState *s, int offset, uint8_t val);
 static void lsi_execute_script(LSIState *s);
 static void lsi_reselect(LSIState *s, lsi_request *p);
 
-static inline int lsi_mem_read(LSIState *s, dma_addr_t addr,
+static inline void lsi_mem_read(LSIState *s, dma_addr_t addr,
                                void *buf, dma_addr_t len)
 {
     if (s->dmode & LSI_DMODE_SIOM) {
         address_space_read(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED,
                            buf, len);
-        return 0;
     } else {
-        return pci_dma_read(PCI_DEVICE(s), addr, buf, len);
+        pci_dma_read(PCI_DEVICE(s), addr, buf, len);
     }
 }
 
-static inline int lsi_mem_write(LSIState *s, dma_addr_t addr,
+static inline void lsi_mem_write(LSIState *s, dma_addr_t addr,
                                 const void *buf, dma_addr_t len)
 {
     if (s->dmode & LSI_DMODE_DIOM) {
         address_space_write(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED,
                             buf, len);
-        return 0;
     } else {
-        return pci_dma_write(PCI_DEVICE(s), addr, buf, len);
+        pci_dma_write(PCI_DEVICE(s), addr, buf, len);
     }
 }
 
-- 
2.11.0


