Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkiTO-00067d-Kj
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 20:57:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1Zka2P-0006tu-9V
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 11:56:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1Zka2N-0005an-Dz
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 11:56:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1Zka2F-00057w-TM; Fri, 09 Oct 2015 11:56:43 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 47D3C461E2;
	Fri,  9 Oct 2015 15:56:43 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-4-95.ams2.redhat.com [10.36.4.95])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t99Fud3L025235; Fri, 9 Oct 2015 11:56:42 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri,  9 Oct 2015 17:56:36 +0200
Message-Id: <1444406198-6521-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1444406198-6521-1-git-send-email-thuth@redhat.com>
References: <1444406198-6521-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 2/4] hw/input/tsc210x: Remove superfluous
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
X-List-Received-Date: Fri, 09 Oct 2015 15:56:56 -0000

g_malloc0 already clears the memory, so no need for additional
memsets here. And while we're at it, let's also remove the
superfluous typecasts for the return values of g_malloc0
and use the type-safe g_new0 instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
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
1.8.3.1


