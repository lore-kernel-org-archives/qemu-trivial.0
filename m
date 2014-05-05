Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNVN-0003f5-GU
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:20:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNVH-0003WW-0E
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:20:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNVC-0006r1-By
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:20:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59053)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNUz-0006oQ-Tg; Mon, 05 May 2014 14:20:22 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9A15640753;
	Mon,  5 May 2014 22:20:20 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 941706AF;
	Mon,  5 May 2014 22:02:07 +0400 (MSK)
Received: (nullmailer pid 24232 invoked by uid 1000);
	Mon, 05 May 2014 18:02:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:01:50 +0400
Message-Id: <1399312923-24129-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 09/22] monitor: Add missing 'static' attribute
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
X-List-Received-Date: Mon, 05 May 2014 18:20:43 -0000

From: Stefan Weil <sw@weilnetz.de>

This fixes a warning from the static code analysis (smatch).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 monitor.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor.c b/monitor.c
index 1266ba0..2d3fb3f 100644
--- a/monitor.c
+++ b/monitor.c
@@ -488,7 +488,7 @@ static const char *monitor_event_names[] = {
 };
 QEMU_BUILD_BUG_ON(ARRAY_SIZE(monitor_event_names) != QEVENT_MAX)
 
-MonitorEventState monitor_event_state[QEVENT_MAX];
+static MonitorEventState monitor_event_state[QEVENT_MAX];
 
 /*
  * Emits the event to every monitor instance
-- 
1.7.10.4


