Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUYi5-0002zk-4w
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 07:17:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZUYhy-0002q5-O7
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 07:17:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZUYhx-00085D-Nr
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 07:17:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38200)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1ZUYhr-00082n-Re; Wed, 26 Aug 2015 07:17:28 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 5866CA2C12;
	Wed, 26 Aug 2015 11:17:27 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-60.ams2.redhat.com
	[10.36.4.60])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QBHODq028642; Wed, 26 Aug 2015 07:17:26 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 26 Aug 2015 12:17:12 +0100
Message-Id: <1440587838-25595-2-git-send-email-berrange@redhat.com>
In-Reply-To: <1440587838-25595-1-git-send-email-berrange@redhat.com>
References: <1440587838-25595-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PATCH 1/7] maint: remove double semicolons in many
	files
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
X-List-Received-Date: Wed, 26 Aug 2015 11:17:36 -0000

A number of source files have statements accidentally
terminated by a double semicolon - eg 'foo = bar;;'.
This is harmless but a mistake none the less.

The tcg/ia64/tcg-target.c file is whitelisted because
it has valid use of ';;' in a comment containing assembly
code.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 block/vhdx.c         | 2 +-
 hw/arm/vexpress.c    | 4 ++--
 hw/intc/arm_gic.c    | 2 +-
 numa.c               | 2 +-
 qga/commands-win32.c | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/vhdx.c b/block/vhdx.c
index 0776de7..f05c7a9 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -1454,7 +1454,7 @@ static int vhdx_create_new_metadata(BlockDriverState *bs,
     uint32_t offset = 0;
     void *buffer = NULL;
     void *entry_buffer;
-    VHDXMetadataTableHeader *md_table;;
+    VHDXMetadataTableHeader *md_table;
     VHDXMetadataTableEntry  *md_table_entry;
 
     /* Metadata entries */
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index da21788..0f8bf1c 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -541,7 +541,7 @@ static void vexpress_common_init(MachineState *machine)
 {
     VexpressMachineState *vms = VEXPRESS_MACHINE(machine);
     VexpressMachineClass *vmc = VEXPRESS_MACHINE_GET_CLASS(machine);
-    VEDBoardInfo *daughterboard = vmc->daughterboard;;
+    VEDBoardInfo *daughterboard = vmc->daughterboard;
     DeviceState *dev, *sysctl, *pl041;
     qemu_irq pic[64];
     uint32_t sys_id;
@@ -762,7 +762,7 @@ static void vexpress_a9_class_init(ObjectClass *oc, void *data)
     mc->name = TYPE_VEXPRESS_A9_MACHINE;
     mc->desc = "ARM Versatile Express for Cortex-A9";
 
-    vmc->daughterboard = &a9_daughterboard;;
+    vmc->daughterboard = &a9_daughterboard;
 }
 
 static void vexpress_a15_class_init(ObjectClass *oc, void *data)
diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index a8c5d19..46ebc3f 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -239,7 +239,7 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
      * for the case where this GIC supports grouping and the pending interrupt
      * is in the wrong group.
      */
-    irq = gic_get_current_pending_irq(s, cpu, attrs);;
+    irq = gic_get_current_pending_irq(s, cpu, attrs);
 
     if (irq >= GIC_MAXIRQ) {
         DPRINTF("ACK, no pending interrupt or it is hidden: %d\n", irq);
diff --git a/numa.c b/numa.c
index 402804b..eed8f5d 100644
--- a/numa.c
+++ b/numa.c
@@ -280,7 +280,7 @@ static void validate_numa_cpus(void)
             bitmap_and(seen_cpus, seen_cpus,
                        numa_info[i].node_cpu, MAX_CPUMASK_BITS);
             error_report("CPU(s) present in multiple NUMA nodes: %s",
-                         enumerate_cpus(seen_cpus, max_cpus));;
+                         enumerate_cpus(seen_cpus, max_cpus));
             exit(EXIT_FAILURE);
         }
         bitmap_or(seen_cpus, seen_cpus,
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index a7822d5..203664c 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -657,7 +657,7 @@ static GuestFilesystemInfo *build_guest_fsinfo(char *guid, Error **errp)
         fs->mountpoint = g_strndup(mnt_point, len);
     }
     fs->type = g_strdup(fs_name);
-    fs->disk = build_guest_disk_info(guid, errp);;
+    fs->disk = build_guest_disk_info(guid, errp);
 free:
     g_free(mnt_point);
     return fs;
-- 
2.4.3


