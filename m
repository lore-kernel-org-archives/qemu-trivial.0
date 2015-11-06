Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZugNV-00079G-QJ
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 07:44:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugNS-00072Z-3w
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:44:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugNR-0000CB-6D
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:44:22 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36657)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZugNC-00005U-Ob; Fri, 06 Nov 2015 07:44:06 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B3C5740DCF;
	Fri,  6 Nov 2015 15:44:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 95A35AB8;
	Fri,  6 Nov 2015 15:44:03 +0300 (MSK)
Received: (nullmailer pid 31688 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:45 +0300
Message-Id: <a6c6d827605e416f0e127a325ee1efc9cf16afa5.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 08/24] hw/input/tsc210x: Remove superfluous
	memset
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
X-List-Received-Date: Fri, 06 Nov 2015 12:44:23 -0000

From: Thomas Huth <thuth@redhat.com>

g_malloc0 already clears the memory, so no need for additional
memsets here. And while we're at it, let's also remove the
superfluous typecasts for the return values of g_malloc0
and use the type-safe g_new0 instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/input/tsc210x.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index fae3385..1073bbf 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -1086,9 +1086,7 @@ uWireSlave *tsc2102_init(qemu_irq pint)
 {
     TSC210xState *s;
 
-    s = (TSC210xState *)
-            g_malloc0(sizeof(TSC210xState));
-    memset(s, 0, sizeof(TSC210xState));
+    s = g_new0(TSC210xState, 1);
     s->x = 160;
     s->y = 160;
     s->pressure = 0;
@@ -1135,9 +1133,7 @@ uWireSlave *tsc2301_init(qemu_irq penirq, qemu_irq kbirq, qemu_irq dav)
 {
     TSC210xState *s;
 
-    s = (TSC210xState *)
-            g_malloc0(sizeof(TSC210xState));
-    memset(s, 0, sizeof(TSC210xState));
+    s = g_new0(TSC210xState, 1);
     s->x = 400;
     s->y = 240;
     s->pressure = 0;
-- 
2.1.4


