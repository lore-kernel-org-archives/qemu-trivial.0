Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNLm-0005H2-1l
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:10:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNLe-0005Ch-PH
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:10:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNLY-0003jw-2L
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:10:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45465)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNLJ-0003hA-Ug; Mon, 05 May 2014 14:10:22 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1837640753;
	Mon,  5 May 2014 22:10:21 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id AAC146B0;
	Mon,  5 May 2014 22:02:07 +0400 (MSK)
Received: (nullmailer pid 24237 invoked by uid 1000);
	Mon, 05 May 2014 18:02:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:01:52 +0400
Message-Id: <1399312923-24129-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 11/22] qemu-timer: Add missing 'static'
	attribute
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
X-List-Received-Date: Mon, 05 May 2014 18:10:47 -0000

From: Stefan Weil <sw@weilnetz.de>

This fixes a warning from the static code analysis (smatch).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-timer.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-timer.c b/qemu-timer.c
index e15ce47..9be1a41 100644
--- a/qemu-timer.c
+++ b/qemu-timer.c
@@ -56,7 +56,7 @@ typedef struct QEMUClock {
 } QEMUClock;
 
 QEMUTimerListGroup main_loop_tlg;
-QEMUClock qemu_clocks[QEMU_CLOCK_MAX];
+static QEMUClock qemu_clocks[QEMU_CLOCK_MAX];
 
 /* A QEMUTimerList is a list of timers attached to a clock. More
  * than one QEMUTimerList can be attached to each clock, for instance
-- 
1.7.10.4


