Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W3qrD-0005Gt-Qo
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jan 2014 12:35:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3qr7-00058K-48
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:35:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3qr2-0006hp-6g
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:35:49 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48757)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W3qqs-0006cD-2v; Thu, 16 Jan 2014 12:35:34 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5515D415C4;
	Thu, 16 Jan 2014 21:35:24 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3E1015FC;
	Thu, 16 Jan 2014 21:35:24 +0400 (MSK)
Received: (nullmailer pid 16389 invoked by uid 1000);
	Thu, 16 Jan 2014 17:35:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Thu, 16 Jan 2014 21:35:10 +0400
Message-Id: <1389893719-16336-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Namhyung Kim <namhyung@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 02/11] Fix typo of tiemr in timer.h
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
X-List-Received-Date: Thu, 16 Jan 2014 17:35:54 -0000

From: Namhyung Kim <namhyung@gmail.com>

Signed-off-by: Namhyung Kim <namhyung@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/timer.h |    6 +++---
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
1.7.10.4


