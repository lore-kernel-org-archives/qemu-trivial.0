Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaMiT-00015Q-Bq
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 07:42:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMiQ-00010h-QF
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:42:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMiN-0004vm-LN
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:42:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaMiC-0004sA-7M; Fri, 11 Sep 2015 07:41:48 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0330A4143D;
	Fri, 11 Sep 2015 14:41:46 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 90179A84;
	Fri, 11 Sep 2015 14:03:54 +0300 (MSK)
Received: (nullmailer pid 22799 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:47 +0300
Message-Id: <6328d69de09243929d90665eb6a6e0c96c4d06fc.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 23/26] hw/virtio/virtio-pci: Remove
	meaningless blank Property
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
X-List-Received-Date: Fri, 11 Sep 2015 11:42:04 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/virtio/virtio-pci.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 43b300f..eda8205 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -2007,10 +2007,6 @@ static const TypeInfo virtio_net_pci_info = {
 
 /* virtio-rng-pci */
 
-static Property virtio_rng_pci_properties[] = {
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void virtio_rng_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
     VirtIORngPCI *vrng = VIRTIO_RNG_PCI(vpci_dev);
@@ -2037,7 +2033,6 @@ static void virtio_rng_pci_class_init(ObjectClass *klass, void *data)
 
     k->realize = virtio_rng_pci_realize;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
-    dc->props = virtio_rng_pci_properties;
 
     pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
     pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_RNG;
-- 
2.1.4


