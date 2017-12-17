Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQjrn-0004JL-RM
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 20:05:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQjrg-00049g-Kk
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 20:05:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQjrb-0007b2-29
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 20:05:08 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36583)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQjrU-0007Oi-Eb; Sun, 17 Dec 2017 20:04:56 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6AF0641197;
	Mon, 18 Dec 2017 04:04:55 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6C93FD01;
	Mon, 18 Dec 2017 00:25:47 +0300 (MSK)
Received: (nullmailer pid 31006 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org
Date: Mon, 18 Dec 2017 00:28:05 +0300
Message-Id: <8908b72ecbfba7ee66f995529e5a9f0eaebefe22.1513545944.git.mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 60/61] i386/pc: move vmmouse.c to hw/i386/
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
X-List-Received-Date: Mon, 18 Dec 2017 01:05:13 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

It's a x86-only device, so it does not make sense to keep it
in the shared misc folder.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/i386/Makefile.objs        | 1 +
 hw/{input =3D> i386}/vmmouse.c | 0
 hw/input/Makefile.objs       | 1 -
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/{input =3D> i386}/vmmouse.c (100%)

diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
index 1548ad1ad0..fd279e7584 100644
--- a/hw/i386/Makefile.objs
+++ b/hw/i386/Makefile.objs
@@ -6,6 +6,7 @@ obj-y +=3D x86-iommu.o intel_iommu.o
 obj-y +=3D amd_iommu.o
 obj-$(CONFIG_XEN) +=3D ../xenpv/ xen/
 obj-$(CONFIG_VMPORT) +=3D vmport.o
+obj-$(CONFIG_VMMOUSE) +=3D vmmouse.o
=20
 obj-y +=3D kvmvapic.o
 obj-y +=3D acpi-build.o
diff --git a/hw/input/vmmouse.c b/hw/i386/vmmouse.c
similarity index 100%
rename from hw/input/vmmouse.c
rename to hw/i386/vmmouse.c
diff --git a/hw/input/Makefile.objs b/hw/input/Makefile.objs
index 7715d7230d..636f794b6b 100644
--- a/hw/input/Makefile.objs
+++ b/hw/input/Makefile.objs
@@ -6,7 +6,6 @@ common-obj-$(CONFIG_PL050) +=3D pl050.o
 common-obj-y +=3D ps2.o
 common-obj-$(CONFIG_STELLARIS_INPUT) +=3D stellaris_input.o
 common-obj-$(CONFIG_TSC2005) +=3D tsc2005.o
-common-obj-$(CONFIG_VMMOUSE) +=3D vmmouse.o
=20
 common-obj-$(CONFIG_VIRTIO) +=3D virtio-input.o
 common-obj-$(CONFIG_VIRTIO) +=3D virtio-input-hid.o
--=20
2.11.0


