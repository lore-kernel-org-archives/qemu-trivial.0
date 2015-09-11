Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaMP0-0005fK-EG
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 07:21:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMOv-0005VY-CX
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:21:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMOu-00027N-Ax
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:21:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39729)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaMOp-000227-Mv; Fri, 11 Sep 2015 07:21:48 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E39F941439;
	Fri, 11 Sep 2015 14:21:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id BB814A52;
	Fri, 11 Sep 2015 14:03:52 +0300 (MSK)
Received: (nullmailer pid 22760 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:28 +0300
Message-Id: <a8f15a27752d855d339befd8de4f0ad1c4dbb0ab.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PULL 04/26] maint: remove double semicolons in many
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
X-List-Received-Date: Fri, 11 Sep 2015 11:21:55 -0000

From: "Daniel P. Berrange" <berrange@redhat.com>

A number of source files have statements accidentally
terminated by a double semicolon - eg 'foo =3D bar;;'.
This is harmless but a mistake none the less.

The tcg/ia64/tcg-target.c file is whitelisted because
it has valid use of ';;' in a comment containing assembly
code.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
@@ -1454,7 +1454,7 @@ static int vhdx_create_new_metadata(BlockDriverStat=
e *bs,
     uint32_t offset =3D 0;
     void *buffer =3D NULL;
     void *entry_buffer;
-    VHDXMetadataTableHeader *md_table;;
+    VHDXMetadataTableHeader *md_table;
     VHDXMetadataTableEntry  *md_table_entry;
=20
     /* Metadata entries */
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index da21788..0f8bf1c 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -541,7 +541,7 @@ static void vexpress_common_init(MachineState *machin=
e)
 {
     VexpressMachineState *vms =3D VEXPRESS_MACHINE(machine);
     VexpressMachineClass *vmc =3D VEXPRESS_MACHINE_GET_CLASS(machine);
-    VEDBoardInfo *daughterboard =3D vmc->daughterboard;;
+    VEDBoardInfo *daughterboard =3D vmc->daughterboard;
     DeviceState *dev, *sysctl, *pl041;
     qemu_irq pic[64];
     uint32_t sys_id;
@@ -762,7 +762,7 @@ static void vexpress_a9_class_init(ObjectClass *oc, v=
oid *data)
     mc->name =3D TYPE_VEXPRESS_A9_MACHINE;
     mc->desc =3D "ARM Versatile Express for Cortex-A9";
=20
-    vmc->daughterboard =3D &a9_daughterboard;;
+    vmc->daughterboard =3D &a9_daughterboard;
 }
=20
 static void vexpress_a15_class_init(ObjectClass *oc, void *data)
diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 2df550c..8bad132 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -323,7 +323,7 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, Me=
mTxAttrs attrs)
      * for the case where this GIC supports grouping and the pending int=
errupt
      * is in the wrong group.
      */
-    irq =3D gic_get_current_pending_irq(s, cpu, attrs);;
+    irq =3D gic_get_current_pending_irq(s, cpu, attrs);
=20
     if (irq >=3D GIC_MAXIRQ) {
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
index cbee186..41bdd3f 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -659,7 +659,7 @@ static GuestFilesystemInfo *build_guest_fsinfo(char *=
guid, Error **errp)
         fs->mountpoint =3D g_strndup(mnt_point, len);
     }
     fs->type =3D g_strdup(fs_name);
-    fs->disk =3D build_guest_disk_info(guid, errp);;
+    fs->disk =3D build_guest_disk_info(guid, errp);
 free:
     g_free(mnt_point);
     return fs;
--=20
2.1.4


