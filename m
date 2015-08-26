Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUf5B-0004eT-4M
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 14:05:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZUf57-0004Vs-C5
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 14:05:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZUf53-0000fR-AL
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 14:05:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59043)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1ZUf51-0000em-BW; Wed, 26 Aug 2015 14:05:47 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id EB5D58E3D5;
	Wed, 26 Aug 2015 18:05:46 +0000 (UTC)
Received: from thinkpad.redhat.com (vpn1-5-59.ams2.redhat.com [10.36.5.59])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QI5cZO026740; Wed, 26 Aug 2015 14:05:45 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org, Jia Liu <proljc@gmail.com>, qemu-trivial@nongnu.org
Date: Wed, 26 Aug 2015 20:05:34 +0200
Message-Id: <1440612338-5912-4-git-send-email-lvivier@redhat.com>
In-Reply-To: <1440612338-5912-1-git-send-email-lvivier@redhat.com>
References: <1440612338-5912-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 3/7] openrisc: remove muldiv64()
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

But as openrisc timer frequency is 20 MHz, we can also do:

    y = x * 50; /* 20 MHz period is 50 ns */

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/openrisc/cputimer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/openrisc/cputimer.c b/hw/openrisc/cputimer.c
index 9c54945..560cb91 100644
--- a/hw/openrisc/cputimer.c
+++ b/hw/openrisc/cputimer.c
@@ -22,7 +22,7 @@
 #include "hw/hw.h"
 #include "qemu/timer.h"
 
-#define TIMER_FREQ    (20 * 1000 * 1000)    /* 20MHz */
+#define TIMER_PERIOD 50 /* 50 ns period for 20 MHz timer */
 
 /* The time when TTCR changes */
 static uint64_t last_clk;
@@ -36,8 +36,7 @@ void cpu_openrisc_count_update(OpenRISCCPU *cpu)
         return;
     }
     now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    cpu->env.ttcr += (uint32_t)muldiv64(now - last_clk, TIMER_FREQ,
-                                        get_ticks_per_sec());
+    cpu->env.ttcr += (uint32_t)((now - last_clk) / TIMER_PERIOD);
     last_clk = now;
 }
 
@@ -59,7 +58,7 @@ void cpu_openrisc_timer_update(OpenRISCCPU *cpu)
     } else {
         wait = (cpu->env.ttmr & TTMR_TP) - (cpu->env.ttcr & TTMR_TP);
     }
-    next = now + muldiv64(wait, get_ticks_per_sec(), TIMER_FREQ);
+    next = now + (uint64_t)wait * TIMER_PERIOD;
     timer_mod(cpu->env.timer, next);
 }
 
-- 
2.1.0


