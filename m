Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W0P86-0005sY-1J
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jan 2014 00:23:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <namhyung@gmail.com>) id 1W0KA4-0004PA-19
	for qemu-trivial@nongnu.org; Mon, 06 Jan 2014 19:04:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <namhyung@gmail.com>) id 1W0K9y-0001vf-2c
	for qemu-trivial@nongnu.org; Mon, 06 Jan 2014 19:04:47 -0500
Received: from lgemrelse7q.lge.com ([156.147.1.151]:53810)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <namhyung@gmail.com>)
	id 1W0K9l-0001t5-EY; Mon, 06 Jan 2014 19:04:29 -0500
X-AuditID: 9c930197-b7c4aae000003d84-2e-52cb4489acc8
Received: from sejong.aot.lge.com ( [10.177.220.181])
	by LGEMRELSE7Q.lge.com (Symantec Brightmail Gateway) with SMTP id
	17.6C.15748.9844BC25; Tue,  7 Jan 2014 09:04:25 +0900 (KST)
From: Namhyung Kim <namhyung@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Jan 2014 09:04:25 +0900
Message-Id: <1389053065-7578-1-git-send-email-namhyung@gmail.com>
X-Mailer: git-send-email 1.7.11.7
X-Brightmail-Tracker: AAAAAA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 156.147.1.151
X-Mailman-Approved-At: Tue, 07 Jan 2014 00:23:04 -0500
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] Fix typo of tiemr in timer.h
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
X-List-Received-Date: Tue, 07 Jan 2014 00:04:54 -0000

Signed-off-by: Namhyung Kim <namhyung@gmail.com>
---
 include/qemu/timer.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index 5afcffc..7f9a074 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -405,7 +405,7 @@ int64_t timerlistgroup_deadline_ns(QEMUTimerListGroup *tlg);
  * timer_init:
  * @ts: the timer to be initialised
  * @timer_list: the timer list to attach the timer to
- * @scale: the scale value for the tiemr
+ * @scale: the scale value for the timer
  * @cb: the callback to be called when the timer expires
  * @opaque: the opaque pointer to be passed to the callback
  *
@@ -422,7 +422,7 @@ void timer_init(QEMUTimer *ts,
 /**
  * timer_new_tl:
  * @timer_list: the timer list to attach the timer to
- * @scale: the scale value for the tiemr
+ * @scale: the scale value for the timer
  * @cb: the callback to be called when the timer expires
  * @opaque: the opaque pointer to be passed to the callback
  *
@@ -447,7 +447,7 @@ static inline QEMUTimer *timer_new_tl(QEMUTimerList *timer_list,
 /**
  * timer_new:
  * @type: the clock type to use
- * @scale: the scale value for the tiemr
+ * @scale: the scale value for the timer
  * @cb: the callback to be called when the timer expires
  * @opaque: the opaque pointer to be passed to the callback
  *
-- 
1.7.11.7


