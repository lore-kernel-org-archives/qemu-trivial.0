Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bL6FU-0006Aj-W4
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jul 2016 06:09:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bL6FS-00069H-K5
	for qemu-trivial@nongnu.org; Thu, 07 Jul 2016 06:09:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bL6FR-0004P1-IW
	for qemu-trivial@nongnu.org; Thu, 07 Jul 2016 06:09:34 -0400
Received: from [59.151.112.132] (port=32064 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bL6FK-0004Mq-WE; Thu, 07 Jul 2016 06:09:27 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="8481878"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Jul 2016 18:09:19 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A82B541C0BBF;
	Thu,  7 Jul 2016 18:09:16 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 7 Jul 2016 18:09:16 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>
Date: Thu, 7 Jul 2016 18:15:58 +0800
Message-ID: <1467886558-4110-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: A82B541C0BBF.ACCE3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] timer.h: fix typo
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
X-List-Received-Date: Thu, 07 Jul 2016 10:09:35 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
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
2.1.0




