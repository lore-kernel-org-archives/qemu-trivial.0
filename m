Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YCCTA-0003KR-8Y
	for mharc-qemu-trivial@gnu.org; Fri, 16 Jan 2015 14:22:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkoch@verizon.com>) id 1YCCT5-0003AT-4S
	for qemu-trivial@nongnu.org; Fri, 16 Jan 2015 14:22:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dkoch@verizon.com>) id 1YCCT0-0000ml-Tx
	for qemu-trivial@nongnu.org; Fri, 16 Jan 2015 14:22:03 -0500
Received: from omzsmtpe04.verizonbusiness.com ([199.249.25.207]:17245)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkoch@verizon.com>)
	id 1YCCSn-0000hV-Hi; Fri, 16 Jan 2015 14:21:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=verizon.com; i=dkoch@verizon.com; q=dns/txt; s=corp;
	t=1421436105; x=1452972105;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=ZH5qrak3vYmNrDTkRWF6R4JG0saAZcOPHYXI69GShM4=;
	b=MUn+u6fXT9EBqeJzm0l/5hf5EdVoSBLRyfyX2CaiizSNjW9ZKJtsIdd/
	fQp3rqHg2eUaIW2tWtqsKR35Wjyn/N+C38eVmtspHNsbs16qxiXfKjmht
	kptAvw0Arsqhzhv4mKW39YlKt3k4sdMqk0OHhIBcdSvveenEnYIGKE3ZV 8=;
X-IronPort-Anti-Spam-Filtered: false
Received: from unknown (HELO fldsmtpi02.verizon.com) ([166.68.71.144])
	by omzsmtpe04.verizonbusiness.com with ESMTP; 16 Jan 2015 19:21:44 +0000
X-VzAPP: 1
X-IronPort-AV: E=Sophos;i="5.09,412,1418083200"; d="scan'208";a="915457518"
Received: from unknown (HELO yoyo.cloudswitch.com) ([208.52.205.215])
	by fldsmtpi02.verizon.com with ESMTP; 16 Jan 2015 19:21:43 +0000
From: Don Koch <dkoch@verizon.com>
To: qemu-devel@nongnu.org
Date: Fri, 16 Jan 2015 14:21:39 -0500
Message-Id: <1421436099-2487-5-git-send-email-dkoch@verizon.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1421436099-2487-1-git-send-email-dkoch@verizon.com>
References: <1421436099-2487-1-git-send-email-dkoch@verizon.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 199.249.25.207
Cc: qemu-trivial@nongnu.org, Don Koch <dkoch@verizon.com>
Subject: [Qemu-trivial] [PATCH 4/4] Convert some debugging printfs to trace
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
X-List-Received-Date: Fri, 16 Jan 2015 19:22:06 -0000

Signed-off-by: Don Koch <dkoch@verizon.com>
---
 hw/net/pcnet.c | 28 ++++++++--------------------
 trace-events   |  8 ++++++++
 2 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
index f409b92..d549342 100644
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
index 6c8f26a..6984078 100644
--- a/trace-events
+++ b/trace-events
@@ -1275,6 +1275,14 @@ spapr_pci_msi_write(uint64_t addr, uint64_t data, uint32_t dt_irq) "@%"PRIx64"<=
 spapr_pci_lsi_set(const char *busname, int pin, uint32_t irq) "%s PIN%d IRQ %u"
 spapr_pci_msi_retry(unsigned config_addr, unsigned req_num, unsigned max_irqs) "Guest device at %x asked %u, have only %u"
 
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
1.8.3.1


