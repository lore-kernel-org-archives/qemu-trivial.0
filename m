Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIYbL-0004Fx-EU
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 04:17:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIYbE-00043m-J1
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 04:17:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIYbD-0000IA-Mh
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 04:17:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50072)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIYb8-0000GG-00; Mon, 11 Jan 2016 04:17:10 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3883140401;
	Mon, 11 Jan 2016 12:17:08 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 2F852AD2;
	Mon, 11 Jan 2016 11:42:01 +0300 (MSK)
Received: (nullmailer pid 28790 invoked by uid 1000);
	Mon, 11 Jan 2016 08:41:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 11:41:51 +0300
Message-Id: <9f23b27d0d981a26015472bbdf7a54e549326ed3.1452501577.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
References: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Cao jin <caoj.fnst@cn.fujitsu.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 12/19] SH PCI Host: convert to realize()
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
 hw/sh4/sh_pci.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
index a2f6d9e..4509053 100644
--- a/hw/sh4/sh_pci.c
+++ b/hw/sh4/sh_pci.c
@@ -151,12 +151,11 @@ static int sh_pci_device_init(SysBusDevice *dev)
     return 0;
 }
 
-static int sh_pci_host_init(PCIDevice *d)
+static void sh_pci_host_realize(PCIDevice *d, Error **errp)
 {
     pci_set_word(d->config + PCI_COMMAND, PCI_COMMAND_WAIT);
     pci_set_word(d->config + PCI_STATUS, PCI_STATUS_CAP_LIST |
                  PCI_STATUS_FAST_BACK | PCI_STATUS_DEVSEL_MEDIUM);
-    return 0;
 }
 
 static void sh_pci_host_class_init(ObjectClass *klass, void *data)
@@ -164,7 +163,7 @@ static void sh_pci_host_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    k->init = sh_pci_host_init;
+    k->realize = sh_pci_host_realize;
     k->vendor_id = PCI_VENDOR_ID_HITACHI;
     k->device_id = PCI_DEVICE_ID_HITACHI_SH7751R;
     /*
-- 
2.1.4


