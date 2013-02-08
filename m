Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3msK-0001GU-OB
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 07:16:16 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1U3msC-0000qh-9x
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 07:16:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1U3ms8-0007EM-U9
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 07:16:08 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:39000)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1U3mrw-00079r-Na; Fri, 08 Feb 2013 07:15:53 -0500
Received: from blackfin.pond.sub.org (p5B32B25A.dip.t-dialin.net
	[91.50.178.90])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 385D3A247E;
	Fri,  8 Feb 2013 13:15:50 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7066C200AB; Fri,  8 Feb 2013 13:15:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  8 Feb 2013 13:15:46 +0100
Message-Id: <1360325749-1989-4-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1360325749-1989-1-git-send-email-armbru@redhat.com>
References: <1360325749-1989-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH for-1.4 3/6] error: Strip trailing '\n' from
	error string arguments (again)
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
X-List-Received-Date: Fri, 08 Feb 2013 12:16:12 -0000

Commit 6daf194d and be62a2eb got rid of a bunch, but they keep coming
back.  Tracked down with this Coccinelle semantic patch:

    @r@
	expression err, eno, cls, fmt;
	position p;
    @@
    (
	error_report(fmt, ...)@p
    |
	error_set(err, cls, fmt, ...)@p
    |
	error_set_errno(err, eno, cls, fmt, ...)@p
    |
	error_setg(err, fmt, ...)@p
    |
	error_setg_errno(err, eno, fmt, ...)@p
    )
    @script:python@
	fmt << r.fmt;
	p << r.p;
    @@
    if "\\n" in str(fmt):
	print "%s:%s:%s:%s" % (p[0].file, p[0].line, p[0].column, fmt)

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 block/gluster.c             |   2 +-
 hmp.c                       |   2 +-
 hw/9pfs/virtio-9p-proxy.c   |   2 +-
 hw/pci/pci.c                |   2 +-
 hw/qdev.c                   |   4 +-
 hw/qxl.c                    |   2 +-
 hw/vfio_pci.c               | 110 ++++++++++++++++++++++----------------------
 hw/vhost_net.c              |   4 +-
 migration.c                 |   2 +-
 qemu-char.c                 |   8 ++--
 target-i386/cpu.c           |  10 ++--
 target-ppc/translate_init.c |   2 +-
 ui/console.c                |   2 +-
 ui/input.c                  |   2 +-
 util/qemu-config.c          |   6 +--
 util/qemu-sockets.c         |   6 +--
 16 files changed, 83 insertions(+), 83 deletions(-)

diff --git a/block/gluster.c b/block/gluster.c
index 0f2c32a..ccd684d 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -217,7 +217,7 @@ static struct glfs *qemu_gluster_init(GlusterConf *gconf, const char *filename)
     ret = glfs_init(glfs);
     if (ret) {
         error_report("Gluster connection failed for server=%s port=%d "
-             "volume=%s image=%s transport=%s\n", gconf->server, gconf->port,
+             "volume=%s image=%s transport=%s", gconf->server, gconf->port,
              gconf->volname, gconf->image, gconf->transport);
         goto out;
     }
diff --git a/hmp.c b/hmp.c
index 420d48b..2f47a8a 100644
--- a/hmp.c
+++ b/hmp.c
@@ -1365,7 +1365,7 @@ void hmp_chardev_add(Monitor *mon, const QDict *qdict)
 
     opts = qemu_opts_parse(qemu_find_opts("chardev"), args, 1);
     if (opts == NULL) {
-        error_setg(&err, "Parsing chardev args failed\n");
+        error_setg(&err, "Parsing chardev args failed");
     } else {
         qemu_chr_new_from_opts(opts, NULL, &err);
     }
diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
index d5ad208..54e9875 100644
--- a/hw/9pfs/virtio-9p-proxy.c
+++ b/hw/9pfs/virtio-9p-proxy.c
@@ -521,7 +521,7 @@ static int v9fs_request(V9fsProxy *proxy, int type,
         }
         break;
     default:
