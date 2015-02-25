Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQTVl-0006HA-AS
	for mharc-qemu-trivial@gnu.org; Tue, 24 Feb 2015 23:23:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVZ-0005kF-P4
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVU-0006Wt-V6
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:37 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:35132)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YQTVJ-0006Pu-W6; Tue, 24 Feb 2015 23:23:22 -0500
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CJW53939; Wed, 25 Feb 2015 12:23:17 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 25 Feb 2015 12:23:11 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 25 Feb 2015 12:22:33 +0800
Message-ID: <1424838157-5524-8-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
References: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH v2 07/11] vfio: Remove superfluous '\n'
	around error_report()
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
X-List-Received-Date: Wed, 25 Feb 2015 04:23:42 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
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
1.7.12.4



