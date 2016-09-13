Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bjqFe-0000cE-Ao
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2016 12:08:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqFZ-0000Wt-PV
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:08:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqFW-0004Ob-5D
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:07:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56184)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bjqFN-00040Q-Hs; Tue, 13 Sep 2016 12:07:45 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 18353416DE;
	Tue, 13 Sep 2016 19:07:42 +0300 (MSK)
Received: from gandalf (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 00125B00;
	Tue, 13 Sep 2016 19:07:39 +0300 (MSK)
Received: (nullmailer pid 31908 invoked by uid 1000);
	Tue, 13 Sep 2016 16:07:39 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 13 Sep 2016 19:04:51 +0300
Message-Id: <083b96e22153cae3658f4defa202f1ce58423463.1473782118.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 12/16] timer.h: fix typo
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
X-List-Received-Date: Tue, 13 Sep 2016 16:08:01 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/timer.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index 309f3d0..41e8325 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -179,7 +179,7 @@ int64_t qemu_clock_deadline_ns_all(QEMUClockType type);
  * qemu_clock_get_main_loop_timerlist:
  * @type: the clock type
  *
- * Return the default timer list assocatiated with a clock.
+ * Return the default timer list associated with a clock.
  *
  * Returns: the default timer list
  */
@@ -509,7 +509,7 @@ static inline void timer_init_ms(QEMUTimer *ts, QEMUClockType type,
  * @cb: the callback to be called when the timer expires
  * @opaque: the opaque pointer to be passed to the callback
  *
- * Creeate a new timer and associate it with @timer_list.
+ * Create a new timer and associate it with @timer_list.
  * The memory is allocated by the function.
  *
  * This is not the preferred interface unless you know you
@@ -534,7 +534,7 @@ static inline QEMUTimer *timer_new_tl(QEMUTimerList *timer_list,
  * @cb: the callback to be called when the timer expires
  * @opaque: the opaque pointer to be passed to the callback
  *
- * Creeate a new timer and associate it with the default
+ * Create a new timer and associate it with the default
  * timer list for the clock type @type.
  *
  * Returns: a pointer to the timer
-- 
2.1.4


