Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bL9F5-0005n1-6m
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jul 2016 09:21:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bL9Ez-0005eu-Of
	for qemu-trivial@nongnu.org; Thu, 07 Jul 2016 09:21:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bL9Ev-0004U1-BW
	for qemu-trivial@nongnu.org; Thu, 07 Jul 2016 09:21:17 -0400
Received: from [59.151.112.132] (port=56189 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bL9En-0004Q7-ON; Thu, 07 Jul 2016 09:21:06 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="8486207"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Jul 2016 21:20:57 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C665341C0BBF;
	Thu,  7 Jul 2016 21:20:53 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 7 Jul 2016 21:20:53 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>
Date: Thu, 7 Jul 2016 21:27:35 +0800
Message-ID: <1467898055-5286-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: C665341C0BBF.ACE7F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] timer.h: fix inconsistency between comment
 and function prototype
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
X-List-Received-Date: Thu, 07 Jul 2016 13:21:22 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 include/qemu/timer.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index 41e8325..7fea97f 100644
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
+ * @type: the clock to associate with the timer
+ * @cb: the callback to call when the timer expires
  * @opaque: the opaque pointer to pass to the callback
  *
  * Create a new timer with nanosecond scale on the default timer list
@@ -564,8 +568,8 @@ static inline QEMUTimer *timer_new_ns(QEMUClockType type, QEMUTimerCB *cb,
 
 /**
  * timer_new_us:
- * @clock: the clock to associate with the timer
- * @callback: the callback to call when the timer expires
+ * @type: the clock to associate with the timer
+ * @cb: the callback to call when the timer expires
  * @opaque: the opaque pointer to pass to the callback
  *
  * Create a new timer with microsecond scale on the default timer list
@@ -581,8 +585,8 @@ static inline QEMUTimer *timer_new_us(QEMUClockType type, QEMUTimerCB *cb,
 
 /**
  * timer_new_ms:
- * @clock: the clock to associate with the timer
- * @callback: the callback to call when the timer expires
+ * @type: the clock to associate with the timer
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
2.1.0




