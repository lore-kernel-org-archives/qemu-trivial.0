Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPZyP-00065E-R7
	for mharc-qemu-trivial@gnu.org; Mon, 17 Mar 2014 12:01:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WPZyA-0005WA-Iv
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 12:00:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WPZy5-0007lH-RG
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 12:00:54 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:46882)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WPZy2-0007gB-T6; Mon, 17 Mar 2014 12:00:47 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WPZxx-0004vf-6i; Mon, 17 Mar 2014 16:00:41 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 17 Mar 2014 16:00:32 +0000
Message-Id: <1395072041-18911-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395072041-18911-1-git-send-email-peter.maydell@linaro.org>
References: <1395072041-18911-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH v2 03/12] hw/pci/pci_host.c: Avoid shifting
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
X-List-Received-Date: Mon, 17 Mar 2014 16:00:55 -0000

Add U suffix to avoid undefined behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pci_host.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index 77c7d1f..2c17916 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -142,8 +142,9 @@ static uint64_t pci_host_data_read(void *opaque,
 {
     PCIHostState *s = opaque;
     uint32_t val;
-    if (!(s->config_reg & (1 << 31)))
+    if (!(s->config_reg & (1u << 31))) {
         return 0xffffffff;
+    }
     val = pci_data_read(s->bus, s->config_reg | (addr & 3), len);
     PCI_DPRINTF("read addr " TARGET_FMT_plx " len %d val %x\n",
                 addr, len, val);
-- 
1.9.0


