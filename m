Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJoTq-0003JV-LY
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 15:54:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoTm-000385-4u
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:54:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoTk-0002d0-Uh
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:54:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55290)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZJoTe-0002a3-E1; Mon, 27 Jul 2015 15:54:22 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A138D425AD;
	Mon, 27 Jul 2015 22:54:20 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 79CF7A65;
	Mon, 27 Jul 2015 22:54:20 +0300 (MSK)
Received: (nullmailer pid 9531 invoked by uid 1000);
	Mon, 27 Jul 2015 19:54:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 27 Jul 2015 22:54:11 +0300
Message-Id: <786f9ce20382704249883d7052f6869011d44281.1438026619.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
References: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Johannes Schlatow <schlatow@ida.ing.tu-bs.de>
Subject: [Qemu-trivial] [PULL 08/10] Fix Cortex-A9 global timer
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
X-List-Received-Date: Mon, 27 Jul 2015 19:54:31 -0000

From: Johannes Schlatow <schlatow@ida.ing.tu-bs.de>

The auto increment bit of the timer control register was wrongly
defined.

See Cortex-A9 MPcore Technical Reference Manual, Section 4.4.2.

Signed-off-by: Johannes Schlatow <schlatow@ida.ing.tu-bs.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/hw/timer/a9gtimer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/timer/a9gtimer.h b/include/hw/timer/a9gtimer.h
index b88c02a..98d8e0a 100644
--- a/include/hw/timer/a9gtimer.h
+++ b/include/hw/timer/a9gtimer.h
@@ -37,7 +37,7 @@
 #define R_CONTROL_TIMER_ENABLE      (1 << 0)
 #define R_CONTROL_COMP_ENABLE       (1 << 1)
 #define R_CONTROL_IRQ_ENABLE        (1 << 2)
-#define R_CONTROL_AUTO_INCREMENT    (1 << 2)
+#define R_CONTROL_AUTO_INCREMENT    (1 << 3)
 #define R_CONTROL_PRESCALER_SHIFT   8
 #define R_CONTROL_PRESCALER_LEN     8
 #define R_CONTROL_PRESCALER_MASK    (((1 << R_CONTROL_PRESCALER_LEN) - 1) << \
-- 
2.1.4


