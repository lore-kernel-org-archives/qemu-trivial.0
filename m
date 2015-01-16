Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YCCT4-00039q-NU
	for mharc-qemu-trivial@gnu.org; Fri, 16 Jan 2015 14:22:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkoch@verizon.com>) id 1YCCSz-00030S-Q9
	for qemu-trivial@nongnu.org; Fri, 16 Jan 2015 14:22:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dkoch@verizon.com>) id 1YCCSu-0000ke-AD
	for qemu-trivial@nongnu.org; Fri, 16 Jan 2015 14:21:57 -0500
Received: from omzsmtpe04.verizonbusiness.com ([199.249.25.207]:17245)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkoch@verizon.com>)
	id 1YCCSn-0000hV-6X; Fri, 16 Jan 2015 14:21:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=verizon.com; i=dkoch@verizon.com; q=dns/txt; s=corp;
	t=1421436105; x=1452972105;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=V+d2c1ZgzFf8X1c/ptUlWA2FFYAXJcRl2KxcMzYWqxY=;
	b=fbee7pvtJsS18irlAo64Y/Xyevn/g7ziqUl6RMKgd06vPnzDd6fv4i4p
	1jPvpYjo8tqiFjyuykWJ7OfOGEzDO7MXaqumdMgCbCahgE50MawwLhZHk
	mD+3o3OAu4lx4CqrfrqUDgv3b16bNIycq8tuWTzbz/hF/wxZaEwwmMqjJ M=;
X-IronPort-Anti-Spam-Filtered: false
Received: from unknown (HELO fldsmtpi02.verizon.com) ([166.68.71.144])
	by omzsmtpe04.verizonbusiness.com with ESMTP; 16 Jan 2015 19:21:44 +0000
X-VzAPP: 1
X-IronPort-AV: E=Sophos;i="5.09,412,1418083200"; d="scan'208";a="915457509"
Received: from unknown (HELO yoyo.cloudswitch.com) ([208.52.205.215])
	by fldsmtpi02.verizon.com with ESMTP; 16 Jan 2015 19:21:43 +0000
From: Don Koch <dkoch@verizon.com>
To: qemu-devel@nongnu.org
Date: Fri, 16 Jan 2015 14:21:38 -0500
Message-Id: <1421436099-2487-4-git-send-email-dkoch@verizon.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1421436099-2487-1-git-send-email-dkoch@verizon.com>
References: <1421436099-2487-1-git-send-email-dkoch@verizon.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 199.249.25.207
Cc: qemu-trivial@nongnu.org, Don Koch <dkoch@verizon.com>
Subject: [Qemu-trivial] [PATCH 3/4] Add/convert trace calls in pcnet-pci.c.
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
X-List-Received-Date: Fri, 16 Jan 2015 19:22:01 -0000

Add trace calls. Convert some #ifdef DEBUG printfs to trace.

Signed-off-by: Don Koch <dkoch@verizon.com>
---
 hw/net/pcnet-pci.c | 49 +++++++++++++++++++------------------------------
 trace-events       | 12 ++++++++++++
 2 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c
index fb5f5d6..80cc3b0 100644
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
index 032bdd5..3a60213 100644
--- a/trace-events
+++ b/trace-events
@@ -1259,6 +1259,18 @@ spapr_pci_msi_write(uint64_t addr, uint64_t data, uint32_t dt_irq) "@%"PRIx64"<=
 spapr_pci_lsi_set(const char *busname, int pin, uint32_t irq) "%s PIN%d IRQ %u"
 spapr_pci_msi_retry(unsigned config_addr, unsigned req_num, unsigned max_irqs) "Guest device at %x asked %u, have only %u"
 
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
1.8.3.1


