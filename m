Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QnmLP-0000l8-SG
	for mharc-qemu-trivial@gnu.org; Mon, 01 Aug 2011 02:51:19 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1QnmLN-0000ds-Jf
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2011 02:51:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1QnmLM-0000l6-RM
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2011 02:51:17 -0400
Received: from ozlabs.org ([203.10.76.45]:56618)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1QnmLH-0000kA-PA; Mon, 01 Aug 2011 02:51:12 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 93B3DB70BC; Mon,  1 Aug 2011 16:51:07 +1000 (EST)
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org
Date: Mon,  1 Aug 2011 16:51:02 +1000
Message-Id: <1312181462-29889-1-git-send-email-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 1.7.5.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 203.10.76.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] Correctly assign PCI domain numbers
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
X-List-Received-Date: Mon, 01 Aug 2011 06:51:18 -0000

qemu already almost supports PCI domains; that is, several entirely
independent PCI host bridges on the same machine.  However, a bug in
pci_bus_new_inplace() means that every host bridge gets assigned domain
number zero and so can't be properly distinguished.  This patch fixes the
bug, giving each new host bridge a new domain number.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/pci.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/hw/pci.c b/hw/pci.c
index 36db58b..2b4aecb 100644
--- a/hw/pci.c
+++ b/hw/pci.c
@@ -262,6 +262,8 @@ int pci_find_domain(const PCIBus *bus)
     return -1;
 }
 
+static int pci_next_domain; /* = 0 */
+
 void pci_bus_new_inplace(PCIBus *bus, DeviceState *parent,
                          const char *name,
                          MemoryRegion *address_space,
@@ -274,7 +276,8 @@ void pci_bus_new_inplace(PCIBus *bus, DeviceState *parent,
 
     /* host bridge */
     QLIST_INIT(&bus->child);
-    pci_host_bus_register(0, bus); /* for now only pci domain 0 is supported */
+
+    pci_host_bus_register(pci_next_domain++, bus);
 
     vmstate_register(NULL, -1, &vmstate_pcibus, bus);
 }
-- 
1.7.5.4


