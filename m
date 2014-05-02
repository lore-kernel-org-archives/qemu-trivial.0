Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WgKJh-00079j-IQ
	for mharc-qemu-trivial@gnu.org; Fri, 02 May 2014 16:44:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgKJb-00071E-HR
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 16:44:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgKJW-0005mn-DD
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 16:44:15 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:47133)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1WgKJM-0005ku-61; Fri, 02 May 2014 16:44:00 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id D94E5180133; Fri,  2 May 2014 22:43:57 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri,  2 May 2014 22:43:57 +0200
Message-Id: <1399063437-3620-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: [Qemu-trivial] [PATCH] monitor: Add missing 'static' attribute
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
X-List-Received-Date: Fri, 02 May 2014 20:44:20 -0000

This fixes a warning from the static code analysis (smatch).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
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


