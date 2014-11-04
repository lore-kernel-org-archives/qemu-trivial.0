Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xlccn-0005zR-1R
	for mharc-qemu-trivial@gnu.org; Tue, 04 Nov 2014 06:50:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xlcch-0005q8-96
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 06:50:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xlccc-0007wH-Ry
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 06:50:07 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:27211)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XlccT-0007ki-FB; Tue, 04 Nov 2014 06:49:54 -0500
Received: from 172.24.2.119 (EHLO szxeml448-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBV49769; Tue, 04 Nov 2014 19:49:48 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml448-hub.china.huawei.com
	(10.82.67.191) with Microsoft SMTP Server id 14.3.158.1; Tue, 4 Nov 2014
	19:49:42 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <lcapitulino@redhat.com>
Date: Tue, 4 Nov 2014 19:49:30 +0800
Message-ID: <1415101770-13568-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-devel@nongnu.org, zhanghailiang <zhang.zhanghailiang@huawei.com>,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, armbru@redhat.com, imammedo@redhat.com
Subject: [Qemu-trivial] [PATCH v7] numa: make 'info numa' take into account
	hotplugged memory
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
X-List-Received-Date: Tue, 04 Nov 2014 11:50:11 -0000

When do memory hotplug, if there is numa node, we should add
the memory size to the corresponding node memory size.

It affects the result of hmp command "info numa".

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
Hi Luiz,

This patch has been long time in the mail list.
The change does not affect anything but the 'info numa' command.
Actully, i have another patch that fix balloon bug.(https://lists.gnu.org/archive/html/qemu-devel/2014-09/msg01568.html)
It is related to memory hotplug too and based on this patch.

Since you don't have bandwidth for another pull request for v2.2.
Maybe go -trivial is another choice if you agreed;)

I'm OK if you think it's not appropriate.

Thanks.

 v7:
- s/uint64_t *node_mem/uint64_t node_mem[]/ (Michael Tokarev)
 v6:
- remove unnecessary 'di' variable (GongLei)
 v5:
- reword the subject (Igor Mammedov)
- turn query_numa_node_mem to void (Igor Mammedov)
 v4:
- s/pc_dimm_stat_node_mem/numa_stat_memory_devices/ (Igor Mammedov)
- rewrite numa_stat_memory_devices and this will also fix compile error for 
  targets that don't support memory hotplug
 v3:
- cold-plugged memory should not be excluded (Igor Mammedov)
 v2:
- Don't modify the numa_info.node_mem directly when treating hotplug memory,
  fix the "info numa" instead (Igor Mammedov)

Thanks for their reviews and suggestions.
---
 include/sysemu/sysemu.h |  1 +
 monitor.c               |  6 +++++-
 numa.c                  | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 6f9b82b..9fea3bc 100644
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
1.7.12.4


