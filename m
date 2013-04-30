Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UX0Gh-0007oy-Jr
	for mharc-qemu-trivial@gnu.org; Mon, 29 Apr 2013 22:26:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UX0Ge-0007jl-3h
	for qemu-trivial@nongnu.org; Mon, 29 Apr 2013 22:26:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UX0Gb-0004Vl-E3
	for qemu-trivial@nongnu.org; Mon, 29 Apr 2013 22:26:08 -0400
Received: from mail-da0-x22c.google.com ([2607:f8b0:400e:c00::22c]:44541)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UX0Gb-0004VN-4I
	for qemu-trivial@nongnu.org; Mon, 29 Apr 2013 22:26:05 -0400
Received: by mail-da0-f44.google.com with SMTP id z20so24913dae.17
	for <qemu-trivial@nongnu.org>; Mon, 29 Apr 2013 19:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=2W6UCqxH7bKBVoBcoXBa33eI8F1LG8Ap7qp8yhYgLz0=;
	b=h4i1XFK7+DHA4aI6i75PHnHxPYHPyN1Pu9xt9dqPVSeAN9qkpb8IEewYNpge7wMaDq
	XEpE9wtlOFU+8qXx9b02GcwXEcV6MdJTIwGU8+Oxb668DbkJW0i9ULlV+e5N/O5oNaNz
	DgjlN/r+pbm7jT0yW1d/t2Biwpm92gQ0rBlg25UGelBS7vXuyCpoOmLgBvSGym32zt7n
	zYv7UU6IBfpVrtXma0cLTP9chLTDROyHoXT8e8xIVy3K7NXL231T3LMxXFARFkdP7VOx
	oTh6ur+UWpda/iM+xTTNDK4t2h9HClh7+XTdcpsReJchNjtAtSoaIruRYXXcSpWQ/e9I
	NQvw==
X-Received: by 10.68.245.6 with SMTP id xk6mr73807846pbc.41.1367288764069;
	Mon, 29 Apr 2013 19:26:04 -0700 (PDT)
Received: from ka1.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id
	dr6sm28348496pac.11.2013.04.29.19.26.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 19:26:02 -0700 (PDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 30 Apr 2013 12:25:51 +1000
Message-Id: <1367288751-25163-1-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmMOPIEy26iC2o1s96f4ZyHhLlIztDSU6PXfG2jE4oaKNHzpJ61+dcpouJwwxfvSJPCnhY3
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c00::22c
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-trivial] [PATCH v2] memory: give name every AddressSpace
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
X-List-Received-Date: Tue, 30 Apr 2013 02:26:10 -0000

The "info mtree" command in QEMU console prints only "memory" and "I/O"
address spaces while there are actually a lot more other AddressSpace
structs created by PCI and VIO devices. Those devices do not normally
have names and therefore not present in "info qtree" output.

The patch fixes this.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

v2:
* removed "const" from AddressSpace::name
* removed redundand check for name!=NULL from mtree_info

---
 exec.c                |    6 ++----
 hw/pci/pci.c          |    3 ++-
 hw/ppc/spapr_vio.c    |    2 +-
 include/exec/memory.h |    5 +++--
 memory.c              |   10 ++++------
 5 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/exec.c b/exec.c
