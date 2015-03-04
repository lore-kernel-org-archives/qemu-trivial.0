Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTGC3-0002GM-PO
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 15:46:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTGBx-00024P-T9
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 15:46:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTGBt-0001eW-Oo
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 15:46:53 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54242)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTGBc-0001Zi-DC; Wed, 04 Mar 2015 15:46:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 52B3E40925;
	Wed,  4 Mar 2015 23:46:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CCB66962;
	Wed,  4 Mar 2015 20:07:09 +0300 (MSK)
Received: (nullmailer pid 17520 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:35 +0300
Message-Id: <44676d5746eb156017eafe3b5ec8f80da3bd373a.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 18/47] vfio: Remove superfluous '\n' around
	error_report()
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
X-List-Received-Date: Wed, 04 Mar 2015 20:46:55 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/vfio/common.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index c5d1551..9289389 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -201,7 +201,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
     };
 
     if (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
-        error_report("VFIO_UNMAP_DMA: %d\n", -errno);
+        error_report("VFIO_UNMAP_DMA: %d", -errno);
         return -errno;
     }
 
@@ -234,7 +234,7 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         return 0;
     }
 
-    error_report("VFIO_MAP_DMA: %d\n", -errno);
+    error_report("VFIO_MAP_DMA: %d", -errno);
     return -errno;
 }
 
@@ -274,7 +274,7 @@ static void vfio_iommu_map_notify(Notifier *n, void *data)
                                  iotlb->translated_addr,
                                  &xlat, &len, iotlb->perm & IOMMU_WO);
     if (!memory_region_is_ram(mr)) {
-        error_report("iommu map to non memory area %"HWADDR_PRIx"\n",
+        error_report("iommu map to non memory area %"HWADDR_PRIx"",
                      xlat);
         return;
     }
@@ -283,7 +283,7 @@ static void vfio_iommu_map_notify(Notifier *n, void *data)
      * check that it did not truncate too much.
      */
     if (len & iotlb->addr_mask) {
-        error_report("iommu has granularity incompatible with target AS\n");
+        error_report("iommu has granularity incompatible with target AS");
         return;
     }
 
@@ -566,7 +566,7 @@ static void vfio_kvm_device_add_group(VFIOGroup *group)
         };
 
         if (kvm_vm_ioctl(kvm_state, KVM_CREATE_DEVICE, &cd)) {
-            error_report("Failed to create KVM VFIO device: %m\n");
+            error_report("Failed to create KVM VFIO device: %m");
             return;
         }
 
-- 
2.1.4


