Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R36Ok-0006Yv-DJ
	for mharc-qemu-trivial@gnu.org; Mon, 12 Sep 2011 09:18:06 -0400
Received: from eggs.gnu.org ([140.186.70.92]:56326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1R36Oi-0006Wy-3b
	for qemu-trivial@nongnu.org; Mon, 12 Sep 2011 09:18:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1R36OZ-0002J7-Nm
	for qemu-trivial@nongnu.org; Mon, 12 Sep 2011 09:18:03 -0400
Received: from thoth.sbs.de ([192.35.17.2]:30953)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1R36OZ-0002J0-Dx; Mon, 12 Sep 2011 09:17:55 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.13.6/8.13.6) with ESMTP id p8CDHrFq020901;
	Mon, 12 Sep 2011 15:17:53 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id p8CDHreD029436;
	Mon, 12 Sep 2011 15:17:53 +0200
Message-ID: <4E6E0681.6010803@siemens.com>
Date: Mon, 12 Sep 2011 15:17:53 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.2
Cc: Blue Swirl <blauwirbel@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-trivial] [PATCH] pci: Remove unused mem_base from PCIBus
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
X-List-Received-Date: Mon, 12 Sep 2011 13:18:05 -0000

Obsoleted by f64e02b6cc.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hw/pci_internals.h |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/hw/pci_internals.h b/hw/pci_internals.h
index c7fd23d..10b4adf 100644
--- a/hw/pci_internals.h
+++ b/hw/pci_internals.h
@@ -24,7 +24,6 @@ struct PCIBus {
     void *irq_opaque;
     PCIDevice *devices[PCI_SLOT_MAX * PCI_FUNC_MAX];
     PCIDevice *parent_dev;
-    target_phys_addr_t mem_base;
     MemoryRegion *address_space_mem;
     MemoryRegion *address_space_io;
 
-- 
1.7.3.4

