Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bkttJ-0000BK-5E
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 10:13:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bkttD-00004w-Gp
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 10:13:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bkttB-0005vU-AH
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 10:13:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51608)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bktt5-0005ou-G7; Fri, 16 Sep 2016 10:13:07 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 149237F7BB;
	Fri, 16 Sep 2016 13:57:07 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHkP024127; Fri, 16 Sep 2016 09:57:05 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>
Date: Fri, 16 Sep 2016 15:56:14 +0200
Message-Id: <1474034177-17663-24-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 16 Sep 2016 13:57:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 23/26] core: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 14:13:20 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
CC: Marcel Apfelbaum <marcel@redhat.com>
---
 hw/core/machine.c      |  2 +-
 hw/core/platform-bus.c |  4 ++--
 hw/core/qdev.c         |  2 +-
 numa.c                 | 12 ++++++------
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 00fbe3e..3eeb1cc 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -336,7 +336,7 @@ static int error_on_sysbus_device(SysBusDevice *sbdev, void *opaque)
 {
     error_report("Option '-device %s' cannot be handled by this machine",
                  object_class_get_name(object_get_class(OBJECT(sbdev))));
-    exit(1);
+    exit(EXIT_FAILURE);
 }
 
 static void machine_init_notify(Notifier *notifier, void *data)
diff --git a/hw/core/platform-bus.c b/hw/core/platform-bus.c
index 36f84ab..03c6c17 100644
--- a/hw/core/platform-bus.c
+++ b/hw/core/platform-bus.c
@@ -122,7 +122,7 @@ static void platform_bus_map_irq(PlatformBusDevice *pbus, SysBusDevice *sbdev,
     irqn = find_first_zero_bit(pbus->used_irqs, max_irqs);
     if (irqn >= max_irqs) {
         error_report("Platform Bus: Can not fit IRQ line");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     set_bit(irqn, pbus->used_irqs);
@@ -157,7 +157,7 @@ static void platform_bus_map_mmio(PlatformBusDevice *pbus, SysBusDevice *sbdev,
     if (!found_region) {
         error_report("Platform Bus: Can not fit MMIO region of size %"PRIx64,
                      size);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* Map the device's region into our Platform Bus MMIO space */
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 5783442..d6e4483 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -359,7 +359,7 @@ void qdev_init_nofail(DeviceState *dev)
     if (err) {
         error_reportf_err(err, "Initialization of device %s failed: ",
                           object_get_typename(OBJECT(dev)));
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     object_unref(OBJECT(dev));
 }
diff --git a/numa.c b/numa.c
index 6289f46..57e4fc4 100644
--- a/numa.c
+++ b/numa.c
@@ -298,7 +298,7 @@ void parse_numa_opts(MachineClass *mc)
     int i;
 
     if (qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, NULL, NULL)) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     assert(max_numa_nodeid <= MAX_NODES);
@@ -308,7 +308,7 @@ void parse_numa_opts(MachineClass *mc)
         /* Report large node IDs first, to make mistakes easier to spot */
         if (!numa_info[i].present) {
             error_report("numa: Node ID missing: %d", i);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
@@ -352,7 +352,7 @@ void parse_numa_opts(MachineClass *mc)
             error_report("total memory for NUMA nodes (0x%" PRIx64 ")"
                          " should equal RAM size (0x" RAM_ADDR_FMT ")",
                          numa_total, ram_size);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         for (i = 0; i < nb_numa_nodes; i++) {
@@ -416,7 +416,7 @@ static void allocate_system_memory_nonnuma(MemoryRegion *mr, Object *owner,
         if (err) {
             error_report_err(err);
             if (mem_prealloc) {
-                exit(1);
+                exit(EXIT_FAILURE);
             }
 
             /* Legacy behavior: if allocation failed, fall back to
@@ -426,7 +426,7 @@ static void allocate_system_memory_nonnuma(MemoryRegion *mr, Object *owner,
         }
 #else
         fprintf(stderr, "-mem-path not supported on this host\n");
-        exit(1);
+        exit(EXIT_FAILURE);
 #endif
     } else {
         memory_region_init_ram(mr, owner, name, ram_size, &error_fatal);
@@ -461,7 +461,7 @@ void memory_region_allocate_system_memory(MemoryRegion *mr, Object *owner,
             error_report("memory backend %s is used multiple times. Each "
                          "-numa option must use a different memdev value.",
                          path);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         host_memory_backend_set_mapped(backend, true);
-- 
2.5.5


