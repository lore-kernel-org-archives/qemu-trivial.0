Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VCu9z-00067P-Lf
	for mharc-qemu-trivial@gnu.org; Fri, 23 Aug 2013 12:24:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1VCu9v-0005zm-IH
	for qemu-trivial@nongnu.org; Fri, 23 Aug 2013 12:24:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1VCu9s-0001Qc-9T
	for qemu-trivial@nongnu.org; Fri, 23 Aug 2013 12:24:23 -0400
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:59450 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1VCu9m-0001Mk-Lp; Fri, 23 Aug 2013 12:24:14 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1VCu2L-0002IP-LR; Fri, 23 Aug 2013 17:16:33 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2013 17:16:32 +0100
Message-Id: <1377274593-8797-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1377274593-8797-1-git-send-email-peter.maydell@linaro.org>
References: <1377274593-8797-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH 1/2] hw/scsi/lsi53c895a: Use sextract32 for
	sign-extension
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
X-List-Received-Date: Fri, 23 Aug 2013 16:24:26 -0000

Use sextract32() for doing sign-extension rather than rolling
our own implementation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/scsi/lsi53c895a.c |   16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 611f2aa..333c62f 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -998,12 +998,6 @@ bad:
     s->msg_action = 0;
 }
 
-/* Sign extend a 24-bit value.  */
-static inline int32_t sxt24(int32_t n)
-{
-    return (n << 8) >> 8;
-}
-
 #define LSI_BUF_SIZE 4096
 static void lsi_memcpy(LSIState *s, uint32_t dest, uint32_t src, int count)
 {
@@ -1083,7 +1077,7 @@ again:
             /* Table indirect addressing.  */
 
             /* 32-bit Table indirect */
-            offset = sxt24(addr);
+            offset = sextract32(addr, 0, 24);
             pci_dma_read(pci_dev, s->dsa + offset, buf, 8);
             /* byte count is stored in bits 0:23 only */
             s->dbc = cpu_to_le32(buf[0]) & 0xffffff;
@@ -1183,13 +1177,13 @@ again:
             uint32_t id;
 
             if (insn & (1 << 25)) {
-                id = read_dword(s, s->dsa + sxt24(insn));
+                id = read_dword(s, s->dsa + sextract32(insn, 0, 24));
             } else {
                 id = insn;
             }
             id = (id >> 16) & 0xf;
             if (insn & (1 << 26)) {
-                addr = s->dsp + sxt24(addr);
+                addr = s->dsp + sextract32(addr, 0, 24);
             }
             s->dnad = addr;
             switch (opcode) {
@@ -1385,7 +1379,7 @@ again:
             if (cond == jmp) {
                 if (insn & (1 << 23)) {
                     /* Relative address.  */
-                    addr = s->dsp + sxt24(addr);
+                    addr = s->dsp + sextract32(addr, 0, 24);
                 }
                 switch ((insn >> 27) & 7) {
                 case 0: /* Jump */
@@ -1438,7 +1432,7 @@ again:
             int i;
 
             if (insn & (1 << 28)) {
-                addr = s->dsa + sxt24(addr);
+                addr = s->dsa + sextract32(addr, 0, 24);
             }
             n = (insn & 7);
             reg = (insn >> 16) & 0xff;
-- 
1.7.9.5