-        error_report("Invalid type %d\n", type);
+        error_report("Invalid type %d", type);
         retval = -EINVAL;
         break;
     }
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 905dc4a..2f45c8f 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1132,7 +1132,7 @@ PCIINTxRoute pci_device_route_intx_to_irq(PCIDevice *dev, int pin)
     } while (dev);
 
     if (!bus->route_intx_to_irq) {
-        error_report("PCI: Bug - unimplemented PCI INTx routing (%s)\n",
+        error_report("PCI: Bug - unimplemented PCI INTx routing (%s)",
                      object_get_typename(OBJECT(bus->qbus.parent)));
         return (PCIINTxRoute) { PCI_INTX_DISABLED, -1 };
     }
diff --git a/hw/qdev.c b/hw/qdev.c
index 8258757..689cd54 100644
--- a/hw/qdev.c
+++ b/hw/qdev.c
@@ -114,11 +114,11 @@ DeviceState *qdev_create(BusState *bus, const char *name)
     dev = qdev_try_create(bus, name);
     if (!dev) {
         if (bus) {
-            error_report("Unknown device '%s' for bus '%s'\n", name,
+            error_report("Unknown device '%s' for bus '%s'", name,
                          object_get_typename(OBJECT(bus)));
             abort();
         } else {
-            error_report("Unknown device '%s' for default sysbus\n", name);
+            error_report("Unknown device '%s' for default sysbus", name);
             abort();
         }
     }
diff --git a/hw/qxl.c b/hw/qxl.c
index a125e29..2e1c5e2 100644
--- a/hw/qxl.c
+++ b/hw/qxl.c
@@ -2036,7 +2036,7 @@ static int qxl_init_common(PCIQXLDevice *qxl)
     qxl->ssd.qxl.base.sif = &qxl_interface.base;
     qxl->ssd.qxl.id = qxl->id;
     if (qemu_spice_add_interface(&qxl->ssd.qxl.base) != 0) {
-        error_report("qxl interface %d.%d not supported by spice-server\n",
+        error_report("qxl interface %d.%d not supported by spice-server",
                      SPICE_INTERFACE_QXL_MAJOR, SPICE_INTERFACE_QXL_MINOR);
         return -1;
     }
diff --git a/hw/vfio_pci.c b/hw/vfio_pci.c
index a934f13..ad9ae36 100644
--- a/hw/vfio_pci.c
+++ b/hw/vfio_pci.c
@@ -289,7 +289,7 @@ static void vfio_enable_intx_kvm(VFIODevice *vdev)
 
     /* Get an eventfd for resample/unmask */
     if (event_notifier_init(&vdev->intx.unmask, 0)) {
-        error_report("vfio: Error: event_notifier_init failed eoi\n");
+        error_report("vfio: Error: event_notifier_init failed eoi");
         goto fail;
     }
 
@@ -297,7 +297,7 @@ static void vfio_enable_intx_kvm(VFIODevice *vdev)
     irqfd.resamplefd = event_notifier_get_fd(&vdev->intx.unmask);
 
     if (kvm_vm_ioctl(kvm_state, KVM_IRQFD, &irqfd)) {
-        error_report("vfio: Error: Failed to setup resample irqfd: %m\n");
+        error_report("vfio: Error: Failed to setup resample irqfd: %m");
         goto fail_irqfd;
     }
 
@@ -316,7 +316,7 @@ static void vfio_enable_intx_kvm(VFIODevice *vdev)
     ret = ioctl(vdev->fd, VFIO_DEVICE_SET_IRQS, irq_set);
     g_free(irq_set);
     if (ret) {
-        error_report("vfio: Error: Failed to setup INTx unmask fd: %m\n");
+        error_report("vfio: Error: Failed to setup INTx unmask fd: %m");
         goto fail_vfio;
     }
 
@@ -365,7 +365,7 @@ static void vfio_disable_intx_kvm(VFIODevice *vdev)
 
     /* Tell KVM to stop listening for an INTx irqfd */
     if (kvm_vm_ioctl(kvm_state, KVM_IRQFD, &irqfd)) {
-        error_report("vfio: Error: Failed to disable INTx irqfd: %m\n");
+        error_report("vfio: Error: Failed to disable INTx irqfd: %m");
     }
 
     /* We only need to close the eventfd for VFIO to cleanup the kernel side */
@@ -447,7 +447,7 @@ static int vfio_enable_intx(VFIODevice *vdev)
 
     ret = event_notifier_init(&vdev->intx.interrupt, 0);
     if (ret) {
-        error_report("vfio: Error: event_notifier_init failed\n");
+        error_report("vfio: Error: event_notifier_init failed");
         return ret;
     }
 
@@ -467,7 +467,7 @@ static int vfio_enable_intx(VFIODevice *vdev)
     ret = ioctl(vdev->fd, VFIO_DEVICE_SET_IRQS, irq_set);
     g_free(irq_set);
     if (ret) {
-        error_report("vfio: Error: Failed to setup INTx fd: %m\n");
+        error_report("vfio: Error: Failed to setup INTx fd: %m");
         qemu_set_fd_handler(*pfd, NULL, NULL, vdev);
         event_notifier_cleanup(&vdev->intx.interrupt);
         return -errno;
@@ -526,7 +526,7 @@ static void vfio_msi_interrupt(void *opaque)
     } else if (vdev->interrupt == VFIO_INT_MSI) {
         msi_notify(&vdev->pdev, nr);
     } else {
-        error_report("vfio: MSI interrupt receieved, but not enabled?\n");
+        error_report("vfio: MSI interrupt receieved, but not enabled?");
     }
 }
 
@@ -580,7 +580,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
     msix_vector_use(pdev, nr);
 
     if (event_notifier_init(&vector->interrupt, 0)) {
-        error_report("vfio: Error: event_notifier_init failed\n");
+        error_report("vfio: Error: event_notifier_init failed");
     }
 
     /*
@@ -609,7 +609,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
         vdev->nr_vectors = nr + 1;
         ret = vfio_enable_vectors(vdev, true);
         if (ret) {
-            error_report("vfio: failed to enable vectors, %d\n", ret);
+            error_report("vfio: failed to enable vectors, %d", ret);
         }
     } else {
         int argsz;
@@ -632,7 +632,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
         ret = ioctl(vdev->fd, VFIO_DEVICE_SET_IRQS, irq_set);
         g_free(irq_set);
         if (ret) {
-            error_report("vfio: failed to modify vector, %d\n", ret);
+            error_report("vfio: failed to modify vector, %d", ret);
         }
     }
 
@@ -721,7 +721,7 @@ static void vfio_enable_msix(VFIODevice *vdev)
 
     if (msix_set_vector_notifiers(&vdev->pdev, vfio_msix_vector_use,
                                   vfio_msix_vector_release, NULL)) {
-        error_report("vfio: msix_set_vector_notifiers failed\n");
+        error_report("vfio: msix_set_vector_notifiers failed");
     }
 
     DPRINTF("%s(%04x:%02x:%02x.%x)\n", __func__, vdev->host.domain,
@@ -746,7 +746,7 @@ retry:
         vector->use = true;
 
         if (event_notifier_init(&vector->interrupt, 0)) {
-            error_report("vfio: Error: event_notifier_init failed\n");
+            error_report("vfio: Error: event_notifier_init failed");
         }
 
         msg = msi_get_message(&vdev->pdev, i);
@@ -767,10 +767,10 @@ retry:
     ret = vfio_enable_vectors(vdev, false);
     if (ret) {
         if (ret < 0) {
-            error_report("vfio: Error: Failed to setup MSI fds: %m\n");
+            error_report("vfio: Error: Failed to setup MSI fds: %m");
         } else if (ret != vdev->nr_vectors) {
             error_report("vfio: Error: Failed to enable %d "
-                         "MSI vectors, retry with %d\n", vdev->nr_vectors, ret);
+                         "MSI vectors, retry with %d", vdev->nr_vectors, ret);
         }
 
         for (i = 0; i < vdev->nr_vectors; i++) {
@@ -891,7 +891,7 @@ static void vfio_bar_write(void *opaque, hwaddr addr,
     }
 
     if (pwrite(bar->fd, &buf, size, bar->fd_offset + addr) != size) {
-        error_report("%s(,0x%"HWADDR_PRIx", 0x%"PRIx64", %d) failed: %m\n",
+        error_report("%s(,0x%"HWADDR_PRIx", 0x%"PRIx64", %d) failed: %m",
                      __func__, addr, data, size);
     }
 
@@ -922,7 +922,7 @@ static uint64_t vfio_bar_read(void *opaque,
     uint64_t data = 0;
 
     if (pread(bar->fd, &buf, size, bar->fd_offset + addr) != size) {
-        error_report("%s(,0x%"HWADDR_PRIx", %d) failed: %m\n",
+        error_report("%s(,0x%"HWADDR_PRIx", %d) failed: %m",
                      __func__, addr, size);
         return (uint64_t)-1;
     }
@@ -979,7 +979,7 @@ static uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
         val = pci_default_read_config(pdev, addr, len);
     } else {
         if (pread(vdev->fd, &val, len, vdev->config_offset + addr) != len) {
-            error_report("%s(%04x:%02x:%02x.%x, 0x%x, 0x%x) failed: %m\n",
+            error_report("%s(%04x:%02x:%02x.%x, 0x%x, 0x%x) failed: %m",
                          __func__, vdev->host.domain, vdev->host.bus,
                          vdev->host.slot, vdev->host.function, addr, len);
             return -errno;
@@ -1021,7 +1021,7 @@ static void vfio_pci_write_config(PCIDevice *pdev, uint32_t addr,
 
     /* Write everything to VFIO, let it filter out what we can't write */
     if (pwrite(vdev->fd, &val_le, len, vdev->config_offset + addr) != len) {
-        error_report("%s(%04x:%02x:%02x.%x, 0x%x, 0x%x, 0x%x) failed: %m\n",
+        error_report("%s(%04x:%02x:%02x.%x, 0x%x, 0x%x, 0x%x) failed: %m",
                      __func__, vdev->host.domain, vdev->host.bus,
                      vdev->host.slot, vdev->host.function, addr, val, len);
     }
@@ -1138,7 +1138,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
 
     if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
                  (section->offset_within_region & ~TARGET_PAGE_MASK))) {
-        error_report("%s received unaligned region\n", __func__);
+        error_report("%s received unaligned region", __func__);
         return;
     }
 
@@ -1160,7 +1160,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
     ret = vfio_dma_map(container, iova, end - iova, vaddr, section->readonly);
     if (ret) {
         error_report("vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
-                     "0x%"HWADDR_PRIx", %p) = %d (%m)\n",
+                     "0x%"HWADDR_PRIx", %p) = %d (%m)",
                      container, iova, end - iova, vaddr, ret);
     }
 }
