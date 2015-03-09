Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YV1WF-0003pD-Ea
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2015 13:31:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36164)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1W5-0003OS-LA
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:31:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1Vt-0005m2-3g
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:57 -0400
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:58251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1Vs-0005lD-OM
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:44 -0400
Received: from /spool/local
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Mon, 9 Mar 2015 17:30:42 -0000
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 9 Mar 2015 17:30:41 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1EEE2219004D; 
	Mon,  9 Mar 2015 17:30:32 +0000 (GMT)
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t29HUfeD4719088; Mon, 9 Mar 2015 17:30:41 GMT
Received: from d06av02.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t29HUeZJ025041; Mon, 9 Mar 2015 11:30:40 -0600
Received: from oc7435384737.ibm.com (sig-9-81-34-230.evts.uk.ibm.com
	[9.81.34.230])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t29HUF7o024224; Mon, 9 Mar 2015 11:30:39 -0600
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Mon,  9 Mar 2015 18:30:10 +0100
Message-Id: <1425922215-20819-4-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1425922215-20819-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1425922215-20819-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15030917-0009-0000-0000-00000367DF40
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.108
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>,
	Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 3/8] pci: Remove unused functions
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
X-List-Received-Date: Mon, 09 Mar 2015 17:31:02 -0000

The functions pcie_ari_init(), pcie_cap_is_arifwd_enabled()
and ich9_d2pbr_init() are completely unused and thus can
be deleted.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Anthony Liguori <aliguori@amazon.com>
---
 hw/pci-bridge/i82801b11.c |   21 ---------------------
 hw/pci/pcie.c             |   25 -------------------------
 include/hw/i386/ich9.h    |    1 -
 include/hw/pci/pcie.h     |    3 ---
 4 files changed, 0 insertions(+), 50 deletions(-)

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
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 1abbbb1..9b9f63d 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -515,19 +515,6 @@ void pcie_cap_arifwd_reset(PCIDevice *dev)
     pci_long_test_and_clear_mask(devctl2, PCI_EXP_DEVCTL2_ARI);
 }
 
-bool pcie_cap_is_arifwd_enabled(const PCIDevice *dev)
-{
-    if (!pci_is_express(dev)) {
-        return false;
-    }
-    if (!dev->exp.exp_cap) {
-        return false;
-    }
-
-    return pci_get_long(dev->config + dev->exp.exp_cap + PCI_EXP_DEVCTL2) &
-        PCI_EXP_DEVCTL2_ARI;
-}
-
 /**************************************************************************
  * pci express extended capability list management functions
  * uint16_t ext_cap_id (16 bit)
@@ -621,15 +608,3 @@ void pcie_add_capability(PCIDevice *dev,
     /* Check capability by default */
     memset(dev->cmask + offset, 0xFF, size);
 }
-
-/**************************************************************************
- * pci express extended capability helper functions
- */
-
-/* ARI */
-void pcie_ari_init(PCIDevice *dev, uint16_t offset, uint16_t nextfn)
-{
-    pcie_add_capability(dev, PCI_EXT_CAP_ID_ARI, PCI_ARI_VER,
-                        offset, PCI_ARI_SIZEOF);
-    pci_set_long(dev->config + offset + PCI_ARI_CAP, (nextfn & 0xff) << 8);
-}
diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 59ea25b..5cede9b 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -19,7 +19,6 @@ void ich9_lpc_set_irq(void *opaque, int irq_num, int level);
 int ich9_lpc_map_irq(PCIDevice *pci_dev, int intx);
 PCIINTxRoute ich9_route_intx_pin_to_irq(void *opaque, int pirq_pin);
 void ich9_lpc_pm_init(PCIDevice *pci_lpc);
-PCIBus *ich9_d2pbr_init(PCIBus *bus, int devfn, int sec_bus);
 I2CBus *ich9_smb_init(PCIBus *bus, int devfn, uint32_t smb_io_base);
 
 #define ICH9_CC_SIZE                            (16 * 1024)     /* 16KB */
diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index b48a7a2..ae0969a 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -106,7 +106,6 @@ void pcie_cap_flr_write_config(PCIDevice *dev,
 /* ARI forwarding capability and control */
 void pcie_cap_arifwd_init(PCIDevice *dev);
 void pcie_cap_arifwd_reset(PCIDevice *dev);
-bool pcie_cap_is_arifwd_enabled(const PCIDevice *dev);
 
 /* PCI express extended capability helper functions */
 uint16_t pcie_find_capability(PCIDevice *dev, uint16_t cap_id);
@@ -114,8 +113,6 @@ void pcie_add_capability(PCIDevice *dev,
                          uint16_t cap_id, uint8_t cap_ver,
                          uint16_t offset, uint16_t size);
 
-void pcie_ari_init(PCIDevice *dev, uint16_t offset, uint16_t nextfn);
-
 extern const VMStateDescription vmstate_pcie_device;
 
 #define VMSTATE_PCIE_DEVICE(_field, _state) {                        \
-- 
1.7.1


