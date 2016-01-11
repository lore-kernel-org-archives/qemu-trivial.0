Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIY8M-0001PP-Dl
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:47:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY8D-00015h-LC
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:47:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY8C-0002Am-NY
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:47:17 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43047)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIY87-000289-7N; Mon, 11 Jan 2016 03:47:11 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6C165403EB;
	Mon, 11 Jan 2016 11:47:08 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id BE5C1AE3;
	Mon, 11 Jan 2016 11:42:01 +0300 (MSK)
Received: (nullmailer pid 28792 invoked by uid 1000);
	Mon, 11 Jan 2016 08:42:00 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 11:41:52 +0300
Message-Id: <a2a645d9678797ea833197d0daf2e330ea75908a.1452501577.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
References: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Cao jin <caoj.fnst@cn.fujitsu.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 13/19] PCI Bonito: QOMify and cleanup
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
X-List-Received-Date: Mon, 11 Jan 2016 08:47:18 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

Also clear the code

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/pci-host/bonito.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 4139a2c..b477679 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -180,8 +180,6 @@
 #define PCI_ADDR(busno,devno,funno,regno)  \
     ((((busno)<<16)&0xff0000) + (((devno)<<11)&0xf800) + (((funno)<<8)&0x700) + (regno))
 
-#define TYPE_BONITO_PCI_HOST_BRIDGE "Bonito-pcihost"
-
 typedef struct BonitoState BonitoState;
 
 typedef struct PCIBonitoState
@@ -215,17 +213,20 @@ typedef struct PCIBonitoState
 
 } PCIBonitoState;
 
-#define BONITO_PCI_HOST_BRIDGE(obj) \
-    OBJECT_CHECK(BonitoState, (obj), TYPE_BONITO_PCI_HOST_BRIDGE)
-
 struct BonitoState {
     PCIHostState parent_obj;
-
     qemu_irq *pic;
-
     PCIBonitoState *pci_dev;
 };
 
+#define TYPE_BONITO_PCI_HOST_BRIDGE "Bonito-pcihost"
+#define BONITO_PCI_HOST_BRIDGE(obj) \
+    OBJECT_CHECK(BonitoState, (obj), TYPE_BONITO_PCI_HOST_BRIDGE)
+
+#define TYPE_PCI_BONITO "Bonito"
+#define PCI_BONITO(obj) \
+    OBJECT_CHECK(PCIBonitoState, (obj), TYPE_PCI_BONITO)
+
 static void bonito_writel(void *opaque, hwaddr addr,
                           uint64_t val, unsigned size)
 {
@@ -723,7 +724,7 @@ static int bonito_pcihost_initfn(SysBusDevice *dev)
 
 static void bonito_realize(PCIDevice *dev, Error **errp)
 {
-    PCIBonitoState *s = DO_UPCAST(PCIBonitoState, dev, dev);
+    PCIBonitoState *s = PCI_BONITO(dev);
     SysBusDevice *sysbus = SYS_BUS_DEVICE(s->pcihost);
     PCIHostState *phb = PCI_HOST_BRIDGE(s->pcihost);
 
@@ -799,8 +800,8 @@ PCIBus *bonito_init(qemu_irq *pic)
     qdev_init_nofail(dev);
 
     /* set the pcihost pointer before bonito_initfn is called */
-    d = pci_create(phb->bus, PCI_DEVFN(0, 0), "Bonito");
-    s = DO_UPCAST(PCIBonitoState, dev, d);
+    d = pci_create(phb->bus, PCI_DEVFN(0, 0), TYPE_PCI_BONITO);
+    s = PCI_BONITO(d);
     s->pcihost = pcihost;
     pcihost->pci_dev = s;
     qdev_init_nofail(DEVICE(d));
@@ -828,7 +829,7 @@ static void bonito_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo bonito_info = {
-    .name          = "Bonito",
+    .name          = TYPE_PCI_BONITO,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PCIBonitoState),
     .class_init    = bonito_class_init,
-- 
2.1.4