@@ -1182,7 +1182,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
 
     if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
                  (section->offset_within_region & ~TARGET_PAGE_MASK))) {
-        error_report("%s received unaligned region\n", __func__);
+        error_report("%s received unaligned region", __func__);
         return;
     }
 
@@ -1200,7 +1200,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
     ret = vfio_dma_unmap(container, iova, end - iova);
     if (ret) {
         error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
-                     "0x%"HWADDR_PRIx") = %d (%m)\n",
+                     "0x%"HWADDR_PRIx") = %d (%m)",
                      container, iova, end - iova, ret);
     }
 }
@@ -1257,7 +1257,7 @@ static int vfio_setup_msi(VFIODevice *vdev, int pos)
         if (ret == -ENOTSUP) {
             return 0;
         }
-        error_report("vfio: msi_init failed\n");
+        error_report("vfio: msi_init failed");
         return ret;
     }
     vdev->msi_cap_size = 0xa + (msi_maskbit ? 0xa : 0) + (msi_64bit ? 0x4 : 0);
@@ -1332,7 +1332,7 @@ static int vfio_setup_msix(VFIODevice *vdev, int pos)
         if (ret == -ENOTSUP) {
             return 0;
         }
-        error_report("vfio: msix_init failed\n");
+        error_report("vfio: msix_init failed");
         return ret;
     }
 
