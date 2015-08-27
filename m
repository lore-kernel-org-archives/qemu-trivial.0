Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZV2vR-00071E-9J
	for mharc-qemu-trivial@gnu.org; Thu, 27 Aug 2015 15:33:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZV2vN-0006vE-KW
	for qemu-trivial@nongnu.org; Thu, 27 Aug 2015 15:33:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZV2vM-00081q-QR
	for qemu-trivial@nongnu.org; Thu, 27 Aug 2015 15:33:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52450)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1ZV2vI-000802-Ng; Thu, 27 Aug 2015 15:33:20 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 62A38C1A40C6;
	Thu, 27 Aug 2015 19:33:20 +0000 (UTC)
Received: from thinkpad.redhat.com (vpn1-7-222.ams2.redhat.com [10.36.7.222])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id t7RJX7Zn024823; Thu, 27 Aug 2015 15:33:19 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org
Date: Thu, 27 Aug 2015 21:33:04 +0200
Message-Id: <1440703987-29012-7-git-send-email-lvivier@redhat.com>
In-Reply-To: <1440703987-29012-1-git-send-email-lvivier@redhat.com>
References: <1440703987-29012-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v3 6/9] arm: clarify the use of muldiv64()
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
X-List-Received-Date: Thu, 27 Aug 2015 19:33:26 -0000

muldiv64() is used to convert microseconds into CPU ticks.

But it is not clear and not commented. This patch uses macro
to clearly identify what is used: time, CPU frequency and ticks.
For an elapsed time and a given frequency, we compute how many ticks
 we have.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
v2: replace "arm: remove muldiv64()"
 target-arm/helper.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 7df1f06..4455761 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -12,6 +12,8 @@
 #include <zlib.h> /* For crc32 */
 #include "exec/semihost.h"
 
+#define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
+
 #ifndef CONFIG_USER_ONLY
 static inline bool get_phys_addr(CPUARMState *env, target_ulong address,
                                  int access_type, ARMMMUIdx mmu_idx,
@@ -678,8 +680,8 @@ void pmccntr_sync(CPUARMState *env)
 {
     uint64_t temp_ticks;
 
-    temp_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
-                          get_ticks_per_sec(), 1000000);
+    temp_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
 
     if (env->cp15.c9_pmcr & PMCRD) {
         /* Increment once every 64 processor clock cycles */
@@ -717,8 +719,8 @@ static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
         return env->cp15.c15_ccnt;
     }
 
-    total_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
-                           get_ticks_per_sec(), 1000000);
+    total_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
 
     if (env->cp15.c9_pmcr & PMCRD) {
         /* Increment once every 64 processor clock cycles */
@@ -738,8 +740,8 @@ static void pmccntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         return;
     }
 
-    total_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
-                           get_ticks_per_sec(), 1000000);
+    total_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
 
     if (env->cp15.c9_pmcr & PMCRD) {
         /* Increment once every 64 processor clock cycles */
-- 
2.1.0


