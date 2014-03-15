Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOlSH-0004M2-Cj
	for mharc-qemu-trivial@gnu.org; Sat, 15 Mar 2014 06:04:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlSA-00049X-M1
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 06:04:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlS6-0007Bs-N8
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 06:04:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54598)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOlRu-00076L-EE; Sat, 15 Mar 2014 06:04:14 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0081341D9A;
	Sat, 15 Mar 2014 14:04:13 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7973D669;
	Sat, 15 Mar 2014 13:57:04 +0400 (MSK)
Received: (nullmailer pid 20017 invoked by uid 1000);
	Sat, 15 Mar 2014 09:57:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Mar 2014 13:56:52 +0400
Message-Id: <1394877419-19949-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org,
	Sebastian Huber <sebastian.huber@embedded-brains.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 06/13] hw/timer/grlib_gptimer: Avoid integer
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
X-List-Received-Date: Sat, 15 Mar 2014 10:04:34 -0000

From: Sebastian Huber <sebastian.huber@embedded-brains.de>

The GPTIMER uses 32-bit registers.  Use a 64-bit operation to get the
ptimer count, otherwise we end up with a count of 0 for GPTIMER counter
values of 0xffffffff.

Use the GPTIMER counter value for tracing to avoid an overflow of the
32-bit value passed to trace_grlib_gptimer_enable().

Reviewed-by: Fabien Chouteau <chouteau@adacore.com>
Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/timer/grlib_gptimer.c |    4 ++--
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
1.7.10.4


