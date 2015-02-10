Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4Wj-0000bT-9w
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:42:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4Wd-0000PP-7B
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:42:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4Wc-0004TZ-4K
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:42:23 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44889)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4WT-0004Qi-Oa; Tue, 10 Feb 2015 01:42:14 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3EE8041822;
	Tue, 10 Feb 2015 09:34:44 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1D73A8C4;
	Tue, 10 Feb 2015 09:34:44 +0300 (MSK)
Received: (nullmailer pid 9344 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:33:55 +0300
Message-Id: <15cae340094402bfe77565d7c6d09e2bb9d6601b.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Don Koch <dkoch@verizon.com>
Subject: [Qemu-trivial] [PULL 06/46] Convert some debugging printfs to trace
	calls in pcnet.c.
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
X-List-Received-Date: Tue, 10 Feb 2015 06:42:27 -0000

From: Don Koch <dkoch@verizon.com>

Signed-off-by: Don Koch <dkoch@verizon.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/pcnet.c | 28 ++++++++--------------------
 trace-events   |  8 ++++++++
 2 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
index 8486b80..7778b9a 100644
--- a/hw/net/pcnet.c
+++ b/hw/net/pcnet.c
@@ -40,6 +40,7 @@
 #include "qemu/timer.h"
 #include "qemu/sockets.h"
 #include "sysemu/sysemu.h"
+#include "trace.h"
 
 #include "pcnet.h"
 
@@ -685,9 +686,7 @@ static void pcnet_bcr_writew(PCNetState *s, uint32_t rap, uint32_t val);
 
 static void pcnet_s_reset(PCNetState *s)
 {
-#ifdef PCNET_DEBUG
-    printf("pcnet_s_reset\n");
-#endif
+    trace_pcnet_s_reset(s);
 
     s->rdra = 0;
     s->tdra = 0;
@@ -760,9 +759,7 @@ static void pcnet_update_irq(PCNetState *s)
         s->csr[4] |= 0x0040;
         s->csr[0] |= 0x0080;
         isr = 1;
-#ifdef PCNET_DEBUG
-        printf("pcnet user int\n");
-#endif
+        trace_pcnet_user_int(s);
     }
 
 #if 1
@@ -777,9 +774,7 @@ static void pcnet_update_irq(PCNetState *s)
     }
 
     if (isr != s->isr) {
-#ifdef PCNET_DEBUG
-        printf("pcnet: INTA=%d\n", isr);
-#endif
+        trace_pcnet_isr_change(s, isr, s->isr);
     }
     qemu_set_irq(s->irq, isr);
     s->isr = isr;
@@ -791,9 +786,7 @@ static void pcnet_init(PCNetState *s)
     uint16_t padr[3], ladrf[4], mode;
     uint32_t rdra, tdra;
 
-#ifdef PCNET_DEBUG
-    printf("pcnet_init init_addr=0x%08x\n", PHYSADDR(s,CSR_IADR(s)));
-#endif
+    trace_pcnet_init(s, PHYSADDR(s, CSR_IADR(s)));
 
     if (BCR_SSIZE32(s)) {
         struct pcnet_initblk32 initblk;
@@ -831,9 +824,7 @@ static void pcnet_init(PCNetState *s)
         tdra &= 0x00ffffff;
     }
 
-#if defined(PCNET_DEBUG)
-    printf("rlen=%d tlen=%d\n", rlen, tlen);
-#endif
+    trace_pcnet_rlen_tlen(s, rlen, tlen);
 
     CSR_RCVRL(s) = (rlen < 9) ? (1 << rlen) : 512;
     CSR_XMTRL(s) = (tlen < 9) ? (1 << tlen) : 512;
@@ -852,11 +843,8 @@ static void pcnet_init(PCNetState *s)
     CSR_RCVRC(s) = CSR_RCVRL(s);
     CSR_XMTRC(s) = CSR_XMTRL(s);
 
-#ifdef PCNET_DEBUG
-    printf("pcnet ss32=%d rdra=0x%08x[%d] tdra=0x%08x[%d]\n",
-        BCR_SSIZE32(s),
-        s->rdra, CSR_RCVRL(s), s->tdra, CSR_XMTRL(s));
-#endif
+    trace_pcnet_ss32_rdra_tdra(s, BCR_SSIZE32(s),
+                               s->rdra, CSR_RCVRL(s), s->tdra, CSR_XMTRL(s));
 
     s->csr[0] |= 0x0101;
     s->csr[0] &= ~0x0004;       /* clear STOP bit */
diff --git a/trace-events b/trace-events
index ae537f7..f87b077 100644
--- a/trace-events
+++ b/trace-events
@@ -1282,6 +1282,14 @@ spapr_pci_msi_retry(unsigned config_addr, unsigned req_num, unsigned max_irqs) "
 pci_update_mappings_del(void *d, uint32_t bus, uint32_t func, uint32_t slot, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,%#"PRIx64"+%#"PRIx64
 pci_update_mappings_add(void *d, uint32_t bus, uint32_t func, uint32_t slot, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,%#"PRIx64"+%#"PRIx64
 
+# hw/net/pcnet.c
+pcnet_s_reset(void *s) "s=%p"
+pcnet_user_int(void *s) "s=%p"
+pcnet_isr_change(void *s, uint32_t isr, uint32_t isr_old) "s=%p INTA=%d<=%d"
+pcnet_init(void *s, uint64_t init_addr) "s=%p init_addr=%#"PRIx64
+pcnet_rlen_tlen(void *s, uint32_t rlen, uint32_t tlen) "s=%p rlen=%d tlen=%d"
+pcnet_ss32_rdra_tdra(void *s, uint32_t ss32, uint32_t rdra, uint32_t rcvrl, uint32_t tdra, uint32_t xmtrl) "s=%p ss32=%d rdra=0x%08x[%d] tdra=0x%08x[%d]"
+
 # hw/net/pcnet-pci.c
 pcnet_aprom_writeb(void *opaque, uint32_t addr, uint32_t val) "opaque=%p addr=0x%08x val=0x%02x"
 pcnet_aprom_readb(void *opaque, uint32_t addr, uint32_t val) "opaque=%p addr=0x%08x val=0x%02x"
-- 
2.1.4


