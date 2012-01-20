Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RoCIA-0000fP-Tp
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jan 2012 06:05:58 -0500
Received: from eggs.gnu.org ([140.186.70.92]:41840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RoCI3-0000Hh-Ix
	for qemu-trivial@nongnu.org; Fri, 20 Jan 2012 06:05:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RoCHx-0006h8-Qw
	for qemu-trivial@nongnu.org; Fri, 20 Jan 2012 06:05:51 -0500
Received: from mail-ww0-f41.google.com ([74.125.82.41]:46860)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RoCHm-0006fx-JZ; Fri, 20 Jan 2012 06:05:34 -0500
Received: by wgbdt11 with SMTP id dt11so486312wgb.4
	for <multiple recipients>; Fri, 20 Jan 2012 03:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=2JIJsUE8XA24aw+wujv89R+OVEW8gihEDOu6GUw8ans=;
	b=WVm1totgCruOI9MaWAEzC2Y+b1A3Iv/Hy0kK22HQ49LPkqtaIzrGlPi4SuooR7JQjg
	57t4/7xavgzJaiQS0rF8Ayt1316RMX+g33lvQ0RjiDAlm2hWB2ZL51UGHVSFG7GzrdIO
	FPeVKfaDTX3jT/NcV3d8w5JsMBgRo9PLIia24=
Received: by 10.180.106.38 with SMTP id gr6mr2947757wib.0.1327057533788;
	Fri, 20 Jan 2012 03:05:33 -0800 (PST)
Received: from localhost.localdomain (93-34-200-238.ip51.fastwebnet.it.
	[93.34.200.238])
	by mx.google.com with ESMTPS id fv6sm7848260wib.8.2012.01.20.03.05.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jan 2012 03:05:33 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 20 Jan 2012 12:05:22 +0100
Message-Id: <1327057522-6590-2-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.7.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.41
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] remove #if 0 code for timers
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
X-List-Received-Date: Fri, 20 Jan 2012 11:05:57 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-timer.c |   29 -----------------------------
 1 files changed, 0 insertions(+), 29 deletions(-)

diff --git a/qemu-timer.c b/qemu-timer.c
index 4a14a6d..8dc0d8a 100644
--- a/qemu-timer.c
+++ b/qemu-timer.c
@@ -494,35 +494,6 @@ static void host_alarm_handler(int host_signum)
     if (!t)
 	return;
 
-#if 0
-#define DISP_FREQ 1000
-    {
-        static int64_t delta_min = INT64_MAX;
-        static int64_t delta_max, delta_cum, last_clock, delta, ti;
-        static int count;
-        ti = qemu_get_clock_ns(vm_clock);
-        if (last_clock != 0) {
-            delta = ti - last_clock;
-            if (delta < delta_min)
-                delta_min = delta;
-            if (delta > delta_max)
-                delta_max = delta;
-            delta_cum += delta;
-            if (++count == DISP_FREQ) {
-                printf("timer: min=%" PRId64 " us max=%" PRId64 " us avg=%" PRId64 " us avg_freq=%0.3f Hz\n",
-                       muldiv64(delta_min, 1000000, get_ticks_per_sec()),
-                       muldiv64(delta_max, 1000000, get_ticks_per_sec()),
-                       muldiv64(delta_cum, 1000000 / DISP_FREQ, get_ticks_per_sec()),
-                       (double)get_ticks_per_sec() / ((double)delta_cum / DISP_FREQ));
-                count = 0;
-                delta_min = INT64_MAX;
-                delta_max = 0;
-                delta_cum = 0;
-            }
-        }
-        last_clock = ti;
-    }
-#endif
     if (alarm_has_dynticks(t) ||
         qemu_next_alarm_deadline () <= 0) {
         t->expired = alarm_has_dynticks(t);
-- 
1.7.7.1


