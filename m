Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z08XN-0007HP-Ap
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:16:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35040)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08XC-0006vM-Uf
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:16:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08XC-0004RA-4v
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:16:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36253)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z08X5-0004M2-IR; Wed, 03 Jun 2015 09:16:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8496A407A5;
	Wed,  3 Jun 2015 16:16:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 3FDF6A54;
	Wed,  3 Jun 2015 16:08:53 +0300 (MSK)
Received: (nullmailer pid 27428 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:28 +0300
Message-Id: <7df057bac3734ee3c2c052fd0807479602ab5583.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Alexander Graf <agraf@suse.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PULL 08/30] device-tree: Make a common-obj
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
X-List-Received-Date: Wed, 03 Jun 2015 13:16:48 -0000

From: Peter Crosthwaite <crosthwaitepeter@gmail.com>

There is no reason for device tree API to be built per-target.
common-obj it. There is an extraneous inclusion of config.h that
needs to be removed.

Cc: Alexander Graf <agraf@suse.de>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 Makefile.objs   | 2 ++
 Makefile.target | 1 -
 device_tree.c   | 1 -
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile.objs b/Makefile.objs
index 28999d3..4881d2c 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -76,6 +76,8 @@ common-obj-$(CONFIG_SECCOMP) +=3D qemu-seccomp.o
=20
 common-obj-$(CONFIG_SMARTCARD_NSS) +=3D $(libcacard-y)
=20
+common-obj-$(CONFIG_FDT) +=3D device_tree.o
+
 ######################################################################
 # qapi
=20
diff --git a/Makefile.target b/Makefile.target
index be01dd3..3e861c8 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -129,7 +129,6 @@ ifdef CONFIG_SOFTMMU
 obj-y +=3D arch_init.o cpus.o monitor.o gdbstub.o balloon.o ioport.o num=
a.o
 obj-y +=3D qtest.o bootdevice.o
 obj-y +=3D hw/
-obj-$(CONFIG_FDT) +=3D device_tree.o
 obj-$(CONFIG_KVM) +=3D kvm-all.o
 obj-y +=3D memory.o savevm.o cputlb.o
 obj-y +=3D memory_mapping.o
diff --git a/device_tree.c b/device_tree.c
index 3d119ef..d2de580 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -18,7 +18,6 @@
 #include <unistd.h>
 #include <stdlib.h>
=20
-#include "config.h"
 #include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
--=20
2.1.4


