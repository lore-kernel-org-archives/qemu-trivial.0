Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dajLh-0003cn-Dv
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 10:01:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dai2Z-0003aR-0N
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:37:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dai2U-0001qM-3s
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:37:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60818)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <otubo@redhat.com>) id 1dai2T-0001pl-V5
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:37:14 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E6873B06B4
	for <qemu-trivial@nongnu.org>; Thu, 27 Jul 2017 12:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E6873B06B4
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=otubo@redhat.com
Received: from vader.redhat.com (ovpn-117-70.ams2.redhat.com [10.36.117.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CA155C46B;
	Thu, 27 Jul 2017 12:37:11 +0000 (UTC)
From: Eduardo Otubo <otubo@redhat.com>
To: qemu-trivial@nongnu.org
Cc: thuth@redhat.com
Date: Thu, 27 Jul 2017 14:37:10 +0200
Message-Id: <20170727123710.29817-1-otubo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 27 Jul 2017 12:37:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Thu, 27 Jul 2017 10:01:08 -0400
Subject: [Qemu-trivial] [PATCH] qemu-system-tricore: segfault when entering
 "x 0" on the monitor
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
X-List-Received-Date: Thu, 27 Jul 2017 12:37:20 -0000

Starting Qemu with "qemu-system-tricore -nographic -M tricore_testboard
-S" and entering "x 0" at the monitor prompt leads to Segmentation
fault. This happens because tricore_cpu_get_phys_page_debug() is not
implemented yet, this is a temporary workaround to avoid the crash do
just abort the execution with exit(1).

Signed-off-by: Eduardo Otubo <otubo@redhat.com>
---
 target/tricore/cpu.c | 10 ++++++++++
 target/tricore/cpu.h |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 08f50e2ba7..822c7f4092 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -22,6 +22,15 @@
 #include "cpu.h"
 #include "qemu-common.h"
 #include "exec/exec-all.h"
+#include "qemu/error-report.h"
+
+hwaddr tricore_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                         MemTxAttrs *attrs)
+{
+    error_report("function cpu_get_phys_page_attrs_debug not"
+                    "implemented, aborting");
+    exit(1);
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
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index a3493a123c..c374ed3213 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -224,6 +224,9 @@ static inline TriCoreCPU *tricore_env_get_cpu(CPUTriCoreState *env)
 #define ENV_OFFSET offsetof(TriCoreCPU, env)
 
 hwaddr tricore_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+hwaddr tricore_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                         MemTxAttrs *attrs);
+
 void tricore_cpu_dump_state(CPUState *cpu, FILE *f,
                             fprintf_function cpu_fprintf, int flags);
 
-- 
2.13.3


