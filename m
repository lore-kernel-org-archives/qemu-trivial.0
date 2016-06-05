Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9YJP-0006Dy-5L
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 09:41:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9YJM-00068e-Nw
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 09:41:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9YJK-0002LE-PI
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 09:41:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38130)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9YJ4-0002HU-4z; Sun, 05 Jun 2016 09:41:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B16FD4092D;
	Sun,  5 Jun 2016 16:41:30 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 168DEADA;
	Sun,  5 Jun 2016 10:43:33 +0300 (MSK)
Received: (nullmailer pid 1119 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:42:52 +0300
Message-Id: <887cc15e0245471729c550959f0ee328dd7c64d1.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 15/52] qemu-options.hx: Specify the units for
 -machine kvm_shadow_mem
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
X-List-Received-Date: Sun, 05 Jun 2016 13:41:53 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The -machine kvm_shadow_mem option takes a size in bytes; say
so explicitly in its documentation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reported-by: Tobi (github.com/tobimensch)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index b780ed1..272630f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -35,7 +35,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "                kernel_irqchip=on|off controls accelerated irqchip support\n"
     "                kernel_irqchip=on|off|split controls accelerated irqchip support (default=off)\n"
     "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
-    "                kvm_shadow_mem=size of KVM shadow MMU\n"
+    "                kvm_shadow_mem=size of KVM shadow MMU in bytes\n"
     "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
     "                mem-merge=on|off controls memory merge support (default: on)\n"
     "                iommu=on|off controls emulated Intel IOMMU (VT-d) support (default=off)\n"
-- 
2.1.4


