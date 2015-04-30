Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynk7g-0006q7-Lk
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 04:47:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynk7b-0006e9-Fk
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 04:47:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynk7a-0004bl-6n
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 04:47:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49392)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ynk7V-0004ZK-P5; Thu, 30 Apr 2015 04:46:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A84D742BBE;
	Thu, 30 Apr 2015 11:46:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 83CE395C;
	Thu, 30 Apr 2015 08:08:59 +0300 (MSK)
Received: (nullmailer pid 4323 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:28 +0300
Message-Id: <1947c1d8c7d5d5b53d44f3b59927edf887245904.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 15/42] pci: Remove unused function
	ich9_d2pbr_init()
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
X-List-Received-Date: Thu, 30 Apr 2015 08:47:04 -0000

From: Thomas Huth <thuth@linux.vnet.ibm.com>

The function ich9_d2pbr_init() is completely unused and
thus can be deleted.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/pci-bridge/i82801b11.c | 21 ---------------------
 include/hw/i386/ich9.h    |  1 -
 2 files changed, 22 deletions(-)

diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
index 14cd7fd..7e79bc0 100644
--- a/hw/pci-bridge/i82801b11.c
+++ b/hw/pci-bridge/i82801b11.c
@@ -101,27 +101,6 @@ static const TypeInfo i82801b11_bridge_info = {
     .class_init    = i82801b11_bridge_class_init,
 };
 
-PCIBus *ich9_d2pbr_init(PCIBus *bus, int devfn, int sec_bus)
-{
-    PCIDevice *d;
-    PCIBridge *br;
-    char buf[16];
-    DeviceState *qdev;
-
-    d = pci_create_multifunction(bus, devfn, true, "i82801b11-bridge");
-    if (!d) {
-        return NULL;
-    }
-    br = PCI_BRIDGE(d);
-    qdev = DEVICE(d);
-
-    snprintf(buf, sizeof(buf), "pci.%d", sec_bus);
-    pci_bridge_map_irq(br, buf, pci_swizzle_map_irq_fn);
-    qdev_init_nofail(qdev);
-
-    return pci_bridge_get_sec_bus(br);
-}
-
 static void d2pbr_register(void)
 {
     type_register_static(&i82801b11_bridge_info);
diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index c171578..f4e522c 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -18,7 +18,6 @@ void ich9_lpc_set_irq(void *opaque, int irq_num, int level);
 int ich9_lpc_map_irq(PCIDevice *pci_dev, int intx);
 PCIINTxRoute ich9_route_intx_pin_to_irq(void *opaque, int pirq_pin);
 void ich9_lpc_pm_init(PCIDevice *pci_lpc);
-PCIBus *ich9_d2pbr_init(PCIBus *bus, int devfn, int sec_bus);
 I2CBus *ich9_smb_init(PCIBus *bus, int devfn, uint32_t smb_io_base);
 
 #define ICH9_CC_SIZE                            (16 * 1024)     /* 16KB */
-- 
2.1.4


