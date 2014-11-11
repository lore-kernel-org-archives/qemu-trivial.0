Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoCpO-0000rI-JQ
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 09:53:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34566)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCpI-0000eV-JO
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:53:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCpE-00029q-5m
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:53:48 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:59703)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XoCp0-00026m-Ev; Tue, 11 Nov 2014 09:53:30 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6CB8B41DFB;
	Tue, 11 Nov 2014 17:53:29 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 425DD706;
	Tue, 11 Nov 2014 17:46:35 +0300 (MSK)
Received: (nullmailer pid 14565 invoked by uid 1000);
	Tue, 11 Nov 2014 14:46:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 11 Nov 2014 17:46:26 +0300
Message-Id: <5b009e400809523e71f1b72bdaa2b681e2a5b1c7.1415716845.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
References: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PULL 04/11] numa: make 'info numa' take into
	account hotplugged memory
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
X-List-Received-Date: Tue, 11 Nov 2014 14:53:53 -0000

From: zhanghailiang <zhang.zhanghailiang@huawei.com>

When do memory hotplug, if there is numa node, we should add
the memory size to the corresponding node memory size.

It affects the result of hmp command "info numa".

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/sysemu/sysemu.h |    1 +
 monitor.c               |    6 +++++-
 numa.c                  |   38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 0037a69..50de1d3 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -161,6 +161,7 @@ typedef struct node_info {
 extern NodeInfo numa_info[MAX_NODES];
 void set_numa_nodes(void);
 void set_numa_modes(void);
+void query_numa_node_mem(uint64_t node_mem[]);
 extern QemuOptsList qemu_numa_opts;
 int numa_init_func(QemuOpts *opts, void *opaque);
 
diff --git a/monitor.c b/monitor.c
index 1fc201a..32db7ee 100644
--- a/monitor.c
+++ b/monitor.c
@@ -1948,7 +1948,10 @@ static void do_info_numa(Monitor *mon, const QDict *qdict)
 {
     int i;
     CPUState *cpu;
+    uint64_t *node_mem;
 
+    node_mem = g_new0(uint64_t, nb_numa_nodes);
+    query_numa_node_mem(node_mem);
     monitor_printf(mon, "%d nodes\n", nb_numa_nodes);
     for (i = 0; i < nb_numa_nodes; i++) {
         monitor_printf(mon, "node %d cpus:", i);
@@ -1959,8 +1962,9 @@ static void do_info_numa(Monitor *mon, const QDict *qdict)
         }
         monitor_printf(mon, "\n");
         monitor_printf(mon, "node %d size: %" PRId64 " MB\n", i,
-            numa_info[i].node_mem >> 20);
+                       node_mem[i] >> 20);
     }
+    g_free(node_mem);
 }
 
 #ifdef CONFIG_PROFILER
diff --git a/numa.c b/numa.c
index 3b98135..afd2866 100644
--- a/numa.c
+++ b/numa.c
@@ -35,6 +35,7 @@
 #include "hw/boards.h"
 #include "sysemu/hostmem.h"
 #include "qmp-commands.h"
+#include "hw/mem/pc-dimm.h"
 
 QemuOptsList qemu_numa_opts = {
     .name = "numa",
@@ -315,6 +316,43 @@ void memory_region_allocate_system_memory(MemoryRegion *mr, Object *owner,
     }
 }
 
+static void numa_stat_memory_devices(uint64_t node_mem[])
+{
+    MemoryDeviceInfoList *info_list = NULL;
+    MemoryDeviceInfoList **prev = &info_list;
+    MemoryDeviceInfoList *info;
+
+    qmp_pc_dimm_device_list(qdev_get_machine(), &prev);
+    for (info = info_list; info; info = info->next) {
+        MemoryDeviceInfo *value = info->value;
+
+        if (value) {
+            switch (value->kind) {
+            case MEMORY_DEVICE_INFO_KIND_DIMM:
+                node_mem[value->dimm->node] += value->dimm->size;
+                break;
+            default:
+                break;
+            }
+        }
+    }
+    qapi_free_MemoryDeviceInfoList(info_list);
+}
+
+void query_numa_node_mem(uint64_t node_mem[])
+{
+    int i;
+
+    if (nb_numa_nodes <= 0) {
+        return;
+    }
+
+    numa_stat_memory_devices(node_mem);
+    for (i = 0; i < nb_numa_nodes; i++) {
+        node_mem[i] += numa_info[i].node_mem;
+    }
+}
+
 static int query_memdev(Object *obj, void *opaque)
 {
     MemdevList **list = opaque;
-- 
1.7.10.4


