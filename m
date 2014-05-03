Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WgTBf-0007E1-RE
	for mharc-qemu-trivial@gnu.org; Sat, 03 May 2014 02:12:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgTBZ-00075l-GN
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 02:12:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgTBU-0001Kd-JK
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 02:12:33 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:47552)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1WgTBK-0001IN-Fz; Sat, 03 May 2014 02:12:18 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 1C63117FCC1; Sat,  3 May 2014 08:12:16 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sat,  3 May 2014 08:12:15 +0200
Message-Id: <1399097535-24897-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] qemu-timer: Add missing 'static' attribute
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
X-List-Received-Date: Sat, 03 May 2014 06:12:38 -0000

This fixes a warning from the static code analysis (smatch).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
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


