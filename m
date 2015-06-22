Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z6zyu-0005Ts-CE
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:33:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zyn-0005HZ-MN
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:33:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zym-0008BO-FB
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:33:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37496)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z6zyg-00089N-0Y; Mon, 22 Jun 2015 07:33:26 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4552541E4C;
	Mon, 22 Jun 2015 14:33:24 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 43C27A55;
	Mon, 22 Jun 2015 14:16:31 +0300 (MSK)
Received: (nullmailer pid 9248 invoked by uid 1000);
	Mon, 22 Jun 2015 11:16:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:12 +0300
Message-Id: <da19bd0c92ee4859702ca1329f01f198b9f8a822.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 05/21] pci-assign: QOMify
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
X-List-Received-Date: Mon, 22 Jun 2015 11:33:35 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/kvm/pci-assign.c | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/hw/i386/kvm/pci-assign.c b/hw/i386/kvm/pci-assign.c
index 9db7c77..74d22f4 100644
--- a/hw/i386/kvm/pci-assign.c
+++ b/hw/i386/kvm/pci-assign.c
@@ -141,6 +141,9 @@ typedef struct AssignedDevice {
     int32_t bootindex;
 } AssignedDevice;
 
+#define TYPE_PCI_ASSIGN "kvm-pci-assign"
+#define PCI_ASSIGN(obj) OBJECT_CHECK(AssignedDevice, (obj), TYPE_PCI_ASSIGN)
+
 static void assigned_dev_update_irq_routing(PCIDevice *dev);
 
 static void assigned_dev_load_option_rom(AssignedDevice *dev);
