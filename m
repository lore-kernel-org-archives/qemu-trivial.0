Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WDsPm-0004SI-8t
	for mharc-qemu-trivial@gnu.org; Thu, 13 Feb 2014 04:17:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WDsPe-0004I8-5u
	for qemu-trivial@nongnu.org; Thu, 13 Feb 2014 04:17:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WDsPY-00054P-6H
	for qemu-trivial@nongnu.org; Thu, 13 Feb 2014 04:16:54 -0500
Received: from host-82-135-62-35.customer.m-online.net ([82.135.62.35]:39362
	helo=mail.embedded-brains.de) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WDsPL-00051x-Vc; Thu, 13 Feb 2014 04:16:36 -0500
Received: by mail.embedded-brains.de (Postfix, from userid 65534)
	id 5D521652CFB; Thu, 13 Feb 2014 10:16:20 +0100 (CET)
Received: from linux-7i4a.eb.z (unknown [192.168.100.11])
	by mail.embedded-brains.de (Postfix) with ESMTP id DE521652BD5;
	Thu, 13 Feb 2014 10:16:19 +0100 (CET)
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
To: qemu-devel@nongnu.org
Date: Thu, 13 Feb 2014 10:16:18 +0100
Message-Id: <1392282978-19368-1-git-send-email-sebastian.huber@embedded-brains.de>
X-Mailer: git-send-email 1.7.7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 82.135.62.35
Cc: qemu-trivial@nongnu.org,
	Sebastian Huber <sebastian.huber@embedded-brains.de>
Subject: [Qemu-trivial] [PATCH] hw/timer/grlib_gptimer: Avoid integer
	overflow
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
X-List-Received-Date: Thu, 13 Feb 2014 09:17:00 -0000

The GPTIMER uses 32-bit registers.  Use a 64-bit operation to get the
ptimer count, otherwise we end up with a count of 0 for GPTIMER counter
values of 0xffffffff.
---
 hw/timer/grlib_gptimer.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
index d5687f6..343563c 100644
--- a/hw/timer/grlib_gptimer.c
+++ b/hw/timer/grlib_gptimer.c
@@ -106,9 +106,9 @@ static void grlib_gptimer_enable(GPTimer *timer)
     /* ptimer is triggered when the counter reach 0 but GPTimer is triggered at
        underflow. Set count + 1 to simulate the GPTimer behavior. */
 
-    trace_grlib_gptimer_enable(timer->id, timer->counter + 1);
+    trace_grlib_gptimer_enable(timer->id, timer->counter);
 
-    ptimer_set_count(timer->ptimer, timer->counter + 1);
+    ptimer_set_count(timer->ptimer, (uint64_t)timer->counter + 1);
     ptimer_run(timer->ptimer, 1);
 }
 
-- 
1.7.7


