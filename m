Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bma17-0006tZ-Fx
	for mharc-qemu-trivial@gnu.org; Wed, 21 Sep 2016 01:24:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bma15-0006sU-KG
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2016 01:24:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bma10-0006N7-PY
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2016 01:24:19 -0400
Received: from ozlabs.org ([103.22.144.67]:45978)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bma0q-0006HQ-6l; Wed, 21 Sep 2016 01:24:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3sf7Mh1rG5z9t17; Wed, 21 Sep 2016 15:24:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1474435440;
	bh=K0ZUeFYBtFss52jxPoQbZZ0M8ZwEebcijLC/O1Q8At0=;
	h=From:To:Cc:Subject:Date:From;
	b=IKJTt9Eak6VbuLAmzMVU6r1ldtJGUJ74OJAVUAI7syUDUAyDpEdNJrEGRwBKC+fC6
	KqL/PfRRvScwqZjWThQ/rDAqyZv/FnbMkp2KL4xo92TCqUr6V+0fPjXtEzbnxWbQmY
	g7K9BrYiSCgBM7GS1ji6zFK6VwyObj2Bn+WUdZ0A=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, peter.maydell@linaro.org,
	ehabkost@redhat.com, marcel@redhat.com,
	David Gibson <david@gibson.dropbear.id.au>
Date: Wed, 21 Sep 2016 15:23:53 +1000
Message-Id: <1474435433-9029-1-git-send-email-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: [Qemu-trivial] [REPOST] sysbus: Remove ignored return value of
 FindSysbusDeviceFunc
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
X-List-Received-Date: Wed, 21 Sep 2016 05:24:20 -0000

Functions of type FindSysbusDeviceFunc currently return an integer.
However, this return value is always ignored by the caller in
find_sysbus_device().

This changes the function type to return void, to avoid confusion over
the function semantics.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/arm/sysbus-fdt.c    | 4 ++--
 hw/core/machine.c      | 2 +-
 hw/core/platform-bus.c | 8 ++------
 hw/ppc/e500.c          | 4 +---
 hw/ppc/spapr.c         | 4 +---
 include/hw/sysbus.h    | 2 +-
 6 files changed, 8 insertions(+), 16 deletions(-)

I sent this during the 2.7 cycle, but it slipped through the cracks.
I've rebased and smoke tested, so reposting andhoping we can get it in
for 2.8.

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 5debb33..d68e3dc 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -436,7 +436,7 @@ static const NodeCreationPair add_fdt_node_functions[] = {
  * are dynamically instantiable and if so call the node creation
  * function.
  */
-static int add_fdt_node(SysBusDevice *sbdev, void *opaque)
+static void add_fdt_node(SysBusDevice *sbdev, void *opaque)
 {
     int i, ret;
 
@@ -445,7 +445,7 @@ static int add_fdt_node(SysBusDevice *sbdev, void *opaque)
                     add_fdt_node_functions[i].typename)) {
             ret = add_fdt_node_functions[i].add_fdt_node_fn(sbdev, opaque);
             assert(!ret);
-            return 0;
+            return;
         }
     }
     error_report("Device %s can not be dynamically instantiated",
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 00fbe3e..afd84ac 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -332,7 +332,7 @@ static bool machine_get_enforce_config_section(Object *obj, Error **errp)
     return ms->enforce_config_section;
 }
 
-static int error_on_sysbus_device(SysBusDevice *sbdev, void *opaque)
+static void error_on_sysbus_device(SysBusDevice *sbdev, void *opaque)
 {
     error_report("Option '-device %s' cannot be handled by this machine",
                  object_class_get_name(object_get_class(OBJECT(sbdev))));
diff --git a/hw/core/platform-bus.c b/hw/core/platform-bus.c
index 36f84ab..329ac67 100644
--- a/hw/core/platform-bus.c
+++ b/hw/core/platform-bus.c
@@ -74,7 +74,7 @@ hwaddr platform_bus_get_mmio_addr(PlatformBusDevice *pbus, SysBusDevice *sbdev,
     return object_property_get_int(OBJECT(sbdev_mr), "addr", NULL);
 }
 
-static int platform_bus_count_irqs(SysBusDevice *sbdev, void *opaque)
+static void platform_bus_count_irqs(SysBusDevice *sbdev, void *opaque)
 {
     PlatformBusDevice *pbus = opaque;
     qemu_irq sbirq;
@@ -93,8 +93,6 @@ static int platform_bus_count_irqs(SysBusDevice *sbdev, void *opaque)
             }
         }
     }
-
-    return 0;
 }
 
 /*
@@ -168,7 +166,7 @@ static void platform_bus_map_mmio(PlatformBusDevice *pbus, SysBusDevice *sbdev,
  * For each sysbus device, look for unassigned IRQ lines as well as
  * unassociated MMIO regions. Connect them to the platform bus if available.
  */
-static int link_sysbus_device(SysBusDevice *sbdev, void *opaque)
+static void link_sysbus_device(SysBusDevice *sbdev, void *opaque)
 {
     PlatformBusDevice *pbus = opaque;
     int i;
@@ -180,8 +178,6 @@ static int link_sysbus_device(SysBusDevice *sbdev, void *opaque)
     for (i = 0; sysbus_has_mmio(sbdev, i); i++) {
         platform_bus_map_mmio(pbus, sbdev, i);
     }
-
-    return 0;
 }
 
 static void platform_bus_init_notify(Notifier *notifier, void *data)
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 0cd534d..cf8b122 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -196,7 +196,7 @@ static int create_devtree_etsec(SysBusDevice *sbdev, PlatformDevtreeData *data)
     return 0;
 }
 
-static int sysbus_device_create_devtree(SysBusDevice *sbdev, void *opaque)
+static void sysbus_device_create_devtree(SysBusDevice *sbdev, void *opaque)
 {
     PlatformDevtreeData *data = opaque;
     bool matched = false;
@@ -211,8 +211,6 @@ static int sysbus_device_create_devtree(SysBusDevice *sbdev, void *opaque)
                      qdev_fw_name(DEVICE(sbdev)));
         exit(1);
     }
-
-    return 0;
 }
 
 static void platform_bus_create_devtree(PPCE500Params *params, void *fdt,
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index ca77bb0..8f9c387 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1115,7 +1115,7 @@ static void spapr_reallocate_hpt(sPAPRMachineState *spapr, int shift,
     }
 }
 
-static int find_unknown_sysbus_device(SysBusDevice *sbdev, void *opaque)
+static void find_unknown_sysbus_device(SysBusDevice *sbdev, void *opaque)
 {
     bool matched = false;
 
@@ -1128,8 +1128,6 @@ static int find_unknown_sysbus_device(SysBusDevice *sbdev, void *opaque)
                      qdev_fw_name(DEVICE(sbdev)));
         exit(1);
     }
-
-    return 0;
 }
 
 static void ppc_spapr_reset(void)
diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index e73a5b2..e88bb6d 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -75,7 +75,7 @@ struct SysBusDevice {
     uint32_t pio[QDEV_MAX_PIO];
 };
 
-typedef int FindSysbusDeviceFunc(SysBusDevice *sbdev, void *opaque);
+typedef void FindSysbusDeviceFunc(SysBusDevice *sbdev, void *opaque);
 
 void sysbus_init_mmio(SysBusDevice *dev, MemoryRegion *memory);
 MemoryRegion *sysbus_mmio_get_region(SysBusDevice *dev, int n);
-- 
2.7.4


