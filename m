Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b09up-0007T0-LW
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 11:49:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b09um-0007LZ-Tl
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:49:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b09ui-0000mK-Bm
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:49:39 -0400
Received: from orth.archaic.org.uk ([81.2.115.148]:49122)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b09uh-0000lV-TN
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:49:36 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b09uc-00038C-HV; Tue, 10 May 2016 16:49:30 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Tue, 10 May 2016 16:49:29 +0100
Message-Id: <1462895369-1508-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 81.2.115.148
Subject: [Qemu-trivial] [PATCH] qemu-options.hx: Specify the units for
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
X-List-Received-Date: Tue, 10 May 2016 15:49:42 -0000

The -machine kvm_shadow_mem option takes a size in bytes; say
so explicitly in its documentation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reported-by: Tobi (github.com/tobimensch)
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 6106520..0b86d9f 100644
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
1.9.1