@@ -1448,7 +1448,7 @@ static void vfio_map_bar(VFIODevice *vdev, int nr)
     ret = pread(vdev->fd, &pci_bar, sizeof(pci_bar),
                 vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * nr));
     if (ret != sizeof(pci_bar)) {
-        error_report("vfio: Failed to read BAR %d (%m)\n", nr);
+        error_report("vfio: Failed to read BAR %d (%m)", nr);
         return;
     }
 
@@ -1471,7 +1471,7 @@ static void vfio_map_bar(VFIODevice *vdev, int nr)
     strncat(name, " mmap", sizeof(name) - strlen(name) - 1);
     if (vfio_mmap_bar(bar, &bar->mem,
                       &bar->mmap_mem, &bar->mmap, size, 0, name)) {
-        error_report("%s unsupported. Performance may be slow\n", name);
+        error_report("%s unsupported. Performance may be slow", name);
     }
 
     if (vdev->msix && vdev->msix->table_bar == nr) {
@@ -1485,7 +1485,7 @@ static void vfio_map_bar(VFIODevice *vdev, int nr)
         /* VFIOMSIXInfo contains another MemoryRegion for this mapping */
         if (vfio_mmap_bar(bar, &bar->mem, &vdev->msix->mmap_mem,
                           &vdev->msix->mmap, size, start, name)) {
-            error_report("%s unsupported. Performance may be slow\n", name);
+            error_report("%s unsupported. Performance may be slow", name);
         }
     }
 }
@@ -1572,7 +1572,7 @@ static int vfio_add_std_cap(VFIODevice *vdev, uint8_t pos)
 
     if (ret < 0) {
         error_report("vfio: %04x:%02x:%02x.%x Error adding PCI capability "
-                     "0x%x[0x%x]@0x%x: %d\n", vdev->host.domain,
+                     "0x%x[0x%x]@0x%x: %d", vdev->host.domain,
                      vdev->host.bus, vdev->host.slot, vdev->host.function,
                      cap_id, size, pos, ret);
         return ret;
@@ -1627,7 +1627,7 @@ static int vfio_load_rom(VFIODevice *vdev)
             if (errno == EINTR || errno == EAGAIN) {
                 continue;
             }
-            error_report("vfio: Error reading device ROM: %m\n");
+            error_report("vfio: Error reading device ROM: %m");
             memory_region_destroy(&vdev->pdev.rom);
             return -errno;
         }
