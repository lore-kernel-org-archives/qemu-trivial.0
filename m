Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dhDJL-0007eK-Cj
	for mharc-qemu-trivial@gnu.org; Mon, 14 Aug 2017 07:13:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dhDJG-0007Ya-GF
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:13:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dhDJF-0007aE-Jy
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:13:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46923)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dhDJD-0007YQ-6F; Mon, 14 Aug 2017 07:13:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9CAAE40D4E;
	Mon, 14 Aug 2017 14:13:22 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CE876B79;
	Mon, 14 Aug 2017 14:07:44 +0300 (MSK)
Received: (nullmailer pid 31399 invoked by uid 1000);
	Mon, 14 Aug 2017 11:07:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eduardo Otubo <otubo@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 14 Aug 2017 14:07:38 +0300
Message-Id: <0ac241bcf9f9d99a252a352a162f4b13b24732ab.1502708830.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 1/7] unicore32: abort when entering "x 0" on
 the monitor
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
X-List-Received-Date: Mon, 14 Aug 2017 11:13:29 -0000

From: Eduardo Otubo <otubo@redhat.com>

Starting Qemu with "qemu-system-unicore32 -M puv3,accel=qtest -S -nographic"
and entering "x 0 " at the monitor prompt leads to abort():

  $ ./unicore32-softmmu/qemu-system-unicore32 -M puv3,accel=qtest -S -nographic
  QEMU 2.9.90 monitor - type 'help' for more information
  (qemu) x 0
  qemu: fatal: uc32_cpu_get_phys_page_debug not supported yet

  R00=00000000 R01=00000000 R02=00000000 R03=00000000
  R04=00000000 R05=00000000 R06=00000000 R07=00000000
  R08=00000000 R09=00000000 R10=00000000 R11=00000000
  R12=00000000 R13=00000000 R14=00000000 R15=00000000
  R16=00000000 R17=00000000 R18=00000000 R19=00000000
  R20=00000000 R21=00000000 R22=00000000 R23=00000000
  R24=00000000 R25=00000000 R26=00000000 R27=00000000
  R28=00000000 R29=00000000 R30=00000000 R31=03000000
  PSR=40000013 -Z-- PRIV
  Aborted (core dumped)

This happens because uc32_cpu_get_phys_page_debug() is not implemented
yet, this is a temporary workaround to avoid the crash.

Signed-off-by: Eduardo Otubo <otubo@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target/unicore32/softmmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/unicore32/softmmu.c b/target/unicore32/softmmu.c
index e7152e72e0..d8d76968f3 100644
--- a/target/unicore32/softmmu.c
+++ b/target/unicore32/softmmu.c
@@ -15,6 +15,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "qemu/error-report.h"
 
 #undef DEBUG_UC32
 
@@ -271,8 +272,7 @@ int uc32_cpu_handle_mmu_fault(CPUState *cs, vaddr address,
 
 hwaddr uc32_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
-    UniCore32CPU *cpu = UNICORE32_CPU(cs);
-
-    cpu_abort(CPU(cpu), "%s not supported yet\n", __func__);
-    return addr;
+    error_report("function uc32_cpu_get_phys_page_debug not "
+                    "implemented, aborting");
+    return -1;
 }
-- 
2.11.0


