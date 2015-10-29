Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZrpQ2-0007dO-Fo
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 11:47:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZrpPv-0007bM-1x
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 11:47:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZrpPt-0004uA-U5
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 11:47:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48433)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZrpPp-0004tg-1E; Thu, 29 Oct 2015 11:47:01 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 1A5438F263;
	Thu, 29 Oct 2015 15:46:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-44.ams2.redhat.com
	[10.36.116.44])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9TFkvg7025397
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 29 Oct 2015 11:46:59 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 1FA88303F916; Thu, 29 Oct 2015 16:46:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Oct 2015 16:46:57 +0100
Message-Id: <1446133617-30840-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, alex.williamson@redhat.com
Subject: [Qemu-trivial] [PATCH] vfio: Use g_new() & friends where that makes
	obvious sense
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
X-List-Received-Date: Thu, 29 Oct 2015 15:47:13 -0000

g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
for two reasons.  One, it catches multiplication overflowing size_t.
Two, it returns T * rather than void *, which lets the compiler catch
more type errors.

This commit only touches allocations with size arguments of the form
sizeof(T).  Same Coccinelle semantic patch as in commit b45c03f.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/vfio/pci-quirks.c | 16 ++++++++--------
 hw/vfio/pci.c        |  4 ++--
 hw/vfio/platform.c   |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index c675d1b..30c68a1 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -284,7 +284,7 @@ static void vfio_vga_probe_ati_3c3_quirk(VFIOPCIDevice *vdev)
     }
 
     quirk = g_malloc0(sizeof(*quirk));
-    quirk->mem = g_malloc0(sizeof(MemoryRegion));
+    quirk->mem = g_new0(MemoryRegion, 1);
     quirk->nr_mem = 1;
 
     memory_region_init_io(quirk->mem, OBJECT(vdev), &vfio_ati_3c3_quirk, vdev,
@@ -319,7 +319,7 @@ static void vfio_probe_ati_bar4_quirk(VFIOPCIDevice *vdev, int nr)
     }
 
     quirk = g_malloc0(sizeof(*quirk));
-    quirk->mem = g_malloc0(sizeof(MemoryRegion) * 2);
+    quirk->mem = g_new0(MemoryRegion, 2);
     quirk->nr_mem = 2;
     window = quirk->data = g_malloc0(sizeof(*window) +
                                      sizeof(VFIOConfigWindowMatch));
@@ -368,7 +368,7 @@ static void vfio_probe_ati_bar2_quirk(VFIOPCIDevice *vdev, int nr)
 
     quirk = g_malloc0(sizeof(*quirk));
     mirror = quirk->data = g_malloc0(sizeof(*mirror));
-    mirror->mem = quirk->mem = g_malloc0(sizeof(MemoryRegion));
+    mirror->mem = quirk->mem = g_new0(MemoryRegion, 1);
     quirk->nr_mem = 1;
     mirror->vdev = vdev;
     mirror->offset = 0x4000;
@@ -544,7 +544,7 @@ static void vfio_vga_probe_nvidia_3d0_quirk(VFIOPCIDevice *vdev)
 
     quirk = g_malloc0(sizeof(*quirk));
     quirk->data = data = g_malloc0(sizeof(*data));
-    quirk->mem = g_malloc0(sizeof(MemoryRegion) * 2);
+    quirk->mem = g_new0(MemoryRegion, 2);
     quirk->nr_mem = 2;
     data->vdev = vdev;
 
@@ -661,7 +661,7 @@ static void vfio_probe_nvidia_bar5_quirk(VFIOPCIDevice *vdev, int nr)
     }
 
     quirk = g_malloc0(sizeof(*quirk));
-    quirk->mem = g_malloc0(sizeof(MemoryRegion) * 4);
+    quirk->mem = g_new0(MemoryRegion, 4);
     quirk->nr_mem = 4;
     bar5 = quirk->data = g_malloc0(sizeof(*bar5) +
                                    (sizeof(VFIOConfigWindowMatch) * 2));
@@ -756,7 +756,7 @@ static void vfio_probe_nvidia_bar0_quirk(VFIOPCIDevice *vdev, int nr)
 
     quirk = g_malloc0(sizeof(*quirk));
     mirror = quirk->data = g_malloc0(sizeof(*mirror));
-    mirror->mem = quirk->mem = g_malloc0(sizeof(MemoryRegion));
+    mirror->mem = quirk->mem = g_new0(MemoryRegion, 1);
     quirk->nr_mem = 1;
     mirror->vdev = vdev;
     mirror->offset = 0x88000;
@@ -775,7 +775,7 @@ static void vfio_probe_nvidia_bar0_quirk(VFIOPCIDevice *vdev, int nr)
     if (vdev->has_vga) {
         quirk = g_malloc0(sizeof(*quirk));
         mirror = quirk->data = g_malloc0(sizeof(*mirror));
-        mirror->mem = quirk->mem = g_malloc0(sizeof(MemoryRegion));
+        mirror->mem = quirk->mem = g_new0(MemoryRegion, 1);
         quirk->nr_mem = 1;
         mirror->vdev = vdev;
         mirror->offset = 0x1800;
@@ -938,7 +938,7 @@ static void vfio_probe_rtl8168_bar2_quirk(VFIOPCIDevice *vdev, int nr)
     }
 
     quirk = g_malloc0(sizeof(*quirk));
-    quirk->mem = g_malloc0(sizeof(MemoryRegion) * 2);
+    quirk->mem = g_new0(MemoryRegion, 2);
     quirk->nr_mem = 2;
     quirk->data = rtl = g_malloc0(sizeof(*rtl));
     rtl->vdev = vdev;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 8fadbcf..e34c0c1 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -586,7 +586,7 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
 {
     vfio_disable_interrupts(vdev);
 
-    vdev->msi_vectors = g_malloc0(vdev->msix->entries * sizeof(VFIOMSIVector));
+    vdev->msi_vectors = g_new0(VFIOMSIVector, vdev->msix->entries);
 
     vdev->interrupt = VFIO_INT_MSIX;
 
@@ -622,7 +622,7 @@ static void vfio_msi_enable(VFIOPCIDevice *vdev)
 
     vdev->nr_vectors = msi_nr_vectors_allocated(&vdev->pdev);
 retry:
-    vdev->msi_vectors = g_malloc0(vdev->nr_vectors * sizeof(VFIOMSIVector));
+    vdev->msi_vectors = g_new0(VFIOMSIVector, vdev->nr_vectors);
 
     for (i = 0; i < vdev->nr_vectors; i++) {
         VFIOMSIVector *vector = &vdev->msi_vectors[i];
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index 5c1156c..289b498 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -478,7 +478,7 @@ static int vfio_populate_device(VFIODevice *vbasedev)
         struct vfio_region_info reg_info = { .argsz = sizeof(reg_info) };
         VFIORegion *ptr;
 
-        vdev->regions[i] = g_malloc0(sizeof(VFIORegion));
+        vdev->regions[i] = g_new0(VFIORegion, 1);
         ptr = vdev->regions[i];
         reg_info.index = i;
         ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, &reg_info);
-- 
2.4.3


