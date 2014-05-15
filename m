Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WkuAu-0002Bf-F5
	for mharc-qemu-trivial@gnu.org; Thu, 15 May 2014 07:50:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1WkuAl-0001qP-Gd
	for qemu-trivial@nongnu.org; Thu, 15 May 2014 07:50:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1WkuAf-00050k-EW
	for qemu-trivial@nongnu.org; Thu, 15 May 2014 07:50:03 -0400
Received: from mono.eik.bme.hu ([152.66.115.2]:56524)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>)
	id 1WkuAS-0004y9-Qa; Thu, 15 May 2014 07:49:45 -0400
Received: from mono.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id E65B82F257;
	Thu, 15 May 2014 13:49:43 +0200 (CEST)
Received: by mono.eik.bme.hu (Postfix, from userid 432)
	id B2D392F44B; Thu, 15 May 2014 13:49:43 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Message-Id: <20140515114943.B2D392F44B@mono.eik.bme.hu>
X-detected-operating-system: by eggs.gnu.org: Solaris 10
X-Received-From: 152.66.115.2
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-trivial] [PATCH v4] serial-pci: Set prog interface field of
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
Date: Thu, 15 May 2014 11:50:10 -0000
X-Original-Date: Thu, 27 Feb 2014 02:05:05 +0100
X-List-Received-Date: Thu, 15 May 2014 11:50:10 -0000

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---

 v2: resubmission after pc-2.1 is added with the multiport case
 v3: added compatibility check to avoid changing earlier than pc-2.1
 v4: renamed compat property to prog_if

 hw/char/serial-pci.c |  7 +++++++
 include/hw/i386/pc.h | 15 +++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index 991c99f..acccc9c 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -34,6 +34,7 @@
 typedef struct PCISerialState {
     PCIDevice dev;
     SerialState state;
+    uint8_t prog_if;
 } PCISerialState;
 
 typedef struct PCIMultiSerialState {
@@ -44,6 +45,7 @@ typedef struct PCIMultiSerialState {
     SerialState  state[PCI_SERIAL_MAX_PORTS];
     uint32_t     level[PCI_SERIAL_MAX_PORTS];
     qemu_irq     *irqs;
+    uint8_t      prog_if;
 } PCIMultiSerialState;
 
 static int serial_pci_init(PCIDevice *dev)
@@ -60,6 +62,7 @@ static int serial_pci_init(PCIDevice *dev)
         return -1;
     }
 
+    pci->dev.config[PCI_CLASS_PROG] = pci->prog_if;
     pci->dev.config[PCI_INTERRUPT_PIN] = 0x01;
     s->irq = pci_allocate_irq(&pci->dev);
 
@@ -101,6 +104,7 @@ static int multi_serial_pci_init(PCIDevice *dev)
     assert(pci->ports > 0);
     assert(pci->ports <= PCI_SERIAL_MAX_PORTS);
 
+    pci->dev.config[PCI_CLASS_PROG] = pci->prog_if;
     pci->dev.config[PCI_INTERRUPT_PIN] = 0x01;
     memory_region_init(&pci->iobar, OBJECT(pci), "multiserial", 8 * pci->ports);
     pci_register_bar(&pci->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &pci->iobar);
@@ -177,12 +181,14 @@ static const VMStateDescription vmstate_pci_multi_serial = {
 
 static Property serial_pci_properties[] = {
     DEFINE_PROP_CHR("chardev",  PCISerialState, state.chr),
+    DEFINE_PROP_UINT8("prog_if",  PCISerialState, prog_if, 0x02),
     DEFINE_PROP_END_OF_LIST(),
 };
 
 static Property multi_2x_serial_pci_properties[] = {
     DEFINE_PROP_CHR("chardev1",  PCIMultiSerialState, state[0].chr),
     DEFINE_PROP_CHR("chardev2",  PCIMultiSerialState, state[1].chr),
+    DEFINE_PROP_UINT8("prog_if",  PCIMultiSerialState, prog_if, 0x02),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -191,6 +197,7 @@ static Property multi_4x_serial_pci_properties[] = {
     DEFINE_PROP_CHR("chardev2",  PCIMultiSerialState, state[1].chr),
     DEFINE_PROP_CHR("chardev3",  PCIMultiSerialState, state[2].chr),
     DEFINE_PROP_CHR("chardev4",  PCIMultiSerialState, state[3].chr),
+    DEFINE_PROP_UINT8("prog_if",  PCIMultiSerialState, prog_if, 0x02),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 32a7687..552fbd8 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -271,6 +271,21 @@ bool e820_get_entry(int, uint32_t, uint64_t *, uint64_t *);
             .driver   = "apic",\
             .property = "version",\
             .value    = stringify(0x11),\
+        },\
+        {\
+            .driver   = "pci-serial",\
+            .property = "prog_if",\
+            .value    = stringify(0),\
+        },\
+        {\
+            .driver   = "pci-serial-2x",\
+            .property = "prof_if",\
+            .value    = stringify(0),\
+        },\
+        {\
+            .driver   = "pci-serial-4x",\
+            .property = "prog_if",\
+            .value    = stringify(0),\
         }
 
 #define PC_COMPAT_1_7 \
-- 
1.8.1.5


