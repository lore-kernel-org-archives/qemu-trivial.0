Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTCqz-0006DU-Ic
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 12:08:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCqs-00060o-Hl
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 12:08:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCqo-00010H-8H
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 12:08:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47445)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTCqZ-0000uK-Ma; Thu, 27 Mar 2014 12:08:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8D35E43721;
	Thu, 27 Mar 2014 20:08:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 78D5A695;
	Thu, 27 Mar 2014 19:28:36 +0400 (MSK)
Received: (nullmailer pid 1804 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:23 +0400
Message-Id: <1395934108-1694-19-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 18/23] tests/libqos/pci-pc: Avoid shifting
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
X-List-Received-Date: Thu, 27 Mar 2014 16:08:27 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Add U suffix when doing "1 << 31" to avoid undefined behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/libqos/pci-pc.c |   12 ++++++------
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
1.7.10.4


