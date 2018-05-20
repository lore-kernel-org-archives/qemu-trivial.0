Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fKHcr-0001bM-Hu
	for mharc-qemu-trivial@gnu.org; Sun, 20 May 2018 02:15:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHcm-0001Xx-A2
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:15:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHcl-0005NM-7k
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:15:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36607)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1fKHcg-0005In-I0; Sun, 20 May 2018 02:15:14 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7F42741129;
	Sun, 20 May 2018 09:15:12 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 542A410C0;
	Sun, 20 May 2018 09:15:12 +0300 (MSK)
Received: (nullmailer pid 7393 invoked by uid 1000);
	Sun, 20 May 2018 06:15:11 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun, 20 May 2018 09:14:59 +0300
Message-Id: <f23c81073a4f9aa41a3687161f6ca3d66501a280.1526796813.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 13/22] trivial: Do not include pci.h if it is
 not necessary
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
X-List-Received-Date: Sun, 20 May 2018 06:15:21 -0000

From: Thomas Huth <thuth@redhat.com>

There is no need to include pci.h in these files.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/hw/ppc/ppc4xx.h            | 2 --
 include/hw/virtio/virtio-balloon.h | 1 -
 include/hw/virtio/virtio-gpu.h     | 1 -
 3 files changed, 4 deletions(-)

diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index cb0bb55cec..3a2a04c8ce 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -25,8 +25,6 @@
 #ifndef PPC4XX_H
 #define PPC4XX_H
=20
-#include "hw/pci/pci.h"
-
 /* PowerPC 4xx core initialization */
 PowerPCCPU *ppc4xx_init(const char *cpu_model,
                         clk_setup_t *cpu_clk, clk_setup_t *tb_clk,
diff --git a/include/hw/virtio/virtio-balloon.h b/include/hw/virtio/virti=
o-balloon.h
index 1ea13bd6a4..e0df3528c8 100644
--- a/include/hw/virtio/virtio-balloon.h
+++ b/include/hw/virtio/virtio-balloon.h
@@ -17,7 +17,6 @@
=20
 #include "standard-headers/linux/virtio_balloon.h"
 #include "hw/virtio/virtio.h"
-#include "hw/pci/pci.h"
=20
 #define TYPE_VIRTIO_BALLOON "virtio-balloon-device"
 #define VIRTIO_BALLOON(obj) \
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gp=
u.h
index 22ac3c2d0e..79bb3fb3dd 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -18,7 +18,6 @@
 #include "ui/qemu-pixman.h"
 #include "ui/console.h"
 #include "hw/virtio/virtio.h"
-#include "hw/pci/pci.h"
 #include "qemu/log.h"
=20
 #include "standard-headers/linux/virtio_gpu.h"
--=20
2.11.0


