Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIYbI-0004As-Nt
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 04:17:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIYbF-000440-Cr
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 04:17:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIYbE-0000Il-H7
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 04:17:17 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:59207)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIYb8-0000GH-NP; Mon, 11 Jan 2016 04:17:10 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 37D4A40400;
	Mon, 11 Jan 2016 12:17:08 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id CF1F4A98;
	Mon, 11 Jan 2016 11:42:00 +0300 (MSK)
Received: (nullmailer pid 28787 invoked by uid 1000);
	Mon, 11 Jan 2016 08:41:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 11:41:50 +0300
Message-Id: <b429d363ed551a7d6b638368c2c73001a2416706.1452501577.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
References: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Cao jin <caoj.fnst@cn.fujitsu.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 11/19] gt64120: convert to realize()
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
X-List-Received-Date: Mon, 11 Jan 2016 09:17:19 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/mips/gt64xxx_pci.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index f76a9fd..c1f3c9c 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -1193,7 +1193,7 @@ static int gt64120_init(SysBusDevice *dev)
     return 0;
 }
 
-static int gt64120_pci_init(PCIDevice *d)
+static void gt64120_pci_realize(PCIDevice *d, Error **errp)
 {
     /* FIXME: Malta specific hw assumptions ahead */
     pci_set_word(d->config + PCI_COMMAND, 0);
@@ -1207,8 +1207,6 @@ static int gt64120_pci_init(PCIDevice *d)
     pci_set_long(d->config + PCI_BASE_ADDRESS_4, 0x14000000);
     pci_set_long(d->config + PCI_BASE_ADDRESS_5, 0x14000001);
     pci_set_byte(d->config + 0x3d, 0x01);
-
-    return 0;
 }
 
 static void gt64120_pci_class_init(ObjectClass *klass, void *data)
@@ -1216,7 +1214,7 @@ static void gt64120_pci_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    k->init = gt64120_pci_init;
+    k->realize = gt64120_pci_realize;
     k->vendor_id = PCI_VENDOR_ID_MARVELL;
     k->device_id = PCI_DEVICE_ID_MARVELL_GT6412X;
     k->revision = 0x10;
-- 
2.1.4


