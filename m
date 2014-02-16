Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WEzef-0007wL-J4
	for mharc-qemu-trivial@gnu.org; Sun, 16 Feb 2014 06:13:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WEzea-0007nn-5D
	for qemu-trivial@nongnu.org; Sun, 16 Feb 2014 06:13:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WEzeV-0004Gb-VP
	for qemu-trivial@nongnu.org; Sun, 16 Feb 2014 06:12:56 -0500
Received: from host-82-135-62-35.customer.m-online.net ([82.135.62.35]:54774
	helo=mail.embedded-brains.de) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WEzeN-0004Fd-9y; Sun, 16 Feb 2014 06:12:43 -0500
Received: by mail.embedded-brains.de (Postfix, from userid 65534)
	id 267C4652CFE; Sun, 16 Feb 2014 12:12:39 +0100 (CET)
Received: from linux.local (38.vpnclient.eb.z [192.168.126.38])
	by mail.embedded-brains.de (Postfix) with ESMTP id 433B4652CF6;
	Sun, 16 Feb 2014 12:12:39 +0100 (CET)
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
To: qemu-devel@nongnu.org
Date: Sun, 16 Feb 2014 12:12:38 +0100
Message-Id: <1392549158-6009-1-git-send-email-sebastian.huber@embedded-brains.de>
X-Mailer: git-send-email 1.8.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 82.135.62.35
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH v2] hw/timer/grlib_gptimer: Avoid integer
	overflows
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
X-List-Received-Date: Sun, 16 Feb 2014 11:13:00 -0000

The GPTIMER uses 32-bit registers.  Use a 64-bit operation to get the
ptimer count, otherwise we end up with a count of 0 for GPTIMER counter
values of 0xffffffff.

Use the GPTIMER counter value for tracing to avoid an overflow of the
32-bit value passed to trace_grlib_gptimer_enable().

Reviewed-by: Fabien Chouteau <chouteau@adacore.com>
Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
---
 hw/timer/grlib_gptimer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
index 74c16d6..7672d3a 100644
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
1.8.1.4


