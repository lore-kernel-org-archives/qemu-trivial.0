Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9XDe-0007Tn-65
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 08:31:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9XDc-0007Q0-9U
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 08:31:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9XDa-00021V-Dq
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 08:31:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42888)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9XDJ-0001wZ-Ux; Sun, 05 Jun 2016 08:31:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BF65D40929;
	Sun,  5 Jun 2016 15:31:30 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 81EC0AFA;
	Sun,  5 Jun 2016 10:43:37 +0300 (MSK)
Received: (nullmailer pid 1143 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Sameeh Jubran <sameeh@daynix.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:03 +0300
Message-Id: <6142c08db8aec2a8a7ad58e8d406857de69894cc.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 26/52] e1000: Removing unnecessary if statement
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
X-List-Received-Date: Sun, 05 Jun 2016 12:31:53 -0000

From: Sameeh Jubran <sameeh@daynix.com>

Since mit_delay can never be 0 this if statement is
superfluous.

Signed-off-by: Sameeh Jubran <sameeh@daynix.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/e1000.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 36e3dbe..1202371 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -311,11 +311,9 @@ set_interrupt_cause(E1000State *s, int index, uint32_t val)
              */
             mit_delay = (mit_delay < 500) ? 500 : mit_delay;
 
-            if (mit_delay) {
-                s->mit_timer_on = 1;
-                timer_mod(s->mit_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                          mit_delay * 256);
-            }
+            s->mit_timer_on = 1;
+            timer_mod(s->mit_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+                      mit_delay * 256);
             s->mit_ide = 0;
         }
     }
-- 
2.1.4


