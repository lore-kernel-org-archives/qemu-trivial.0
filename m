Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bjqMD-0006SF-4K
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2016 12:14:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqM7-0006Mx-JR
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:14:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqM3-00088Y-Sl
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:14:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55532)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bjqLv-0007lP-0u; Tue, 13 Sep 2016 12:14:31 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E2B3A416D8;
	Tue, 13 Sep 2016 19:14:26 +0300 (MSK)
Received: from gandalf (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id AB9FDB02;
	Tue, 13 Sep 2016 19:07:40 +0300 (MSK)
Received: (nullmailer pid 31910 invoked by uid 1000);
	Tue, 13 Sep 2016 16:07:39 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 13 Sep 2016 19:04:52 +0300
Message-Id: <04ecbb783441d5d51587d23bad1c0a7b8ce27193.1473782118.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 13/16] timer.h: fix inconsistency between
 comment and function prototype
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
X-List-Received-Date: Tue, 13 Sep 2016 16:14:47 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/timer.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index 41e8325..e6c089e 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -431,6 +431,7 @@ void timer_init_tl(QEMUTimer *ts,
 
 /**
  * timer_init:
+ * @ts: the timer to be initialised
  * @type: the clock to associate with the timer
  * @scale: the scale value for the timer
  * @cb: the callback to call when the timer expires
@@ -450,6 +451,7 @@ static inline void timer_init(QEMUTimer *ts, QEMUClockType type, int scale,
 
 /**
  * timer_init_ns:
+ * @ts: the timer to be initialised
  * @type: the clock to associate with the timer
  * @cb: the callback to call when the timer expires
  * @opaque: the opaque pointer to pass to the callback
@@ -468,6 +470,7 @@ static inline void timer_init_ns(QEMUTimer *ts, QEMUClockType type,
 
 /**
  * timer_init_us:
+ * @ts: the timer to be initialised
  * @type: the clock to associate with the timer
  * @cb: the callback to call when the timer expires
  * @opaque: the opaque pointer to pass to the callback
@@ -486,6 +489,7 @@ static inline void timer_init_us(QEMUTimer *ts, QEMUClockType type,
 
 /**
  * timer_init_ms:
+ * @ts: the timer to be initialised
  * @type: the clock to associate with the timer
  * @cb: the callback to call when the timer expires
  * @opaque: the opaque pointer to pass to the callback
@@ -547,8 +551,8 @@ static inline QEMUTimer *timer_new(QEMUClockType type, int scale,
 
 /**
  * timer_new_ns:
- * @clock: the clock to associate with the timer
- * @callback: the callback to call when the timer expires
+ * @type: the clock type to associate with the timer
+ * @cb: the callback to call when the timer expires
  * @opaque: the opaque pointer to pass to the callback
  *
  * Create a new timer with nanosecond scale on the default timer list
@@ -564,8 +568,8 @@ static inline QEMUTimer *timer_new_ns(QEMUClockType type, QEMUTimerCB *cb,
 
 /**
  * timer_new_us:
- * @clock: the clock to associate with the timer
- * @callback: the callback to call when the timer expires
+ * @type: the clock type to associate with the timer
+ * @cb: the callback to call when the timer expires
  * @opaque: the opaque pointer to pass to the callback
  *
  * Create a new timer with microsecond scale on the default timer list
@@ -581,8 +585,8 @@ static inline QEMUTimer *timer_new_us(QEMUClockType type, QEMUTimerCB *cb,
 
 /**
  * timer_new_ms:
- * @clock: the clock to associate with the timer
- * @callback: the callback to call when the timer expires
+ * @type: the clock type to associate with the timer
+ * @cb: the callback to call when the timer expires
  * @opaque: the opaque pointer to pass to the callback
  *
  * Create a new timer with millisecond scale on the default timer list
@@ -691,6 +695,7 @@ bool timer_pending(QEMUTimer *ts);
 /**
  * timer_expired:
  * @ts: the timer
+ * @current_time: the current time
  *
  * Determines whether a timer has expired.
  *
-- 
2.1.4


