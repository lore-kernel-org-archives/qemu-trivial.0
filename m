Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhymN-0007i5-Sf
	for mharc-qemu-trivial@gnu.org; Wed, 07 May 2014 06:08:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1WhymG-0007aN-9o
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 06:08:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1WhymA-0007GU-8t
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 06:08:40 -0400
Received: from mono.eik.bme.hu ([152.66.115.2]:35525)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1WhymA-0007Eg-1Q
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 06:08:34 -0400
Received: from mono.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id EBC4C4E7C;
	Wed,  7 May 2014 12:08:18 +0200 (CEST)
Received: by mono.eik.bme.hu (Postfix, from userid 432)
	id C714A196A9; Wed,  7 May 2014 12:08:18 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Message-Id: <20140507100818.C714A196A9@mono.eik.bme.hu>
X-detected-operating-system: by eggs.gnu.org: Solaris 10
X-Received-From: 152.66.115.2
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH v2] serial-pci: Set prog interface field of
 pci config to 16550 compatible
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
Date: Wed, 07 May 2014 10:08:46 -0000
X-Original-Date: Thu, 27 Feb 2014 02:05:05 +0100
X-List-Received-Date: Wed, 07 May 2014 10:08:46 -0000

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---

 v2: resubmission after pc-2.1 is added with the multiport case

 hw/char/serial-pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index 991c99f..f3f5e07 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -60,6 +60,7 @@ static int serial_pci_init(PCIDevice *dev)
         return -1;
     }
 
+    pci->dev.config[PCI_CLASS_PROG] = 0x02; /* 16550 compatible */
     pci->dev.config[PCI_INTERRUPT_PIN] = 0x01;
     s->irq = pci_allocate_irq(&pci->dev);
 
@@ -101,6 +102,7 @@ static int multi_serial_pci_init(PCIDevice *dev)
     assert(pci->ports > 0);
     assert(pci->ports <= PCI_SERIAL_MAX_PORTS);
 
+    pci->dev.config[PCI_CLASS_PROG] = 0x02; /* 16550 compatible */
     pci->dev.config[PCI_INTERRUPT_PIN] = 0x01;
     memory_region_init(&pci->iobar, OBJECT(pci), "multiserial", 8 * pci->ports);
     pci_register_bar(&pci->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &pci->iobar);
-- 
1.8.1.5