@@ -1657,14 +1657,14 @@ static int vfio_connect_container(VFIOGroup *group)
 
     fd = qemu_open("/dev/vfio/vfio", O_RDWR);
     if (fd < 0) {
-        error_report("vfio: failed to open /dev/vfio/vfio: %m\n");
+        error_report("vfio: failed to open /dev/vfio/vfio: %m");
         return -errno;
     }
 
     ret = ioctl(fd, VFIO_GET_API_VERSION);
     if (ret != VFIO_API_VERSION) {
         error_report("vfio: supported vfio version: %d, "
-                     "reported version: %d\n", VFIO_API_VERSION, ret);
+                     "reported version: %d", VFIO_API_VERSION, ret);
         close(fd);
         return -EINVAL;
     }
@@ -1675,7 +1675,7 @@ static int vfio_connect_container(VFIOGroup *group)
     if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1_IOMMU)) {
         ret = ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &fd);
         if (ret) {
-            error_report("vfio: failed to set group container: %m\n");
+            error_report("vfio: failed to set group container: %m");
             g_free(container);
             close(fd);
             return -errno;
@@ -1683,7 +1683,7 @@ static int vfio_connect_container(VFIOGroup *group)
 
         ret = ioctl(fd, VFIO_SET_IOMMU, VFIO_TYPE1_IOMMU);
         if (ret) {
-            error_report("vfio: failed to set iommu for container: %m\n");
+            error_report("vfio: failed to set iommu for container: %m");
             g_free(container);
             close(fd);
             return -errno;
@@ -1694,7 +1694,7 @@ static int vfio_connect_container(VFIOGroup *group)
 
         memory_listener_register(&container->iommu_data.listener, &address_space_memory);
     } else {
-        error_report("vfio: No available IOMMU models\n");
+        error_report("vfio: No available IOMMU models");
         g_free(container);
         close(fd);
         return -EINVAL;
@@ -1714,7 +1714,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
     VFIOContainer *container = group->container;
 
     if (ioctl(group->fd, VFIO_GROUP_UNSET_CONTAINER, &container->fd)) {
-        error_report("vfio: error disconnecting group %d from container\n",
+        error_report("vfio: error disconnecting group %d from container",
                      group->groupid);
     }
 
@@ -1749,13 +1749,13 @@ static VFIOGroup *vfio_get_group(int groupid)
     snprintf(path, sizeof(path), "/dev/vfio/%d", groupid);
     group->fd = qemu_open(path, O_RDWR);
     if (group->fd < 0) {
-        error_report("vfio: error opening %s: %m\n", path);
+        error_report("vfio: error opening %s: %m", path);
         g_free(group);
         return NULL;
     }
 
     if (ioctl(group->fd, VFIO_GROUP_GET_STATUS, &status)) {
-        error_report("vfio: error getting group status: %m\n");
+        error_report("vfio: error getting group status: %m");
         close(group->fd);
         g_free(group);
         return NULL;
@@ -1764,7 +1764,7 @@ static VFIOGroup *vfio_get_group(int groupid)
     if (!(status.flags & VFIO_GROUP_FLAGS_VIABLE)) {
         error_report("vfio: error, group %d is not viable, please ensure "
                      "all devices within the iommu_group are bound to their "
-                     "vfio bus driver.\n", groupid);
+                     "vfio bus driver.", groupid);
         close(group->fd);
         g_free(group);
         return NULL;
@@ -1774,7 +1774,7 @@ static VFIOGroup *vfio_get_group(int groupid)
     QLIST_INIT(&group->device_list);
 
     if (vfio_connect_container(group)) {
-        error_report("vfio: failed to setup container for group %d\n", groupid);
+        error_report("vfio: failed to setup container for group %d", groupid);
         close(group->fd);
         g_free(group);
         return NULL;
@@ -1820,7 +1820,7 @@ static int vfio_get_device(VFIOGroup *group, const char *name, VFIODevice *vdev)
     /* Sanity check device */
     ret = ioctl(vdev->fd, VFIO_DEVICE_GET_INFO, &dev_info);
     if (ret) {
-        error_report("vfio: error getting device info: %m\n");
+        error_report("vfio: error getting device info: %m");
         goto error;
     }
 
@@ -1828,23 +1828,23 @@ static int vfio_get_device(VFIOGroup *group, const char *name, VFIODevice *vdev)
             dev_info.flags, dev_info.num_regions, dev_info.num_irqs);
 
     if (!(dev_info.flags & VFIO_DEVICE_FLAGS_PCI)) {
-        error_report("vfio: Um, this isn't a PCI device\n");
+        error_report("vfio: Um, this isn't a PCI device");
         goto error;
     }
 
     vdev->reset_works = !!(dev_info.flags & VFIO_DEVICE_FLAGS_RESET);
     if (!vdev->reset_works) {
-        error_report("Warning, device %s does not support reset\n", name);
+        error_report("Warning, device %s does not support reset", name);
     }
 
     if (dev_info.num_regions < VFIO_PCI_CONFIG_REGION_INDEX + 1) {
-        error_report("vfio: unexpected number of io regions %u\n",
+        error_report("vfio: unexpected number of io regions %u",
                      dev_info.num_regions);
         goto error;
     }
 
     if (dev_info.num_irqs < VFIO_PCI_MSIX_IRQ_INDEX + 1) {
-        error_report("vfio: unexpected number of irqs %u\n", dev_info.num_irqs);
+        error_report("vfio: unexpected number of irqs %u", dev_info.num_irqs);
         goto error;
     }
 
@@ -1853,7 +1853,7 @@ static int vfio_get_device(VFIOGroup *group, const char *name, VFIODevice *vdev)
 
         ret = ioctl(vdev->fd, VFIO_DEVICE_GET_REGION_INFO, &reg_info);
         if (ret) {
-            error_report("vfio: Error getting region %d info: %m\n", i);
+            error_report("vfio: Error getting region %d info: %m", i);
             goto error;
         }
 
@@ -1873,7 +1873,7 @@ static int vfio_get_device(VFIOGroup *group, const char *name, VFIODevice *vdev)
 
     ret = ioctl(vdev->fd, VFIO_DEVICE_GET_REGION_INFO, &reg_info);
     if (ret) {
-        error_report("vfio: Error getting ROM info: %m\n");
+        error_report("vfio: Error getting ROM info: %m");
         goto error;
     }
 
@@ -1889,7 +1889,7 @@ static int vfio_get_device(VFIOGroup *group, const char *name, VFIODevice *vdev)
 
     ret = ioctl(vdev->fd, VFIO_DEVICE_GET_REGION_INFO, &reg_info);
     if (ret) {
-        error_report("vfio: Error getting config info: %m\n");
+        error_report("vfio: Error getting config info: %m");
         goto error;
     }
 
@@ -1941,7 +1941,7 @@ static int vfio_initfn(PCIDevice *pdev)
              vdev->host.domain, vdev->host.bus, vdev->host.slot,
              vdev->host.function);
     if (stat(path, &st) < 0) {
-        error_report("vfio: error: no such host device: %s\n", path);
+        error_report("vfio: error: no such host device: %s", path);
         return -errno;
     }
 
@@ -1949,7 +1949,7 @@ static int vfio_initfn(PCIDevice *pdev)
 
     len = readlink(path, iommu_group_path, PATH_MAX);
     if (len <= 0) {
-        error_report("vfio: error no iommu_group for device\n");
+        error_report("vfio: error no iommu_group for device");
         return -errno;
     }
 
@@ -1957,7 +1957,7 @@ static int vfio_initfn(PCIDevice *pdev)
     group_name = basename(iommu_group_path);
 
     if (sscanf(group_name, "%d", &groupid) != 1) {
-        error_report("vfio: error reading %s: %m\n", path);
+        error_report("vfio: error reading %s: %m", path);
         return -errno;
     }
 
@@ -1966,7 +1966,7 @@ static int vfio_initfn(PCIDevice *pdev)
 
     group = vfio_get_group(groupid);
     if (!group) {
-        error_report("vfio: failed to get group %d\n", groupid);
+        error_report("vfio: failed to get group %d", groupid);
         return -ENOENT;
     }
 
@@ -1980,7 +1980,7 @@ static int vfio_initfn(PCIDevice *pdev)
             pvdev->host.slot == vdev->host.slot &&
             pvdev->host.function == vdev->host.function) {
 
-            error_report("vfio: error: device %s is already attached\n", path);
+            error_report("vfio: error: device %s is already attached", path);
             vfio_put_group(group);
             return -EBUSY;
         }
@@ -1988,7 +1988,7 @@ static int vfio_initfn(PCIDevice *pdev)
 
     ret = vfio_get_device(group, path, vdev);
     if (ret) {
-        error_report("vfio: failed to get device %s\n", path);
+        error_report("vfio: failed to get device %s", path);
         vfio_put_group(group);
         return ret;
     }
@@ -1999,7 +1999,7 @@ static int vfio_initfn(PCIDevice *pdev)
                 vdev->config_offset);
     if (ret < (int)MIN(pci_config_size(&vdev->pdev), vdev->config_size)) {
         ret = ret < 0 ? -errno : -EFAULT;
-        error_report("vfio: Failed to read device config space\n");
+        error_report("vfio: Failed to read device config space");
         goto out_put;
     }
 
@@ -2086,7 +2086,7 @@ static void vfio_pci_reset(DeviceState *dev)
     if (vdev->reset_works) {
         if (ioctl(vdev->fd, VFIO_DEVICE_RESET)) {
             error_report("vfio: Error unable to reset physical device "
-                         "(%04x:%02x:%02x.%x): %m\n", vdev->host.domain,
+                         "(%04x:%02x:%02x.%x): %m", vdev->host.domain,
                          vdev->host.bus, vdev->host.slot, vdev->host.function);
         }
     }
diff --git a/hw/vhost_net.c b/hw/vhost_net.c
index 8693ac2..d1df0e2 100644
--- a/hw/vhost_net.c
+++ b/hw/vhost_net.c
@@ -214,7 +214,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
     int r, i = 0;
 
     if (!dev->binding->set_guest_notifiers) {
-        error_report("binding does not support guest notifiers\n");
+        error_report("binding does not support guest notifiers");
         r = -ENOSYS;
         goto err;
     }
@@ -231,7 +231,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
                                           total_queues * 2,
                                           true);
     if (r < 0) {
-        error_report("Error binding guest notifier: %d\n", -r);
+        error_report("Error binding guest notifier: %d", -r);
         goto err;
     }
 
diff --git a/migration.c b/migration.c
index 77c1971..c4589b1 100644
--- a/migration.c
+++ b/migration.c
@@ -85,7 +85,7 @@ void qemu_start_incoming_migration(const char *uri, Error **errp)
         fd_start_incoming_migration(p, errp);
 #endif
     else {
-        error_setg(errp, "unknown migration protocol: %s\n", uri);
+        error_setg(errp, "unknown migration protocol: %s", uri);
     }
 }
 
