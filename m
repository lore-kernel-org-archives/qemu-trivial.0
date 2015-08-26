Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUf5E-0004ma-TA
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 14:06:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZUf5A-0004eC-WF
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 14:05:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZUf57-0000ge-2c
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 14:05:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59072)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1ZUf54-0000fu-I6; Wed, 26 Aug 2015 14:05:50 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 2F7A58E3D5;
	Wed, 26 Aug 2015 18:05:50 +0000 (UTC)
Received: from thinkpad.redhat.com (vpn1-5-59.ams2.redhat.com [10.36.5.59])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QI5cZQ026740; Wed, 26 Aug 2015 14:05:48 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
Date: Wed, 26 Aug 2015 20:05:36 +0200
Message-Id: <1440612338-5912-6-git-send-email-lvivier@redhat.com>
In-Reply-To: <1440612338-5912-1-git-send-email-lvivier@redhat.com>
References: <1440612338-5912-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 5/7] hpet: remove muldiv64()
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
X-List-Received-Date: Wed, 26 Aug 2015 18:05:58 -0000

hpet defines a clock period in femtoseconds but
then converts it to nanoseconds to use the internal
timers.

We can define the period in nanoseconds and use it
directly, this allows to remove muldiv64().

We only need to convert the period to femtoseconds
to put it in internal hpet capability register.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/timer/hpet.c         | 6 +++---
 include/hw/timer/hpet.h | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 2bb6221..3037bef 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -126,12 +126,12 @@ static uint32_t hpet_time_after64(uint64_t a, uint64_t b)
 
 static uint64_t ticks_to_ns(uint64_t value)
 {
-    return (muldiv64(value, HPET_CLK_PERIOD, FS_PER_NS));
+    return value * HPET_CLK_PERIOD;
 }
 
 static uint64_t ns_to_ticks(uint64_t value)
 {
-    return (muldiv64(value, FS_PER_NS, HPET_CLK_PERIOD));
+    return value / HPET_CLK_PERIOD;
 }
 
 static uint64_t hpet_fixup_reg(uint64_t new, uint64_t old, uint64_t mask)
@@ -758,7 +758,7 @@ static void hpet_realize(DeviceState *dev, Error **errp)
     /* 64-bit main counter; LegacyReplacementRoute. */
     s->capability = 0x8086a001ULL;
     s->capability |= (s->num_timers - 1) << HPET_ID_NUM_TIM_SHIFT;
-    s->capability |= ((HPET_CLK_PERIOD) << 32);
+    s->capability |= ((uint64_t)(HPET_CLK_PERIOD * FS_PER_NS) << 32);
 
     qdev_init_gpio_in(dev, hpet_handle_legacy_irq, 2);
     qdev_init_gpio_out(dev, &s->pit_enabled, 1);
diff --git a/include/hw/timer/hpet.h b/include/hw/timer/hpet.h
index 773953b..d872909 100644
--- a/include/hw/timer/hpet.h
+++ b/include/hw/timer/hpet.h
@@ -16,9 +16,9 @@
 #include "qom/object.h"
 
 #define HPET_BASE               0xfed00000
-#define HPET_CLK_PERIOD         10000000ULL /* 10000000 femtoseconds == 10ns*/
+#define HPET_CLK_PERIOD         10 /* 10 ns*/
 
-#define FS_PER_NS 1000000
+#define FS_PER_NS 1000000       /* 1000000 femtoseconds == 1 ns */
 #define HPET_MIN_TIMERS         3
 #define HPET_MAX_TIMERS         32
 
-- 
2.1.0


