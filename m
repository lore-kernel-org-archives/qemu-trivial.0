Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bso43-0007Ca-II
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 05:37:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bso40-00077k-Hx
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:37:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bso3y-0003QY-8p
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:37:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37020)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bso3q-0003GL-Nk; Sat, 08 Oct 2016 05:36:55 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 16EE840ED9;
	Sat,  8 Oct 2016 12:36:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id C7F68B3D;
	Sat,  8 Oct 2016 11:58:16 +0300 (MSK)
Received: (nullmailer pid 19272 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Chen Fan <fan.chen@easystack.cn>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:58:11 +0300
Message-Id: <7a25126d8a4155536a8a3d350e0ab185607bc819.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 25/26] virtio: rename the bar index field name
 in VirtIOPCIProxy
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Oct 2016 09:37:05 -0000

From: Chen Fan <fan.chen@easystack.cn>

the bar index names are much similar to the bar memory regions,
distinguish them to improve the code readability.

Signed-off-by: Chen Fan <fan.chen@easystack.cn>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/virtio-vga.c |  4 ++--
 hw/virtio/virtio-pci.c  | 20 ++++++++++----------
 hw/virtio/virtio-pci.h  |  8 ++++----
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index f77b401..f9b017d 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -120,8 +120,8 @@ static void virtio_vga_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
      * virtio regions are moved to the end of bar #2, to make room for
      * the stdvga mmio registers at the start of bar #2.
      */
-    vpci_dev->modern_mem_bar = 2;
-    vpci_dev->msix_bar = 4;
+    vpci_dev->modern_mem_bar_idx = 2;
+    vpci_dev->msix_bar_idx = 4;
 
     if (!(vpci_dev->flags & VIRTIO_PCI_FLAG_PAGE_PER_VQ)) {
         /*
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 2d60a00..06831de 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1551,7 +1551,7 @@ static void virtio_pci_modern_mem_region_map(VirtIOPCIProxy *proxy,
                                              struct virtio_pci_cap *cap)
 {
     virtio_pci_modern_region_map(proxy, region, cap,
-                                 &proxy->modern_bar, proxy->modern_mem_bar);
+                                 &proxy->modern_bar, proxy->modern_mem_bar_idx);
 }
 
 static void virtio_pci_modern_io_region_map(VirtIOPCIProxy *proxy,
@@ -1559,7 +1559,7 @@ static void virtio_pci_modern_io_region_map(VirtIOPCIProxy *proxy,
                                             struct virtio_pci_cap *cap)
 {
     virtio_pci_modern_region_map(proxy, region, cap,
-                                 &proxy->io_bar, proxy->modern_io_bar);
+                                 &proxy->io_bar, proxy->modern_io_bar_idx);
 }
 
 static void virtio_pci_modern_mem_region_unmap(VirtIOPCIProxy *proxy,
@@ -1670,14 +1670,14 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
             memory_region_init(&proxy->io_bar, OBJECT(proxy),
                                "virtio-pci-io", 0x4);
 
-            pci_register_bar(&proxy->pci_dev, proxy->modern_io_bar,
+            pci_register_bar(&proxy->pci_dev, proxy->modern_io_bar_idx,
                              PCI_BASE_ADDRESS_SPACE_IO, &proxy->io_bar);
 
             virtio_pci_modern_io_region_map(proxy, &proxy->notify_pio,
                                             &notify_pio.cap);
         }
 
-        pci_register_bar(&proxy->pci_dev, proxy->modern_mem_bar,
+        pci_register_bar(&proxy->pci_dev, proxy->modern_mem_bar_idx,
                          PCI_BASE_ADDRESS_SPACE_MEMORY |
                          PCI_BASE_ADDRESS_MEM_PREFETCH |
                          PCI_BASE_ADDRESS_MEM_TYPE_64,
@@ -1693,7 +1693,7 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
 
     if (proxy->nvectors) {
         int err = msix_init_exclusive_bar(&proxy->pci_dev, proxy->nvectors,
-                                          proxy->msix_bar);
+                                          proxy->msix_bar_idx);
         if (err) {
             /* Notice when a system that supports MSIx can't initialize it.  */
             if (err != -ENOTSUP) {
@@ -1716,7 +1716,7 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
                               &virtio_pci_config_ops,
                               proxy, "virtio-pci", size);
 
-        pci_register_bar(&proxy->pci_dev, proxy->legacy_io_bar,
+        pci_register_bar(&proxy->pci_dev, proxy->legacy_io_bar_idx,
                          PCI_BASE_ADDRESS_SPACE_IO, &proxy->bar);
     }
 
@@ -1760,10 +1760,10 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
      *   region 4+5 --  virtio modern memory (64bit) bar
      *
      */
-    proxy->legacy_io_bar  = 0;
-    proxy->msix_bar       = 1;
-    proxy->modern_io_bar  = 2;
-    proxy->modern_mem_bar = 4;
+    proxy->legacy_io_bar_idx  = 0;
+    proxy->msix_bar_idx       = 1;
+    proxy->modern_io_bar_idx  = 2;
+    proxy->modern_mem_bar_idx = 4;
 
     proxy->common.offset = 0x0;
     proxy->common.size = 0x1000;
diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index 541cbdb..b4edea6 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -143,10 +143,10 @@ struct VirtIOPCIProxy {
     MemoryRegion io_bar;
     MemoryRegion modern_cfg;
     AddressSpace modern_as;
-    uint32_t legacy_io_bar;
-    uint32_t msix_bar;
-    uint32_t modern_io_bar;
-    uint32_t modern_mem_bar;
+    uint32_t legacy_io_bar_idx;
+    uint32_t msix_bar_idx;
+    uint32_t modern_io_bar_idx;
+    uint32_t modern_mem_bar_idx;
     int config_cap;
     uint32_t flags;
     bool disable_modern;
-- 
2.1.4


