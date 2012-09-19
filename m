Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TEKiX-00053Z-6a
	for mharc-qemu-trivial@gnu.org; Wed, 19 Sep 2012 09:53:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1TEKiM-0004Zv-La
	for qemu-trivial@nongnu.org; Wed, 19 Sep 2012 09:53:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1TEKiG-0007CQ-Uh
	for qemu-trivial@nongnu.org; Wed, 19 Sep 2012 09:53:18 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:50109)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1TEKi3-0006xT-4I; Wed, 19 Sep 2012 09:52:59 -0400
Received: by pbbrp12 with SMTP id rp12so2508785pbb.4
	for <multiple recipients>; Wed, 19 Sep 2012 06:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=PxojQF1Wnh1YiJudTd4KfF3GmK1MgBFg6Dzxbw6LnW4=;
	b=j2CjEBB1Ns5L5wpRs+sWzCqoOHSDnE7vzA/gWIJrDfi/9OJdpDy6Wwty6HzHnYkmPK
	OSk6LLZw8rQgdjKOJzwrYj21dB5dh4l4UFtkRkmBlParzkaj/x9pcgl7fbsk5FmSWbYY
	szVLwfqE7WDfX4N3x9m/gz1zpzqG5ldgJMxN6bhAdqsjt2td1Q4TYLmUT1SykfV0Hkg8
	ISAWFQ802aUSDVBh8pJncb7PCEWEwNr4I0L07ZmcXkcjDYes35Vy9/7A8UbodX9ZDjC6
	S244ERxEAMnZtqfTAFPuU5v60VjniPsSgE+0MCe6cXsyRlZMhIEBMpS2DVhrrgen7COc
	TZVQ==
Received: by 10.66.83.234 with SMTP id t10mr7045482pay.39.1348062778190;
	Wed, 19 Sep 2012 06:52:58 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-169-1.ip50.fastwebnet.it.
	[93.34.169.1])
	by mx.google.com with ESMTPS id ih2sm1870105pbc.65.2012.09.19.06.52.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Sep 2012 06:52:56 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 19 Sep 2012 15:52:44 +0200
Message-Id: <1348062764-30806-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] qemu-timer: simplify qemu_run_timers
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
X-List-Received-Date: Wed, 19 Sep 2012 13:53:28 -0000

ptimer_head is an invariant pointer to clock->active_timers.
Remove it, and just reference clock->active_timers directly.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-timer.c | 7 +++----
 1 file modificato, 3 inserzioni(+), 4 rimozioni(-)

diff --git a/qemu-timer.c b/qemu-timer.c
index c7a1551..908a103 100644
--- a/qemu-timer.c
+++ b/qemu-timer.c
@@ -372,21 +372,20 @@ bool qemu_timer_expired(QEMUTimer *timer_head, int64_t current_time)
 
 void qemu_run_timers(QEMUClock *clock)
 {
-    QEMUTimer **ptimer_head, *ts;
+    QEMUTimer *ts;
     int64_t current_time;
    
     if (!clock->enabled)
         return;
 
     current_time = qemu_get_clock_ns(clock);
-    ptimer_head = &clock->active_timers;
     for(;;) {
-        ts = *ptimer_head;
+        ts = clock->active_timers;
         if (!qemu_timer_expired_ns(ts, current_time)) {
             break;
         }
         /* remove timer from the list before calling the callback */
-        *ptimer_head = ts->next;
+        clock->active_timers = ts->next;
         ts->next = NULL;
 
         /* run the callback (the timer list can be modified) */
-- 
1.7.12