index 180a345..0091272 100644
--- a/exec.c
+++ b/exec.c
@@ -1839,13 +1839,11 @@ static void memory_map_init(void)
 {
     system_memory = g_malloc(sizeof(*system_memory));
     memory_region_init(system_memory, "system", INT64_MAX);
-    address_space_init(&address_space_memory, system_memory);
-    address_space_memory.name = "memory";
+    address_space_init(&address_space_memory, system_memory, "memory");
 
     system_io = g_malloc(sizeof(*system_io));
     memory_region_init(system_io, "io", 65536);
-    address_space_init(&address_space_io, system_io);
-    address_space_io.name = "I/O";
+    address_space_init(&address_space_io, system_io, "I/O");
 
     memory_listener_register(&core_memory_listener, &address_space_memory);
     memory_listener_register(&io_memory_listener, &address_space_io);
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index fe146dc..0a1acd6 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -823,7 +823,8 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev, PCIBus *bus,
     memory_region_init_alias(&pci_dev->bus_master_enable_region, "bus master",
                              pci_dev->iommu, 0, memory_region_size(pci_dev->iommu));
     memory_region_set_enabled(&pci_dev->bus_master_enable_region, false);
-    address_space_init(&pci_dev->bus_master_as, &pci_dev->bus_master_enable_region);
+    address_space_init(&pci_dev->bus_master_as, &pci_dev->bus_master_enable_region,
+                       name);
 
     pci_dev->devfn = devfn;
     pstrcpy(pci_dev->name, sizeof(pci_dev->name), name);
diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
index fbcbd6f..fadde20 100644
--- a/hw/ppc/spapr_vio.c
+++ b/hw/ppc/spapr_vio.c
@@ -449,7 +449,7 @@ static int spapr_vio_busdev_init(DeviceState *qdev)
     if (pc->rtce_window_size) {
         uint32_t liobn = SPAPR_VIO_BASE_LIOBN | dev->reg;
         dev->tcet = spapr_tce_new_table(liobn, pc->rtce_window_size);
-        address_space_init(&dev->as, spapr_tce_get_iommu(dev->tcet));
+        address_space_init(&dev->as, spapr_tce_get_iommu(dev->tcet), qdev->id);
     }
 
     return pc->init(dev);
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 99d51b7..907118e 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -177,7 +177,7 @@ struct MemoryRegionPortio {
  */
 struct AddressSpace {
     /* All fields are private. */
-    const char *name;
+    char *name;
     MemoryRegion *root;
     struct FlatView *current_map;
     int ioeventfd_nb;
@@ -839,8 +839,9 @@ void mtree_info(fprintf_function mon_printf, void *f);
  *
  * @as: an uninitialized #AddressSpace
  * @root: a #MemoryRegion that routes addesses for the address space
+ * @name: an address space name
  */
-void address_space_init(AddressSpace *as, MemoryRegion *root);
+void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name);
 
 
 /**
diff --git a/memory.c b/memory.c
index cee3e59..b4117a8 100644
--- a/memory.c
+++ b/memory.c
@@ -1002,7 +1002,7 @@ void memory_region_init_iommu(MemoryRegion *mr,
     mr->terminates = true;  /* then re-forwards */
     mr->destructor = memory_region_destructor_iommu;
     mr->iommu_target_as = g_new(AddressSpace, 1);
-    address_space_init(mr->iommu_target_as, target);
+    address_space_init(mr->iommu_target_as, target, name);
 }
 
 static uint64_t invalid_read(void *opaque, hwaddr addr,
@@ -1599,7 +1599,7 @@ void memory_listener_unregister(MemoryListener *listener)
     QTAILQ_REMOVE(&memory_listeners, listener, link);
 }
 
-void address_space_init(AddressSpace *as, MemoryRegion *root)
+void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name)
 {
     memory_region_transaction_begin();
     as->root = root;
@@ -1608,7 +1608,7 @@ void address_space_init(AddressSpace *as, MemoryRegion *root)
     as->ioeventfd_nb = 0;
     as->ioeventfds = NULL;
     QTAILQ_INSERT_TAIL(&address_spaces, as, address_spaces_link);
-    as->name = NULL;
+    as->name = g_strdup(name?name:"anonymous");
     address_space_init_dispatch(as);
     memory_region_update_pending |= root->enabled;
     memory_region_transaction_commit();
@@ -1623,6 +1623,7 @@ void address_space_destroy(AddressSpace *as)
     QTAILQ_REMOVE(&address_spaces, as, address_spaces_link);
     address_space_destroy_dispatch(as);
     flatview_destroy(as->current_map);
+    g_free(as->name);
     g_free(as->current_map);
     g_free(as->ioeventfds);
 }
@@ -1749,9 +1750,6 @@ void mtree_info(fprintf_function mon_printf, void *f)
     QTAILQ_INIT(&ml_head);
 
     QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
-        if (!as->name) {
-            continue;
-        }
         mon_printf(f, "%s\n", as->name);
         mtree_print_mr(mon_printf, f, as->root, 0, 0, &ml_head);
     }
-- 
1.7.10.4


