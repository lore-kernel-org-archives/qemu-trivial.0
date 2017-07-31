Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dc7pj-0004Ak-32
	for mharc-qemu-trivial@gnu.org; Mon, 31 Jul 2017 06:21:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7pg-000481-Dm
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:21:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7pf-0006Bw-Fb
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:21:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46587)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dc7pa-00068H-ID; Mon, 31 Jul 2017 06:21:46 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A53BE42ABC;
	Mon, 31 Jul 2017 13:21:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 95022B78;
	Mon, 31 Jul 2017 13:21:43 +0300 (MSK)
Received: (nullmailer pid 5550 invoked by uid 1000);
	Mon, 31 Jul 2017 10:21:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eduardo Otubo <otubo@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 31 Jul 2017 13:21:25 +0300
Message-Id: <b190f477e29c7cd03a8fee49c96d27f160e3f5b0.1501496349.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 06/25] qemu-system-tricore: segfault when
 entering "x 0" on the monitor
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
X-List-Received-Date: Mon, 31 Jul 2017 10:21:53 -0000

From: Eduardo Otubo <otubo@redhat.com>

Starting Qemu with "qemu-system-tricore -nographic -M tricore_testboard -S"
and entering "x 0" at the monitor prompt leads to Segmentation fault.
This happens because tricore_cpu_get_phys_page_debug() is not implemented
yet, this is a temporary workaround to avoid the crash.

Signed-off-by: Eduardo Otubo <otubo@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target/tricore/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 08f50e2ba7..5ab5b56454 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -22,6 +22,15 @@
 #include "cpu.h"
 #include "qemu-common.h"
 #include "exec/exec-all.h"
+#include "qemu/error-report.h"
+
+static hwaddr tricore_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                         MemTxAttrs *attrs)
+{
+    error_report("function cpu_get_phys_page_attrs_debug not "
+                    "implemented, aborting");
+    return -1;
+}
 
 static inline void set_feature(CPUTriCoreState *env, int feature)
 {
@@ -176,6 +185,7 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
     cc->dump_state = tricore_cpu_dump_state;
     cc->set_pc = tricore_cpu_set_pc;
     cc->synchronize_from_tb = tricore_cpu_synchronize_from_tb;
+    cc->get_phys_page_attrs_debug = tricore_cpu_get_phys_page_attrs_debug;
 }
 
 static void cpu_register(const TriCoreCPUInfo *info)
-- 
2.11.0