diff --git a/qemu-char.c b/qemu-char.c
index a3ba021..574d3d2 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -3021,12 +3021,12 @@ CharDriverState *qemu_chr_new_from_opts(QemuOpts *opts,
     int i;
 
     if (qemu_opts_id(opts) == NULL) {
-        error_setg(errp, "chardev: no id specified\n");
+        error_setg(errp, "chardev: no id specified");
         goto err;
     }
 
     if (qemu_opt_get(opts, "backend") == NULL) {
-        error_setg(errp, "chardev: \"%s\" missing backend\n",
+        error_setg(errp, "chardev: \"%s\" missing backend",
                    qemu_opts_id(opts));
         goto err;
     }
@@ -3035,14 +3035,14 @@ CharDriverState *qemu_chr_new_from_opts(QemuOpts *opts,
             break;
     }
     if (i == ARRAY_SIZE(backend_table)) {
-        error_setg(errp, "chardev: backend \"%s\" not found\n",
+        error_setg(errp, "chardev: backend \"%s\" not found",
                    qemu_opt_get(opts, "backend"));
         goto err;
     }
 
     chr = backend_table[i].open(opts);
     if (!chr) {
-        error_setg(errp, "chardev: opening backend \"%s\" failed\n",
+        error_setg(errp, "chardev: opening backend \"%s\" failed",
                    qemu_opt_get(opts, "backend"));
         goto err;
     }
diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 5c108e1..aab35c7 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -1333,7 +1333,7 @@ static void cpu_x86_parse_featurestr(X86CPU *cpu, char *features, Error **errp)
 
                 numvalue = strtoul(val, &err, 0);
                 if (!*val || *err) {
-                    error_setg(errp, "bad numerical value %s\n", val);
+                    error_setg(errp, "bad numerical value %s", val);
                     goto out;
                 }
                 if (numvalue < 0x80000000) {
@@ -1355,7 +1355,7 @@ static void cpu_x86_parse_featurestr(X86CPU *cpu, char *features, Error **errp)
                 tsc_freq = strtosz_suffix_unit(val, &err,
                                                STRTOSZ_DEFSUFFIX_B, 1000);
                 if (tsc_freq < 0 || *err) {
-                    error_setg(errp, "bad numerical value %s\n", val);
+                    error_setg(errp, "bad numerical value %s", val);
                     goto out;
                 }
                 snprintf(num, sizeof(num), "%" PRId64, tsc_freq);
@@ -1364,12 +1364,12 @@ static void cpu_x86_parse_featurestr(X86CPU *cpu, char *features, Error **errp)
                 char *err;
                 numvalue = strtoul(val, &err, 0);
                 if (!*val || *err) {
-                    error_setg(errp, "bad numerical value %s\n", val);
+                    error_setg(errp, "bad numerical value %s", val);
                     goto out;
                 }
                 hyperv_set_spinlock_retries(numvalue);
             } else {
-                error_setg(errp, "unrecognized feature %s\n", featurestr);
+                error_setg(errp, "unrecognized feature %s", featurestr);
                 goto out;
             }
         } else if (!strcmp(featurestr, "check")) {
@@ -1382,7 +1382,7 @@ static void cpu_x86_parse_featurestr(X86CPU *cpu, char *features, Error **errp)
             hyperv_enable_vapic_recommended(true);
         } else {
             error_setg(errp, "feature string `%s' not in format (+feature|"
-                       "-feature|feature=xyz)\n", featurestr);
+                       "-feature|feature=xyz)", featurestr);
             goto out;
         }
         if (error_is_set(errp)) {
diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
index f038850..6cebaa1 100644
--- a/target-ppc/translate_init.c
+++ b/target-ppc/translate_init.c
@@ -9806,7 +9806,7 @@ static void create_ppc_opcodes(PowerPCCPU *cpu, Error **errp)
             ((opc->handler.type2 & def->insns_flags2) != 0)) {
             if (register_insn(env->opcodes, opc) < 0) {
                 error_setg(errp, "ERROR initializing PowerPC instruction "
-                           "0x%02x 0x%02x 0x%02x\n", opc->opc1, opc->opc2,
+                           "0x%02x 0x%02x 0x%02x", opc->opc1, opc->opc2,
                            opc->opc3);
                 return;
             }
diff --git a/ui/console.c b/ui/console.c
index d880ebf..0a68836 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -194,7 +194,7 @@ void qmp_screendump(const char *filename, Error **errp)
     if (consoles[0] && consoles[0]->hw_screen_dump) {
         consoles[0]->hw_screen_dump(consoles[0]->hw, filename, cswitch, errp);
     } else {
-        error_setg(errp, "device doesn't support screendump\n");
+        error_setg(errp, "device doesn't support screendump");
     }
 
     if (cswitch) {
diff --git a/ui/input.c b/ui/input.c
index 259fd18..9abef0c 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -269,7 +269,7 @@ void qmp_send_key(KeyValueList *keys, bool has_hold_time, int64_t hold_time,
         /* key down events */
         keycode = keycode_from_keyvalue(p->value);
         if (keycode < 0x01 || keycode > 0xff) {
-            error_setg(errp, "invalid hex keycode 0x%x\n", keycode);
+            error_setg(errp, "invalid hex keycode 0x%x", keycode);
             free_keycodes();
             return;
         }
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 47c81f7..db6ec03 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -29,7 +29,7 @@ QemuOptsList *qemu_find_opts(const char *group)
 
     ret = find_list(vm_config_groups, group, &local_err);
     if (error_is_set(&local_err)) {
-        error_report("%s\n", error_get_pretty(local_err));
+        error_report("%s", error_get_pretty(local_err));
         error_free(local_err);
     }
 
@@ -153,7 +153,7 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
             /* group with id */
             list = find_list(lists, group, &local_err);
             if (error_is_set(&local_err)) {
-                error_report("%s\n", error_get_pretty(local_err));
+                error_report("%s", error_get_pretty(local_err));
                 error_free(local_err);
                 goto out;
             }
@@ -164,7 +164,7 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
             /* group without id */
             list = find_list(lists, group, &local_err);
             if (error_is_set(&local_err)) {
-                error_report("%s\n", error_get_pretty(local_err));
+                error_report("%s", error_get_pretty(local_err));
                 error_free(local_err);
                 goto out;
             }
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 3537bf3..1350ccc 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -720,7 +720,7 @@ int unix_connect_opts(QemuOpts *opts, Error **errp,
     int sock, rc;
 
     if (NULL == path) {
-        error_setg(errp, "unix connect: no path specified\n");
+        error_setg(errp, "unix connect: no path specified");
         return -1;
     }
 
@@ -854,7 +854,7 @@ SocketAddress *socket_parse(const char *str, Error **errp)
     addr = g_new(SocketAddress, 1);
     if (strstart(str, "unix:", NULL)) {
         if (str[5] == '\0') {
-            error_setg(errp, "invalid Unix socket address\n");
+            error_setg(errp, "invalid Unix socket address");
             goto fail;
         } else {
             addr->kind = SOCKET_ADDRESS_KIND_UNIX;
@@ -863,7 +863,7 @@ SocketAddress *socket_parse(const char *str, Error **errp)
         }
     } else if (strstart(str, "fd:", NULL)) {
         if (str[3] == '\0') {
-            error_setg(errp, "invalid file descriptor address\n");
+            error_setg(errp, "invalid file descriptor address");
             goto fail;
         } else {
             addr->kind = SOCKET_ADDRESS_KIND_FD;
-- 
1.7.11.7