@@ -257,7 +260,7 @@ static const MemoryRegionOps slow_bar_ops = {
 static void assigned_dev_iomem_setup(PCIDevice *pci_dev, int region_num,
                                      pcibus_t e_size)
 {
-    AssignedDevice *r_dev = DO_UPCAST(AssignedDevice, dev, pci_dev);
+    AssignedDevice *r_dev = PCI_ASSIGN(pci_dev);
     AssignedDevRegion *region = &r_dev->v_addrs[region_num];
     PCIRegion *real_region = &r_dev->real_device.regions[region_num];
 
@@ -289,7 +292,7 @@ static const MemoryRegionOps assigned_dev_ioport_ops = {
 static void assigned_dev_ioport_setup(PCIDevice *pci_dev, int region_num,
                                       pcibus_t size)
 {
-    AssignedDevice *r_dev = DO_UPCAST(AssignedDevice, dev, pci_dev);
+    AssignedDevice *r_dev = PCI_ASSIGN(pci_dev);
     AssignedDevRegion *region = &r_dev->v_addrs[region_num];
 
     region->e_size = size;
@@ -303,7 +306,7 @@ static void assigned_dev_ioport_setup(PCIDevice *pci_dev, int region_num,
 
 static uint32_t assigned_dev_pci_read(PCIDevice *d, int pos, int len)
 {
-    AssignedDevice *pci_dev = DO_UPCAST(AssignedDevice, dev, d);
+    AssignedDevice *pci_dev = PCI_ASSIGN(d);
     uint32_t val;
     ssize_t ret;
     int fd = pci_dev->real_device.config_fd;
@@ -328,7 +331,7 @@ static uint8_t assigned_dev_pci_read_byte(PCIDevice *d, int pos)
 
 static void assigned_dev_pci_write(PCIDevice *d, int pos, uint32_t val, int len)
 {
-    AssignedDevice *pci_dev = DO_UPCAST(AssignedDevice, dev, d);
+    AssignedDevice *pci_dev = PCI_ASSIGN(d);
     ssize_t ret;
     int fd = pci_dev->real_device.config_fd;
 
@@ -946,7 +949,7 @@ static void deassign_device(AssignedDevice *dev)
  */
 static void assigned_dev_update_irq_routing(PCIDevice *dev)
 {
-    AssignedDevice *assigned_dev = DO_UPCAST(AssignedDevice, dev, dev);
+    AssignedDevice *assigned_dev = PCI_ASSIGN(dev);
     Error *err = NULL;
     int r;
 
@@ -961,7 +964,7 @@ static void assigned_dev_update_irq_routing(PCIDevice *dev)
 
 static void assigned_dev_update_msi(PCIDevice *pci_dev)
 {
-    AssignedDevice *assigned_dev = DO_UPCAST(AssignedDevice, dev, pci_dev);
+    AssignedDevice *assigned_dev = PCI_ASSIGN(pci_dev);
     uint8_t ctrl_byte = pci_get_byte(pci_dev->config + pci_dev->msi_cap +
                                      PCI_MSI_FLAGS);
     int r;
@@ -1015,7 +1018,7 @@ static void assigned_dev_update_msi(PCIDevice *pci_dev)
 
 static void assigned_dev_update_msi_msg(PCIDevice *pci_dev)
 {
-    AssignedDevice *assigned_dev = DO_UPCAST(AssignedDevice, dev, pci_dev);
+    AssignedDevice *assigned_dev = PCI_ASSIGN(pci_dev);
     uint8_t ctrl_byte = pci_get_byte(pci_dev->config + pci_dev->msi_cap +
                                      PCI_MSI_FLAGS);
 
@@ -1048,7 +1051,7 @@ static bool assigned_dev_msix_skipped(MSIXTableEntry *entry)
 
 static int assigned_dev_update_msix_mmio(PCIDevice *pci_dev)
 {
-    AssignedDevice *adev = DO_UPCAST(AssignedDevice, dev, pci_dev);
+    AssignedDevice *adev = PCI_ASSIGN(pci_dev);
     uint16_t entries_nr = 0;
     int i, r = 0;
     MSIXTableEntry *entry = adev->msix_table;
@@ -1113,7 +1116,7 @@ static int assigned_dev_update_msix_mmio(PCIDevice *pci_dev)
 
 static void assigned_dev_update_msix(PCIDevice *pci_dev)
 {
-    AssignedDevice *assigned_dev = DO_UPCAST(AssignedDevice, dev, pci_dev);
+    AssignedDevice *assigned_dev = PCI_ASSIGN(pci_dev);
     uint16_t ctrl_word = pci_get_word(pci_dev->config + pci_dev->msix_cap +
                                       PCI_MSIX_FLAGS);
     int r;
@@ -1163,7 +1166,7 @@ static void assigned_dev_update_msix(PCIDevice *pci_dev)
 static uint32_t assigned_dev_pci_read_config(PCIDevice *pci_dev,
                                              uint32_t address, int len)
 {
-    AssignedDevice *assigned_dev = DO_UPCAST(AssignedDevice, dev, pci_dev);
+    AssignedDevice *assigned_dev = PCI_ASSIGN(pci_dev);
     uint32_t virt_val = pci_default_read_config(pci_dev, address, len);
     uint32_t real_val, emulate_mask, full_emulation_mask;
 
@@ -1184,7 +1187,7 @@ static uint32_t assigned_dev_pci_read_config(PCIDevice *pci_dev,
 static void assigned_dev_pci_write_config(PCIDevice *pci_dev, uint32_t address,
                                           uint32_t val, int len)
 {
-    AssignedDevice *assigned_dev = DO_UPCAST(AssignedDevice, dev, pci_dev);
+    AssignedDevice *assigned_dev = PCI_ASSIGN(pci_dev);
     uint16_t old_cmd = pci_get_word(pci_dev->config + PCI_COMMAND);
     uint32_t emulate_mask, full_emulation_mask;
     int ret;
@@ -1244,7 +1247,7 @@ static void assigned_dev_setup_cap_read(AssignedDevice *dev, uint32_t offset,
 
 static int assigned_device_pci_cap_init(PCIDevice *pci_dev, Error **errp)
 {
-    AssignedDevice *dev = DO_UPCAST(AssignedDevice, dev, pci_dev);
+    AssignedDevice *dev = PCI_ASSIGN(pci_dev);
     PCIRegion *pci_region = dev->real_device.regions;
     int ret, pos;
     Error *local_err = NULL;
@@ -1684,8 +1687,8 @@ static const VMStateDescription vmstate_assigned_device = {
 
 static void reset_assigned_device(DeviceState *dev)
 {
-    PCIDevice *pci_dev = DO_UPCAST(PCIDevice, qdev, dev);
-    AssignedDevice *adev = DO_UPCAST(AssignedDevice, dev, pci_dev);
+    PCIDevice *pci_dev = PCI_DEVICE(dev);
+    AssignedDevice *adev = PCI_ASSIGN(pci_dev);
     char reset_file[64];
     const char reset[] = "1";
     int fd, ret;
@@ -1740,7 +1743,7 @@ static void reset_assigned_device(DeviceState *dev)
 
 static void assigned_realize(struct PCIDevice *pci_dev, Error **errp)
 {
-    AssignedDevice *dev = DO_UPCAST(AssignedDevice, dev, pci_dev);
+    AssignedDevice *dev = PCI_ASSIGN(pci_dev);
     uint8_t e_intx;
     int r;
     Error *local_err = NULL;
@@ -1836,7 +1839,7 @@ exit_with_error:
 
 static void assigned_exitfn(struct PCIDevice *pci_dev)
 {
-    AssignedDevice *dev = DO_UPCAST(AssignedDevice, dev, pci_dev);
+    AssignedDevice *dev = PCI_ASSIGN(pci_dev);
 
     deassign_device(dev);
     free_assigned_device(dev);
@@ -1845,7 +1848,7 @@ static void assigned_exitfn(struct PCIDevice *pci_dev)
 static void assigned_dev_instance_init(Object *obj)
 {
     PCIDevice *pci_dev = PCI_DEVICE(obj);
-    AssignedDevice *d = DO_UPCAST(AssignedDevice, dev, PCI_DEVICE(obj));
+    AssignedDevice *d = PCI_ASSIGN(pci_dev);
 
     device_add_bootindex_property(obj, &d->bootindex,
                                   "bootindex", NULL,
@@ -1879,7 +1882,7 @@ static void assign_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo assign_info = {
-    .name               = "kvm-pci-assign",
+    .name               = TYPE_PCI_ASSIGN,
     .parent             = TYPE_PCI_DEVICE,
     .instance_size      = sizeof(AssignedDevice),
     .class_init         = assign_class_init,
-- 
2.1.4


