Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPZyX-0006Md-Ai
	for mharc-qemu-trivial@gnu.org; Mon, 17 Mar 2014 12:01:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WPZy9-0005Uu-Ue
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 12:00:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WPZy8-0007mr-EW
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 12:00:53 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:46882)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WPZy1-0007gB-GH; Mon, 17 Mar 2014 12:00:45 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WPZxx-0004wJ-GQ; Mon, 17 Mar 2014 16:00:41 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 17 Mar 2014 16:00:38 +0000
Message-Id: <1395072041-18911-10-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395072041-18911-1-git-send-email-peter.maydell@linaro.org>
References: <1395072041-18911-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH v2 09/12] tests/libqos/pci-pc: Avoid shifting
	left into sign bit
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
X-List-Received-Date: Mon, 17 Mar 2014 16:00:58 -0000

Add U suffix when doing "1 << 31" to avoid undefined behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/libqos/pci-pc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/libqos/pci-pc.c b/tests/libqos/pci-pc.c
index 3bde8ab..bf741a4 100644
--- a/tests/libqos/pci-pc.c
+++ b/tests/libqos/pci-pc.c
@@ -110,37 +110,37 @@ static void qpci_pc_io_writel(QPCIBus *bus, void *addr, uint32_t value)
 
 static uint8_t qpci_pc_config_readb(QPCIBus *bus, int devfn, uint8_t offset)
 {
-    outl(0xcf8, (1 << 31) | (devfn << 8) | offset);
+    outl(0xcf8, (1U << 31) | (devfn << 8) | offset);
     return inb(0xcfc);
 }
 
 static uint16_t qpci_pc_config_readw(QPCIBus *bus, int devfn, uint8_t offset)
 {
-    outl(0xcf8, (1 << 31) | (devfn << 8) | offset);
+    outl(0xcf8, (1U << 31) | (devfn << 8) | offset);
     return inw(0xcfc);
 }
 
 static uint32_t qpci_pc_config_readl(QPCIBus *bus, int devfn, uint8_t offset)
 {
-    outl(0xcf8, (1 << 31) | (devfn << 8) | offset);
+    outl(0xcf8, (1U << 31) | (devfn << 8) | offset);
     return inl(0xcfc);
 }
 
 static void qpci_pc_config_writeb(QPCIBus *bus, int devfn, uint8_t offset, uint8_t value)
 {
-    outl(0xcf8, (1 << 31) | (devfn << 8) | offset);
+    outl(0xcf8, (1U << 31) | (devfn << 8) | offset);
     outb(0xcfc, value);
 }
 
 static void qpci_pc_config_writew(QPCIBus *bus, int devfn, uint8_t offset, uint16_t value)
 {
-    outl(0xcf8, (1 << 31) | (devfn << 8) | offset);
+    outl(0xcf8, (1U << 31) | (devfn << 8) | offset);
     outw(0xcfc, value);
 }
 
 static void qpci_pc_config_writel(QPCIBus *bus, int devfn, uint8_t offset, uint32_t value)
 {
-    outl(0xcf8, (1 << 31) | (devfn << 8) | offset);
+    outl(0xcf8, (1U << 31) | (devfn << 8) | offset);
     outl(0xcfc, value);
 }
 
-- 
1.9.0


