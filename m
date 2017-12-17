Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQgaP-00057X-Ie
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 16:35:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQgaM-00054E-Ql
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 16:35:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQgaL-0007FM-RU
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 16:35:02 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50545)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQgaG-00078T-Mt; Sun, 17 Dec 2017 16:34:56 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6F5384117D;
	Mon, 18 Dec 2017 00:34:55 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 50977D53;
	Mon, 18 Dec 2017 00:25:49 +0300 (MSK)
Received: (nullmailer pid 31004 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org
Date: Mon, 18 Dec 2017 00:28:04 +0300
Message-Id: <c1a6f731e5fba216218ce5c4437b31973fc5d240.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 59/61] i386/pc: move vmport.c to hw/i386/
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
X-List-Received-Date: Sun, 17 Dec 2017 21:35:04 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

It's a x86-only device, so it does not make sense to keep it
in the shared misc folder.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/i386/Makefile.objs      |  1 +
 hw/{misc =3D> i386}/vmport.c | 17 +++++++++--------
 hw/misc/Makefile.objs      |  2 --
 3 files changed, 10 insertions(+), 10 deletions(-)
 rename hw/{misc =3D> i386}/vmport.c (95%)

diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
index 2e5e1299ad..1548ad1ad0 100644
--- a/hw/i386/Makefile.objs
+++ b/hw/i386/Makefile.objs
@@ -5,6 +5,7 @@ obj-y +=3D pc_sysfw.o
 obj-y +=3D x86-iommu.o intel_iommu.o
 obj-y +=3D amd_iommu.o
 obj-$(CONFIG_XEN) +=3D ../xenpv/ xen/
+obj-$(CONFIG_VMPORT) +=3D vmport.o
=20
 obj-y +=3D kvmvapic.o
 obj-y +=3D acpi-build.o
diff --git a/hw/misc/vmport.c b/hw/i386/vmport.c
similarity index 95%
rename from hw/misc/vmport.c
rename to hw/i386/vmport.c
index 165500223f..eb880c6def 100644
--- a/hw/misc/vmport.c
+++ b/hw/i386/vmport.c
@@ -28,7 +28,7 @@
 #include "sysemu/hw_accel.h"
 #include "hw/qdev.h"
=20
-//#define VMPORT_DEBUG
+/* #define VMPORT_DEBUG */
=20
 #define VMPORT_CMD_GETVERSION 0x0a
 #define VMPORT_CMD_GETRAMSIZE 0x14
@@ -38,8 +38,7 @@
=20
 #define VMPORT(obj) OBJECT_CHECK(VMPortState, (obj), TYPE_VMPORT)
=20
-typedef struct VMPortState
-{
+typedef struct VMPortState {
     ISADevice parent_obj;
=20
     MemoryRegion io;
@@ -51,8 +50,9 @@ static VMPortState *port_state;
=20
 void vmport_register(unsigned char command, VMPortReadFunc *func, void *=
opaque)
 {
-    if (command >=3D VMPORT_ENTRIES)
+    if (command >=3D VMPORT_ENTRIES) {
         return;
+    }
=20
     port_state->func[command] =3D func;
     port_state->opaque[command] =3D opaque;
@@ -71,14 +71,15 @@ static uint64_t vmport_ioport_read(void *opaque, hwad=
dr addr,
     cpu_synchronize_state(cs);
=20
     eax =3D env->regs[R_EAX];
-    if (eax !=3D VMPORT_MAGIC)
+    if (eax !=3D VMPORT_MAGIC) {
         return eax;
+    }
=20
     command =3D env->regs[R_ECX];
-    if (command >=3D VMPORT_ENTRIES)
+    if (command >=3D VMPORT_ENTRIES) {
         return eax;
-    if (!s->func[command])
-    {
+    }
+    if (!s->func[command]) {
 #ifdef VMPORT_DEBUG
         fprintf(stderr, "vmport: unknown command %x\n", command);
 #endif
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 10c88a84b4..d517f83e81 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -11,8 +11,6 @@ common-obj-$(CONFIG_EDU) +=3D edu.o
 common-obj-y +=3D unimp.o
 common-obj-$(CONFIG_FW_CFG_DMA) +=3D vmcoreinfo.o
=20
-obj-$(CONFIG_VMPORT) +=3D vmport.o
-
 # ARM devices
 common-obj-$(CONFIG_PL310) +=3D arm_l2x0.o
 common-obj-$(CONFIG_INTEGRATOR_DEBUG) +=3D arm_integrator_debug.o
--=20
2.11.0


