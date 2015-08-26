Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUf5B-0004ew-9x
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 14:05:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZUf56-0004TO-58
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 14:05:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZUf55-0000g5-77
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 14:05:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41475)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1ZUf50-0000eI-1n; Wed, 26 Aug 2015 14:05:46 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 8CDCA8C1B8;
	Wed, 26 Aug 2015 18:05:45 +0000 (UTC)
Received: from thinkpad.redhat.com (vpn1-5-59.ams2.redhat.com [10.36.5.59])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QI5cZN026740; Wed, 26 Aug 2015 14:05:44 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
	Leon Alrae <leon.alrae@imgtec.com>, qemu-trivial@nongnu.org
Date: Wed, 26 Aug 2015 20:05:33 +0200
Message-Id: <1440612338-5912-3-git-send-email-lvivier@redhat.com>
In-Reply-To: <1440612338-5912-1-git-send-email-lvivier@redhat.com>
References: <1440612338-5912-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 2/7] mips: remove muldiv64()
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
X-List-Received-Date: Wed, 26 Aug 2015 18:05:55 -0000

Originally, timers were ticks based, and it made sense to
add ticks to current time to know when to trigger an alarm.

But since commit:

7447545 change all other clock references to use nanosecond resolution accessors

All timers use nanoseconds and we need to convert ticks to nanoseconds, by
doing something like:

    y = muldiv64(x, get_ticks_per_sec(), TIMER_FREQ)

where x is the number of device ticks and y the number of system ticks.

y is used as nanoseconds in timer functions,
it works because 1 tick is 1 nanosecond.
(get_ticks_per_sec() is 10^9)

But as MIPS timer frequency is 100 MHz, we can also do:

    y = x * 10; /* 100 MHz period is 10 ns */

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/mips/cputimer.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/hw/mips/cputimer.c b/hw/mips/cputimer.c
index 577c9ae..a74ae5c 100644
--- a/hw/mips/cputimer.c
+++ b/hw/mips/cputimer.c
@@ -25,7 +25,7 @@
 #include "qemu/timer.h"
 #include "sysemu/kvm.h"
 
-#define TIMER_FREQ	100 * 1000 * 1000
+#define TIMER_PERIOD 10 /* 10 ns period for 100 Mhz frequency */
 
 /* XXX: do not use a global */
 uint32_t cpu_mips_get_random (CPUMIPSState *env)
@@ -49,9 +49,8 @@ static void cpu_mips_timer_update(CPUMIPSState *env)
     uint32_t wait;
 
     now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    wait = env->CP0_Compare - env->CP0_Count -
-	    (uint32_t)muldiv64(now, TIMER_FREQ, get_ticks_per_sec());
-    next = now + muldiv64(wait, get_ticks_per_sec(), TIMER_FREQ);
+    wait = env->CP0_Compare - env->CP0_Count - (uint32_t)(now / TIMER_PERIOD);
+    next = now + (uint64_t)wait * TIMER_PERIOD;
     timer_mod(env->timer, next);
 }
 
@@ -79,8 +78,7 @@ uint32_t cpu_mips_get_count (CPUMIPSState *env)
             cpu_mips_timer_expire(env);
         }
 
-        return env->CP0_Count +
-            (uint32_t)muldiv64(now, TIMER_FREQ, get_ticks_per_sec());
+        return env->CP0_Count + (uint32_t)(now / TIMER_PERIOD);
     }
 }
 
@@ -95,9 +93,8 @@ void cpu_mips_store_count (CPUMIPSState *env, uint32_t count)
         env->CP0_Count = count;
     else {
         /* Store new count register */
-        env->CP0_Count =
-            count - (uint32_t)muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                                       TIMER_FREQ, get_ticks_per_sec());
+        env->CP0_Count = count -
+               (uint32_t)(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / TIMER_PERIOD);
         /* Update timer timer */
         cpu_mips_timer_update(env);
     }
@@ -121,8 +118,8 @@ void cpu_mips_start_count(CPUMIPSState *env)
 void cpu_mips_stop_count(CPUMIPSState *env)
 {
     /* Store the current value */
-    env->CP0_Count += (uint32_t)muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                                         TIMER_FREQ, get_ticks_per_sec());
+    env->CP0_Count += (uint32_t)(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
+                                 TIMER_PERIOD);
 }
 
 static void mips_timer_cb (void *opaque)
-- 
2.1.0


