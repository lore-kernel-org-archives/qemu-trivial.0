Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TV71M-0007na-Ln
	for mharc-qemu-trivial@gnu.org; Sun, 04 Nov 2012 15:42:16 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TV71J-0007gF-VJ
	for qemu-trivial@nongnu.org; Sun, 04 Nov 2012 15:42:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TV71J-00019D-76
	for qemu-trivial@nongnu.org; Sun, 04 Nov 2012 15:42:13 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:33786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TV71H-00018s-CA; Sun, 04 Nov 2012 15:42:11 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	2C444728002F; Sun,  4 Nov 2012 21:42:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id MVIQumq+9Axo; Sun,  4 Nov 2012 21:42:09 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 856AF728003A; Sun,  4 Nov 2012 21:42:09 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sun,  4 Nov 2012 21:42:08 +0100
Message-Id: <1352061728-30617-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 78.47.199.172
Cc: Paolo Bonzini <pbonzini@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] qemu-timer: Fix compilation for non-POSIX
	hosts
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
X-List-Received-Date: Sun, 04 Nov 2012 20:42:14 -0000

A compiler warning is caused by the unused local function reinit_timers
on non-POSIX hosts. Include that function only for POSIX hosts.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 qemu-timer.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/qemu-timer.c b/qemu-timer.c
index 8d9cf38..0d2bb94 100644
--- a/qemu-timer.c
+++ b/qemu-timer.c
@@ -745,6 +745,7 @@ static void quit_timers(void)
     t->stop(t);
 }
 
+#ifdef CONFIG_POSIX
 static void reinit_timers(void)
 {
     struct qemu_alarm_timer *t = alarm_timer;
@@ -755,6 +756,7 @@ static void reinit_timers(void)
     }
     qemu_rearm_alarm_timer(t);
 }
+#endif /* CONFIG_POSIX */
 
 int init_timer_alarm(void)
 {
-- 
1.7.10.4


