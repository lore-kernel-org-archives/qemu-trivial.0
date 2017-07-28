Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db3o2-00066y-MJ
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 07:51:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1db3o0-00065S-Oj
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:51:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1db3nz-00053v-T1
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:51:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37428)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <otubo@redhat.com>)
	id 1db3ns-0004zo-V1; Fri, 28 Jul 2017 07:51:37 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1DDC9C0DE1F3;
	Fri, 28 Jul 2017 11:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1DDC9C0DE1F3
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=otubo@redhat.com
Received: from vader.redhat.com (ovpn-116-161.ams2.redhat.com [10.36.116.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 672BF600C2;
	Fri, 28 Jul 2017 11:51:32 +0000 (UTC)
From: Eduardo Otubo <otubo@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	gxt@mprc.pku.edu.cn,
	thuth@redhat.com
Date: Fri, 28 Jul 2017 13:51:31 +0200
Message-Id: <20170728115131.31725-1-otubo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 28 Jul 2017 11:51:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] unicore32: abort when entering "x 0" on the
 monitor
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
X-List-Received-Date: Fri, 28 Jul 2017 11:51:45 -0000

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
2.13.3


