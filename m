Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL7ms-0005WT-V7
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 05:11:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL7ml-0005L0-Qv
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 05:11:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL7mi-0003tt-5q
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 05:11:15 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:52399)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL7ma-0003pt-MB; Tue, 10 Feb 2015 05:11:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6663E418BE;
	Tue, 10 Feb 2015 13:11:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8D06B931;
	Tue, 10 Feb 2015 09:34:44 +0300 (MSK)
Received: (nullmailer pid 9342 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:33:54 +0300
Message-Id: <32c952498b6ab740894fe83513bf43e872bf56a2.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Don Koch <dkoch@verizon.com>
Subject: [Qemu-trivial] [PULL 05/46] Add/convert trace calls in pcnet-pci.c.
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
X-List-Received-Date: Tue, 10 Feb 2015 10:11:20 -0000

From: Don Koch <dkoch@verizon.com>

Add trace calls. Convert some #ifdef DEBUG printfs to trace.

Signed-off-by: Don Koch <dkoch@verizon.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/pcnet-pci.c | 49 +++++++++++++++++++------------------------------
 trace-events       | 12 ++++++++++++
 2 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c
index b86bc0d..5df79f0 100644
--- a/hw/net/pcnet-pci.c
+++ b/hw/net/pcnet-pci.c
@@ -33,6 +33,7 @@
 #include "qemu/timer.h"
 #include "sysemu/dma.h"
 #include "sysemu/sysemu.h"
+#include "trace.h"
 
 #include "pcnet.h"
 
@@ -61,9 +62,8 @@ typedef struct {
 static void pcnet_aprom_writeb(void *opaque, uint32_t addr, uint32_t val)
 {
     PCNetState *s = opaque;
-#ifdef PCNET_DEBUG
-    printf("pcnet_aprom_writeb addr=0x%08x val=0x%02x\n", addr, val);
-#endif
+
+    trace_pcnet_aprom_writeb(opaque, addr, val);
     if (BCR_APROMWE(s)) {
         s->prom[addr & 15] = val;
     }
@@ -73,9 +73,8 @@ static uint32_t pcnet_aprom_readb(void *opaque, uint32_t addr)
 {
     PCNetState *s = opaque;
     uint32_t val = s->prom[addr & 15];
-#ifdef PCNET_DEBUG
-    printf("pcnet_aprom_readb addr=0x%08x val=0x%02x\n", addr, val);
-#endif
+
+    trace_pcnet_aprom_readb(opaque, addr, val);
     return val;
 }
 
@@ -84,6 +83,7 @@ static uint64_t pcnet_ioport_read(void *opaque, hwaddr addr,
 {
     PCNetState *d = opaque;
 
+    trace_pcnet_ioport_read(opaque, addr, size);
     if (addr < 0x10) {
         if (!BCR_DWIO(d) && size == 1) {
             return pcnet_aprom_readb(d, addr);
@@ -111,6 +111,7 @@ static void pcnet_ioport_write(void *opaque, hwaddr addr,
 {
     PCNetState *d = opaque;
 
+    trace_pcnet_ioport_write(opaque, addr, data, size);
     if (addr < 0x10) {
         if (!BCR_DWIO(d) && size == 1) {
             pcnet_aprom_writeb(d, addr, data);
@@ -141,10 +142,8 @@ static const MemoryRegionOps pcnet_io_ops = {
 static void pcnet_mmio_writeb(void *opaque, hwaddr addr, uint32_t val)
 {
     PCNetState *d = opaque;
-#ifdef PCNET_DEBUG_IO
-    printf("pcnet_mmio_writeb addr=0x" TARGET_FMT_plx" val=0x%02x\n", addr,
-           val);
-#endif
+
+    trace_pcnet_mmio_writeb(opaque, addr, val);
     if (!(addr & 0x10))
         pcnet_aprom_writeb(d, addr & 0x0f, val);
 }
@@ -153,22 +152,18 @@ static uint32_t pcnet_mmio_readb(void *opaque, hwaddr addr)
 {
     PCNetState *d = opaque;
     uint32_t val = -1;
+
     if (!(addr & 0x10))
         val = pcnet_aprom_readb(d, addr & 0x0f);
-#ifdef PCNET_DEBUG_IO
-    printf("pcnet_mmio_readb addr=0x" TARGET_FMT_plx " val=0x%02x\n", addr,
-           val & 0xff);
-#endif
+    trace_pcnet_mmio_readb(opaque, addr, val);
     return val;
 }
 
 static void pcnet_mmio_writew(void *opaque, hwaddr addr, uint32_t val)
 {
     PCNetState *d = opaque;
-#ifdef PCNET_DEBUG_IO
-    printf("pcnet_mmio_writew addr=0x" TARGET_FMT_plx " val=0x%04x\n", addr,
-           val);
-#endif
+
+    trace_pcnet_mmio_writew(opaque, addr, val);
     if (addr & 0x10)
         pcnet_ioport_writew(d, addr & 0x0f, val);
     else {
@@ -182,6 +177,7 @@ static uint32_t pcnet_mmio_readw(void *opaque, hwaddr addr)
 {
     PCNetState *d = opaque;
     uint32_t val = -1;
+
     if (addr & 0x10)
         val = pcnet_ioport_readw(d, addr & 0x0f);
     else {
@@ -190,20 +186,15 @@ static uint32_t pcnet_mmio_readw(void *opaque, hwaddr addr)
         val <<= 8;
         val |= pcnet_aprom_readb(d, addr);
     }
-#ifdef PCNET_DEBUG_IO
-    printf("pcnet_mmio_readw addr=0x" TARGET_FMT_plx" val = 0x%04x\n", addr,
-           val & 0xffff);
-#endif
+    trace_pcnet_mmio_readw(opaque, addr, val);
     return val;
 }
 
 static void pcnet_mmio_writel(void *opaque, hwaddr addr, uint32_t val)
 {
     PCNetState *d = opaque;
-#ifdef PCNET_DEBUG_IO
-    printf("pcnet_mmio_writel addr=0x" TARGET_FMT_plx" val=0x%08x\n", addr,
-           val);
-#endif
+
+    trace_pcnet_mmio_writel(opaque, addr, val);
     if (addr & 0x10)
         pcnet_ioport_writel(d, addr & 0x0f, val);
     else {
@@ -219,6 +210,7 @@ static uint32_t pcnet_mmio_readl(void *opaque, hwaddr addr)
 {
     PCNetState *d = opaque;
     uint32_t val;
+
     if (addr & 0x10)
         val = pcnet_ioport_readl(d, addr & 0x0f);
     else {
@@ -231,10 +223,7 @@ static uint32_t pcnet_mmio_readl(void *opaque, hwaddr addr)
         val <<= 8;
         val |= pcnet_aprom_readb(d, addr);
     }
-#ifdef PCNET_DEBUG_IO
-    printf("pcnet_mmio_readl addr=0x" TARGET_FMT_plx " val=0x%08x\n", addr,
-           val);
-#endif
+    trace_pcnet_mmio_readl(opaque, addr, val);
     return val;
 }
 
diff --git a/trace-events b/trace-events
index 61c8a9a..ae537f7 100644
--- a/trace-events
+++ b/trace-events
@@ -1282,6 +1282,18 @@ spapr_pci_msi_retry(unsigned config_addr, unsigned req_num, unsigned max_irqs) "
 pci_update_mappings_del(void *d, uint32_t bus, uint32_t func, uint32_t slot, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,%#"PRIx64"+%#"PRIx64
 pci_update_mappings_add(void *d, uint32_t bus, uint32_t func, uint32_t slot, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,%#"PRIx64"+%#"PRIx64
 
+# hw/net/pcnet-pci.c
+pcnet_aprom_writeb(void *opaque, uint32_t addr, uint32_t val) "opaque=%p addr=0x%08x val=0x%02x"
+pcnet_aprom_readb(void *opaque, uint32_t addr, uint32_t val) "opaque=%p addr=0x%08x val=0x%02x"
+pcnet_ioport_read(void *opaque, uint64_t addr, unsigned size) "opaque=%p addr=%#"PRIx64" size=%d"
+pcnet_ioport_write(void *opaque, uint64_t addr, uint64_t data, unsigned size) "opaque=%p addr=%#"PRIx64" data=%#"PRIx64" size=%d"
+pcnet_mmio_writeb(void *opaque, uint64_t addr, uint32_t val) "opaque=%p addr=%#"PRIx64" val=0x%x"
+pcnet_mmio_writew(void *opaque, uint64_t addr, uint32_t val) "opaque=%p addr=%#"PRIx64" val=0x%x"
+pcnet_mmio_writel(void *opaque, uint64_t addr, uint32_t val) "opaque=%p addr=%#"PRIx64" val=0x%x"
+pcnet_mmio_readb(void *opaque, uint64_t addr, uint32_t val) "opaque=%p addr=%#"PRIx64" val=0x%x"
+pcnet_mmio_readw(void *opaque, uint64_t addr, uint32_t val) "opaque=%p addr=%#"PRIx64" val=0x%x"
+pcnet_mmio_readl(void *opaque, uint64_t addr, uint32_t val) "opaque=%p addr=%#"PRIx64" val=0x%x"
+
 # hw/intc/xics.c
 xics_icp_check_ipi(int server, uint8_t mfrr) "CPU %d can take IPI mfrr=%#x"
 xics_icp_accept(uint32_t old_xirr, uint32_t new_xirr) "icp_accept: XIRR %#"PRIx32"->%#"PRIx32
-- 
2.1.4


