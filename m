Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpUUb-0002ED-Gs
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 02:06:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fan.chen@easystack.cn>) id 1bpTEI-00052B-LO
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 00:45:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fan.chen@easystack.cn>) id 1bpTEH-0004pr-FT
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 00:45:54 -0400
Received: from m199-177.yeah.net ([123.58.177.199]:13138)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fan.chen@easystack.cn>)
	id 1bpTEA-0004oj-Ka; Thu, 29 Sep 2016 00:45:47 -0400
Received: from localhost.localdomain (unknown [58.213.72.214])
	by m199-177.yeah.net (HMail) with ESMTPA id 70D8B11054C0;
	Thu, 29 Sep 2016 12:06:59 +0800 (CST)
From: Chen Fan <fan.chen@easystack.cn>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Chen Fan <fan.chen@easystack.cn>
Date: Thu, 29 Sep 2016 12:04:40 +0800
Message-Id: <1475121880-9593-1-git-send-email-fan.chen@easystack.cn>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1koWUFPN1dZCBgUCR5ZQUpOVUNIQ0tLS0lCTE5PTUhDTFdZCQ4XHghZQV
	koKz0kNTQ1PiQyNSQzPjo*PilBS1VLQDYjJCI#KCQyNSQzPjo*PilBS1VLQCsvKSQ1NCQyNSQzPj
	o*PilBS1VLQDg0LjUvKSIkODVBS1VLQCk#PDI0NSQ6KDI6QUtVS0ArKTQtMjU4PiQxMjo1PCguQU
	tVS0A*IjU6NjI4JDIrJDU0JDI1JDM#Oj8#KUFLVUtAKT46NyQyKyQyNSQpOTckMjUkMz46Pz4pQU
	pJVUtANi43LzIkKTgrLyQ*Mj09Pik#NS8kMjUkMz46Pz4pQUlVS0AyKyQvND86IiQ4NS8kSyRKS0
	tBS1VLQDIrJEokNjI1Li8#JDg1LyRLJEpLQUtVS0AyKyRISyQ2MjUuLz4kODUvJEskTktBS1VLQD
	IrJE4kNjI1Li8#JDg1LyRLJEpLQUtVS0AyKyRKJDM0LikkODUvJEskSktLQUtVS0AoLjkxPjgvJC
	80PzoiJDg1LyRLJEpLS0FLVUtAKC45MT44LyRKJDM0LikkODUvJEskSktLQUtVS0AoLjkxPjgvJE
	4kNjI1Li8#JDg1LyRLJEpLQUtVS0AoOTEkNz41JE9LJCNBS1VLS0pLQC8#Iy8kNz41JEpJQ0skI0
	FLVUtLSktAODUvJDMvNjckNz41JEowJE4wQUtVS0tKS0AvPiMvLik3JD4jMigvQUtVS0tKS0AvPi
	MvLik3JCgrOjg#QUtVS0tKS0ApPjg#Mi0#KSQ4NS8kSiROQUtVS0tKS0A*PjcyLT4pJDc#NSRLQU
	tVS0tKS0A3OjU8JD41QUtVS0tKS0A9NSQoLjkkPjUsNCk*KCQzNzEkSktLSUtKQUtVSUNAKC45JD
	5BSlVOTlkG
X-HM-Sender-Digest: e1kSHx4VD1lBWUc6MAg6Exw6MzosECJODzESNS8*GTIwCTJVSlVKT0xO
	SklJS0pCTU5IVTMWGhIXVR0aFVUYEx4VOx4aCAIIDxoYEFUYFUVZV1kMHhlZQR0aFwgeV1kIAVlB
	Tk1LTjdXWRILWUFZTkNVSUpIVUxJVUlKT1kG
X-HM-Tid: 0a57741fbcb8642770d8b11054c0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 123.58.177.199
X-Mailman-Approved-At: Thu, 29 Sep 2016 02:06:48 -0400
Subject: [Qemu-trivial] [PATCH] virtio: rename the bar index field name in
 VirtIOPCIProxy
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
X-List-Received-Date: Thu, 29 Sep 2016 04:45:55 -0000

the bar index names are much similar to the bar memory regions,
distinguish them to improve the code readability.

Signed-off-by: Chen Fan <fan.chen@easystack.cn>
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
2.7.4


