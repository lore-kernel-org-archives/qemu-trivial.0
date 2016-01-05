Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aGPH0-0002yU-ET
	for mharc-qemu-trivial@gnu.org; Tue, 05 Jan 2016 05:55:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aGPGy-0002wZ-V6
	for qemu-trivial@nongnu.org; Tue, 05 Jan 2016 05:55:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aGPGx-0002sI-UZ
	for qemu-trivial@nongnu.org; Tue, 05 Jan 2016 05:55:28 -0500
Received: from [59.151.112.132] (port=4717 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aGPGt-0002o8-Ax; Tue, 05 Jan 2016 05:55:23 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2235400"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jan 2016 18:55:01 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 96EEC41890E7;
	Tue,  5 Jan 2016 18:54:52 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 5 Jan 2016 18:54:52 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 5 Jan 2016 18:57:49 +0800
Message-ID: <1451991469-8893-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 96EEC41890E7.AAB2A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] PCI Bonito: QOMify
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
X-List-Received-Date: Tue, 05 Jan 2016 10:55:30 -0000

Also clear the code

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
Since this file don`t have maintainer & it should be simple enough for
qemu-trival, so cc: qemu-trival.

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
2.1.0




